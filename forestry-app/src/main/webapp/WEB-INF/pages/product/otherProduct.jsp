<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/import.jsp"></jsp:include>
<title>林产品入库管理</title>
</head>
<body>
<div id="loggingPlanQueryForm" >
    <table>
        <tr>
            <td >产品名称：</td>
            <td>
                <input class="mini-textbox" id="productName_q" />
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
                        <a class="mini-button" iconCls="icon-edit" onclick="edit()">编辑</a> 
                        <a class="mini-button" iconCls="icon-save" onclick="addProductNum()">产品出入库</a> 
                    </td>
                   
                </tr>
            </table>           
        </div>
 <div id="loggingPlanGrid" class="mini-datagrid" style="width:100%;height:500px;" 
    url="${pageContext.request.contextPath}/product/queryProductList.do"
    idField="id" allowResize="true" multiSelect="true" 
    sizeList="[20,30,50,100]" pageSize="20" 
    showHeader="true" title="林产品列表"
 onmouseup="return datagrid1_onmouseup()">
    <div property="columns">
        <div field="id" width="80" align="center" headerAlign="center" allowSort="true">序号</div>  
         <div type="checkcolumn"></div>
        <div field="productName" width="120" dateFormat="yyyy-MM-dd"align="center" headerAlign="center" allowSort="true">产品名称</div>    
        <div field="createdBy" width="120" headerAlign="center"align="center" allowSort="true">登记产品用户</div>                            
        <div field="createdAt" width="100"  align="center" headerAlign="center">登记时间</div>
         <div field="unit" width="100"  align="center" headerAlign="center">产品来源</div>
        <div field="amount" headerAlign="center" width="100"align="center" dataType="float" allowSort="true">产品存量</div>                                
    </div>
</div>
<div class = "mini-window"id="editForm" style="width:60%;border:solid 1px #aaa;display:none;">
<fieldset style="width:97%;border:solid 1px #aaa;" id="editField">
        <legend>产品信息</legend>
        <div id="editForm1" style="padding:5px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:80px;">产品名称：</td>
                    <td style="width:150px;"><input id="productName" name="productName" class="mini-textbox"required="true" />
                    <input id="productId" name="productId" class="mini-hidden" /></td>
                    <td style="width:80px;">产品来源：</td>
                    <td style="width:150px;"><input id="unit" name="unit" class="mini-textbox" required="true"/></td>
               </tr>
                <tr>
                   <td colspan="4" align="center"><a class="mini-button" iconCls="icon-add" onclick="save()">保存</a></td>
                </tr>
            </table>
        </div>
    </fieldset>
    </div>
    
    <div class = "mini-window"id="addForm" style="width:60%;border:solid 1px #aaa;display:none;">
