<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>新增事项</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="<c:url value="/resources/miniui/jquery-1.11.0.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/miniui/miniui.cmc.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/miniui/mini-utils.js"/>"></script>
<script>var __CONTEXT_PATH__="${pageContext.request.contextPath}";</script>
<link href="<c:url value="/resources/miniui/themes/default/miniui.css?v=${STATIC_FILE_VERSION}"/>" rel="stylesheet" type="text/css" />
<style type="text/css">
body {
	font: 14px/24px arial, "宋体", sans-serif, "Microsoft YaHei", tahoma; color: rgb(51, 51, 51); font-size-adjust: none; font-stretch: normal;
}
textarea {
	font-family: "Microsoft YaHei";
}
ul {
	list-style: none;
}

li {
	list-style: none;
}
a {
	color: rgb(45, 100, 179); text-decoration: none;
}
a:hover {
	text-decoration: underline;
}
html {
}
body {
}
body.layout-ihome {
	font-family: "Microsoft YaHei",SimSun,arial,"宋体"; font-size: 15px; background-color: rgb(243, 243, 243);
}
body.layout-ihome .ihome-content {
	border-width: 0px 1px 1px; border-style: solid; border-color: rgb(220, 220, 220); overflow: hidden; background-color: rgb(255, 255, 255);margin-bottom:20px;
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
</head>

<body class="layout-ihome">
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
			<div style="float:left; text-align:right;" id="div_doas" ><SPAN id="sp_astext" class="span-toas" onclick="toggleBtn('answer-bar','tb_as');">我知道答案<I id="answer-bar" class="i-arrow-down"></I></SPAN></div>
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
					<input type="button" value="回答" class="but_2" onclick="doAnswer();"/>
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


<script type="text/javascript">
mini.parse();

function SetData(data){
	try{
		//跨页面传递的数据对象，克隆后才可以安全使用
		data = mini.clone(data);
		MiniUtils.request({
			url: __CONTEXT_PATH__+"/m31/m310401/qaQuestionAction!viewQuestionAnswer.action",
			data: { questionid: data.questionid },
			success: function (text) {
				$("#questionid").val(data.questionid);
				$("#askerid").val(text.question.askerid);
				$("#sp_title").text(text.question.title);
				$("#sp_askername").text(text.question.askername);
				var askTime=mini.formatDate(text.question.asktime, "yyyy-MM-dd HH:mm:ss");
				$("#sp_asktime").text(askTime);
				$("#sp_footnote").text(text.question.footnote);
				$("#sp_acount").text("回答:"+text.question.acount);
				$("#sp_vcount").text("浏览:"+text.question.vcount);
				if(text.question.iscollect=="1"){
					$("#sp_collect").text("已收藏");
					$("#sp_collect").unbind( "click" );
				}else{
					$("#sp_collect").text("收藏");
					$("#sp_collect").bind("click",doCollect);
				}
				
				var selectedBean=text.selectedBean;
				var myAnswerList=text.myAnswerList;
				var otherAnswerList=text.otherAnswerList;
				if(myAnswerList.length>0 || otherAnswerList.length>0){
					$("#ul_aslist").empty();
					for(var index = 0,l = myAnswerList.length;index<l;index++){
						//当前登录人的回答放最上面
						var answertime=mini.formatDate( myAnswerList[index].answertime, "yyyy-MM-dd HH:mm:ss");
						$("#ul_aslist").append("<li><div class=\"myanswer-cont clearfix\"><div class=\"myanswer-cont-main grid\"><div id=\"div_memo"+myAnswerList[index].id+"\" class=\"myanswer-title\">"+myAnswerList[index].memo+"</div><div class=\"myanswer-info\"><span>"+myAnswerList[index].answername+"</span><span>"+answertime+"</span><span id=\"ascmtcount"+myAnswerList[index].id+"\" style=\"cursor:pointer;\" onclick=\"toComment(\'"+myAnswerList[index].id+"\');\">评论（"+myAnswerList[index].cmtcount+"）</span><span id=\"asgdcount"+myAnswerList[index].id+"\" style=\"cursor:pointer;\" onclick=\"doGood(\'"+myAnswerList[index].id+"\');\">赞同（"+myAnswerList[index].goodcount+"）</span></div></div><div class=\"scomment\" id=\"ascmt"+myAnswerList[index].id+"\"></div></div></li>");
					}
					for(var index = 0,l = otherAnswerList.length;index<l;index++){
						var answertime=mini.formatDate( otherAnswerList[index].answertime, "yyyy-MM-dd HH:mm:ss");
						var strHtml="<li id=\"li_aslist"+otherAnswerList[index].id+"\"><div class=\"myanswer-cont clearfix\"><div class=\"myanswer-cont-main grid\"><div id=\"div_memo"+otherAnswerList[index].id+"\" class=\"myanswer-title\">"+otherAnswerList[index].memo+"</div><div class=\"myanswer-info\"><span>"+otherAnswerList[index].answername+"</span><span>"+answertime+"</span><span id=\"ascmtcount"+otherAnswerList[index].id+"\" style=\"cursor:pointer;\" onclick=\"toComment(\'"+otherAnswerList[index].id+"\');\">评论（"+otherAnswerList[index].cmtcount+"）</span><span id=\"asgdcount"+otherAnswerList[index].id+"\" style=\"cursor:pointer;\" onclick=\"doGood(\'"+otherAnswerList[index].id+"\');\">赞同（"+otherAnswerList[index].goodcount+"）</span>";
						if(text.question.status=="20" && $("#askerid").val()==text.question.curOperatorId){
							//如果问题未关闭，且当前登录人为提问人，显示采纳答案按钮
							strHtml=strHtml+"<span id=\"asselect"+otherAnswerList[index].id+"\" style=\"cursor:pointer;\" onclick=\"doSelect(\'"+otherAnswerList[index].id+"\');\">采纳答案</span>";
						}
						strHtml=strHtml+"</div></div><div class=\"scomment\" id=\"ascmt"+otherAnswerList[index].id+"\"></div></div></li>";
						$("#ul_aslist").append(strHtml);
					}
				}
				
				if(text.question.status=="30" ){
					//如果问题已关闭,不允许回答
					$("#div_doas").empty();
					$("#div_doas").append("<span id=\"sp_astext\" class=\"span-toas-r\">问题已关闭</span>");
					$("#tb_as").hide();
					//如果有采纳的回答
					if(text.question.selectedanswerid.length>0 ){
						var answertime=mini.formatDate( selectedBean.answertime, "yyyy-MM-dd HH:mm:ss");
						$("#div_doas").empty();
						$("#div_doas").append("<span id=\"sp_astext\" class=\"span-toas-r\">问题已采纳答案并关闭</span>");
						$("#ul_selectedAs").append("<li id=\"li_aslist"+selectedBean.id+"\"><div class=\"myanswer-cont clearfix\"><div class=\"myanswer-cont-main grid\"><div id=\"div_memo"+selectedBean.id+"\" class=\"myanswer-title\">"+selectedBean.memo+"</div><div class=\"myanswer-info\"><span>"+selectedBean.answername+"</span><span>"+answertime+"</span><span id=\"ascmtcount"+selectedBean.id+"\" style=\"cursor:pointer;\" onclick=\"toComment(\'"+selectedBean.id+"\');\">评论（"+selectedBean.cmtcount+"）</span><span id=\"asgdcount"+selectedBean.id+"\" style=\"cursor:pointer;\" onclick=\"doGood(\'"+selectedBean.id+"\');\">赞同（"+selectedBean.goodcount+"）</span></div></div><div class=\"scomment\" id=\"ascmt"+selectedBean.id+"\"></div></div></li>");
						$("#div_selectedAs").show();	
					}
				}else{
					//如果问题未关闭，且当前登录人已回答过问题
					if(myAnswerList.length>0){
						$("#sp_astext").html("完善我的回答<I id=\"answer-bar\" class=\"i-arrow-down\"></I>");
						$("#memo").val( myAnswerList[0].memo);
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

function doAnswer(){
	try{
		var memo=$("#memo").val();
		var questionid=$("#questionid").val();
		var data = "{\"memo\":\""+memo+"\",\"questionid\":\""+questionid+"\"}";
		$.ajax({
			url: __CONTEXT_PATH__+"/m31/m310401/qaAnswerAction!addAnswer.action",
			type: "post",
			data: { jsonData: data },
			success: function (text) {
				var obj = mini.decode(text,true);
				var result=obj.result[0];
				
				$("#sp_acount").text("回答:"+result.acount);
				
				if(result.saveType=="insert"){
					var answertime=mini.formatDate(result.answertime, "yyyy-MM-dd HH:mm:ss");
					$("#ul_aslist").prepend("<li id=\"li_aslist"+result.id+"\"><div class=\"myanswer-cont clearfix\"><div class=\"myanswer-cont-main grid\"><div id=\"div_memo"+result.id+"\" class=\"myanswer-title\">"+result.memo+"</div><div class=\"myanswer-info\"><span>"+result.answername+"</span><span>"+answertime+"</span><span id=\"ascmtcount"+result.id+"\" style=\"cursor:pointer;\" onclick=\"toComment(\'"+result.id+"\');\">评论（"+result.cmtcount+"）</span><span id=\"asgdcount"+result.id+"\" style=\"cursor:pointer;\" onclick=\"doGood(\'"+result.id+"\');\">赞同（"+result.goodcount+"）</span></div></div><div class=\"scomment\" id=\"ascmt"+result.id+"\"></div></div></li>");
					$("#sp_astext").text("完善我的回答");
				}else{
					$("#div_memo"+result.id).text(result.memo);
				}
				//mini.alert("提交回答成功!");
				//$("#memo").val("");
			},
			error: function (text) {
				mini.alert("提交失败，返回结果:" + text);
			}
		});
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

function doCollect(){
	try{
		var questionid=$("#questionid").val();
		var data = "{\"questionid\":\""+questionid+"\"}";
		
		MiniUtils.request({
			url: __CONTEXT_PATH__+"/m31/m310401/qaCollectAction!doCollect.action",
			data: { jsonData: data },
			success: function (text) {
				$("#sp_collect").text("已收藏");
				$("#sp_collect").unbind( "click" );
			},
			error: function (text) {
				mini.alert("提交失败，返回结果:" + text);
			}
		});
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

function doInvite(){
	try{
		alert("doCollect");
		var questionid=$("#questionid").val();
		var data = "{\"questionid\":\""+questionid+"\"}";
		
		MiniUtils.request({
			url: __CONTEXT_PATH__+"/m31/m310401/qaCollectAction!doCollect.action",
			data: { jsonData: data },
			success: function (text) {
				$("#sp_collect").text("已收藏");
				$("#sp_collect").unbind( "click" );
			},
			error: function (text) {
				mini.alert("提交失败，返回结果:" + text);
			}
		});
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

function toComment(cntId){
	try{
		var questionid=$("#questionid").val();
		var answerid=cntId;
		
		if($("#ascmt"+cntId).is(":hidden")){
			MiniUtils.request({
				url: __CONTEXT_PATH__+"/m31/m310401/qaCommentAction!listComment.action",
				data: { questionid: questionid,answerid:answerid },
				success: function (text) {
					var list=text.aslist;
					$("#ascmt"+cntId).show();
	        		$("#ascmt"+cntId).empty();
	        		$("#ascmt"+cntId).append("<div id=\"divipt"+cntId+"\" sytle=\"font-size: 12px;font-family:宋体;\"><table style=\"width:100%\"><tr><td style=\"width:70%;\"><input id=\"cmtipt"+cntId+"\" name=\"cmtipt\" style=\"width:95%;\"/></td><td style=\"width:70%;\"><input type=\"button\" value=\"提交评论\" onclick=\"doComment(\'"+cntId+"\');\"/></td></tr></table></div>");
					if(list.length>0){
						var operatortime;
						for(var index = 0,l = list.length;index<l;index++){
							operatortime=mini.formatDate( list[index].operatortime, "yyyy-MM-dd HH:mm:ss");
							$("#ascmt"+cntId).append("<div>"+list[index].memo+"</div><div class=\"cmtlst\"><span>"+list[index].operatorname+"</span>&nbsp;&nbsp;&nbsp;<span>"+operatortime+"</span>&nbsp;&nbsp;&nbsp;<span style=\"cursor:pointer;\" onclick=\"doReplyComment(\'"+list[index].operatorname+"\',\'"+cntId+"\');\">回复</span></div>");
						}
					}
				},
				error: function (text) {
					mini.alert("提交失败，返回结果:" + text);
				}
			});
		
		}else{
			$("#ascmt"+cntId).hide();
	        $("#ascmt"+cntId).empty();
		}
		
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

function doComment(cntId){
	try{
		var cmtMemo=$("#cmtipt"+cntId).val();
		var questionid=$("#questionid").val();
		var answerid=cntId;

		var data = "{\"memo\":\""+cmtMemo+"\",\"questionid\":\""+questionid+"\",\"answerid\":\""+answerid+"\"}";
		$.ajax({
			url: __CONTEXT_PATH__+"/m31/m310401/qaCommentAction!doComment.action",
			type: "post",
			data: { jsonData: data },
			success: function (text) {
				var obj = mini.decode(text,true);
				var result=obj.result[0];
				
				var operatortime=mini.formatDate( result.operatortime, "yyyy-MM-dd HH:mm:ss");
				$("#divipt"+cntId).after("<div>"+result.memo+"</div><div class=\"cmtlst\"><span>"+result.operatorname+"</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>"+operatortime+"</span>&nbsp;&nbsp;&nbsp;<span style=\"cursor:pointer;\" onclick=\"doReplyComment(\'"+result.operatorname+"\',\'"+cntId+"\');\">回复</span></div>");
				//mini.alert("提交评论成功!");
				$("#cmtipt"+cntId).val("");
				$("#ascmtcount"+cntId).text("评论（"+result.cmtcount+"）");
			},
			error: function (text) {
				mini.alert("提交失败，返回结果:" + text);
			}
		});
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

function doReplyComment(name,cntId){
	try{
		$("#cmtipt"+cntId).focus();
		$("#cmtipt"+cntId).val("回复 "+name+":");
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

function doGood(cntId){
	try{
		var questionid=$("#questionid").val();
		var answerid=cntId;

		var data = "{\"memo\":\"赞同\",\"questionid\":\""+questionid+"\",\"answerid\":\""+answerid+"\"}";
		MiniUtils.request( {
			type : "post",
			url : "${pageContext.request.contextPath}/m31/m310401/qaCommentAction!doGood.action",
			data : { jsonData: data },
			success : function(text) {
				
				$("#asgdcount"+cntId).text("赞同（"+text.goodcount+"）");
			},
			error : function(text) {
				MiniUtils.error(text);
			}
		});
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

function doSelect(cntId){
	try{
		var questionid=$("#questionid").val();
		var answerid=cntId;

		var data = "{\"questionid\":\""+questionid+"\",\"id\":\""+answerid+"\"}";
		$.ajax({
			url: __CONTEXT_PATH__+"/m31/m310401/qaAnswerAction!doSelect.action",
			type: "post",
			data: { jsonData: data },
			success: function (text) {
				var obj = mini.decode(text,true);
				var bean=obj.result[0].answerBean;
				var otherAnswerList=obj.result[0].otherAnswerList;
				var answertime=mini.formatDate(bean.answertime, "yyyy-MM-dd HH:mm:ss");
				$("#ul_selectedAs").append("<li id=\"li_aslist"+bean.id+"\"><div class=\"myanswer-cont clearfix\"><div class=\"myanswer-cont-main grid\"><div id=\"div_memo"+bean.id+"\" class=\"myanswer-title\">"+bean.memo+"</div><div class=\"myanswer-info\"><span>"+bean.answername+"</span><span>"+answertime+"</span><span id=\"ascmtcount"+bean.id+"\" style=\"cursor:pointer;\" onclick=\"toComment(\'"+bean.id+"\');\">评论（"+bean.cmtcount+"）</span><span id=\"asgdcount"+bean.id+"\" style=\"cursor:pointer;\" onclick=\"doGood(\'"+bean.id+"\');\">赞同（"+bean.goodcount+"）</span></div></div><div class=\"scomment\" id=\"ascmt"+bean.id+"\"></div></div></li>");
				$("#div_selectedAs").show();	
				
				$("#ul_aslist").empty();
				if(otherAnswerList.length>0){
					var astime;
					for(var index = 0,l = otherAnswerList.length;index<l;index++){
						astime=mini.formatDate( otherAnswerList[index].answertime, "yyyy-MM-dd HH:mm:ss");
						$("#ul_aslist").append("<li id=\"li_aslist"+otherAnswerList[index].id+"\"><div class=\"myanswer-cont clearfix\"><div class=\"myanswer-cont-main grid\"><div id=\"div_memo"+otherAnswerList[index].id+"\" class=\"myanswer-title\">"+otherAnswerList[index].memo+"</div><div class=\"myanswer-info\"><span>"+otherAnswerList[index].answername+"</span><span>"+astime+"</span><span id=\"ascmtcount"+otherAnswerList[index].id+"\" style=\"cursor:pointer;\" onclick=\"toComment(\'"+otherAnswerList[index].id+"\');\">评论（"+otherAnswerList[index].cmtcount+"）</span><span id=\"asgdcount"+otherAnswerList[index].id+"\" style=\"cursor:pointer;\" onclick=\"doGood(\'"+otherAnswerList[index].id+"\');\">赞同（"+otherAnswerList[index].goodcount+"）</span></div></div><div class=\"scomment\" id=\"ascmt"+otherAnswerList[index].id+"\"></div></div></li>");
					}
				}
				
				$("#div_doas").empty();
				$("#div_doas").append("<span id=\"sp_astext\" class=\"span-toas-r\">问题已采纳答案并关闭</span>");
				$("#tb_as").hide();
			},
			error: function (text) {
				mini.alert("提交失败，返回结果:" + text);
			}
		});
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
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

</script>
</body>
</html>