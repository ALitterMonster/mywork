<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/import.jsp"></jsp:include>
<title>火灾情况记录管理</title>
</head>
<body>
<div id="loggingPlanQueryForm" >
    <table>
        <tr>
            <td >火灾发生区域：</td>
            <td>
                <input class="mini-textbox" id="affectedArea_q" name="affectedArea_q"/>
            </td>             
            <td >火灾发生时间</td>
            <td>
                <input id="occurTimeStart_q" name="occurTimeStart_q" class="mini-datepicker" />-
                <input id="occurTimeEnd_q" name="occurTimeEnd_q" class="mini-datepicker" />-
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
 <div id="fireRecordGrid" class="mini-datagrid" style="width:100%;height:500px;" 
    url="${pageContext.request.contextPath}/prevention/queryFireRecordList.do"
    idField="id" allowResize="true" multiSelect="true" 
    sizeList="[20,30,50,100]" pageSize="20" 
    showHeader="true" title="火灾情况记录列表"
 onmouseup="return datagrid1_onmouseup()">
    <div property="columns">
        <div field="id" width="80" align="center" headerAlign="center" allowSort="true">序号</div>  
         <div type="checkcolumn"></div>
        <div field="affectedArea" width="100"  align="center" headerAlign="center">火灾发生区域</div>
        <div field="occurTime" headerAlign="center" width="100"align="center" dateFormat="yyyy-MM-dd" allowSort="true">火灾发生时间</div>                                
        <div field="dealTime" headerAlign="center" width="100"align="center" dateFormat="yyyy-MM-dd" allowSort="true">火灾处理时间</div>                                
        <div field="dealPlan" width="100"  align="center" headerAlign="center">火灾处理方案</div>
        <div field="longitude" width="100"  align="center" headerAlign="center">经度</div>
        <div field="latitude" width="100"  align="center" headerAlign="center">纬度</div>
        <div field="temperature" width="100"  align="center" headerAlign="center">温度</div>
        <div field="airHumidity" width="100"  align="center" headerAlign="center">空气湿度</div>
        <div field="windDirection" width="100"  align="center" headerAlign="center">风向</div>
    </div>
</div>
<div class = "mini-window"id="editForm" style="width:60%;border:solid 1px #aaa;display:none;">
<fieldset style="width:97%;border:solid 1px #aaa;" id="editField">
        <legend>火灾情况记录信息</legend>
        <div id="editForm1" style="padding:5px;">
            <table style="width:100%;">
               <tr>
                    <td style="width:80px;">火灾发生区域：</td>
                    <td style="width:150px;"><input id="affectedArea" name="affectedArea" class="mini-textbox"required="true" />
                    <input id="recordId" name="recordId" class="mini-hidden" /></td>
					<td style="width:80px;">火灾处理方案：</td>
                    <td style="width:150px;"><input id="dealPlan" name="dealPlan" class="mini-textbox"required="true" />
               </tr>
               <tr>
                <td style="width:80px;">火灾发生时间：</td>
                 <td align="left" colspan="1" style="width:150px;">
                 	<input id="occurTime" name="occurTime" class="mini-datepicker" required="true" /> 
                 </td>
                 <td>火灾处理时间：</td>
                 <td><input id="dealTime" name="dealTime" class="mini-datepicker" required="true"/></td>
               </tr>
               <tr>
                    <td style="width:80px;">经度：</td>
                    <td style="width:150px;"><input id="longitude" name="longitude" class="mini-textbox"required="true" />
					<td style="width:80px;">纬度：</td>
                    <td style="width:150px;"><input id="latitude" name="latitude" class="mini-textbox"required="true" />
               </tr>
               <tr>
                    <td style="width:80px;">温度：</td>
                    <td style="width:150px;"><input id="temperature" name="temperature" class="mini-textbox"required="true" />
					<td style="width:80px;">空气湿度：</td>
                    <td style="width:150px;"><input id="airHumidity" name="airHumidity" class="mini-textbox"required="true" />
               </tr>
               <tr>
                    <td style="width:80px;">风向：</td>
                    <td style="width:150px;" colspan="3" >
                    <input id="windDirection" name="windDirection" class="mini-textbox"required="true" />
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
    var grid = mini.get("fireRecordGrid");
    grid.load({affectedArea:'',occurTimeStart:'',occurTimeEnd:''});

	//绑定表单
	var editField = mini.get("editForm");
	
	function queryList() {
    	var affectedArea = mini.get("affectedArea_q").getValue();
    	var occurTimeStart = mini.get("occurTimeStart_q").getFormValue();
    	var occurTimeEnd = mini.get("occurTimeEnd_q").getFormValue();
    	if(occurTimeStart!=""){
    		occurTimeStart +=" 00:00:00";
    	}
    	if(occurTimeEnd!=""){
    		occurTimeEnd +=" 00:00:00";
    	}
    	grid.load({affectedArea:affectedArea,occurTimeStart:occurTimeStart,occurTimeEnd:occurTimeEnd});
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
        	url: "${pageContext.request.contextPath}/prevention/queryFireRecordById.do",
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
        	url: "${pageContext.request.contextPath}/prevention/batchDeleteFireRecord.do",
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
		if(data.dealTime!=""){
			data.dealTime=mini.get("dealTime").getFormValue()+" 00:00:00";
		}
		if(data.occurTime!=""){
			data.occurTime=mini.get("occurTime").getFormValue()+" 00:00:00";
		}
		
		if(data.recordId==""){
			var json = mini.encode(data);
    		$.ajax({
        		url: "${pageContext.request.contextPath}/prevention/addFireRecord.do",
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
        		url: "${pageContext.request.contextPath}/prevention/updateFireRecord.do",
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


