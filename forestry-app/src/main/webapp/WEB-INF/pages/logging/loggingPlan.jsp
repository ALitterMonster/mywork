<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/import.jsp"></jsp:include>
<title>采伐计划管理</title>
</head>
<body>
<div id="loggingPlanQueryForm" >
    <table>
        <tr>
            <td >计划名称：</td>
            <td>
                <input class="mini-textbox"  />
            </td>             
            <td >计划创建时间</td>
            <td>
                <input id="start" name="startdate" class="mini-datepicker" />-
            </td>  
             <td>
                <input id="end" name="enddate" class="mini-datepicker"/>
            </td>                 
            
        </tr>
     </table>
 </div>
 <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                     <td style="width:100%;">
                        <a class="mini-button" iconCls="icon-add" onclick="add()">增加</a>
                        <a class="mini-button" iconCls="icon-remove" onclick="remove()">删除</a>   
                         <a class="mini-button" iconCls="icon-save" onclick="save()">保存</a>       
                    </td>
                    <td style="white-space:nowrap;">
                        <input id="start" name="startdate" class="mini-datepicker" required="true"  /> 
                        <a class="mini-button" onclick="search()">查询</a>
                    </td>
                </tr>
            </table>           
        </div>
 <div id="loggingPlanGrid" class="mini-datagrid" style="width:100%;height:250px;" 
    url="${pageContext.request.contextPath}/loggingPlan/queryPlanList.do"
    idField="id" allowResize="true"
    sizeList="[20,30,50,100]" pageSize="20" 
    showHeader="true" title="采伐计划列表"
 onmouseup="return datagrid1_onmouseup()">
    <div property="columns">
        <div type="indexcolumn" ></div>
         <div type="checkcolumn"></div>
        <div field="createdAt" width="120" dateFormat="yyyy-MM-dd"align="center" headerAlign="center" allowSort="true">创建时间</div>    
        <div field="createdBy" width="120" headerAlign="center"align="center" allowSort="true">创建用户</div>                            
        <div field="planName" width="100"  align="center" headerAlign="center">计划名称</div>
        <div field="endTime" headerAlign="center" width="100"align="center" dateFormat="yyyy-MM-dd" allowSort="true">计划截止时间</div>                                
        <div field="amount" width="100" allowSort="true"align="center"  dataType="float">计划砍伐数量</div>
        <div field="planStatus" width="100" headerAlign="center" align="center"allowSort="true">计划状态</div>                
    </div>
</div>

<fieldset style="width:100%;border:solid 1px #aaa;display:none;" id="editField">
        <legend>采伐计划信息</legend>
        <div id="editForm1" style="padding:5px;">
            <input class="mini-hidden" name="id"/>
            <table style="width:100%;">
                <tr>
                    <td style="width:80px;">计划名称：</td>
                    <td style="width:150px;"><input id="name" name="name" class="mini-textbox" /></td>
                    <td style="width:80px;">计划砍伐数量：</td>
                    <td style="width:150px;"><input id="amount" name="amount" class="mini-textbox" /></td>
             
                <td style="width:80px;">计划开始时间：</td>
                    <td align="left" colspan="1" style="width:150px;"><input id="startTime"
					name="startTime" class="mini-datepicker" codeType="MZ_JDDM" /> </td>
                </tr>
                <tr>
                    <td>计划结束时间：</td>
                    <td><input id="endTime" name="endTime" class="mini-datepicker" /></td>
                    <td>计划采伐区域：</td>
                    <td><input id="area" name="area" class="mini-textbox"  /></td>
                    <td>备注：</td>
                    <td><input id="content" name="content" class="mini-textbox" /></td>
                </tr>
                <tr>
                   <td ></td>
                </tr>
            </table>
        </div>
    </fieldset>
</body>

<script type="text/javascript">
        
    //初始化砍伐信息
    mini.parse();
    var grid = mini.get("loggingPlanGrid");
    grid.load();

	//绑定表单
	var db = new mini.DataBinding();
	db.bindForm("editForm", grid);
	var editField = $("#editField");
	
	function add() {
    	editField.show();
	}
	function remove() {
    	var rows = grid.getSelecteds();
    	if (rows.length > 0) {
        	grid.removeRows(rows, true);
    	}
    	var data = grid.getChanges();
    	var json = mini.encode(data);
    	grid.loading("保存中，请稍后......");
    	$.ajax({
        	url: "${pageContext.request.contextPath}/m31/m310102/countInfoDelete.action",
        	data: { data: json },
        	type: "post",
        	success: function (text) {
            	grid.reload();
       	 	},
        	error: function (jqXHR, textStatus, errorThrown) {
           		 alert(jqXHR.responseText);
        	}
    	});
	}
	function addRow() {
    	
	}
	function removeRow() {
    	var rows = grid.getSelecteds();
    	if (rows.length > 0) {
        	grid.removeRows(rows, true);
    	}
	}
	
	function save() {
    	var data = grid.getChanges();
    	var json = mini.encode(data);
    	grid.loading("保存中，请稍后......");
    	$.ajax({
        	url: "${pageContext.request.contextPath}/m31/m310102/countInfoSave.action",
        	data: { data: json },
        	type: "post",
        	success: function (text) {
            	grid.reload();
        	},
        	error: function (jqXHR, textStatus, errorThrown) {
            	alert(jqXHR.responseText);
        	}
    	});
	}
    </script>

</html>


