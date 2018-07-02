<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我的话题</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
#answerWin textarea {
	font-family: "Microsoft YaHei";
}
#answerWin ul {
	list-style: none;
}

#answerWin li {
	list-style: none;
}
#answerWin a {
	 text-decoration: none;
}
#answerWin a:hover {
	text-decoration: underline;
}
html {
}
body {
}

.line {
	
}
.clearfix {
	
}
.line::after {
	height: 0px; overflow: hidden; clear: both; display: block; visibility: hidden; content: "\0020";
}
.clearfix::after {
	height: 0px; overflow: hidden; clear: both; display: block; visibility: hidden; content: "\0020";
}

.wgt-myqa {
	padding-bottom: 5px; min-height: 100px;
}

.wgt-myqa-title {
	display:inline-block;margin:10px 20px; font-size: 16px;font-weight:600;font-family: "Microsoft YaHei";
}

.wgt-myqa-footnote {
	display:inline-block;margin:0px 20px 10px;font-size: 14px;font-family:"宋体";
}

.wgt-myanswer-list-wp {
	padding-bottom: 10px; min-height: 100px;
}
.wgt-myanswer-list-wp .myanswer-list li {
	padding: 0px 10px;
}
.wgt-myanswer-list-wp .myanswer-list li .myanswer-cont {
	padding: 5px 0px 5px; border-bottom-color: rgb(224, 224, 224); border-bottom-width: 1px; border-bottom-style: dotted;
}
.wgt-myanswer-list-wp .myanswer-list li .myanswer-cont .myanswer-cont-main {
	width: 100%;
}
.wgt-myanswer-list-wp .myanswer-list li .myanswer-cont .myanswer-cont-main .myanswer-title {
	margin: 5px 0px 5px;color: rgb(0, 0, 0); line-height: 1.5; font-size: 14px;font-family:宋体;
}
.wgt-myanswer-list-wp .myanswer-list li .myanswer-cont .myanswer-cont-main .myanswer-info {
	color: rgb(201, 201, 201); font-size: 12px; margin-top: 10px;
}
.wgt-myanswer-list-wp .myanswer-list li .myanswer-cont .myanswer-cont-main .myanswer-info span {
	margin-right: 20px;
}
.wgt-myanswer-filter {
	padding: 5px 10px; background-color: rgb(233, 233, 233);
}
.wgt-myanswer-filter .filter-classify span {
	color: rgb(96, 96, 96); margin: 0px;
}


