<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我的话题</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="../common/import.jsp"></jsp:include>
</head>

<body style="margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;">

	<div id="div_query" style="width:100%;">
		<table style="width:100%;" >
			<tr>
				<td style="width:5%;" align="right">分类：</td>
				<td align="left" style="width:10%;">
					<input id="filterKey" name="filterKey"  class="mini-combobox"  data="[{ id: 'myask', text: '我的提问'},{ id: 'myanswer', text: '我的回答'},{ id: 'mycomment', text: '我的评论'},{ id: 'mycollect', text: '我的收藏'}]"
			               value="myask" textField="text" valueField="id"  showNullItem="false" allowInput="false" style="width:100%;" onvaluechanged="initGrid();"/>
				</td>
				<td align="left" style="width:30%;">
					<input id="queryText" name="queryText" class="mini-textbox"  style="width:100%;" emptyText="请输入问题名称或补充描述" />
				</td>
				<td align="right" style="width:10%;"><a class="mini-button"  iconCls="icon-search" onclick="doQuery();">查询</a> </td>
				<td style="width:45%;" align="right">&nbsp;</td>
			</tr>
		</table>
	</div>
	
	<div  style="width: 100%; height: 100%;" align="center">
		<div style="width: 99%;">
		<div id="div_cxjg"  class="mini-toolbar" style="border-bottom: 0; padding: 0px;" align="left">
			<table style="width:100%;">
				<tr>
					<td style="width:100%;">
						<a id="a_add" class="mini-button" iconCls="icon-addnew" plain="true" onclick="toAdd();">提问</a>
						<a id="a_edit" class="mini-button" iconCls="icon-edit" plain="true" onclick="toEdit();">修改问题</a>
						<a id="a_close" class="mini-button" iconCls="icon-no" plain="true" onclick="doClose();">关闭问题</a>
						<a id="a_delete" class="mini-button" iconCls="icon-remove" plain="true" onclick="doDelete();">删除问题</a>
						<a id="a_delAnswer" class="mini-button" iconCls="icon-remove" plain="true" onclick="delAnswer();">删除回答</a>
						<a id="a_delComment" class="mini-button" iconCls="icon-remove" plain="true" onclick="delComment();">删除评论</a>
						<a id="a_cancelMycollect" class="mini-button" iconCls="icon-remove" plain="true" onclick="cancelMycollect();">取消收藏</a>
					</td>
				</tr>
			</table>
		</div>
		</div>
	
		<div id="myqaGrid" class="mini-datagrid" style="width:99%;height:86%;" allowResize="false"
        			url="${pageContext.request.contextPath}/m31/m310401/qaQuestionAction!queryQuestion.action"  idField="id" multiSelect="false" 
        			pageSize="20" >

		</div>
    </div>
<script type="text/javascript">
mini.parse();
var myqaGrid= mini.get('myqaGrid');

var statusArray = [{ id: 20, text: '待回答' }, { id: 30, text: '已关闭'}];        
        
initGrid();

