<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<link rel="shortcut icon" href="<%=basePath%>static/images/favicon.new.ico" />
<link href="<%=basePath%>static/new/css/index.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>static/new/js/jquery-ui-1.8.2.custom.min.js"></script>
<script type="text/javascript" src="<%=basePath%>static/new/js/lotterymode.js"></script>
<SCRIPT type="text/javascript" src="<%=basePath%>static/new/js/jquery.nivo.slider.js"></SCRIPT>
<SCRIPT type="text/javascript" src="<%=basePath%>static/new/js/superfish.js"></SCRIPT>
<SCRIPT type="text/javascript" src="<%=basePath%>static/new/js/jquery.autocomplete.min.js"></SCRIPT>
<div class="menu">
	<div class="logo">
		<a href="<%=basePath%>/index" title="鸿运彩票"><img
			src="<%=basePath%>static/images/sc_50.jpg" alt="鸿运彩票"></a>
	</div>
	<div
		style="margin-left: 217px; margin-top: -85px; height: 85px; width: 780px;">
		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
			codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
			width="780" height="80" title="1">
			<param name="movie" value="<%=basePath%>static/new/logo.swf">
			<param name="quality" value="high">
			<embed src="<%=basePath%>static/new/logo.swf" quality="high"
				pluginspage="http://www.macromedia.com/go/getflashplayer"
				type="application/x-shockwave-flash" width="780" height="80"></embed>
		</object>


	</div>
	<div id="topTabBox">
		<div id="topTab">
			<ul id="funcTab">
				<li id="lotteryListEntry" class="open"><a class="topNavHolder"
					hidefocus="true" rel="nofollow">选择彩种<i></i></a> <c:choose>
						<c:when test="${frist}">
							<div id="lotteryList" style="left: 0px;">
								<div class="lotteryListWrap">
									<ul>
										<li class="zyGame"><a href="<%=basePath%>cqssc/cqsscview"><em
												class="cz_logo35 logo35_ssc"></em><strong>重庆时时彩</strong><span
												class="grayWords">每天120期哦</span></a></li>
										<li class="zyGame"><a
											href="<%=basePath%>sdsyy/sdsyyview"><em
												class="cz_logo35 logo35_d11"></em><strong>山东十一运</strong><span
												class="grayWords">返奖率高达59%</span></a></li>
										<li class="zyGame"><a
											href="<%=basePath%>jxssc/jxsscview"><em
												class="cz_logo35 logo35_jxd11"></em><strong>江西11选5</strong><span
												class="grayWords">每天78期</span></a></li>
										<li class="zyGame"><a
											href="<%=basePath%>gdsyxw/gdsyxwview"><em
												class="cz_logo35 logo35_jxd11"></em><strong>广东11选5</strong><span
												class="grayWords">每天84期</span></a></li>
										<li class="zyGame"><a
											href="javascript:alert('暂停销售')"><em
												class="cz_logo35 logo35_x3d"></em><strong>福彩3D</strong><span
												class="grayWords">每天84期</span></a></li>

									</ul>

								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div id="lotteryList" style="left: 0px; display: none">
								<div class="lotteryListWrap">
									<ul>
										<li class="zyGame"><a href="<%=basePath%>cqssc/cqsscview"><em
												class="cz_logo35 logo35_ssc"></em><strong>重庆时时彩</strong><span
												class="grayWords">每天120期哦</span></a></li>
										<li class="zyGame"><a
											href="<%=basePath%>sdsyy/sdsyyview"><em
												class="cz_logo35 logo35_d11"></em><strong>山东十一运</strong><span
												class="grayWords">返奖率高达59%</span></a></li>
										<li class="zyGame"><a
											href="<%=basePath%>jxssc/jxsscview"><em
												class="cz_logo35 logo35_jxd11"></em><strong>江西11选5</strong><span
												class="grayWords">每天78期</span></a></li>
										<li class="zyGame"><a
											href="<%=basePath%>gdsyxw/gdsyxwview"><em
												class="cz_logo35 logo35_jxd11"></em><strong>广东11选5</strong><span
												class="grayWords">每天84期</span></a></li>
										<li class="zyGame"><a
											href="javascript:alert('暂停销售')"><em
												class="cz_logo35 logo35_x3d"></em><strong>福彩3D</strong><span
												class="grayWords">每天84期</span></a></li>

									</ul>

								</div>
							</div>
						</c:otherwise>
					</c:choose></li>
				<li pid="home"><a href="<%=basePath%>index">网站首页</a>|</li>
				<li pid="hall"><a href="<%=basePath%>lobby"
					title="彩票购彩大厅">购彩大厅</a>|</li>
				<li pid="groupbuy"><a href="<%=basePath%>hemai/hemaiview"
					title="彩票合买大厅">合买大厅</a>|</li>
				<li pid="award"><a href="<%=basePath%>wfjx"
					title="中国彩票开奖">玩法介绍</a>|</li>
				<li pid="trend"><a href="http://www.ld3j.com/zoushi"
					title="福彩体彩走势图">走势图表</a>|</li>
				<li pid="cpInfo"><a href="<%=basePath%>/articles"
					title="彩票资讯">彩票资讯</a>|</li>
				<li pid="coupon"><a href="<%=basePath%>/notices"
					title="网站公告">网站公告</a>|</li>
				<li pid="mobile"><a href="<%=basePath%>user/memberCenter"
					title="手机购买彩票"><span class="icon_mob"></span>我的帐户</a></li>
			</ul>
		</div>
	</div>