.span-toas{
margin-top: 0px;font-size: 12px; color: rgb(45, 100, 179); cursor: pointer; display: inline-block;
}
.span-toas-r{
margin-top: 0px;font-size: 12px; color: rgb(201, 201, 201); display: inline-block;
}
.i-arrow-up {
	background:url(${pageContext.request.contextPath}/resources/images/toup.jpg) right 1px no-repeat; width: 16px; height: 16px; vertical-align: bottom; display: inline-block; background-repeat: no-repeat; -moz-box-orient: vertical;
}
.i-arrow-down {
	background:url(${pageContext.request.contextPath}/resources/images/todown.jpg) right 1px no-repeat; width: 16px; height: 16px; vertical-align: bottom; display: inline-block; background-repeat: no-repeat; -moz-box-orient: vertical;
}
.but_2{ background:url(${pageContext.request.contextPath}/resources/images/but_2.jpg) no-repeat;width:60px; height:24px; border:none; cursor:pointer; color:#fff;}
.span_u{margin: 10px 10px 5px 10px;color: rgb(201, 201, 201); font-size: 12px; }

.scomment{width:97%;border:1px solid  rgb(224, 224, 224);background-color:#FFFFFF;overflow:hidden;display:none;padding:10px;font-size: 12px;font-family:宋体;}
.cmtlst{border-bottom:1px dashed #000; min-height:20px;width:100%;color: rgb(201, 201, 201);border-bottom-color: rgb(224, 224, 224);}</style>
<jsp:include page="../common/import.jsp"></jsp:include>
</head>

<body style="margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;">

	<div id="div_query" style="width:100%;">
		<table style="width:100%;" >
			<tr>
				<td align="left" style="width:30%;">
					<input id="queryText" name="queryText" class="mini-textbox"  style="width:100%;" emptyText="请输入问题名称" />
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
						<a id="a_close" class="mini-button" iconCls="icon-no" plain="true" onclick="doDelete();">关闭问题</a>
						<a id="a_close" class="mini-button" iconCls="icon-search" plain="true" onclick="queryAnswer();">查看答案</a>
					</td>
				</tr>
			</table>
		</div>
		</div>
	
		<div id="myqaGrid" class="mini-datagrid" style="width:99%;height:86%;" allowResize="false"
        			url="${pageContext.request.contextPath}/forum/queryList.do"  idField="id" 
        			pageSize="20" multiSelect="true" >
        	<div property="columns">
 				<div field="id" width="80" align="center" headerAlign="center" allowSort="true">序号</div>  
         		<div type="checkcolumn"></div>
       			 <div field="title" width="120" dateFormat="yyyy-MM-dd"align="center" headerAlign="center" allowSort="true">问题名称</div>    
        		<div field="footnote" width="120" headerAlign="center"align="center" allowSort="true">详细信息</div>                            
       			 <div field="updatetime" headerAlign="center" width="100"align="center" dateFormat="yyyy-MM-dd" allowSort="true">创建时间</div>  
       		</div>                              
		</div>
    </div>
    <div class = "mini-window"id="addWin" style="width: 620px;">
    <div id="addForm" style="padding: 10px;">
	<table border="0" cellpadding="2" cellspacing="0" style="width:auto;table-layout:fixed;" >
		<tr>
			<td align="left" style="width:500px;">一句话描述您的疑问<br\>
			<input id="qaId" name="qaId" class="mini-hidden"/>
			<input id="title" name="title" class="mini-textarea"  required="true" style="width: 580px; height: 50px" emptyText="请在这里概述您的问题"/>
			</td>
		</tr>
		<tr>
			<td align="left" style="width:500px;">问题补充描述<span style="color: rgb(177, 177, 177); font-weight: 400; margin-left: 3px;">（选填）</span><br\>
			<input id="footnote" name="footnote" class="mini-textarea"  required="true" style="width: 580px; height: 80px" emptyText="可在这里继续补充问题细节"/>
			</td>
		</tr>
	</table>
	</div>
	<div>
		<table border="0" align="center" cellpadding="0" cellspacing="0">
			<tr align="center">
	        	<td align="center">
					<input type="button" value="保存" class="but_2"style="color: rgb(48, 174, 28);" onclick="doAdd();"/>
					&nbsp;&nbsp;<input type="button" value="关闭" style="color: rgb(48, 174, 28);"class="but_2" onclick="closeWin();"/> 
	        	</td>
	    	</tr>
	 	</table>
	</div>
	</div>

	
	
	<div id="answerWin" class="mini-window"style="width:800px;height:600px">
	<DIV class="ihome-content" id="div_qa_content" style="display: block">
	<DIV class="wgt-myanswer-filter" >
		<DIV class="filter-classify" >
			<span style="color: rgb(48, 174, 28);">问题信息</span>
		</DIV>
	</DIV>

	<DIV class="wgt-myqa">
		<span id="sp_title" class="wgt-myqa-title"></span><br />
		<span id="sp_footnote" class="wgt-myqa-footnote"></span>
	</DIV>
	
	<DIV style="padding-bottom: 5px;">
		<div style="margin:0px 20px 5px 20px;">
			<div style=" text-align:right;" id="div_doas" ><SPAN id="sp_astext" class="span-toas" 
			onclick="toggleBtn('answer-bar','tb_as');">我知道答案<I id="answer-bar" class="i-arrow-down"></I></SPAN></div>
			<div style="float:right; text-align:right;"><span id="sp_askername" class="span_u"></span><span id="sp_asktime" class="span_u"></span><span id="sp_acount" class="span_u"></span><span id="sp_vcount" class="span_u"></span><span id="sp_collect" class="span_u" style="cursor:pointer;" ></span></div>
		</div>
		<div id="tb_as" style="display: none;margin:0px 20px 10px 20px;">
		<table border="0" cellpadding="2" cellspacing="0" style="width:auto;table-layout:fixed;" >
		<tr>
			<td align="left" style="width:710px;">
			<textarea id="memo" name="memo" style="width: 710px; height: 100px;overflow-y:hidden;font-family:'宋体';font-size: 14px;"></textarea>
			<input id="questionid" name="questionid"  type="hidden"/>
			<input id="askerid" name="askerid"  type="hidden"/>
			</td>
		</tr>
		<tr>
			<td align="right">
					<input type="button" value="回答" class="span-toas" onclick="doAnswer();"/>
	        	</td>
		</tr>
		</table>
		</div>
	</DIV>
</DIV>	

<DIV class="ihome-content" id="div_selectedAs" style="display: none">
	<DIV class="wgt-myanswer-filter">
		<DIV class="filter-classify">
			<span style="color: rgb(48, 174, 28);">提问者采纳</span>
		</DIV>
	</DIV>

	<DIV class="wgt-myanswer-list-wp" style="">
		<UL class="myanswer-list" id="ul_selectedAs" style="margin:10px;padding:0px">
			
		</UL>
	</DIV>
</DIV>

<DIV class="ihome-content" id="div_qa_content" style="display: block">
	<DIV class="wgt-myanswer-filter">
		<DIV class="filter-classify">
			<span style="color: rgb(48, 174, 28);">回答信息</span>
		</DIV>
	</DIV>

	<DIV class="wgt-myanswer-list-wp" style="">
		<UL class="myanswer-list" id="ul_aslist" style="margin:10px;padding:0px">
			
		</UL>
	</DIV>
</DIV>
</div>
<script type="text/javascript">
mini.parse();
var myqaGrid= mini.get('myqaGrid');
form = new mini.Form("#addForm");
var statusArray = [{ id: 20, text: '待回答' }, { id: 30, text: '已关闭'}];    
myqaGrid.load();

function doQuery(){
	var title =mini.get("queryText").getValue();
	myqaGrid.load({title:title});
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
	var form = new mini.Form("#addForm"); 
	form.setData();
	var addwin = mini.get("addWin");
	addwin.show();
}
function toEdit(){
	var form = new mini.Form("#addForm"); 
	form.setData();
	var addwin = mini.get("addWin");
	var rows = myqaGrid.getSelecteds();
    if (rows.length > 1 ||rows.length==0) {
        alert("请选择一条记录");
    	return false;
    }else{
    	form.setData(rows[0]);
    	mini.get("qaId").setValue(rows[0].id);
    	addwin.show();
    }

}
function doAdd(){
	var addwin = mini.get("addWin");
	try{
		var form = new mini.Form("#addForm");
		var data = form.getData();//获取表单多个控件的数据
		
		if(mini.get("qaId").getValue()==""){
			var json = mini.encode(data);//序列化成JSON
			$.ajax({
        		url: "${pageContext.request.contextPath}/forum/add.do",
        		data: { data:json},
        		type: "post",
        		success: function (data) {
        			data=mini.decode(data);
        			alert(data.message);
            		addwin.hide();
            		doQuery();
       	 		},
        		error: function (jqXHR, textStatus, errorThrown) {
           		 	alert(jqXHR.responseText);
        		}
    		});
    	}else{
    		data.id=data.qaId;
    		var json = mini.encode(data);//序列化成JSON
    		$.ajax({
        		url: "${pageContext.request.contextPath}/forum/update.do",
        		data: { data:json},
        		type: "post",
        		success: function (data) {
        			data=mini.decode(data);
        			alert(data.message);
            		addwin.hide();
            		doQuery();
       	 		},
        		error: function (jqXHR, textStatus, errorThrown) {
           		 	alert(jqXHR.responseText);
        		}
    		});
    	}
    	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

function doDelete(){
	try{
		var rows = myqaGrid.getSelecteds();
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
        		url: "${pageContext.request.contextPath}/forum/batchDelete.do",
        		data: { ids:ids},
        		type: "post",
        		success: function (data) {
        			data=mini.decode(data);
        			alert(data.message);
            		doQuery();
       	 		},
        		error: function (jqXHR, textStatus, errorThrown) {
           		 	alert(jqXHR.responseText);
        		}
    		});
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
function closeWin(){
	var form = new mini.Form("#addForm"); 
	var addwin = mini.get("addWin");
	form.setData();
	addwin.hide();

}

function SetData(){
	var row=myqaGrid.getSelected();
	
	try{
		$.ajax({
			url: "${pageContext.request.contextPath}/answer/queryList.do",
			data: { questionid: row.id },
			success: function (data) {
				$("#questionid").val(row.id);
				$("#sp_title").text(row.title);
				var askTime=mini.formatDate(row.asktime, "yyyy-MM-dd HH:mm:ss");
				$("#sp_asktime").text(askTime);
				$("#sp_footnote").text(row.footnote);
				if(data.length>0 ){
					$("#ul_aslist").empty();
					for(var index = 0,l = data.length;index<l;index++){
						var answertime=mini.formatDate( data[index].answertime, "yyyy-MM-dd HH:mm:ss");
						var strHtml="<li id=\"li_aslist"+data[index].id+"\">";
						strHtml=strHtml+"<div class=\"myanswer-cont clearfix\"><div class=\"myanswer-cont-main grid\">";
						strHtml=strHtml+"<div id=\"div_memo"+data[index].id+"\" class=\"myanswer-title\">"+data[index].memo;
						strHtml=strHtml+"</div><div class=\"myanswer-info\"><span>"+data[index].answername+"</span><span>"+answertime+"</span>";
						strHtml=strHtml+"</div></div><div class=\"scomment\" id=\"ascmt"+data[index].id+"\"></div></div></li>";
						$("#ul_aslist").append(strHtml);
					}
				}
			},
			error: function (text) {
				mini.alert("提交失败，返回结果:" + text);
			}
		});
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}


function queryAnswer(){
	var answerWin = mini.get("answerWin");
	answerWin.show();
	SetData();
}
function toggleBtn(cssID,contentID){
	try{
		if($("#"+contentID).is(":hidden")){
			$("#"+contentID).show();
	        $("#"+cssID).removeClass().addClass("i-arrow-up");
		}else{
			$("#"+contentID).hide();
	        $("#"+cssID).removeClass().addClass("i-arrow-down");
		}
	}catch(e){
        mini.alert("未知错误："+e.responseText);
	}
}

function doAnswer(){
	try{
		var memo=$("#memo").val();
		var questionid=$("#questionid").val();
		var data = "{\"memo\":\""+memo+"\",\"questionid\":\""+questionid+"\"}";
		$.ajax({
			url: "${pageContext.request.contextPath}/answer/add.do",
			type: "post",
			data: { data: data },
			success: function (text) {
				var result = mini.decode(text,true);
				toggleBtn('answer-bar','tb_as');
				$("#memo").val("");
				//$("#sp_acount").text("回答:"+result.acount);
				var answertime=mini.formatDate(result.answertime, "yyyy-MM-dd HH:mm:ss");
				$("#ul_aslist").prepend("<li id=\"li_aslist"+result.id+"\"><div class=\"myanswer-cont clearfix\"><div class=\"myanswer-cont-main grid\"><div id=\"div_memo"+result.id+"\" class=\"myanswer-title\">"+result.memo+"</div><div class=\"myanswer-info\"><span>"+result.answername+"</span><span>"+answertime+"</span></div></div><div class=\"scomment\" id=\"ascmt"+result.id+"\"></div></div></li>");
				//$("#sp_astext").text("完善我的回答");
				mini.alert("提交回答成功!");
			},
			error: function (text) {
				mini.alert("提交失败，返回结果:" + text);
			}
		});
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

</script>
</body>
</html>
