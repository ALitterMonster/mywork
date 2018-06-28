<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/import.jsp"></jsp:include>
<title>采伐计划管理</title>
</head>
<body>
<div id="loggingPlanQueryForm" >
    <table>
        <tr>
            <td >计划名称：</td>
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
 
 <div id="loggingPlanGrid" class="mini-datagrid" style="width:100%;height:250px;" 
    url="${pageContext.request.contextPath}/logginPlan/queryLoggingPlan"
    idField="id" allowResize="true"
    sizeList="[20,30,50,100]" pageSize="20" 
    showHeader="true" title="采伐计划列表"
 onmouseup="return datagrid1_onmouseup()">
    <div property="columns">
        <div type="indexcolumn" ></div>
        <div field="createdAt" width="120" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true">创建时间</div>    
        <div field="createdBy" width="120" headerAlign="center" allowSort="true">创建用户</div>                            
        <div field="planName" width="100"  align="center" headerAlign="center">计划名称</div>
        <div field="endTIme"align="right" width="100" dateFormat="yyyy-MM-dd" allowSort="true">计划截止时间</div>                                
        <div field="amount" width="100" allowSort="true" decimalPlaces="2" dataType="float">计划砍伐数量</div>
        <div field="planStatus" width="100" headerAlign="center" allowSort="true">计划状态</div>                
    </div>
</div>
</body>

<script type="text/javascript">
        
        mini.parse();
        
        var grid = mini.get("userGrid");

        grid.load();

    </script>

</html>


