<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<link href="http://www.ib18.cn/res/css/head.css" rel="stylesheet"
	type="text/css">

<div class="top">
	<div class="wrap">

		<!--submenu-->
		<div class="submenu fn_clear">
			<%-- <div class="left">
        	<c:choose>
        	    <c:when test="${sessionScope.memberUser.userName != null}">
                     <a href="<%=basePath %>user/memberCenter" class="orange">${sessionScope.memberUser.userName}</a><a href="<%=basePath %>user/loginout" class="orange">退出</a>
                </c:when>
                <c:otherwise>
                      <a href="<%=basePath %>user/login" class="orange">登录</a><a href="<%=basePath %>user/register" class="orange">注册</a>
               </c:otherwise>
        	</c:choose>   
        	   
        	   <a href="<%=basePath %>recharge">充值</a></div>
            <div class="right">
            	<a href="<%=basePath %>">首页</a>
                <a href="#">购买彩票</a>
                <a href="#">咨询</a>
                <em>
                	<a href="#">网站导航</a>
                	<cite>
                    	<a href="#">手机客户端</a>
                        <a href="#">号码篮</a>
                        <a href="#">中奖计算器</a>
                        <a href="#">复式计算器</a>
                        <a href="#">奖金预算器</a>
                        <a href="#">彩票软件</a>
                    </cite>
                </em>
            </div>
        </div>
        <!--submenu end -->
        
        <!--logos and-->
        <div class="ads">
        	<div class="logo"><a href="#"><img src="<%=basePath %>static/images/logo.png" /></a></div>
            <div class="adtop"><a href="#"><img src="<%=basePath %>static/images/ad1.jpg" /></a></div>
            <div class="hotline"><img src="<%=basePath %>static/images/phone.jpg" /></div>
        </div> --%>

			<div class="mainbody">
				<!--顶部-->
				<div class="sc_top">
					<div class="sc_top_1">
						<div class="sc_top_logo">
							<img src="http://www.ib18.cn/res/img/sc_50.jpg">
						</div>
						<!-- <div class="sc_top_pain"></div> -->
						<div class="sc_top_wen">
							<div>
								<p>
									您好，<span style="color: #f30; font-weight: bold;" id="username">
										<c:choose>
											<c:when test="${sessionScope.memberUser.userName != null}">
												<a href="<%=basePath%>user/memberCenter" class="orange">${sessionScope.memberUser.userName}</a>
												<a href="<%=basePath%>user/loginout" class="orange">退出</a>
											</c:when>
											<c:otherwise>
												<a href="<%=basePath%>user/login" class="orange">登录</a>
												<%-- 												<a href="<%=basePath%>user/register" class="orange">注册</a>
 --%>
											</c:otherwise>
										</c:choose>
									</span>&nbsp;&nbsp;当前余额： <span style="cursor: pointer; color: #f30;"
										id="mymoeny"> <c:choose>
											<c:when test="${sessionScope.memberUser != null}">
												${memberUser.availableScore}
												</c:when>
											<c:otherwise>
											***
											</c:otherwise>
										</c:choose>
									</span>&nbsp;元&nbsp;&nbsp; <a href="<%=basePath%>user/memberCenter">我的账户</a>
									<span style="color: #ccc;">|</span> <a
										onclick="javascript:location='<%=basePath%>recharge';"
										style="cursor: pointer;">充值</a> <span style="color: #ccc;">|</span>
									<a onclick="javascript:location='<%=basePath%>money/apply';"
										style="cursor: pointer;">提款</a> <span style="color: #ccc;">|</span>
									<a href="<%=basePath%>user/loginout"><em>[安全退出]</em></a>
								</p>
							</div>
							<div>
								<a id="qq" target="_blank"> <img
									src="http://www.ib18.cn/res/img/kefu.jpg" style="float: right;">
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="sc_top_2">
					<ul id="lotteryTypesUl">
						<li class="sc_top_li"><a style="margin-left: 10px;"
							href="<%=basePath%>index">首页</a></li>
						<c:choose>
							<c:when test="${sessionScope.memberUser.userName != null}">
								<li class="sc_top_li"><a
									href="<%=basePath%>hemai/hemaiview">合买中心</a></li>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
						<li class="sc_top_li"><a href="<%=basePath%>cqssc/cqsscview">重庆时时彩</a></li>
						<li class="sc_top_li"><a href="<%=basePath%>jxssc/jxsscview">江西时时彩</a></li>
						<li class="sc_top_li"><a href="javascript:alert('暂停销售')">山东十一运</a></li>
						<li class="sc_top_li"><a href="javascript:alert('暂停销售')">江西11选5</a></li>
						<li class="sc_top_li"><a href="javascript:alert('暂停销售')">福彩3D</a></li>
						<li class="sc_top_li"><a href="javascript:alert('暂停销售')">排列三</a></li>
						<li class="sc_top_li"><a href="javascript:alert('暂停销售')">上海时时乐</a></li>
						<li class="sc_top_li"><a href="<%=basePath%>gdsyxw/gdsyxwview">广东11选5</a></li>
						<li class="sc_top_li"><a href="<%=basePath%>wfjx">玩法介绍</a></li>
					</ul>
				</div>
			</div>
			<!--顶部-->
		</div>

	</div>
</div>