function initGrid(){
	try{
		var filterValue=mini.get('filterKey').getValue();
		if(filterValue=="myask"){
			$("#a_add").show();
			$("#a_edit").show();
			$("#a_close").show();
			$("#a_delete").show();
			$("#a_delAnswer").hide();
			$("#a_delComment").hide();
			$("#a_cancelMycollect").hide();
			myqaGrid.clearRows();
			myqaGrid.set({
		        columns: [
		        	{ type: "checkcolumn",width: 6},
		        	{ type: "indexcolumn",width: 10},
		        	{ field: "id", visible: false, editor: { type: "textbox"} },
		        	{ field: "title", width: 200, headerAlign: "center", allowSort: true, header: "问题", editor: { type: "textbox"} },
	            	{ field: "asktime", width: 40, headerAlign: "center", align:"center", dateFormat: "yyyy-MM-dd HH:mm:ss", allowSort: true, header: "提问时间", editor: { type: "datepicker"} },
		        	{ field: "acount", width: 20, headerAlign: "center", align:"center", allowSort: true, header: "回答人数", editor: { type: "textbox"} },
		        	{ field: "vcount", width: 20, headerAlign: "center", align:"center", allowSort: true, header: "浏览人数", editor: { type: "textbox"} },
           		 	{ field: "status", type: "comboboxcolumn", autoShowPopup: true, width: 20, headerAlign: "center", align:"center", header: "状态", editor: { type: "combobox", data: statusArray} }
			    ]
		    });
			
			myqaGrid.on("drawcell", function (e) {
				var record = e.record,column = e.column,field = e.field,value = e.value;
				if (field == "title") {
					e.cellStyle = "text-align:left";
					e.cellHtml = '<a style="text-decoration:underline;" href="javascript:toView(\'' + record.id + '\')">'+record.title+'</a>';
				}
			});
			
		}else if(filterValue=="myanswer"){
			$("#a_add").hide();
			$("#a_edit").hide();
			$("#a_close").hide();
			$("#a_delete").hide();
			$("#a_delAnswer").show();
			$("#a_delComment").hide();
			$("#a_cancelMycollect").hide();
			myqaGrid.clearRows();
			myqaGrid.set({
		        columns: [
		        	{ type: "checkcolumn",width: 6},
		        	{ type: "indexcolumn",width: 10},
		        	{ field: "id", visible: false, editor: { type: "textbox"} },
		        	{ field: "memo", width: 200, headerAlign: "center", allowSort: true, header: "回答内容", editor: { type: "textbox"} },
	            	{ field: "answertime", width: 35, headerAlign: "center", align:"center", dateFormat: "yyyy-MM-dd HH:mm:ss", allowSort: true, header: "回答时间", editor: { type: "datepicker"} },
		        	{ field: "cmtcount", width: 20, headerAlign: "center", align:"center", allowSort: true, header: "评论数", editor: { type: "textbox"} },
		        	{ field: "goodcount", width: 20, headerAlign: "center", align:"center", allowSort: true, header: "赞同数", editor: { type: "textbox"} }
			    ]
		    });
			
			myqaGrid.on("drawcell", function (e) {
				var record = e.record,column = e.column,field = e.field,value = e.value;
				if (field == "memo") {
					e.cellStyle = "text-align:left";
					e.cellHtml = '<a style="text-decoration:underline;" href="javascript:toView(\'' + record.questionid + '\')">'+record.memo+'</a>';
				}
			});
			
		}else if(filterValue=="mycomment"){
			$("#a_add").hide();
			$("#a_edit").hide();
			$("#a_close").hide();
			$("#a_delete").hide();
			$("#a_delAnswer").hide();
			$("#a_delComment").show();
			$("#a_cancelMycollect").hide();
			myqaGrid.clearRows();
			myqaGrid.set({
		        columns: [
		        	{ type: "checkcolumn",width: 6},
		        	{ type: "indexcolumn",width: 10},
		        	{ field: "id", visible: false, editor: { type: "textbox"} },
		        	{ field: "memo", width: 200, headerAlign: "center", allowSort: true, header: "评论内容", editor: { type: "textbox"} },
	            	{ field: "operatortime", width: 35, headerAlign: "center", align:"center", dateFormat: "yyyy-MM-dd HH:mm:ss", allowSort: true, header: "评论时间", editor: { type: "datepicker"} }
			    ]
		    });
			
			myqaGrid.on("drawcell", function (e) {
				var record = e.record,column = e.column,field = e.field,value = e.value;
				if (field == "memo") {
					e.cellStyle = "text-align:left";
					e.cellHtml = '<a style="text-decoration:underline;" href="javascript:toView(\'' + record.questionid + '\')">'+record.memo+'</a>';
				}
			});
			
		}else if(filterValue=="mycollect"){
			$("#a_add").hide();
			$("#a_edit").hide();
			$("#a_close").hide();
			$("#a_delete").hide();
			$("#a_delAnswer").hide();
			$("#a_delComment").hide();
			$("#a_cancelMycollect").show();
			myqaGrid.clearRows();
			myqaGrid.set({
		        columns: [
		        	{ type: "checkcolumn",width: 6},
		        	{ type: "indexcolumn",width: 10},
		        	{ field: "id", visible: false, editor: { type: "textbox"} },
		        	{ field: "title", width: 200, headerAlign: "center", allowSort: true, header: "问题", editor: { type: "textbox"} },
	            	{ field: "collecttime", width: 35, headerAlign: "center", align:"center", dateFormat: "yyyy-MM-dd HH:mm:ss", allowSort: true, header: "收藏时间", editor: { type: "datepicker"} },
           		 	{ field: "status", type: "comboboxcolumn", autoShowPopup: true, width: 20, headerAlign: "center", align:"center", header: "状态", editor: { type: "combobox", data: statusArray} }
			    ]
		    });
			
			myqaGrid.on("drawcell", function (e) {
				var record = e.record,column = e.column,field = e.field,value = e.value;
				if (field == "title") {
					e.cellStyle = "text-align:left";
					e.cellHtml = '<a style="text-decoration:underline;" href="javascript:toView(\'' + record.questionid + '\')">'+record.title+'</a>';
				}
			});
			
		}else{
			mini.alert("分类不正确");
			return;
		}
		
		
		
		
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

function doQuery(){
	try{
    	var form = new mini.Form("#div_query");
    	var form_json=mini.encode(form.getData());
    	//alert(form_json);
    	myqaGrid.load( eval("("+form_json+")"));
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

function toView(questionid){
	try{
		mini.open({
                url: "${pageContext.request.contextPath}/pages/forum/talk_view.jsp",
                title: "问答详细信息", width: 800, height: 500,
                onload: function () {
                   	var iframe = this.getIFrameEl();
                    var data = { questionid: questionid};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                    //todo
                }
            });
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

function toAdd(){
	try{
		mini.open({
                url: "${pageContext.request.contextPath}/pages/forum/talk_add.jsp",
                title: "我要提问", width: 600, height: 300,
                onload: function () {
                   	//do nothing
                },
                ondestroy: function (action) {
                	doQuery();
                }
            });
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

function toEdit(){
	try{
		var row=myqaGrid.getSelected();
		if(row){
			mini.open({
                url: __CONTEXT_PATH__ + "/pages/m31/m310401/m310401_edit.jsp",
                title: "我要提问", width: 600, height: 300,
                onload: function () {
                   	var iframe = this.getIFrameEl();
                    var data = { questionid: row.id};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                	doQuery();
                }
            });
		}else{
			mini.alert("请选择要修改的事项");
		}
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

function doClose(){
	try{
		var row=myqaGrid.getSelected();
		if(row){
			MiniUtils.request({
				url: __CONTEXT_PATH__+"/m31/m310401/qaQuestionAction!colseQuestion.action",
				data: { questionid: row.id },
				success: function (text) {
					mini.alert("关闭问题成功");
					doQuery();
				},
				error: function (text) {
					mini.alert( text);
				}
			});
		}else{
			mini.alert("请选择要修改的事项");
		}
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

function doDelete(){
	try{
		var row=myqaGrid.getSelected();
		if(row){
			MiniUtils.request({
				url: __CONTEXT_PATH__+"/m31/m310401/qaQuestionAction!deleteQuestion.action",
				data: { questionid: row.id },
				success: function (text) {
					mini.alert("删除问题成功");
					doQuery();
				},
				error: function (text) {
					mini.alert("提交失败，返回结果:" + text);
				}
			});
		}else{
			mini.alert("请选择要删除的记录");
		}
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

function delAnswer(){
	try{
		var row=myqaGrid.getSelected();
		if(row){
			MiniUtils.request({
				url: __CONTEXT_PATH__+"/m31/m310401/qaAnswerAction!deleteAnswer.action",
				data: { id: row.id },
				success: function (text) {
					mini.alert("删除回答成功");
					doQuery();
				},
				error: function (text) {
					mini.alert("提交失败，返回结果:" + text);
				}
			});
		}else{
			mini.alert("请选择要删除的记录");
		}
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

function delComment(){
	try{
		var row=myqaGrid.getSelected();
		if(row){
			MiniUtils.request({
				url: __CONTEXT_PATH__+"/m31/m310401/qaCommentAction!deleteComment.action",
				data: { id: row.id },
				success: function (text) {
					mini.alert("删除评论成功");
					doQuery();
				},
				error: function (text) {
					mini.alert("提交失败，返回结果:" + text);
				}
			});
		}else{
			mini.alert("请选择要删除的记录");
		}
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

function cancelMycollect(){
	try{
		var row=myqaGrid.getSelected();
		if(row){
			MiniUtils.request({
				url: __CONTEXT_PATH__+"/m31/m310401/qaCollectAction!cancelCollect.action",
				data: { id: row.id },
				success: function (text) {
					mini.alert("取消收藏成功");
					doQuery();
				},
				error: function (text) {
					mini.alert("提交失败，返回结果:" + text);
				}
			});
		}else{
			mini.alert("请选择要取消的收藏");
		}
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

</script>
</body>
</html>
