<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/import.jsp"></jsp:include>
<title>生态林公益事业记录管理</title>
</head>
<body>
<div id="loggingPlanQueryForm" >
    <table>
        <tr>
        	<td >种植树种类：</td>
            <td>
                <input class="mini-textbox" id="treeSpecies1" />
            </td>
           	<td >种植人姓名：</td>
            <td>
                <input class="mini-textbox" id="name1" />
            </td>
            <td>种植树数量：</td>
            <td>
                <input class="mini-textbox" id="treeNum1" />
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
 <div id="publicServiceGrid" class="mini-datagrid" style="width:100%;height:500px;" 
    url="${pageContext.request.contextPath}/publicservice/queryPublicServiceList.do"
    idField="id" allowResize="true" multiSelect="true" 
    sizeList="[20,30,50,100]" pageSize="20" 
    showHeader="true" title="生态林公益事业记录列表"
 	onmouseup="return datagrid1_onmouseup()">
    <div property="columns">
        <div field="id" width="80" align="center" headerAlign="center" allowSort="true">序号</div>  
         <div type="checkcolumn"></div>
        <div field="createdAt" width="120" dateFormat="yyyy-MM-dd"align="center" headerAlign="center" allowSort="true">创建时间</div>    
        <div field="createdBy" width="120" headerAlign="center"align="center" allowSort="true">创建用户</div>
        <div field="treeSpecies" width="100"  align="center" headerAlign="center">种植树种类</div>
        <div field="plantingTime" headerAlign="center" width="100"align="center" dateFormat="yyyy-MM-dd" allowSort="true">种植时间</div>                                
        <div field="treeNum" width="100"  align="center" headerAlign="center">种植数量</div>
        <div field="name" width="100"  align="center" headerAlign="center">种植人姓名</div>
        <div field="contact" width="100"  align="center" headerAlign="center">种植人联系方式</div>
        <div field="donationTime" headerAlign="center" width="100"align="center" dateFormat="yyyy-MM-dd" allowSort="true">捐献时间</div>                                
        <div field="treeUnitPrice" width="100"  align="center" headerAlign="center">种植树单价</div>
        <div field="publicServiceName" width="100"  align="center" headerAlign="center">公益事业名称</div>
    </div>
</div>
<div class = "mini-window"id="editForm" style="width:60%;border:solid 1px #aaa;display:none;">
<fieldset style="width:97%;border:solid 1px #aaa;" id="editField">
        <legend>生态林公益事业记录信息</legend>
        <div id="editForm1" style="padding:5px;">
            <table style="width:100%;">
               <tr>
               	<td style="width:80px;">种植树种类：</td>
	            <td align="left" style="width:150px;">
	                <input class="mini-textbox" id="treeSpecies" name="treeSpecies" required="true"/>
	                <input id="recordId" name="recordId" class="mini-hidden" />
	            </td>
                <td style="width:80px;">种植时间：</td>
                <td align="left"style="width:150px;">
                	<input id="plantingTime" name="plantingTime" class="mini-datepicker" required="true" />
                </td>
               </tr>
               <tr>
                <td style="width:80px;">种植数量：</td>
	            <td align="left" style="width:150px;">
	                <input class="mini-textbox" id="treeNum" name="treeNum" required="true"/>
	            </td>
	            <td style="width:80px;">种植人姓名：</td>
	            <td align="left" style="width:150px;">
	                <input class="mini-textbox" id="name" name="name" required="true"/>
	            </td>
	           </tr>
	           <tr>
	            <td style="width:80px;">种植人联系方式：</td>
	            <td align="left" style="width:150px;">
	                <input class="mini-textbox" id="contact" name="contact" required="true"/>
	            </td>
	            <td style="width:80px;">捐献时间：</td>
                <td align="left"style="width:150px;">
                	<input id="donationTime" name="donationTime" class="mini-datepicker" required="true" />
                </td>
               </tr>
               <tr>
                <td>种植树单价：</td>
	            <td>
	                <input class="mini-textbox" id="treeUnitPrice" name="treeUnitPrice" required="true"/>
	            </td>
	            <td>公益事业名称：</td>
	            <td>
	                <input class="mini-textbox" id="publicServiceName" name="publicServiceName" required="true"/>
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
        
    //初始化湿地信息
    mini.parse();
    var grid = mini.get("publicServiceGrid");
    grid.load({plantingTime:'',treeSpecies:'',name:'',treeNum:''});

	//绑定表单
	var db = new mini.DataBinding();
	db.bindForm("editForm", grid);
	var editField = mini.get("editForm");
	
	function queryList() {
    	var treeSpecies = mini.get("treeSpecies1").getFormValue();
    	var name = mini.get("name1").getFormValue();
    	var treeNum = mini.get("treeNum1").getFormValue();
    	if(plantingTime!=""){
    		plantingTime +=" 00:00:00";
    	}
    	grid.load({treeSpecies:treeSpecies,name:name,treeNum:treeNum});
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
        	url: "${pageContext.request.contextPath}/publicservice/queryPublicServiceById.do",
        	data: { id: id },
        	type: "get",
        	success: function (data) {
        		data=mini.decode(data);
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
        	url: "${pageContext.request.contextPath}/publicservice/batchDeletePublicService.do",
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
		if(data.plantingTime!=""){
			data.plantingTime=mini.get("plantingTime").getFormValue()+" 00:00:00";
		}
		if(data.donationTime!=""){
			data.donationTime=mini.get("donationTime").getFormValue()+" 00:00:00";
		}
		
		if(data.recordId==""){
			var json = mini.encode(data);
    		$.ajax({
        		url: "${pageContext.request.contextPath}/publicservice/addPublicService.do",
        		data: { wetlands: json },
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
        		url: "${pageContext.request.contextPath}/publicservice/updatePublicService.do",
        		data: { wetlands: json },
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


