<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<jsp:include page="WEB-INF/pages/common/import.jsp"></jsp:include>
<title>登录</title>
</head>
<body>
	<div id="loginWindow" class="mini-window" title="用户登录" style="width:300px;height:170px;" allowDrag="false" showModal="true" showCloseButton="false">
	    <div id="loginForm" style="padding:15px;padding-top:10px;">
	        <table >
	            <tr>
	                <td style="width:60px;"><label for="username$text">帐号：</label></td>
	                <td>
	                    <input id="username" name="username" class="mini-textbox" required="true" style="width:150px;"/>
	                </td>    
	            </tr>
	            <tr>
	                <td style="width:60px;"><label for="pwd$text">密码：</label></td>
	                <td>
	                    <input id="pwd" name="pwd" class="mini-password" requiredErrorText="密码不能为空" required="true" style="width:150px;" onenter="onLoginClick"/>
	                </td>
	            </tr>            
	            <tr>
	                <td></td>
	                <td style="padding-top:5px;">
	                    <a onclick="onLoginClick" class="mini-button" style="width:60px;">登录</a>
	                    <a onclick="onResetClick" class="mini-button" style="width:60px;">重置</a>
	                </td>
	            </tr>
	        </table>
	    </div>

	</div>
    
	<script type="text/javascript">
	    mini.parse();
	
	    var loginWindow = mini.get("loginWindow");
	    loginWindow.show();
	
	    function onLoginClick(e) {
	        var form = new mini.Form("#loginForm");
	
	        form.validate();
	        if (form.isValid() == false) return;
	        loginWindow.hide();
	        var data = form.getData();      //获取表单多个控件的数据
	        $.ajax({
	            url: "${pageContext.request.contextPath}/login.do",
	            type: "post",
	            data:  data ,
	            success: function (text) {
	            	if(text.result == 'success'){
	            		window.location = "${pageContext.request.contextPath}/main.jsp";
	            	}else {
	            		alert(text.msg);
	            		window.location = "${pageContext.request.contextPath}";
	            	}
	                
	            },
	            error: function(text){
	            	alert("登录失败，请重新登录！");
	            	window.location = "${pageContext.request.contextPath}";
	            }
	        });
	        

	        
	    }
	    
	    function onResetClick(e) {
            var form = new mini.Form("#loginWindow");
            form.clear();
        }

	</script>
	
</body>
</html>

