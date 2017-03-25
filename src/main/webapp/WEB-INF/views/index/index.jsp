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
<TITLE>鸿运彩票</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=basePath%>static/css/jqueryui.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>static/css/style.css" type="text/css"
	rel="stylesheet" />
<link href="http://www.ld3j.com/css/index.css" rel="stylesheet"
	type="text/css" />
<script src="<%=basePath%>static/js/jquery-1.7.2.min.js"
	type="text/javascript"></script>
<META content="MSHTML 6.00.2900.6058" name=GENERATOR>
<style type="text/css">
#banner {
	position: relative;
	width: 748px;
	margin-bottom: 6px;
	height: 196px;
	border: 1px solid #666;
	overflow: hidden;
	float: right;
}

#banner_list img {
	border: 0px;
}

#banner_bg {
	position: absolute;
	bottom: 0;
	background-color: #000;
	height: 30px;
	filter: Alpha(Opacity = 30);
	opacity: 0.3;
	z-index: 1000;
	cursor: pointer;
	width: 748px;
}

#banner_info {
	position: absolute;
	bottom: 0;
	left: 5px;
	height: 22px;
	color: #fff;
	z-index: 1001;
	cursor: pointer
}

#banner_text {
	position: absolute;
	width: 120px;
	z-index: 1002;
	right: 3px;
	bottom: 3px;
}

#banner ul {
	position: absolute;
	list-style-type: none;
	filter: Alpha(Opacity = 80);
	opacity: 0.8;
	border: 1px solid #fff;
	z-index: 1000;
	margin: 0;
	padding: 0;
	bottom: 3px;
	right: 5px;
}

#banner ul li {
	padding: 0px 8px;
	float: left;
	display: block;
	color: #FFF;
	border: #e5eaff 1px solid;
	background: #6f4f67;
	cursor: pointer
}

#banner ul li.on {
	background: #900
}

#banner_list a {
	position: absolute;
}

#tabfirst_01 {
	float: left;
	width: 100%;
	height: 36px;
	background: url(http://www.ib18.cn/res/img/yh13.png) repeat-x;
}

#tabfirst_01 li {
	float: left;
	display: inline;
	text-align: center;
	line-height: 27px;
	width: 34px;
	height: 27px;
	margin-top: 9px;
	margin-left: 10px;
	color: #333;
	cursor: pointer;
}

