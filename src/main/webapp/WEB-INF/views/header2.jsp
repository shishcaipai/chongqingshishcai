<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<div class="topbar">
	<div class="div_m clearfix">
		<div class="person_part">
			<ul id="top_user_info">
				<li>欢迎您，<span> <c:choose>
							<c:when test="${sessionScope.memberUser.userName != null}">
								<a href="<%=basePath%>user/memberCenter" class="orange">${sessionScope.memberUser.userName}</a>
								<a href="<%=basePath%>user/loginout" class="orange">退出</a>
							</c:when>
							<c:otherwise>
								<a href="<%=basePath%>user/login" class="orange">登录</a>
							</c:otherwise>
						</c:choose></span>&nbsp;当前余额：<span
					style="cursor: pointer; color: #f30;" id="mymoeny">
					<c:choose>
					<c:when test="${sessionScope.memberUser != null}">
												${memberUser.availableScore}
												</c:when>
											<c:otherwise>
											***
											</c:otherwise>
										</c:choose></span>&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;<a
					rel="nofollow" href="<%=basePath%>user/memberCenter">我的账户</a>
					| <a href="<%=basePath%>recharge" id="btn_chongz">充值</a>
					| <a href="<%=basePath%>money/apply">提款</a> | [<a
					id="logoutLink" href="<%=basePath%>user/loginout">退出</a>]
			</ul>
		</div>
		<div style="text-align:center;">
								<a target="_blank"
									href="http://wpa.qq.com/msgrd?v=3&uin=212395988&site=qq&menu=yes"><img
									border="0" src="http://wpa.qq.com/pa?p=2:212395988:41"
									alt="点击这里给我发消息" title="点击这里给我发消息" style="float: right;" /></a>
							</div>
	</div>
</div>