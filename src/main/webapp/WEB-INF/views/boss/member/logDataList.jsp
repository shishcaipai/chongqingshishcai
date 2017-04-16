<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>会员登陆信息</title>
<!-- 引入Jquery -->
<script type="text/javascript" src="<%=basePath%>/static/js/jquery.js"
	charset="utf-8"></script>
<script src="<%=basePath%>static/js/commonUtil.js"
	type="text/javascript"></script>
<%@ include file="../../common/easyUiInclude.jsp"%>

<script type="text/javascript">
	$(function() {
		$('#mydatagrid').datagrid({
			title : '会员登陆信息',
			iconCls : 'icon-ok',
			pageSize : 10,//默认选择的分页是每页5行数据
			pageList : [ 5, 10, 15, 20 ],//可以选择的分页集合
			nowrap : true,//设置为true，当数据长度超出列宽时将会自动截取
			striped : true,//设置为true将交替显示行背景。
			collapsible : true,//显示可折叠按钮
			toolbar:"#tb",//在添加 增添、删除、修改操作的按钮要用到这个
			url:'<%=basePath%>boss/member/logdata_list_page',//url调用Action方法
			queryParams: { "time": new Date().getTime() },
			loadMsg : '数据装载中......',
			singleSelect : true,//为true时只能选择单行
			fitColumns : true,//允许表格自动缩放，以适应父容器
			//sortName : 'xh',//当数据表格初始化时以哪一列来排序
			//sortOrder : 'desc',//定义排序顺序，可以是'asc'或者'desc'（正序或者倒序）。
			remoteSort : false,
			frozenColumns : [ [ {
				field : 'ck',
				checkbox : true
			} ] ],
			pagination : true,//分页
			rownumbers : true,//行数
			columns : [ [ {
				field : 'user_name',
				title : '账号',
				width : 90,
				align : 'center'
			}, {
				field : 'ip',
				title : 'ip',
				width : 180,
				align : 'center'
			}, {
				field : 'create_date',
				title : '登陆时间',
				width : 100,
				align : 'center',
				formatter : function(value, row, index) {
					var time = row.create_date;
					if (time != '') {
						return formatTime(time);
					}
				}
			} ] ]
		});

	});
</script>

</head>
<body>
	<!-- 工具栏 -->
	<div>
		<table id="mydatagrid"></table>
	</div>
</body>
</html>