#tabfirst_01 li.tabin_01 {
	background: url(http://www.ib18.cn/res/img/yh14_34.png) no-repeat;
	color: #275fb6;
}
</style>
<script type="text/javascript">
	var t = n = 0, count;
	$(document).ready(
					function() {
						count = $("#banner_list a").length;
						if (count == 1) {
							$("#banner ul").hide();
							return;
						}
						$('#banner li:eq(0)').toggleClass("on");
						$("#banner_list a:not(:first-child)").hide();
						$("#banner_info").html($("#banner_list a:first-child").find("img")
										.attr('alt'));
						$("#banner_info").click(function() {
									window.open($("#banner_list a:first-child")
											.attr('href'), "_blank")
								});
						$("#banner li").click(function() {
											var i = $(this).text() - 1;//获取Li元素内的值，即1，2，3，4
											n = i;
											if (i >= count)
												return;
											$("#banner_info").html(
													$("#banner_list a").eq(i)
															.find("img").attr(
																	'alt'));
											$("#banner_info").unbind().click(function() {
																window.open($("#banner_list a").eq(i).attr('href'),"_blank")
															})
											$("#banner_list a").filter(":visible").fadeOut(500)
													.parent().children().eq(i)
													.fadeIn(1000);
											document.getElementById("banner").style.background = "";
											$(this).toggleClass("on");
											$(this).siblings().removeAttr("class");
										});
						t = setInterval("showAuto()", 4000);
						$("#banner").hover(function() {
							clearInterval(t)
						}, function() {
							t = setInterval("showAuto()", 4000);
						});
					});

	function showAuto() {
		n = n >= (count - 1) ? 0 : ++n;
		$("#banner li").eq(n).trigger('click');
	}
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="banner">
		<div class="wrap">
			<div class="s_part fn_clear">

				<!--首页内容-->
				<div
					style="width: 1000px; margin: 0 auto; clear: both; padding-top: 6px;">


					<div class="sc_dlen">
						<div class="sc_bge">
							<table border="0" cellpadding="0" cellspacing="0"
								style="font-size: 12px">
								<tr>
									<td colspan="2">
										<div
											style="width: 220px; height: 100px; background: url('http://www.ib18.cn/res/img/head.jpg') no-repeat;">
											<div
												style="padding: 15px 0px 0px 100px; overflow: hidden; line-height: 25px;">
												<div style="font-size: 16px; font-weight: bold;">${memberUser.userName}</div>
												<div id="FFFFFF"
													style="font-size: 12px; color: red; cursor: pointer;">
													余额：<span><c:choose>
															<c:when test="${sessionScope.memberUser != null}">
												${memberUser.availableScore}
												</c:when>
															<c:otherwise>
											***
											</c:otherwise>
														</c:choose></span> 元
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr style="text-align: center; line-height: 25px;">
									<td colspan="2"><a href="<%=basePath%>myrecharge/list"
										style="color: #AE6B00">我的账户</a> <a
										href="<%=basePath%>betting_record" style="color: #AE6B00">中奖记录</a>
										<a href="<%=basePath%>betting_record" style="color: #AE6B00">投注记录</a></td>
								</tr>
								<tr style="text-align: center;">
									<td><input
										onclick="javascript:location='<%=basePath%>recharge';" name=""
										type="button" class="sc_yydd" value="在线充值"></td>
									<td><input
										onclick="javascript:location='<%=basePath%>money/apply';"
										type="button" class="sc_yydd" value="用户提款"></td>
								</tr>
							</table>
							<!--登录后-->
						</div>
					</div>

					<!-- 广告 -->
					<div id="banner">
						<div id="banner_info"></div>
						<!--标题-->
						<ul>
							<li>1</li>
							<li>2</li>
							<li>3</li>
						</ul>
						<div id="banner_list" class="sc_advaer">
							<a href="#"><img
								src="<%=basePath%>static/images/11.png"
								style="width: 100%; height: 100%;" /></a> <a href="#"><img
								src="<%=basePath%>static/images/33.png"
								style="width: 100%; height: 100%;" /></a> <a href="#"><img
								src="<%=basePath%>static/images/11.png"
								style="width: 100%; height: 100%;" /></a>
						</div>
					</div>

					<div style="width: 750px; float: left; overflow: hidden;">
						<!--公告-->
						<div class="sc_news">
							<div class="sc_lines">
								<b style="float: left; margin: 12px 0px 0px 30px;"></b>网站公告
							</div>
							<ul>

								
									  <c:forEach var="art" items="${requestScope.notice }">
								<li class="sc_gglist"><em>[公告]</em> <a
									href="<%=basePath %>article/article?id=${art.id }" target="_blank"
									title="${art.title }">${art.title }</a></li>
								</c:forEach>
							</ul>
						</div>
						<!--分析-->
						<div
							style="width: 500px; height: 215px; background: url(http://www.ib18.cn/res/img/sc_7.jpg); margin: 0px 0px 6px 10px; float: left;">
							<div
								style="width: 240px; height: 36px; line-height: 36px; font-size: 14px; font-weight: bold; color: #8a8000; text-indent: 0.5em">
								<b style="float: left; margin: 12px 0px 0px 30px;"></b>分析推荐
							</div>
							<ul>
                          <c:forEach var="art" items="${requestScope.zixian }">
									<li
									style="width: 500px; height: 22px; overflow: hidden; line-height: 22px; margin: 6px;">
									<em>[资讯]</em> <a href="<%=basePath %>article/article?id=${art.id }"
									target="_blank" title="${art.title }"
									style="color: #333;">${art.title }</a>
								</li>
								</c:forEach>

							</ul>
						</div>
						<div>
							<ul>
								<li class="sc_fxpicter"><a><img
										src="http://www.ib18.cn/res/img/sc_51.png"></a></li>
								<li class="sc_fxpicter"><a><img
										src="http://www.ib18.cn/res/img/sc_52.png"></a></li>
								<li class="sc_fxpicter"><a><img
										src="http://www.ib18.cn/res/img/sc_53.png"></a></li>
							</ul>
						</div>
					</div>


					<!--排行-->
					<div class="sc_ph">
						<div class="sc_lines">
							<b style="float: left; margin: 12px 0px 0px 30px;"></b>中奖排行榜
						</div>
						<ul id="tabfirst_01">
							<li class="tabin_01" onclick="total()">总榜</li>
							<li onclick="today()">今日</li>
							<li onclick="yesterday()">昨天</li>
						</ul>
						<div id="tab_box_01">
							<ul class="xc_grzjph02">
								<c:forEach var="map" items="${requestScope.map }">
									<li><span class="yh_phb_01"> <!--<img  src="/images/images/1.gif">-->&nbsp;
								</span> <span class="yh_phb_02">${map.user_name}***</span> <span class="yh_phb_up"></span>
									<span class="yh_phb_03"><em>${map.money}</em>&nbsp;元</span></li>
								</c:forEach>
							</ul>
						</div>
						<!-- <div id="tab_box_02" style="display: none">
							<ul class="xc_grzjph02">
								<li><span class="yh_phb_01">&nbsp;</span> <span
									class="yh_phb_02">***瓦上</span> <span class="yh_phb_03"><b>151986</b>&nbsp;元</span>
								</li>
							</ul>
						</div> -->
					</div>

					<!--热门彩种-->
					<div
						style="width: 1000px; float: left; margin-top: 20px; line-height: 20px;">
						<ul>
							<li
								style="float: left; width: 180px; height: 150px; margin: 10px">
								<div style="float: left; width: 100px;">
									<a href="javascript:alert('暂停销售,等待开放')"><img
										src="http://www.ib18.cn/res/img/sc_21.jpg"></a>
								</div>
								<div style="float: left; width: 80px;">
									<b>江西时时彩</b><br>10分钟一期<br>返奖率:59%
								</div>
							</li>
							<li
								style="float: left; width: 180px; height: 150px; margin: 10px">
								<div style="float: left; width: 100px;">
									<a href="<%=basePath%>cqssc/cqsscview"><img
										src="http://www.ib18.cn/res/img/sc_22.jpg"></a>
								</div>
								<div style="float: left; width: 80px;">
									<b>重庆时时彩</b><br>全天120期<br>返奖率:59%
								</div>
							</li>
							<li
								style="float: left; width: 180px; height: 150px; margin: 10px">
								<div style="float: left; width: 100px;">
									<a href="javascript:alert('暂停销售')"><img
										src="http://www.ib18.cn/res/img/sc_23.jpg"></a>
								</div>
								<div style="float: left; width: 80px;">
									<b>江西11选5</b><br>10分钟一期<br>返奖率:59%
								</div>
							</li>
							<li
								style="float: left; width: 180px; height: 150px; margin: 10px">
								<div style="float: left; width: 100px;">
									<a href="javascript:alert('暂停销售')"><img
										src="http://www.ib18.cn/res/img/sc_24.jpg"></a>
								</div>
								<div style="float: left; width: 80px;">
									<b>福彩3D</b><br>每天晚上<br>20：30开奖
								</div>
							</li>
							<li
								style="float: left; width: 180px; height: 150px; margin: 10px">
								<div style="float: left; width: 100px;">
									<a href="javascript:alert('暂停销售')"><img
										src="http://www.ib18.cn/res/img/sc_26.jpg"></a>
								</div>
								<div style="float: left; width: 80px;">
									<b>排列3</b><br>天天开奖<br>益智易中
								</div>
							</li>
						</ul>
					</div>
				</div>
				<link href="http://www.ib18.cn/res/css/foot.css" rel="stylesheet"
					type="text/css">
				<div class="footer">
					<div class="kong10"></div>
					<div class="kong10"></div>


				</div>


				<script type="text/javascript">
					$(function() {
						$("ul#tabfirst_01>li").click(
								function() {
									$(this).addClass("tabin_01").siblings()
											.removeClass("tabin_01");
								});
					});
					function today() {
						$("#tab_box_01").hide();
						var oldContent = $("#tab_box_02").html();
						$("#tab_box_02").html('加载中...');

						var lotteryTypeId = "";
						$.ajax({
									url : "<%=basePath%>theWinningList",
									dataType : "json",
									async : false,
									data : {
										"lotteryTypeId" : lotteryTypeId,
										t : Math.random()
									},
									success : function(data) {
										var html = '<div class="contentin_01 contentfirst_01"><ul class="xc_grzjph02">';
										if (data.length == 0) {
											$('#tab_box_02').html('今日无中奖');
											return;
										}
										for (var i = 0; i < data.length; i++) {
											var li = "<li>";
											li += '<span class="yh_phb_01">&nbsp;</span>';
											li += '<span class="yh_phb_02">'
													+ data[i].user_name
													+ '</span>';
												li += '<span class="yh_phb_03" style="color:red;"><b>'
														+ parseFloat(
																data[i].money)
																.toFixed(2)
														+ '</b>&nbsp;</span>';
											li += "</li>";
											html += li;
										}
										html += '</ul></div>';
										$('#tab_box_02').html(html);
									}
								});

						$("#tab_box_02").show();
					}
					function yesterday() {
						$("#tab_box_01").hide();
						var oldContent = $("#tab_box_02").html();
						$("#tab_box_02").html('加载中...');

						var lotteryTypeId = "";
						$.ajax({
									url : "<%=basePath%>theWinningList",
									dataType : "json",
									async : false,
									data : {
										"lotteryTypeId" : lotteryTypeId,
										t : Math.random()
									},
									success : function(data) {
										var html = '<div class="contentin_01 contentfirst_01"><ul class="xc_grzjph02">';
										if (data.length == 0) {
											$('#tab_box_02').html('昨天无中奖');
											return;
										}
										for (var i = 0; i < data.length; i++) {
											var li = "<li>";
											li += '<span class="yh_phb_01">&nbsp;</span>';
											li += '<span class="yh_phb_02">'
													+ data[i].user_name
													+ '</span>';
												li += '<span class="yh_phb_03"><b>'
														+ parseFloat(
																data[i].money)
																.toFixed(2)
														+ '</b>&nbsp;</span>';
											li += "</li>";
											html += li;
										}
										html += '</ul></div>';
										$('#tab_box_02').html(html);
									}
								});

						$("#tab_box_02").show();
					}

					function total() {
						$("#tab_box_01").show();
						$("#tab_box_02").hide();
					}
				</script>
			</div>
		</div>

	</div>
	<!--main end -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
