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
<div id="userQueryForm" >
    <table>
        <tr>
            <td >用户名：</td>
            <td>
                <input class="mini-textbox"  />
            </td>             
            <td >必须是邮箱地址：</td>
            <td>
                <input class="mini-textbox"/>
            </td>                 
            
        </tr>
     </table>
 </div>
 
 <div id="userGrid" class="mini-datagrid" style="width:100%;height:250px;" 
    url="${pageContext.request.contextPath}/userAuth/user!queryList.action"
    idField="id" allowResize="true"
    sizeList="[20,30,50,100]" pageSize="20" 
    showHeader="true" title="用户列表"
 onmouseup="return datagrid1_onmouseup()">
    <div property="columns">
        <div type="indexcolumn" ></div>
        <div field="loginname" width="120" headerAlign="center" allowSort="true">员工帐号</div>    
        <div field="name" width="120" headerAlign="center" allowSort="true">姓名</div>                            
        <div field="gender" width="100" renderer="onGenderRenderer" align="center" headerAlign="center">性别</div>
        <div field="salary" numberFormat="¥#,0.00" align="right" width="100" allowSort="true">薪资</div>                                
        <div field="age" width="100" allowSort="true" decimalPlaces="2" dataType="float">年龄</div>
        <div field="createtime" width="100" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">创建日期</div>                
    </div>
</div>
</body>

<script type="text/javascript">
        
        mini.parse();
        
        var grid = mini.get("userGrid");

        grid.load();

    </script>

</html>


