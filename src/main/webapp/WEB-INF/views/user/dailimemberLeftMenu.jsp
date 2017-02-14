<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!--左部导航-->
<div class="account_left">

	<div class="user_left">
		<div class="user_hot">
			<b style="float: left; margin-top: 5px"><img
				src="<%=basePath%>static/images/sc_38.jpg" /></b><span
					onclick="javascript:location='<%=basePath%>dailimenu">基本信息</span>
		</div>
		<div class="user_scond">
			<div class="user_tub">
				<b style="float: left; margin-right: 15px"><img
					src="<%=basePath%>static/images/sc_40.jpg" /></b><span
					onclick="javascript:location='<%=basePath%>dailimembeSpred'">推广管理</span>
			</div>
			<div class="user_tub">
				<b style="float: left; margin-right: 15px"><img
					src="<%=basePath%>static/images/sc_41.jpg" /></b><span
					onclick="javascript:location='<%=basePath%>dailimembeIncomeDetail'">收入明细</span>
			</div>
			<div class="user_tub">
				<b style="float: left; margin-right: 15px"><img
					src="<%=basePath%>static/images/sc_42.jpg" /></b><span
					onclick="javascript:location='<%=basePath%>dailimembeMonthBaance'">月度结算表</span>
			</div>

			<div class="user_tub">
				<span style="margin-left: 40px;"
					onclick="javascript:location='<%=basePath%>dailimembeSpredLink'">推广链接</span>
			</div>
			<div class="user_tub">
				<span style="margin-left: 40px;"
					onclick="javascript:location='<%=basePath%>dailimemberManager'">成员管理</span>
			</div>
			<div class="user_tub">
				<span style="margin-left: 40px;"
					onclick="javascript:location='<%=basePath%>dailimemberConsumption'">成员消费</span>
			</div>
          <div class="user_tub">
				<span style="margin-left: 40px;"
					onclick="javascript:location='<%=basePath%>dailimembeIncomeStatic'">盈收统计</span>
			</div>
		</div>
	</div>

</div>

