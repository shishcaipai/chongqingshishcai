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
<link href="http://www.ib18.cn/res/css/page_left.css" rel="stylesheet"
	type="text/css" />
<link href="http://www.ib18.cn/res/css/head.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>static/css/jqueryui.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>static/css/style.css" type="text/css"
	rel="stylesheet" />
<LINK href="http://www.ib18.cn/res/css/head.css" type=text/css
	rel=stylesheet>
<link href="http://www.ib18.cn/res/css/page.css" type="text/css"
	rel="stylesheet">
	<link href="http://www.80cb.cn/res/css/common.css" type="text/css"
		rel="stylesheet">
		<link href="http://www.80cb.cn/res/css/cps.css" type="text/css"
			rel="stylesheet">
<title>代理中心</title>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="account">
		<div class="account_left">
			<jsp:include page="dailimemberLeftMenu.jsp"></jsp:include>
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
							成员类别: <font id="loginuser" style="color: #ff0000;"> 代理商 </font>
						</p>
					</li>
					<li class="ylf_cps04">
						<p>
							今日收入:<span class="red" id="spanIncomeByDay">0.0</span><span
								class="Title12">元</span>
						</p>
						<p>|</p>
						<p>
							累计收入：<span class="red" id="spanIncome">10000.0</span><span
								class="Title12">元</span>
						</p>
					</li>
					<li class="ylf_cps05">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>累计推广员人数:<span class="red" id="spanMemberCount">0</span><span
									class="Title12">人</span></td>
								<td>累计客户人数：<span class="red" id="spanMemberCount">

										(个人)2 + (下级)0 = 2 </span><span class="Title12">人</span>
								</td>
							</tr>
							<tr>
								<td>今日新增客户数：<span class="red" id="spanMemberCountByDay">
										(个人)0 + (下级)0 = 0 </span><span class="Title12">人</span>
								</td>
								<td>新增交易客户 <span class="red" id="spanMemberCountByDay">
										(个人)0 + (下级)0 = 0 </span><span class="Title12">人</span>
								</td>
							</tr>
							<tr>
								<td>新增客户交易量： <span class="red" id="spanMemberCountByDay">
										(个人)0 + (下级)0 = 0.0 </span><span class="Title12">元</span>
								</td>
								<td>日交易量： <span class="red" id="spanMemberCountByDay">

										0 </span><span class="Title12">元</span>
								</td>
							</tr>
						</table>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!--main end -->

	<jsp:include page="../footer.jsp"></jsp:include>
	<div class="opacity">
		<div class="dialog">
			<div class="diatitle">
				<em>提示</em>
			</div>
			<div class="diabox">提示信息</div>
		</div>
	</div>
</body>
</html>
