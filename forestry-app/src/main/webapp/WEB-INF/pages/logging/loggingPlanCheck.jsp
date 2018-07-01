<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/import.jsp"></jsp:include>
<title>采伐审核管理</title>
</head>
<body>
<div id="loggingPlanQueryForm" >
    <table>
        <tr>
            <td >计划名称：</td>
            <td>
                <input class="mini-textbox"  id="planName_q" name="planName_q"/>
            </td>             
            <td >审核状态</td>
            <td>
               <input id="status_q" name="status_q" class="mini-combobox" style="width:150px;" textField="text" valueField="id" 
                    data="[{id:0,text:'不通过'},{id:1,text:'通过'},{id:2,text:'未审核'}]" value="" showNullItem="true" allowInput="true"/>
            </td> 
            <td style="white-space:nowrap;">
                        <a class="mini-button" onclick="search()">查询</a>
            </td> 
        </tr>
     </table>
 </div>
 <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                     <td style="width:100%;">
                        <a class="mini-button" iconCls="icon-add" onclick="check()">审核</a>
                            
                    </td>
                </tr>
            </table>           
        </div>
 <div id="loggingPlanGrid" class="mini-datagrid" style="width:100%;height:250px;" 
    url="${pageContext.request.contextPath}/loggingCheck/queryList.do"
    idField="id" allowResize="true"
    sizeList="[20,30,50,100]" pageSize="20" 
    showHeader="true" title="采伐计划列表"
 onmouseup="return datagrid1_onmouseup()">
    <div property="columns">
        <div type="indexcolumn" ></div>
        <div type="checkcolumn"></div>
        <div field="createdAt" width="120" dateFormat="yyyy-MM-dd"align="center" headerAlign="center" allowSort="true">审核时间</div>    
        <div field="createdBy" width="120" headerAlign="center"align="center" allowSort="true">创建用户</div>                            
        <div field="planName" width="100"  align="center" headerAlign="center">计划名称</div>
        <div field="endTime" headerAlign="center" width="100"align="center" dateFormat="yyyy-MM-dd" allowSort="true">计划截止时间</div>                                
        <div field="amount" width="100" allowSort="true"align="center"  dataType="float">计划砍伐数量</div>
        <div field="status" width="100" headerAlign="center"renderer="onRenderer" align="center"allowSort="true">审核状态</div>                
    </div>
</div>

<div class = "mini-window"id="editForm" style="width:60%;border:solid 1px #aaa;display:none;">
<fieldset style="width:97%;border:solid 1px #aaa;" id="editField">
        <legend>审核采伐计划信息</legend>
        <div id="editForm1" style="padding:5px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:80px;">审核结果：</td>
                    <td style="width:150px;"><input id="status" name="status" class="mini-combobox" style="width:150px;" textField="text" valueField="id" 
                    data="[{id:0,text:'不通过'},{id:1,text:'通过'}]" value="" showNullItem="true" allowInput="true" required="true"/>
                    <td style="width:80px;">备注：</td>
                    <td style="width:150px;"><input id="remark" name="remark" class="mini-textbox"vtype="int" required="true"/></td>
               </tr>
                <tr>
                   <td colspan="4" align="center"><a class="mini-button" iconCls="icon-add" onclick="saveCheck()">保存</a></td>
                </tr>
            </table>
        </div>
    </fieldset>
    </div>
</body>

<script type="text/javascript">
        
    //初始化砍伐信息
    mini.parse();
    var grid = mini.get("loggingPlanGrid");
    var editField = mini.get("editForm");
    grid.load();
	function search() {
    	var status = mini.get("status_q").getValue();
    	var planName = mini.get("planName_q").getFormValue();
    	grid.load({planName:planName,status:status});
	}
	
	function check() {
		var rows = grid.getSelecteds();
    	var ids = "";
    	if (rows.length !=1) {
    		alert("请选择一条记录");
    		return false;
    	}
		var form = new mini.Form("#editForm"); 
		form.setData();
    	editField.show();
	}
	
	function saveCheck() {
    	var rows = grid.getSelecteds();
    	var id = rows[0].id;
    	var status=mini.get("status").getValue();
    	var remark = mini.get("remark").getValue();
    	$.ajax({
        	url: "${pageContext.request.contextPath}/loggingCheck/update.do",
        	data: { id: id, status:status,remark:remark},
        	type: "post",
        	success: function (data) {
        		var result = mini.decode(data);
        		if(result!=null && result.code=="0000"){
        			alert("操作成功");
            		grid.reload();
            		editField.hide();
	}
            	}else{
            		alert(data.message);
            		editField.hide();
            	}
       	 	},
        	error: function (jqXHR, textStatus, errorThrown) {
           		 alert(jqXHR.responseText);
        	}
    	});
	}
		function onRenderer(e) {
		if ("1" == e.value) return "审核通过";
		else if("0" == e.value) return "审核不通过";
		else if("2" == e.value) return "未审核";
		else return "";
    }
    </script>

</html>


