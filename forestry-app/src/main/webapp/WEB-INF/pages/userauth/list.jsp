<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/import.jsp"></jsp:include>
<title>用户管理</title>
</head>
<body>
<div id="queryForm" >
    <table>
        <tr>
            <td >用户名：</td>
            <td>
                <input class="mini-textbox" id="userName" name="userName"/>
            </td>  
            <td >显示名称：</td>
            <td>
                <input class="mini-textbox" id="name" name="name"/>
            </td>  
            <td >是否有效：</td>
            <td>           
            	<input id="isValid" name="isValid"  class="mini-combobox" style="width:150px;" textField="text" valueField="id" data="[{id:1,text:'是'},{id:0,text:'否'}]" value="" showNullItem="true" allowInput="true"/>
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
    url="${pageContext.request.contextPath}/userauth/list.do"
    idField="id" allowResize="true" multiSelect="true" 
    sizeList="[20,30,50,100]" pageSize="20" 
    showHeader="true" title="人员列表"
 onmouseup="return datagrid1_onmouseup()">
    <div property="columns">
        <div field="userId" width="80" align="center" headerAlign="center" allowSort="true">序号</div>  
        <div type="checkcolumn"></div>
        <div field="userName" width="120" headerAlign="center"align="center" allowSort="true">用户名</div>    
        <div field="name" width="120" headerAlign="center"align="center" allowSort="true">显示名称</div>                            
        <div field="userPwd" width="100"  align="center" headerAlign="center">密码</div>
        <div field="mail" width="100"  align="center" headerAlign="center">邮件</div>
        <div field="mobileNo" width="100"  align="center" headerAlign="center">手机</div>
        <div field="roleName" width="100"  align="center" headerAlign="center">角色</div>
        <div field="fId" width="100"  align="center" headerAlign="center" visible="false"></div>
        <div field="createDate" headerAlign="center" width="100"align="center"  dateFormat="yyyy-MM-dd hh:mm:ss" allowSort="true">创建时间</div>                                
        <div field="updateDate" headerAlign="center" width="100"align="center"  dateFormat="yyyy-MM-dd hh:mm:ss" allowSort="true">修改时间</div>
        <div field="isValid" width="100" headerAlign="center" align="center" renderer="onRenderer" allowSort="true">是否有效</div>                
    </div>
</div>
<div class = "mini-window"id="editForm" style="width:60%;border:solid 1px #aaa;display:none;">
<fieldset style="width:97%;border:solid 1px #aaa;" id="editField">
        <legend>人员信息</legend>
        <div id="editForm1" style="padding:5px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:80px;">用户名：</td>
                    <td style="width:150px;"><input id="userName" name="userName" class="mini-textbox" required="true"/></td>
                    <td style="width:80px;">显示名称：</td>
                    <td style="width:150px;"><input id="name" name="name" class="mini-textbox" required="true"/></td>
               </tr>
               <tr>
                    <td style="width:80px;">密码：</td>
                    <td style="width:150px;"><input id="userPwd" name="userPwd" class="mini-textbox" required="true"/>
                    <input id="userId" name="userId" class="mini-hidden" />
                    <input id="fId" name="fId" class="mini-hidden" /></td>
                    <td style="width:80px;">邮件：</td>
                    <td style="width:150px;"><input id="mail" name="mail" class="mini-textbox" required="true"/></td>
               </tr>
               <tr>
                    <td style="width:80px;">手机：</td>
                    <td style="width:150px;"><input id="mobileNo" name="mobileNo" class="mini-textbox" required="true"/></td>
                    <td style="width:80px;">是否有效：</td>
                    <td style="width:150px;">
                    	<input id="isValid" name="isValid" class="mini-combobox" style="width:150px;" textField="text" valueField="id" data="[{id:1,text:'是'},{id:0,text:'否'}]" value="" showNullItem="true" allowInput="true" required="true"/>
                    </td>
               </tr>
               <tr>
                    <td style="width:80px;">角色：</td>
                    <td style="width:150px;"><input name="roleId"  class="mini-combobox" url="${pageContext.request.contextPath}/roleManager/roleComboBox.do" value="" textField="text" valueField="id" required="true"/></td>
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
	
	function quanxian() {
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
     			ids+=","+value.userId;
			});
    	}else{
    		alert("请选择一条删除记录");
    		return false;
    	}
  		ids=ids.substring(1);
    	$.ajax({
        	url: "${pageContext.request.contextPath}/userauth/delete.do",
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
       	var userId = mini.getByName("userId");
       	
       	if(userId.getValue() == '') userId.setValue(0);
       	
       	var data = form.getData();      //获取表单多个控件的数据	
		var json = mini.encode(data);
		
   		$.ajax({
       		url: "${pageContext.request.contextPath}/userauth/save.do",
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


