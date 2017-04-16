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
<title>中奖管理</title>
<!-- 引入Jquery -->
<script type="text/javascript" src="<%=basePath%>/static/js/jquery.js"
	charset="utf-8"></script>
<script src="<%=basePath%>static/js/commonUtil.js"
	type="text/javascript"></script>
<script src="<%=basePath%>static/boss/js/zjtradeOrder.js?orde=1"
	type="text/javascript"></script>
<%@ include file="../../common/easyUiInclude.jsp"%>

</head>
<body>
	<!-- 工具栏 -->
	<div id="tb" style="height: auto">
		<form id="queryForm">
			<table>
				<tr>
					<td>下单人账号：</td>
					<td><input id="search_userName" /></td>
				</tr>
				<tr>
					<td>下单时间：</td>
					<td><input name="checkStartTime" id="checkStartTime"
						class="easyui-datebox" style="width: 150px"></td>
					<td align="right">到:</td>
					<td colspan="3"><input name="checkEndTime" id="checkEndTime"
						class="easyui-datebox" style="width: 150px"></td>
				</tr>
			</table>
		</form>
		<div>
			<a href="javascript:searchOrder()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">查询</a>
				
		</div>
	</div>



	<div>
		<table id="mydatagrid"></table>
	</div>
</body>
</html>

