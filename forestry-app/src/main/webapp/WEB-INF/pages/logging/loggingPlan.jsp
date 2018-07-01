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
                <input class="mini-textbox" id="planName_q" />
            </td>             
            <td >计划创建时间</td>
            <td>
                <input id="startAt" name="startAt" class="mini-datepicker" />-
            </td>  
             <td>
                <input id="endAt" name="endAt" class="mini-datepicker"/>
            </td> 
            <td>                
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
 <div id="loggingPlanGrid" class="mini-datagrid" style="width:100%;height:500px;" 
    url="${pageContext.request.contextPath}/loggingPlan/queryPlanList.do"
    idField="id" allowResize="true" multiSelect="true" 
    sizeList="[20,30,50,100]" pageSize="20" 
    showHeader="true" title="采伐计划列表"
 onmouseup="return datagrid1_onmouseup()">
    <div property="columns">
        <div field="id" width="80" align="center" headerAlign="center" allowSort="true">序号</div>  
         <div type="checkcolumn"></div>
        <div field="createdAt" width="120" dateFormat="yyyy-MM-dd"align="center" headerAlign="center" allowSort="true">创建时间</div>    
        <div field="createdBy" width="120" headerAlign="center"align="center" allowSort="true">创建用户</div>                            
        <div field="planName" width="100"  align="center" headerAlign="center">计划名称</div>
        <div field="endTime" headerAlign="center" width="100"align="center" dateFormat="yyyy-MM-dd" allowSort="true">计划截止时间</div>                                
        <div field="amount"headerAlign="center" width="100" allowSort="true"align="center"  >计划砍伐数量</div>
        <div field="remark" width="100" headerAlign="center" align="center"allowSort="true">备注</div>                
    </div>
</div>
<div class = "mini-window"id="editForm" style="width:60%;border:solid 1px #aaa;display:none;">
<fieldset style="width:97%;border:solid 1px #aaa;" id="editField">
        <legend>采伐计划信息</legend>
        <div id="editForm1" style="padding:5px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:80px;">计划名称：</td>
                    <td style="width:150px;"><input id="planName" name="planName" class="mini-textbox"required="true" />
                    <input id="planId" name="planId" class="mini-hidden" /></td>
                    <td style="width:80px;">计划砍伐数量：</td>
                    <td style="width:150px;"><input id="amount" name="amount" class="mini-textbox"vtype="int" required="true"/></td>
               </tr>
               <tr>
                <td style="width:80px;">计划开始时间：</td>
                 <td align="left" colspan="1" style="width:150px;"><input id="startTime"
					name="startTime" class="mini-datepicker" required="true" /> </td>
                
             
                    <td>计划结束时间：</td>
                    <td><input id="endTime" name="endTime" class="mini-datepicker" required="true"/></td>
               </tr>
               <tr>
                    <td>计划采伐区域：</td>
                    <td><input id="area" name="area" class="mini-textbox"  required="true" /></td>
                    <td>备注：</td>
                    <td><input id="remark" name="remark" class="mini-textbox" /></td>
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
    var grid = mini.get("loggingPlanGrid");
    grid.load({planName:'',startAt:'',endAt:''});

	//绑定表单
	var db = new mini.DataBinding();
	db.bindForm("editForm", grid);
	var editField = mini.get("editForm");
	
	function queryList() {
    	var planName = mini.get("planName_q").getValue();
    	var startAt = mini.get("startAt").getFormValue();
    	var endAt = mini.get("endAt").getFormValue();
    	var startDate = mini.get("startAt").getValue();
    	var endDate = mini.get("endAt").getValue();
    	if(startDate>endDate){
    		alert("查询截止日期不能大于开始日期！");
    		return false;
    	}
    	if(startAt!=""){
    		startAt +=" 00:00:00";
    	}
    	if(endAt!=""){
    		endAt +=" 23:59:59";
    	}
    	grid.load({planName:planName,startAt:startAt,endAt:endAt});
	}
	function add() {
		var form = new mini.Form("#editForm"); 
		form.setData();
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
        	url: "${pageContext.request.contextPath}/loggingPlan/queryById.do",
        	data: { id: id },
        	type: "get",
        	success: function (data) {
        		var result = mini.decode(data);
        		if(result!=null && result.code=="0000"){
        			alert(data.message);
        		}else{
            		editField.show();
            		var form = new mini.Form("#editForm");  
            		form.setData(result.data);
            		mini.get("planId").setValue(result.data.id);
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
        	url: "${pageContext.request.contextPath}/loggingPlan/batchDelete.do",
        	data: { ids: ids },
        	type: "post",
        	success: function (data) {
        		var result = mini.decode(data);
        		if(result!=null && result.code=="0000"){
        			alert("操作成功");
            		grid.reload();
            	}else{
            		alert(data.message);
            	}
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
		if(data.startTime!=""){
			data.startTime=mini.get("startTime").getFormValue()+" 00:00:00";
		}
		if(data.endTime!=""){
			data.endTime=mini.get("endTime").getFormValue()+" 23:59:59";
		}
		
		if(data.planId==""){
			var json = mini.encode(data);
    		$.ajax({
        		url: "${pageContext.request.contextPath}/loggingPlan/addPlan.do",
        		data: { planInfo: json },
        		type: "post",
        		success: function (data) {
        			var result = mini.decode(data);
        			if(result!=null && result.code!="0000"){
        				alert("操作成功");
            			grid.reload();
            			form.clear();
            			editField.hide();
            		}else{
            			alert(data.message);
            			editField.hide();
            		}
        		},
        		error: function (error) {
            		alert(mini.encode(error));
            		form.clear();
            		editField.hide();
        		}
    	});
    	}else{
    		data.id=data.planId;
    		var json = mini.encode(data);
    		$.ajax({
        		url: "${pageContext.request.contextPath}/loggingPlan/updatePlan.do",
        		data: { planInfo: json },
        		type: "post",
        		success: function (data) {
        			var result = mini.decode(data);
        			if(result!=null && result.code!="0000"){
        				alert("操作成功");
            			grid.reload();
            			form.clear();
            			editField.hide();
            		}else{
            			alert(data.message);
            		}
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


