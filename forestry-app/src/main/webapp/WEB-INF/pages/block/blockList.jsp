<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/import.jsp"></jsp:include>
<title>区块信息管理</title>
</head>
<body>
<div id="loggingPlanQueryForm" >
    <table>
        <tr>
        	<td >区域类型：</td>
            <td>
            	<input id="blockType" name="blockType" class="mini-combobox" style="width:150px;" textField="text" valueField="id" 
                    data="[{id:1,text:'工业区'},{id:2,text:'农业区'},{id:3,text:'能源区'},{id:4,text:'矿区'},{id:5,text:'加工工业区'},{id:6,text:'风景旅游区'}]" 
                    value="" showNullItem="true" allowInput="true"/>
            </td>
            <td >经度：</td>
            <td>
                <input class="mini-textbox" id="longitude" name="longitude"/>
            </td>
            <td >纬度：</td>
            <td>
                <input class="mini-textbox" id="latitude" name="latitude"/>
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
 <div id="blockGrid" class="mini-datagrid" style="width:100%;height:500px;" 
    url="${pageContext.request.contextPath}/block/queryBlockList.do"
    idField="id" allowResize="true" multiSelect="true" 
    sizeList="[20,30,50,100]" pageSize="20" 
    showHeader="true" title="区块信息列表"
 onmouseup="return datagrid1_onmouseup()">
    <div property="columns">
        <div field="id" width="80" align="center" headerAlign="center" allowSort="true">序号</div>  
        <div type="checkcolumn"></div>
        <div field="blockType" width="100"  align="center" headerAlign="center" renderer="onRenderer">区域类型</div>
        <div field="longitude" width="100"  align="center" headerAlign="center">经度</div>
        <div field="latitude" width="100"  align="center" headerAlign="center">纬度</div>
        <div field="temperature" width="100"  align="center" headerAlign="center">温度</div>
        <div field="windDirection" width="100"  align="center" headerAlign="center">风向</div>
        <div field="airHumidity" width="100"  align="center" headerAlign="center">空气湿度</div>
        <div field="contactor" width="100"  align="center" headerAlign="center">联系人</div>
        <div field="contact" width="100"  align="center" headerAlign="center">联系方式</div>
    </div>
</div>
<div class = "mini-window"id="editForm" style="width:60%;border:solid 1px #aaa;display:none;">
<fieldset style="width:97%;border:solid 1px #aaa;" id="editField">
        <legend>区块信息</legend>
        <div id="editForm1" style="padding:5px;">
            <table style="width:100%;">
               <tr>
                    <td style="width:80px;">区域类型：</td>
                    <td style="width:150px;">
                    <input id="recordId" name="recordId" class="mini-hidden" />
                    <input id="blockType" name="blockType" class="mini-combobox" style="width:150px;" textField="text" valueField="id" 
                    data="[{id:1,text:'工业区'},{id:2,text:'农业区'},{id:3,text:'能源区'},{id:4,text:'矿区'},{id:5,text:'加工工业区'},{id:6,text:'风景旅游区'}]" 
                    value="" showNullItem="true" allowInput="true" required="true"/>
					<td style="width:80px;">经度：</td>
                    <td style="width:150px;"><input id="longitude" name="longitude" class="mini-textbox"required="true" />
               </tr>
               <tr>
                    <td style="width:80px;">纬度：</td>
                    <td style="width:150px;"><input id="latitude" name="latitude" class="mini-textbox"required="true" />
					<td style="width:80px;">温度：</td>
                    <td style="width:150px;"><input id="temperature" name="temperature" class="mini-textbox"required="true" />
               </tr>
               <tr>
                    <td style="width:80px;">风向：</td>
                    <td style="width:150px;"><input id="windDirection" name="windDirection" class="mini-textbox"required="true" />
					<td style="width:80px;">空气湿度：</td>
                    <td style="width:150px;"><input id="airHumidity" name="airHumidity" class="mini-textbox"required="true" />
               </tr>
               <tr>
                    <td style="width:80px;">联系人：</td>
                    <td style="width:150px;"><input id="contactor" name="contactor" class="mini-textbox"required="true" />
					<td style="width:80px;">联系方式：</td>
                    <td style="width:150px;"><input id="contact" name="contact" class="mini-textbox"required="true" />
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
        
    //初始化区块信息
    mini.parse();
    var grid = mini.get("blockGrid");
    grid.load({blockType:'',longitude:'',latitude:''});

    function onRenderer(e) {
		if ("1" == e.value) return "工业区";
		else if("2" == e.value) return "农业区";
		else if("3" == e.value) return "能源区";
		else if("4" == e.value) return "矿区";
		else if("5" == e.value) return "加工工业区";
		else if("6" == e.value) return "风景旅游区";
		else return "";
    }
    
	//绑定表单
	var db = new mini.DataBinding();
	db.bindForm("editForm", grid);
	var editField = mini.get("editForm");
	
	function queryList() {
		var form = new mini.Form("#loggingPlanQueryForm");
    	var data = form.getData();
    	alert(mini.encode(data))
    	grid.load(data);
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
        	url: "${pageContext.request.contextPath}/block/queryBlockById.do",
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
        	url: "${pageContext.request.contextPath}/block/batchDeleteBlock.do",
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
		if(data.recordId==""){
			var json = mini.encode(data);
    		$.ajax({
        		url: "${pageContext.request.contextPath}/block/addBlock.do",
        		data: { block: json },
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
        		url: "${pageContext.request.contextPath}/block/updateBlock.do",
        		data: { block: json },
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


