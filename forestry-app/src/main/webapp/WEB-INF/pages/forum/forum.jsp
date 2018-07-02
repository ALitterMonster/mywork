<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>全部话题</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="../common/import.jsp"></jsp:include>
</head>

<body style="margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;">

	<div id="div_query" style="width:100%;">
		<table style="width:100%;" >
			<tr>
				<td style="width:5%;" align="right">状态：</td>
				<td align="left" style="width:10%;">
					<input id="filterKey" name="filterKey"  class="mini-combobox"  data="[{ id: 'allqa', text: '全部' }, { id: 'opened', text: '待回答'},{ id: 'closed', text: '已关闭'}]"
			               value="allqa" textField="text" valueField="id"  showNullItem="false" allowInput="false" style="width:100%;"/>
				</td>
				<td align="left" style="width:30%;">
					<input id="queryText" name="queryText" class="mini-textbox"  style="width:100%;" emptyText="请输入问题名称或补充描述" />
				</td>
				<td align="right" style="width:10%;"><a class="mini-button"  iconCls="icon-search" onclick="doQuery();">查询</a> </td>
				<td style="width:45%;" align="right">&nbsp;</td>
			</tr>
		</table>
	</div>
	
	<div  style="width: 100%; height: 100%; " align="center">
		<div style="width: 99%;">
		<div id="div_cxjg"  class="mini-toolbar" style="border-bottom: 0; padding: 0px;" align="left">
			<table style="width:100%;">
				<tr>
					<td style="width:100%;">
						<a class="mini-button" iconCls="icon-addnew" plain="true" onclick="doCollect();">收藏问题</a>
					</td>
				</tr>
			</table>
		</div>
		</div>
		<div id="qaGrid" class="mini-datagrid" style="width:99%;height:87%;" allowResize="false"
        			url="${pageContext.request.contextPath}/m31/m310401/qaQuestionAction!queryQuestion.action"  idField="id" multiSelect="false" 
        			pageSize="20" >
			<div property="columns">
				<!--<div type="indexcolumn"></div>        -->
				<div type="checkcolumn" width="2%" ></div>
				<div type="indexcolumn" width="4%" ></div>
				<div field="id" headerAlign="left" visible="false">ID</div>
				<div field="title" width="67%" headerAlign="left">问题</div>
				<div field="acount" width="6%" headerAlign="center" align="center">回答人数</div>
				<div field="vcount" width="6%" headerAlign="center" align="center">浏览人数</div>
				<div field="collectid" width="8%" headerAlign="center" >是否已收藏</div>
				<div field="status" width="7%" headerAlign="center" >状态</div>
			</div>
		</div>
    </div>
<script type="text/javascript">
mini.parse();
var qaGrid= mini.get('qaGrid');
qaGrid.on("drawcell", function (e) {
	var record = e.record,column = e.column,field = e.field,value = e.value;
	if (field == "title") {
		e.cellStyle = "text-align:left";
		e.cellHtml = '<a style="text-decoration:underline;" href="javascript:toView(\'' + record.id + '\')">'+record.title+'</a>';
	}
	if (field == "collectid") {
		e.cellStyle = "text-align:center";
		if(record.collectid.length>0){
			e.cellHtml = '是';
		}else{
			e.cellHtml = '否';
		}
		
	}
	if (field == "status") {
		e.cellStyle = "text-align:center";
		if(record.status=='20'){
			e.cellHtml = '待回答';
		}else if(record.status=='30'){
			e.cellHtml = '已关闭';
		}else{
			e.cellHtml = '未定义';
		}
	}
});
//doQuery();

function doQuery(){
	try{ 	
    	var form = new mini.Form("#div_query");
    	var form_json=mini.encode(form.getData());
    	//alert(form_json);
    	qaGrid.load( eval("("+form_json+")"));
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

function toView(questionid){
	try{
		mini.open({
                url: __CONTEXT_PATH__ + "/pages/m31/m310401/m310401_view.jsp",
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

function doCollect(){
	try{
		var row=qaGrid.getSelected();
		if(row){
			var questionid=row.id;
			var data = "{\"questionid\":\""+questionid+"\"}";
			
			MiniUtils.request({
				url: __CONTEXT_PATH__+"/m31/m310401/qaCollectAction!doCollect.action",
				data: { jsonData: data },
				success: function (text) {
					mini.alert("收藏成功");
					doQuery();
				},
				error: function (text) {
					mini.alert(text);
				}
			});
		}else{
			mini.alert("请选择要收藏的问题");
		}
	}catch(e){
		mini.alert("未知异常："+e.responseText);
	}
}

</script>
</body>
</html>
