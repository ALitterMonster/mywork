<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="resource/scripts/boot.js" type="text/javascript"></script>
	<link href="resource/res/third-party/scrollbar/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
	<script src="resource/res/third-party/scrollbar/jquery.mCustomScrollbar.concat.min.js" type="text/javascript"></script>
   	<link href="resource/frame/menu/menu.css" rel="stylesheet" type="text/css" />
    <script src="resource/frame/menu/menu.js" type="text/javascript"></script>
    <script src="resource/frame/menutip.js" type="text/javascript"></script>
    <link href="resource/frame/tabs.css" rel="stylesheet" type="text/css" />
    <link href="resource/frame/frame.css" rel="stylesheet" type="text/css" />
    <link href="resource/frame/index.css" rel="stylesheet" type="text/css" />
<title>主页</title>
</head>
<body>
    
<div class="navbar">
    <div class="navbar-header">
        <div class="navbar-brand">林业管理系统</div>
        <div class="navbar-brand navbar-brand-compact">M</div>
    </div>
    <ul class="nav navbar-nav">
        <li><a id="toggle"><span class="fa fa-bars" ></span></a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
            <a class="dropdown-toggle userinfo" >
                <img class="user-img" src="resource/frame/images/user.jpg" />个人资料<i class="fa fa-angle-down"></i>
            </a>
            <ul class="dropdown-menu pull-right">
                <li ><a href="#" onclick="showInfo()"><i class="fa fa-eye "></i> 用户信息</a></li>
                <li><a href="#" onclick="exit()"><i class="fa fa-user"></i> 退出登录</a></li>
            </ul>
        </li>
    </ul>
</div>

<div class="container">
    
    <div class="sidebar">
        <div class="sidebar-toggle"><i class = "fa fa-fw fa-dedent" ></i></div>
        <div id="mainMenu">
        </div>
    </div>

    <div class="main">
        <div id="mainTabs" class="mini-tabs main-tabs" activeIndex="0" style="height:100%;" plain="false"
             buttons="#tabsButtons" arrowPosition="side" >
            <div name="index" iconCls="fa-android" title="控制台">
                欢迎来到林业管理系统
            </div>
        </div>
    </div>
   <div class = "mini-window"id="showForm" style="width:auto;height:auto;border:solid 1px #aaa;display:none;">
		<fieldset style="width:auto;border:solid 1px #aaa;" id="editField">
	        <legend>个人资料</legend>
	        <div style="padding:5px;">
	            <table style="width:100%;">
	                <tr>
	                    <td style="width:80px;">用户名：</td>
	                    <td style="width:150px;"><input id="userName" name="userName" class="mini-textbox" value="${ sessionScope.user.userName }" readonly/></td>
	                    <td style="width:80px;">显示名称：</td>
	                    <td style="width:150px;"><input id="name" name="name" class="mini-textbox" value="${ sessionScope.user.name }" readonly/></td>
	               </tr>
	               <tr>
	                    <td style="width:80px;">邮件：</td>
	                    <td style="width:150px;"><input id="mail" name="mail" class="mini-textbox" value="${ sessionScope.user.mail }" readonly/></td>
	                    <td style="width:80px;">手机：</td>
	                    <td style="width:150px;"><input id="mobileNo" name="mobileNo" class="mini-textbox" value="${ sessionScope.user.mobileNo }" readonly/></td>
	               </tr>
	            </table>
	        </div>
	    </fieldset>
    </div>
</div>
</body>
</html>

<script>

    function activeTab(item) {
        var tabs = mini.get("mainTabs");
        var tab = tabs.getTab(item.id);
        if (!tab) {
            tab = { name: item.id, title: item.text, url: item.url, showCloseButton: true };
            tab = tabs.addTab(tab);
        }
        tabs.activeTab(tab);
    }

    $(function () {
        //menu
        var menu = new Menu("#mainMenu", {
            itemclick: function (item) {
                if (!item.children) {
                    activeTab(item);
                }
            }
        });

        $(".sidebar").mCustomScrollbar({ autoHideScrollbar: true });

        new MenuTip(menu);

        $.ajax({
            url: "${pageContext.request.contextPath}/menus.do",
            type: "post",
            success: function (text) {
                menu.loadData(text);
            }
        })

        //toggle
        $("#toggle, .sidebar-toggle").click(function () {
            $('body').toggleClass('compact');
            mini.layout();
        });

        //dropdown
        $(".dropdown-toggle").click(function (event) {
            $(this).parent().addClass("open");
            return false;
        });

        $(document).click(function (event) {
            $(".dropdown").removeClass("open");
        });
    });
    
    function showInfo(){
    	var showForm = mini.get("showForm");
    	showForm.show();
    }
    
    function exit(){
    	window.location = "${pageContext.request.contextPath}";
    }

</script>