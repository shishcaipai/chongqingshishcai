<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>订单管理</title>
<!-- 引入Jquery -->
<script type="text/javascript"	src="<%=basePath%>/static/js/jquery.js" charset="utf-8"></script>
<script src="<%=basePath%>static/js/commonUtil.js" type="text/javascript"></script>
<script src="<%=basePath%>static/boss/js/tradeOrder.js" type="text/javascript"></script>
<%@ include file="../../common/easyUiInclude.jsp"%>

</head>
<body>
<!-- 工具栏 -->
<div id="tb" style="height:auto">
    <form id="queryForm">
	<table>
		<tr>
			<td>下单人账号：</td>
			<td><input id="search_userName" /></td>
			<td>下单人名称：</td>
			<td> 
			<td><input id="search_realName" /></td>
			<td>手机号： </td>
			<td><input id="search_telephone" /></td>
		</tr>
		<tr>
			<td>订单类型：</td>
			<td>
				<select id="search_orderType" style=" width: 150px;">
					<option value="">请选择</option>
					<option value="1">充值订单</option>
					<option value="2">代购订单</option>
				</select>
			</td>
			<td>订单状态：</td>
			<td> 
			<td>
				<select id="search_orderStatus" style=" width: 150px;">
					<option value="">请选择</option>
					<option value="1">下订单成功</option>
					<option value="2">下订单失败</option>
				</select>
			</td>
			<td>支付状态： </td>
			<td>
				<select id="search_payStatus" style=" width: 150px;">
					<option value="">请选择</option>
					<option value="0">未支付</option>
					<option value="1">支付成功</option>
					<option value="2">支付失败</option>
					<option value="3">支付超时</option>
				</select>
			</td>
		</tr>
		<tr>
			 <td>下单时间：</td>
			 <td>
              	<input name="checkStartTime" id="checkStartTime" class="easyui-datebox" style="width:150px">
             </td>
             <td align="right">到:</td>
             <td colspan="3">
               	<input name="checkEndTime" id="checkEndTime" class="easyui-datebox" style="width:150px">
             </td>
		</tr>
	</table>  
	</form>
	<div>
		<a href="javascript:searchOrder()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
		<a href="javascript:updateOrderDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		<a href="javascript:deleteOrder()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		<a href="javascript:clearSearchForm()" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">清空</a>
	</div>
</div>
	<div>
	<table id="mydatagrid" ></table>
   </div>
</body>
</html>