<fieldset style="width:97%;border:solid 1px #aaa;" id="addField">
        <legend>产品出入库信息</legend>
        <div id="editForm1" style="padding:5px;">
            <table style="width:100%;">
                <tr>
                	<td style="width:80px;">操作：</td>
                    <td style="width:150px;"><input id="type" name="type" class="mini-combobox" style="width:150px;" textField="text" 
                	valueField="id" data="[{id:1,text:'入库'},{id:2,text:'出库'}]" value="" 
                	showNullItem="true" allowInput="true" required="true"/></td>
                    <td style="width:80px;">产品数量：</td>
                    <td style="width:150px;"><input id="amount" name="amount"vtype="float" class="mini-textbox"required="true" />
                    <input id="productId_1" name="productId_1" class="mini-hidden" /></td>
               </tr>
                <tr>
                	 <td style="width:80px;">产品来源：</td>
                    <td style="width:150px;"><input id="origin" name="origin" class="mini-textbox" required="true"/></td>
                    <td style="width:80px;">入库操作员：</td>
                    <td style="width:150px;"><input id="createdBy" name="createdBy" class="mini-textbox"required="true" />
                    <input id="productId_1" name="productId_1" class="mini-hidden" /></td>
               </tr>
               <tr>
               		<td style="width:80px;">备注：</td>
                    <td style="width:150px;"><input id="remark" name="remark" class="mini-textbox" required="true"/></td>
               </tr>
                <tr>
                   <td colspan="4" align="center"><a class="mini-button" iconCls="icon-add" onclick="addProduct()">保存</a></td>
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
    grid.load({productName:'',type:2});

	//绑定表单
	var editField = mini.get("editForm");
	var addField = mini.get("addForm");
	
	function queryList() {
    	var productName = mini.get("productName_q").getValue();
    	grid.load({productName:productName,type:2});
	}
	function add() {
    	var form = new mini.Form("#editForm"); 
		form.setData();
    	editField.show();
	}
	function addProductNum() {
		var form = new mini.Form("#addForm"); 
		form.setData();
    	addField.show();
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
        	url: "${pageContext.request.contextPath}/product/queryById.do",
        	data: { id: id },
        	type: "get",
        	success: function (data) {
        		var result = mini.decode(data);
        		if(result!=null && result.code!="0000"){
        			alert(result.message);
        		}else{
            		editField.show();
            		var form = new mini.Form("#editForm");  
            		form.setData(result.data);
            		mini.get("productId").setValue(result.data.id);
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
        	url: "${pageContext.request.contextPath}/product/batchDelete.do",
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
		if(data.productId==""){
			data.type=2;
			var json = mini.encode(data);
    		$.ajax({
        		url: "${pageContext.request.contextPath}/product/add.do",
        		data: { data: json },
        		type: "post",
        		success: function (data) {
        		var result = mini.decode(data);
        		if(result!=null || result.code !="0000"){
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
    	}else{
    		data.id=data.productId;
    		var json = mini.encode(data);
    		$.ajax({
        		url: "${pageContext.request.contextPath}/product/update.do",
        		data: { data: json },
        		type: "post",
        		success: function (text) {
        		var result = mini.decode(data);
        		if(result!=null || result.code !="0000"){
        			alert("操作成功");
            		grid.reload();
            		form.clear();
            		editField.hide();
            		}else{
            			alert(result.message);
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
	function addProduct() {
    	var addField = new mini.Form("#addField");   
    	addField.validate();
		if (addField.isValid() == false) return;
    	var rows = grid.getSelecteds();
    	var id = "";
    	if (rows.length > 1 ||rows.length==0) {
        	alert("请选择一条记录");
    		return false;
    	}else{
    		id=rows[0].id;
    	}
    	var data = addField.getData();
    	
    	data.productId=id;
    	var json = mini.encode(data);
    	$.ajax({
        	url: "${pageContext.request.contextPath}/product/addProduct.do",
        	data: { data: json },
        	type: "post",
        	success: function (data) {
        		var result = mini.decode(data);
        		var form = mini.get("addForm");
        		grid.reload();
        		if(result!=null && result.code!="0000"){
        			alert(result.message);
        			form.hide();
        		}else{
        			alert(result.message);
            		form.hide();
            	}
       	 	},
        	error: function (jqXHR, textStatus, errorThrown) {
           		 alert(jqXHR.responseText);
        	}
    	});
	}
	
	function deleteProduct() {
    	
    	var rows = grid.getSelecteds();
    	var id = "";
    	if (rows.length > 1 ||rows.length==0) {
        	alert("请选择一条记录");
    		return false;
    	}else{
    		id=rows[0].id;
    	}
    	var data = deleteForm.getData();
    	data.id=id;
    	var json = mini.encode(data);
    	
    	$.ajax({
        	url: "${pageContext.request.contextPath}/product/deleteProduct.do",
        	data: { data: json },
        	type: "post",
        	success: function (data) {
        		var result = mini.decode(data);
        		if(result!=null && result.code!="0000"){
        			alert(result.message);
        			deleteField.hide();
        		}else{
            		deleteField.hide();
            	}
       	 	},
        	error: function (jqXHR, textStatus, errorThrown) {
           		 alert(jqXHR.responseText);
        	}
    	});
	}
    </script>

</html>


