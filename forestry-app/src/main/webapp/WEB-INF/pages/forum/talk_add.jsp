<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>话题</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="../common/import.jsp"></jsp:include>
</head>

<body>
<div id="addForm" style="padding: 10px">
	<table border="0" cellpadding="2" cellspacing="0" style="width:auto;table-layout:fixed;" >
		<tr>
			<td align="left" style="width:500px;">一句话描述您的疑问<br\>
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
					<input type="button" value="保存" class="but_2" onclick="doSave();"/>&nbsp;&nbsp;<input type="button" value="关闭" class="but_2" onclick="closeWin();"/> 
	        	</td>
	    	</tr>
	 	</table>
	</div>
<script type="text/javascript">
mini.parse();
form = new mini.Form("#addForm");
function doSave(){
	try{
		
		var data = form.getData();//获取表单多个控件的数据
		data = mini.encode(data);//序列化成JSON
		MiniUtils.request({
			url: __CONTEXT_PATH__+"/m31/m310401/qaQuestionAction!addQuestion.action",
			data: { jsonData: data },
			success: function (text) {
				MiniUtils.info("保存成功!",closeWin);
			},
			error: function (text) {
				mini.alert("提交失败，返回结果:" + text);
			}
		});
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}


function closeWin(){
	try{
		if (window.CloseOwnerWindow){
			return window.CloseOwnerWindow();
		}else{
			window.close();
		}
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

</script>
</body>
</html>