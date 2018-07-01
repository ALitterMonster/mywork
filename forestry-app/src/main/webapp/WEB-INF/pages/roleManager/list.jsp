<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/import.jsp"></jsp:include>
<title>权限管理</title>
</head>
<body>
<div id="queryForm" >
    <table>
        <tr>
            <td >机构名称：</td>
            <td>
                <input class="mini-textbox" id="roleName" name="roleName"/>
            </td>  
            <td >机构等级：</td>
            <td>           
            	<input class="mini-textbox" id="roleLevel" name="roleLevel"/>
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
                         <a class="mini-button" iconCls="icon-save" onclick="menu()">菜单绑定</a>   
                    </td>
                   
                </tr>
            </table>           
        </div>
 <div id="dataGrid" class="mini-datagrid" style="width:100%;height:500px;" 
    url="${pageContext.request.contextPath}/roleManager/list.do"
    idField="id" allowResize="true" multiSelect="true" 
    sizeList="[20,30,50,100]" pageSize="20" 
    showHeader="true" title="机构列表"
 onmouseup="return datagrid1_onmouseup()">
    <div property="columns">
        <div field="roleId" width="80" align="center" headerAlign="center" allowSort="true">序号</div>  
        <div type="checkcolumn"></div>
        <div field="roleName" width="120" headerAlign="center"align="center" allowSort="true">机构名称</div>   
        <div field="roleLevel" width="120" headerAlign="center"align="center" allowSort="true">机构等级</div>     
        <div field="description" width="120" headerAlign="center"align="center" allowSort="true">描述</div>                         
    </div>
</div>
<div class = "mini-window"id="editForm" style="width:60%;border:solid 1px #aaa;display:none;">
<fieldset style="width:97%;border:solid 1px #aaa;" id="editField">
        <legend>机构信息</legend>
        <div id="editForm1" style="padding:5px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:80px;">机构名称：</td>
                    <td style="width:150px;"><input id="roleName" name="roleName" class="mini-textbox" required="true"/></td>
                    <td style="width:80px;">机构等级：</td>
                    <td style="width:150px;"><input id="roleLevel" name="roleLevel" class="mini-textbox" required="true"/></td>
               </tr>
               <tr>
                    <td style="width:80px;">描述：</td>
                    <td colspan="3" >
						<textarea style="width:100%;" class="mini-textarea" name="description" emptyText=""></textarea> 
                    <input id="roleId" name="roleId" class="mini-hidden" /></td>
               </tr>
               <tr >
                    <td colspan="4" align="center"><a class="mini-button" iconCls="icon-add" onclick="save()">保存</a></td>
               </tr>
            </table>
        </div>
    </fieldset>
    </div>
</body>
<div class = "mini-window"id="menuForm" style="width:20%;height:auto;display:none;">
	<table style="width:100%;">
		<tr>
			<ul id="tree2" class="mini-tree" style="width:200px;padding:5px;" 
		        checkRecursive="false" showTreeIcon="true" textField="text" idField="id" parentField="parentId" resultAsTree="false"  
		        showCheckBox="true"   _checkOnTextClick="true" >
		    </ul>
		<tr>
	    <tr >
	    	<td align="center"><a  class="mini-button" iconCls="icon-add" onclick="menuBand()">保存</a>
	    </tr>
    </table>
</div>
</body>

<script type="text/javascript">
        
    //初始化砍伐信息
    mini.parse();
    var grid = mini.get("dataGrid");
    grid.load();
    
	//绑定表单
	var db = new mini.DataBinding();
	db.bindForm("editForm", grid);
	var editField = mini.get("editForm");
	var menuField = mini.get("menuForm");
	
	function queryList() {
    	//var planName = mini.get("planName").getValue();
    	var form = new mini.Form("#queryForm");
    	var data = form.getData();
    	grid.load(data);
	}
	
	function onRenderer(e) {
		if ("1" == e.value) return "是";
		else if("0" == e.value) return "否";
		else return "";
    }
	
	function add() {
		var form = new mini.Form("#editForm"); 
		form.setData();
    	editField.show();
	}
	function edit() {
		var form = new mini.Form("#editForm"); 
    	var rows = grid.getSelecteds();
    	var id = "";
    	if (rows.length > 1 ||rows.length==0) {
        	alert("请选择一条记录");
    		return false;
    	}else{
    		editField.show();
    		form.setData(rows[0]);
    	}
    	
	}
	
	function menu() {
		var tree = mini.get("tree2");
		tree.load ( '${pageContext.request.contextPath}/menuManager/list.do ');	
		var form = new mini.Form("#menuForm"); 
    	var rows = grid.getSelecteds();
    	var id = "";
    	if (rows.length > 1 ||rows.length==0) {
        	alert("请选择一条记录");
    		return false;
    	}else{
    		menuField.show();
    		
    	    var rows = grid.getSelecteds();
    	    $.ajax({
    	        url: "${pageContext.request.contextPath}/roleManager/getMenuId.do",
    	        type: "post",
    	        data: {roleId:rows[0].roleId},
    	        success: function (text) {
    	        	tree.checkNodes ( text );
    	        }
    		})
    	}
    	
	}
	
	function menuBand(){
		var tree = mini.get("tree2");
		var nodes = tree.getValue( true);
		var rows = grid.getSelecteds();
		
		$.ajax({
        	url: "${pageContext.request.contextPath}/roleManager/menuBand.do",
        	data: { roleId: rows[0].roleId ,nodes: nodes},
        	type: "post",
        	success: function (text) {
        		alert("绑定成功！");
        		menuField.hide();
            	grid.reload();
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
     			ids+=","+value.roleId;
			});
    	}else{
    		alert("请选择一条删除记录");
    		return false;
    	}
  		ids=ids.substring(1);
    	$.ajax({
        	url: "${pageContext.request.contextPath}/roleManager/delete.do",
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
       	var roleId = mini.getByName("roleId");
       	
       	if(roleId.getValue() == '') roleId.setValue(0);
       	
       	var data = form.getData();      //获取表单多个控件的数据	
		var json = mini.encode(data);
		
   		$.ajax({
       		url: "${pageContext.request.contextPath}/roleManager/save.do",
       		data: { data: json },
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
	
</script>

</html>


