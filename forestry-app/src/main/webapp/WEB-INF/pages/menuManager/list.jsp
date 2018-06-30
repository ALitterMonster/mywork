<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/import.jsp"></jsp:include>
<title>菜单管理</title>
</head>
<body>
<div id="queryForm" >
    <table>
        <tr>
            <td>菜单名称：</td>
            <td>
                <input class="mini-textbox" id="menuName" name="menuName"/>
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
 <div id="dataGrid" class="mini-datagrid" style="width:100%;height:500px;" 
    url="${pageContext.request.contextPath}/menuManager/list.do"
    idField="id" allowResize="true" multiSelect="true" 
    sizeList="[20,30,50,100]" pageSize="20" 
    showHeader="true" title="菜单列表"
 onmouseup="return datagrid1_onmouseup()">
    <div property="columns">
        <div field="id" width="80" align="center" headerAlign="center" allowSort="true">序号</div>  
        <div type="checkcolumn"></div>
        <div field="text" width="120" headerAlign="center"align="center" allowSort="true">菜单名称</div>   
        <div field="url" width="120" headerAlign="center"align="center" allowSort="true">url</div>     
        <div field="description" width="120" headerAlign="center"align="center" allowSort="true">描述</div>  
        <div field="parentId" width="120" headerAlign="center"align="center" allowSort="true">父节点ID</div>                         
    </div>
</div>
<div class = "mini-window"id="editForm" style="width:60%;border:solid 1px #aaa;display:none;">
<fieldset style="width:97%;border:solid 1px #aaa;" id="editField">
        <legend>菜单信息</legend>
        <div id="editForm1" style="padding:5px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:80px;">菜单名称：</td>
                    <td style="width:150px;"><input id="text" name="text" class="mini-textbox" required="true"/></td>
                    <td style="width:80px;">url：</td>
                    <td style="width:150px;"><input id="url" name="url" class="mini-textbox"/></td>
               </tr>
               <tr>
               		<td style="width:80px;">父级ID：</td>
                    <td style="width:150px;"><input id="parentId" name="parentId" class="mini-textbox" required="true"/></td>
               </tr>
               <tr>
                    <td style="width:80px;">描述：</td>
                    <td colspan="3" >
						<textarea style="width:100%;" class="mini-textarea" name="description" emptyText=""></textarea> 
                    <input id="id" name="id" class="mini-hidden" /></td>
               </tr>
               <tr >
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
    var grid = mini.get("dataGrid");
    grid.load();

	//绑定表单
	var db = new mini.DataBinding();
	db.bindForm("editForm", grid);
	var editField = mini.get("editForm");
	
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
        	url: "${pageContext.request.contextPath}/menuManager/delete.do",
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
       	var id = mini.getByName("id");
       	
       	if(id.getValue() == '') id.setValue(0);
       	
       	var data = form.getData();      //获取表单多个控件的数据	
		var json = mini.encode(data);
		
   		$.ajax({
       		url: "${pageContext.request.contextPath}/menuManager/save.do",
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


