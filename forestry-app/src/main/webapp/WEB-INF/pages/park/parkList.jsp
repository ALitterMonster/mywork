<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/import.jsp"></jsp:include>
<title>森林公园管理</title>
</head>
<body>
<div id="loggingPlanQueryForm" >
    <table>
        <tr>
            <td >时间段</td>
            <td>
                <input id="periodStart1" name="periodStart" class="mini-datepicker" />-
                <input id="periodEnd1" name="periodEnd" class="mini-datepicker" />
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
 <div id="parkGrid" class="mini-datagrid" style="width:100%;height:500px;" 
    url="${pageContext.request.contextPath}/park/queryParkList.do"
    idField="id" allowResize="true" multiSelect="true" 
    sizeList="[20,30,50,100]" pageSize="20" 
    showHeader="true" title="森林公园情况列表"
 	onmouseup="return datagrid1_onmouseup()">
    <div property="columns">
        <div field="id" width="80" align="center" headerAlign="center" allowSort="true">序号</div>  
         <div type="checkcolumn"></div>
        <div field="createdAt" width="120" dateFormat="yyyy-MM-dd"align="center" headerAlign="center" allowSort="true">创建时间</div>    
        <div field="createdBy" width="120" headerAlign="center"align="center" allowSort="true">创建用户</div>                            
        <div field="periodStart" headerAlign="center" width="100"align="center" dateFormat="yyyy-MM-dd" allowSort="true">时间段（开始）</div>                                
        <div field="periodEnd" headerAlign="center" width="100"align="center" dateFormat="yyyy-MM-dd" allowSort="true">时间段（结束）</div>                                
        <div field="passengerFlow" width="100"  align="center" headerAlign="center">客流量</div>
        <div field="vegetationCoverage" width="100"  align="center" headerAlign="center">植被覆盖率</div>
        <div field="animalSpecies" width="100"  align="center" headerAlign="center">动物种类</div>
        <div field="plantSpecies" width="100"  align="center" headerAlign="center">植物种类</div>
    </div>
</div>
<div class = "mini-window"id="editForm" style="width:60%;border:solid 1px #aaa;display:none;">
<fieldset style="width:97%;border:solid 1px #aaa;" id="editField">
        <legend>森林公园情况信息</legend>
        <div id="editForm1" style="padding:5px;">
            <table style="width:100%;">
               <tr>
                <td style="width:80px;">时间段：</td>
                 <td align="left" colspan="3" style="width:150px;">
                    <input id="recordId" name="recordId" class="mini-hidden" />
                 	<input id="periodStart" name="periodStart" class="mini-datepicker" required="true" />-
                 	<input id="periodEnd" name="periodEnd" class="mini-datepicker" required="true" />
                 </td>
               </tr>
               <tr>
                    <td style="width:80px;">客流量：</td>
                    <td style="width:150px;"><input id="passengerFlow" name="passengerFlow" class="mini-textbox"required="true" />
					<td style="width:80px;">植被覆盖率：</td>
                    <td style="width:150px;"><input id="vegetationCoverage" name="vegetationCoverage" class="mini-textbox"required="true" />
               </tr>
               <tr>
                    <td style="width:80px;">动物种类：</td>
                    <td style="width:150px;"><input id="animalSpecies" name="animalSpecies" class="mini-textbox"required="true" />
					<td style="width:80px;">植物种类：</td>
                    <td style="width:150px;"><input id="plantSpecies" name="plantSpecies" class="mini-textbox"required="true" />
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
    var grid = mini.get("parkGrid");
    grid.load({periodStart:'',periodEnd:''});

	//绑定表单
	var db = new mini.DataBinding();
	db.bindForm("editForm", grid);
	var editField = mini.get("editForm");
	
	function queryList() {
    	var periodStart = mini.get("periodStart1").getFormValue();
    	var periodEnd = mini.get("periodEnd1").getFormValue();
    	if(periodStart!="" || periodEnd!=""){
    		if(periodStart>periodEnd){
    			alert("查询截止日期不能大于开始日期！");
    			return false;
    		}
    	}
    	if(periodStart!=""){
    		periodStart +=" 00:00:00";
    	}
    	if(periodEnd!=""){
    		periodEnd +=" 23:59:59";
    	}
    	grid.load({periodStart:periodStart,periodEnd:periodEnd});
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
        	url: "${pageContext.request.contextPath}/park/queryParkById.do",
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
        	url: "${pageContext.request.contextPath}/park/batchDeletePark.do",
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
		if(data.periodStart!=""){
			data.periodStart=mini.get("periodStart").getFormValue()+" 00:00:00";
		}
		if(data.periodEnd!=""){
			data.periodEnd=mini.get("periodEnd").getFormValue()+" 00:00:00";
		}
		
		if(periodStart!="" || periodEnd!=""){
    		if(periodStart>periodEnd){
    			alert("查询截止日期不能大于开始日期！");
    			return false;
    		}
    	}
		
		if(data.recordId==""){
			var json = mini.encode(data);
    		$.ajax({
        		url: "${pageContext.request.contextPath}/park/addPark.do",
        		data: { park: json },
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
        		url: "${pageContext.request.contextPath}/park/updatePark.do",
        		data: { park: json },
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


