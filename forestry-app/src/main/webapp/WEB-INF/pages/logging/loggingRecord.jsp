<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/import.jsp"></jsp:include>
<title>采伐记录管理</title>
</head>
<body>
<div id="loggingQueryForm" >
    <table>
        <tr>
            <td >砍伐单位：</td>
            <td>
                <input class="mini-textbox" id="createdBy_q" />
            </td>    
            <td >砍伐时间</td>
            <td>
                <input id="startAt_q" name="startAt_q" class="mini-datepicker" />-
            </td>  
             <td>
                <input id="endAt_q" name="endAt_q" class="mini-datepicker"/>
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
 <div id="loggingGrid" class="mini-datagrid" style="width:100%;height:400px;" 
    url="${pageContext.request.contextPath}/loggingRecord/queryRecordList.do"
    idField="id" allowResize="true" multiSelect="true" 
    sizeList="[20,30,50,100]" pageSize="20" 
    showHeader="true" title="采伐记录列表"
 onmouseup="return datagrid1_onmouseup()">
    <div property="columns">
        <div field="id" width="80" align="center" headerAlign="center" allowSort="true">序号</div>  
         <div type="checkcolumn"></div>
        <div field="updatedAt" width="120" dateFormat="yyyy-MM-dd"align="center" headerAlign="center" allowSort="true">采伐时间</div>    
        <div field="createdBy" width="120" headerAlign="center"align="center" allowSort="true">采伐单位</div>                            
        <div field="area" width="100"  align="center" headerAlign="center">采伐面积</div>
        <div field="amout" headerAlign="center" width="100"align="center" dateFormat="yyyy-MM-dd" allowSort="true">砍伐数量</div>                                
        <div field="remark"headerAlign="center" width="100" allowSort="true"align="center" >备注</div>
    </div>
</div>
<div class = "mini-window"id="editForm" style="width:60%;border:solid 1px #aaa;display:none;">
<fieldset style="width:97%;border:solid 1px #aaa;" id="editField">
        <legend>采伐记录信息</legend>
        <div id="editForm1" style="padding:5px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:80px;">采伐单位：</td>
                    <td style="width:150px;"><input id="createdBy" name="createdBy" class="mini-textbox"  required="true"/>
                    <input id="recordId" name="recordId" class="mini-hidden" /></td>
                    <td style="width:80px;">采伐时间：</td>
                    <td style="width:150px;"><input id="updatedAt" name="updatedAt" class="mini-datepicker" required="true" /></td>
               </tr>
               <tr>
                <td style="width:80px;">采伐面积：</td>
                 <td align="left" colspan="1" style="width:150px;"><input id="area"
					name="area" class="mini-textbox"  required="true"vtype="int" /> </td>
                    <td>采伐数量：</td>
                    <td><input id="amout" name="amout" class="mini-textbox" required="true"vtype="int" /></td>
               </tr>
               <tr>
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
    var grid = mini.get("loggingGrid");
    grid.load({createdBy_q:'',startAt_q:'',endAt_q:'',isLegal:'1'});

	//绑定表单
	var db = new mini.DataBinding();
	db.bindForm("editForm", grid);
	var editField = mini.get("editForm");
	
	function queryList() {
    	var createdBy = mini.get("createdBy_q").getValue();
    	var startAt = mini.get("startAt_q").getFormValue();
    	var endAt = mini.get("endAt_q").getFormValue();
    	var startDate = mini.get("startAt_q").getValue();
    	var endDate = mini.get("endAt_q").getValue();
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
    	grid.load({createdBy:createdBy,startAt:startAt,endAt:endAt,isLegal:1});
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
        	url: "${pageContext.request.contextPath}/loggingRecord/queryById.do",
        	data: { id: id },
        	type: "get",
        	success: function (data) {
            	editField.show();
            	var form = new mini.Form("#editForm");  
            	var result = mini.decode(data);
            	form.setData(result.data);
            	mini.get("recordId").setValue(result.data.id);
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
        	url: "${pageContext.request.contextPath}/loggingRecord/batchDelete.do",
        	data: { ids: ids },
        	type: "post",
        	success: function (data) {
        		var result = mini.decode(data);
        		if(result!=null && result.code=="0000"){
        			alert("操作成功");
            		grid.reload();
            	}else{
            		alert(result.message);
            		editField.hide();
            	}
       	 	},
        	error: function (jqXHR, textStatus, errorThrown) {
           		 alert(jqXHR.responseText);
        	}
    	});
	}
	
	function save() {
		var form = new mini.Form("#editForm");            
		var data = form.getData();      //获取表单多个控件的数据
		form.validate();
		if (form.isValid() == false) return;
		if(data.updatedAt!=""){
			data.updatedAt=mini.get("updatedAt").getFormValue()+" 00:00:00";
		}
		if(data.recordId==""){
			data.isLegal=1;
			var json = mini.encode(data);
    		$.ajax({
        		url: "${pageContext.request.contextPath}/loggingRecord/addRecord.do",
        		data: { data: json },
        		type: "post",
        		success: function (data) {
        			var result = mini.decode(data);
        			if(result!=null && result.code=="0000"){
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
    		data.id=data.recordId;
    		var json = mini.encode(data);
    		$.ajax({
        		url: "${pageContext.request.contextPath}/loggingRecord/updateRecord.do",
        		data: { data: json },
        		type: "post",
        		success: function (data) {
        			var result = mini.decode(data);
        			if(result!=null && result.code=="0000"){
        				alert("操作成功");
            			grid.reload();
            			form.clear();
            			editField.hide();
            		}else{
            			alert(result.message);
            			form.clear();
            			editField.hide();
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


