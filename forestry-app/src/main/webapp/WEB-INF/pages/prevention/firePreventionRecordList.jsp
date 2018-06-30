<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/import.jsp"></jsp:include>
<title>防火记录管理</title>
</head>
<body>
<div id="loggingPlanQueryForm" >
    <table>
        <tr>
            <td >火灾预防区域：</td>
            <td>
                <input class="mini-textbox" id="preventionArea" />
            </td>             
            <td >火灾预防时间</td>
            <td>
                <input id="preventionTime" name="preventionTime" class="mini-datepicker" />-
            </td>
            <td >火灾预防结果：</td>
            <td>
                <input class="mini-textbox" id="preventionResult" />
            </td>                
            	<a class="mini-button" iconCls="icon-save" onclick="queryList()">查询</a>
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
                         <a class="mini-button" iconCls="icon-save" onclick="edit()">编辑</a>       
                    </td>
                   
                </tr>
            </table>           
        </div>
 <div id="firePreventionRecordGrid" class="mini-datagrid" style="width:100%;height:500px;" 
    url="${pageContext.request.contextPath}/prevention/queryFirePreventionRecordList.do"
    idField="id" allowResize="true" multiSelect="true" 
    sizeList="[20,30,50,100]" pageSize="20" 
    showHeader="true" title="防火检查记录列表"
 onmouseup="return datagrid1_onmouseup()">
    <div property="columns">
        <div field="id" width="80" align="center" headerAlign="center" allowSort="true">序号</div>  
         <div type="checkcolumn"></div>
        <div field="createdAt" width="120" dateFormat="yyyy-MM-dd"align="center" headerAlign="center" allowSort="true">创建时间</div>    
        <div field="createdBy" width="120" headerAlign="center"align="center" allowSort="true">创建用户</div>                            
        <div field="preventionArea" width="100"  align="center" headerAlign="center">火灾预防区域</div>
        <div field="preventionTime" headerAlign="center" width="100"align="center" dateFormat="yyyy-MM-dd" allowSort="true">火灾预防时间</div>                                
        <div field="preventionResult" width="100"  align="center" headerAlign="center">火灾预防结果</div>
        <div field="riskLevel" width="100"  align="center" headerAlign="center">风险等级</div>
    </div>
</div>
<div class = "mini-window"id="editForm" style="width:60%;border:solid 1px #aaa;display:none;">
<fieldset style="width:97%;border:solid 1px #aaa;" id="editField">
        <legend>防火检查记录信息</legend>
        <div id="editForm1" style="padding:5px;">
            <table style="width:100%;">
               <tr>
                    <td style="width:80px;">火灾预防区域：</td>
                    <td style="width:150px;"><input id="preventionArea" name="preventionArea" class="mini-textbox"required="true" />
                    <input id="recordId" name="recordId" class="mini-hidden" /></td>
					<td style="width:80px;">火灾预防结果：</td>
                    <td style="width:150px;"><input id="preventionResult" name="preventionResult" class="mini-textbox"required="true" />
               </tr>
               <tr>
                <td style="width:80px;">火灾预防时间：</td>
                 <td align="left" colspan="1" style="width:150px;">
                 	<input id="preventionTime" name="preventionTime" class="mini-datepicker" required="true" /> 
                 </td>
                 <td>风险等级：</td>
                    <td style="width:150px;"><input id="riskLevel" name="riskLevel" class="mini-textbox"required="true" />
                 </td>
               </tr>
               <tr>
                  <td colspan="4" align="center"><a class="mini-button" iconCls="icon-add" onclick="save()">保存</a></td>
               </tr>
            </table>
        </div>
    </fieldset>
    </div>
</body>

<script type="text/javascript">
        
    //初始化砍伐信息
    mini.parse();
    var grid = mini.get("firePreventionRecordGrid");
    grid.load({affectedArea:'',occurTime:'',dealTime:''});

	//绑定表单
	var db = new mini.DataBinding();
	db.bindForm("editForm", grid);
	var editField = mini.get("editForm");
	
	function queryList() {
    	var preventionArea = mini.get("preventionArea").getValue();
    	var preventionTime = mini.get("preventionTime").getFormValue();
    	var preventionResult = mini.get("preventionResult").getFormValue();
    	if(occurTime!=""){
    		occurTime +=" 00:00:00";
    	}
    	grid.load({preventionArea:preventionArea,preventionTimee:preventionTime,preventionResult:preventionResult});
	}
	function add() {
    	editField.show();
	}
	function edit() {
    	
    	var rows = grid.getSelecteds();
    	var id = "";
    	if (rows.length > 1 ||rows.length==0) {
        	alert("请选择一条记录");
    		return false;
    	}else{
    		id=rows[0].id;
    	}
    	$.ajax({
        	url: "${pageContext.request.contextPath}/prevention/queryFirePreventionRecordById.do",
        	data: { id: id },
        	type: "get",
        	success: function (data) {
        		if(data!=null && data.code!="0000"){
        			alert(data.message);
        		}else{
            		editField.show();
            		var form = new mini.Form("#editForm");  
            		var result = mini.decode(data);
            		form.setData(result.data);
            		mini.get("recordId").setValue(result.data.id);
            	}
       	 	},
        	error: function (jqXHR, textStatus, errorThrown) {
           		 alert(jqXHR.responseText);
        	}
    	});
	}
	function remove() {
    	var rows = grid.getSelecteds();
    	var ids = "";
    	if (rows.length > 0) {
        	$.each(rows,function(index,value){
     			ids+=","+value.id;
			});
    	}else{
    		alert("请选择一条删除记录");
    		return false;
    	}
  		ids=ids.substring(1);
    	$.ajax({
        	url: "${pageContext.request.contextPath}/prevention/batchDeleteFirePreventionRecord.do",
        	data: { ids: ids },
        	type: "post",
        	success: function (text) {
        	alert("操作成功");
            	grid.reload();
       	 	},
        	error: function (jqXHR, textStatus, errorThrown) {
           		 alert(jqXHR.responseText);
        	}
    	});
	}
	
	function save() {
		var form = new mini.Form("#editForm");   
		form.validate();
		if (form.isValid() == false) return;
		var data = form.getData();      //获取表单多个控件的数据
		if(data.preventionTime!=""){
			data.preventionTime=mini.get("preventionTime").getFormValue()+" 00:00:00";
		}
		
		if(data.recordId==""){
			var json = mini.encode(data);
    		$.ajax({
        		url: "${pageContext.request.contextPath}/prevention/addFirePreventionRecord.do",
        		data: { fireRecord: json },
        		type: "post",
        		success: function (text) {
        		alert("操作成功");
            		grid.reload();
            		form.clear();
            		editField.hide();
        		},
        		error: function (error) {
            		alert(mini.encode(error));
            		form.clear();
            		editField.hide();
        		}
    	});
    	}else{
    		data.id=data.recordId;
    		var json = mini.encode(data);
    		$.ajax({
        		url: "${pageContext.request.contextPath}/prevention/updateFirePreventionRecord.do",
        		data: { fireRecord: json },
        		type: "post",
        		success: function (text) {
        			alert("操作成功");
            		grid.reload();
            		form.clear();
            		editField.hide();
        		},
        		error: function (error) {
            		alert(mini.encode(error));
            		form.clear();
            		editField.hide();
            		
        		}
    		});
    	}
	}
	
    </script>

</html>


