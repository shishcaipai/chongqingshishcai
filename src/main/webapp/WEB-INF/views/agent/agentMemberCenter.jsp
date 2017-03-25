<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=basePath%>static/new/css/page_left.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>static/new/css/head.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>static/css/jqueryui.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>static/css/style.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>static/new/css/page.css" type="text/css"
	rel="stylesheet">
	<link href="<%=basePath%>static/new/css/common.css" type="text/css"
		rel="stylesheet">
		<link href="<%=basePath%>static/new/css/cps.css" type="text/css"
			rel="stylesheet">
<title>代理中心</title>
</head>

<body>
	<jsp:include page="../header2.jsp"></jsp:include>
	<div class="header clearfix">
		<jsp:include page="../header3.jsp"></jsp:include>
	<div id="account">
		<div class="account_left">
			<jsp:include page="agentMemberLeftMenu.jsp"></jsp:include>
		</div>
		<div class="account_right">
			<div class="user_right">
				<ul class="ylf_cps01">
					<li class="ylf_cps02"><img
						src="<%=basePath%>static/images/page_bg08.png" width="120"
						height="113"></li>
					<li class="ylf_cps03">
						<p style="font-size: 14px;">
							您好，<font id="loginuser"
								style="color: #0099cc; font-weight: bold;">${memberUser.userName}</font>&nbsp;&nbsp;欢迎进入代理中心！
						</p>
						<p>
							成员类别: <font id="loginuser" style="color: #ff0000;"> <c:choose>
				<c:when
					test="${sessionScope.memberUser != null&&sessionScope.memberUser.type==2}">
					代理商
				</c:when>
				<c:otherwise>
				  代理人
				</c:otherwise>
			</c:choose> </font>
						</p>
					</li>
					<li class="ylf_cps04">
						<p>
							今日收入:<span class="red" id="spanIncomeByDay">${todayIncome}</span><span
								class="Title12">元</span>
						</p>
						<p>|</p>
						<p>
							累计收入：<span class="red" id="spanIncome">${totalIncome}</span><span
								class="Title12">元</span>
						</p>
					</li>
					<li class="ylf_cps05">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>累计推广员人数:<span class="red" id="spanMemberCount">${numTotalAllUser}</span><span
									class="Title12">人</span></td>
							</tr>
							<tr>
								<td>今日新增客户数：<span class="red" id="spanMemberCountByDay">
										${numTodayTotalUser}</span><span class="Title12">人</span>
								</td>
								<td>总共交易量 <span class="red" id="spanMemberCountByDay">
										 ${numTradingTotalUser} </span><span class="Title12">人</span>
								</td>
							</tr>
							<tr>
								<td>今日新增客户交易量： <span class="red" id="numTodayTradingTotalUser">
										 ${totalTradingVolume}</span><span class="Title12">元</span>
								</td>
								<td>日交易量： <span class="red" id="spanMemberCountByDay">

										${dailyTradingVolume} </span><span class="Title12">元</span>
								</td>
							</tr>
						</table>
					</li>
				</ul>
			</div>
		</div>
	</div>
	</div>
	<!--main end -->

</body>
</html>
