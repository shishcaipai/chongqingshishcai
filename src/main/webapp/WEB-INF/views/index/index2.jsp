<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>鸿运彩票彩票_鸿运彩票彩票合买平台</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html;charset=GBK">
<meta name="Keywords" content="">
<meta name="Description" content="">
<link rel="shortcut icon"
	href="<%=basePath%>static/images/favicon.new.ico" />
<link href="<%=basePath%>static/new/css/index.css" type="text/css"
	rel="stylesheet">
<script type="text/javascript"
	src="<%=basePath%>static/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>static/new/js/jquery-ui-1.8.2.custom.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>static/new/js/lotterymode.js"></script>
<SCRIPT type="text/javascript"
	src="<%=basePath%>static/new/js/jquery.nivo.slider.js"></SCRIPT>
<SCRIPT type="text/javascript"
	src="<%=basePath%>static/new/js/superfish.js"></SCRIPT>
<SCRIPT type="text/javascript"
	src="<%=basePath%>static/new/js/jquery.autocomplete.min.js"></SCRIPT>
<script src="<%=basePath%>static/js/buyTogether.js"
	type="text/javascript"></script>
</head>
<body>
	<jsp:include page="../header2.jsp"></jsp:include>
	<div class="header clearfix">
		<jsp:include page="../header3.jsp"></jsp:include>

		<div class="docBody clearfix">
			<div class="siderBox">
				<div id="awardLists">
					<dl id="awardListTab" class="grayTitle clearfix">
						<dt>
							<span>开奖公告</span>
						</dt>

					</dl>
					<ul id="awardList01" class="awardList_con" style="display: block;">
						<li>
									<p>
										<strong><a href="<%=basePath%>cqssc/cqsscview"
											target="_blank">重庆时时彩</a></strong> <span id="cqssc"> </span>
									</p>
									<p id="cqsscnum">暂无开奖数据请稍后</p>

									<p class="tr m-r">
										<span id="cqssctime"></span><a href="<%=basePath%>/zoushi">走势</a>
										| <a href="<%=basePath%>cqssc/cqsscview">投注</a>
									</p>
								</li>

						<li>
									<p>
										<strong><a href="<%=basePath%>gdsyxw/gdsyxwview"
											target="_blank">广东11选5</a></strong> <span id="gd11c5"> </span>
									</p>
									<p id="gd11c5num">暂无开奖数据请稍后</p>
									<p class="tr m-r">
										<span id="gd11c5time"></span><a href="<%=basePath%>/zoushi">走势</a>
										| <a href="<%=basePath%>gdsyxw/gdsyxwview">投注</a>
									</p>
								</li>
						<li>
									<p>
										<strong><a href="<%=basePath%>jxssc/jxsscview"
											target="_blank">江西11选5</a></strong> <span id="jx11c5"> </span>
									</p>
									<p id="jx11c5num">暂无开奖数据请稍后</p>
									<p class="tr m-r">
										<span id="jx11c5time"></span><a href="<%=basePath%>/zoushi">走势</a>
										| <a href="<%=basePath%>jxssc/jxsscview">投注</a>
									</p>
								</li>

					</ul>


				</div>
				<!--开奖号码结束-->
				<!--排行榜开始-->
				<div id="rankingList">
					<h2 style="border-top: none;" class="grayTitle">总排行榜</h2>
					<div class="ranking_con">
						<table id="ownerRanks" class="ranking_table">
							<colgroup>
								<col width="20%">
									<col width="30%">
										<col width="35%">
											<col width="15%">
							</colgroup>
							<tbody>
								<tr>
									<th class="tr">&nbsp;排名</th>
									<th>用户名</th>
									<th class="t_r">中奖金额</th>
									<c:forEach var="map" items="${requestScope.map }"
										varStatus="status">
										<tr>
											<td><span class='xh_top'>${ status.index + 1}</span></td>
											<td><span class="nickNames">${map.user_name}***</span></td>
											<td class="t_r">${map.money}&nbsp;元</td>
										</tr>

									</c:forEach>

								</tr>

							</tbody>
						</table>
					</div>
				</div>
				<!--排行榜结束-->
				<!--彩票走势图-->
				<div id="analysisTool">
					<h2 class="grayTitle">
						<a href="<%=basePath%>/zoushi">彩票走势图</a>
					</h2>
					<dl class="chartList clearfix">
						<dt>
							<a href="<%=basePath%>/zoushi">彩票走势图</a>
						</dt>
						<dd class="separator clearfix">
							<span>数字彩：</span><br> <span><a
									href="<%=basePath%>/zoushi">福彩3D</a></span>
								<dd>
									<span>高频彩：</span><br> <span><a
											href="<%=basePath%>/zoushi">重庆时时彩</a></span> <span><a
											href="<%=basePath%>/zoushi">广东11选5</a></span> <span><a
											href="<%=basePath%>/zoushi">江西11选5</a></span>
								</dd>
					</dl>
				</div>
				<!--走势图结束-->
			</div>
			<div class="maincontent">
				<!--首页logo-->
				<div id="SlideBox">
					<div class="theme-default">
						<div id="slider3" class="nivoSlider">
							<a href="javascript:void(0)"><img
								src="<%=basePath%>static/new/images/20130301150629_7687.jpg"
								width="100%" height="250"></a> <a href="javascript:void(0)"><img
								src="<%=basePath%>static/new/images/20130306133049_6844.jpg"
								width="100%" height="250"></a> <a href="javascript:void(0)"><img
								src="<%=basePath%>static/new/images/20130308120827_5124.jpg"
								width="100%" height="250"></a>
						</div>
					</div>
				</div>
				<!--快速投注开始-->
				<div id="quickbuyBox">
					<div class="quickbuy_title">
						<h2>
							<a href="/Trade/">购买彩票</a>
						</h2>

					</div>
					<div class="quickbuy_con clearfix">
						<div class="bettingBox">
							<div class="bet_title">
								<h3>热&nbsp;&nbsp;门：</h3>
								<ul class="quickbuy_menu">
									<li class="active"><a href="<%=basePath%>cqssc/cqsscview">重庆时时彩</a></li>
									<li><a href="<%=basePath%>jxssc/jxsscview">江西11选5</a></li>
									<li><a href="<%=basePath%>gdsyxw/gdsyxwview">广东11选5</a></li>
								</ul>
							</div>
							<dl class="gpcBet_con">
								<dd>
									<div class="clearfix">
										<h3 class="czLogo icon_ssq">
											<a title="重庆时时彩" href="<%=basePath%>cqssc/cqsscview"></a>
										</h3>
										<div class="gpc_main">
											<p class="gpc_title">
												<a href="<%=basePath%>cqssc/cqsscview"><strong>重庆时时彩</strong>&nbsp;&nbsp;每天<strong
													class="gpc_period">120</strong>期<span class="retimeBlock">白天10分钟，晚上5分钟</span></a>
											</p>
											<p class="gpc_con">
												<a href="/Trade/Ssq/">每周<span class="c_ba2636">二</span>、<span
													class="c_ba2636">四</span>、<span class="c_ba2636">日</span>晚上21:30开奖
												</a>
											</p>
										</div>
										<div class="gpc_betBtn">
											<a title="立即投注" class="btnSubmint"
												href="<%=basePath%>cqssc/cqsscview"></a>
										</div>
									</div>
								</dd>
								<dd class="hide">
									<div class="clearfix">
										<h3 class="czLogo icon_dlt">
											<a title="江西11选5" href="<%=basePath%>jxssc/jxsscview"></a>
										</h3>
										<div class="gpc_main">
											<p class="gpc_title">
												<a href="<%=basePath%>jxssc/jxsscview"><strong>江西11选5</strong></a>
											</p>
											<p class="gpc_con">
												<a href="<%=basePath%>jxssc/jxsscview">每天<span
													class="c_ba2636">78</span><span class="c_ba2636">期</span>，<span
													class="c_ba2636">每十分钟一期</span>
												</a>
											</p>
										</div>
										<div class="gpc_betBtn">
											<a title="立即投注" class="btnSubmint"
												href="<%=basePath%>jxssc/jxsscview"></a>
										</div>
									</div>
								</dd>
								<dd class="hide">
									<div class="clearfix">
										<h3 class="czLogo icon_dlt">
											<a title="广东11选5" href="<%=basePath%>gdsyxw/gdsyxwview"></a>
										</h3>
										<div class="gpc_main">
											<p class="gpc_title">
												<a href="<%=basePath%>gdsyxw/gdsyxwview"><strong>广东11选5</strong></a>
											</p>
											<p class="gpc_con">
												<a href="<%=basePath%>gdsyxw/gdsyxwview">每天<span
													class="c_ba2636">84</span><span class="c_ba2636">期</span>，<span
													class="c_ba2636">每十分钟一期</span>
												</a>
											</p>
										</div>
										<div class="gpc_betBtn">
											<a title="立即投注" class="btnSubmint"
												href="<%=basePath%>gdsyxw/gdsyxwview"></a>
										</div>
									</div>
								</dd>
							</dl>
							<div class="bet_title">
								<h3>高频彩：</h3>
								<ul class="quickbuy_menu">
									<li class="active"><a href="<%=basePath%>cqssc/cqsscview">重庆时时彩</a></li>
									<li><a href="<%=basePath%>jxssc/jxsscview">江西11选5</a></li>
									<li><a href="<%=basePath%>gdsyxw/gdsyxwview">广东11选5</a></li>
								</ul>
							</div>
							<dl class="gpcBet_con">
								<dd>
									<div class="clearfix">
										<h3 class="czLogo icon_ssq">
											<a title="重庆时时彩" href="<%=basePath%>cqssc/cqsscview"></a>
										</h3>
										<div class="gpc_main">
											<p class="gpc_title">
												<a href="<%=basePath%>cqssc/cqsscview"><strong>重庆时时彩</strong>&nbsp;&nbsp;每天<strong
													class="gpc_period">120</strong>期<span class="retimeBlock">白天10分钟，晚上5分钟</span></a>
											</p>
											<p class="gpc_con">
												<a href="/Trade/Ssq/">每周<span class="c_ba2636">二</span>、<span
													class="c_ba2636">四</span>、<span class="c_ba2636">日</span>晚上21:30开奖
												</a>
											</p>
										</div>
										<div class="gpc_betBtn">
											<a title="立即投注" class="btnSubmint"
												href="<%=basePath%>cqssc/cqsscview"></a>
										</div>
									</div>
								</dd>
								<dd class="hide">
									<div class="clearfix">
										<h3 class="czLogo icon_dlt">
											<a title="江西11选5" href="<%=basePath%>jxssc/jxsscview"></a>
										</h3>
										<div class="gpc_main">
											<p class="gpc_title">
												<a href="<%=basePath%>jxssc/jxsscview"><strong>江西11选5</strong></a>
											</p>
											<p class="gpc_con">
												<a href="<%=basePath%>jxssc/jxsscview">每天<span
													class="c_ba2636">78</span><span class="c_ba2636">期</span>，<span
													class="c_ba2636">每十分钟一期</span>
												</a>
											</p>
										</div>
										<div class="gpc_betBtn">
											<a title="立即投注" class="btnSubmint"
												href="<%=basePath%>jxssc/jxsscview"></a>
										</div>
									</div>
								</dd>
								<dd class="hide">
									<div class="clearfix">
										<h3 class="czLogo icon_dlt">
											<a title="广东11选5" href="<%=basePath%>gdsyxw/gdsyxwview"></a>
										</h3>
										<div class="gpc_main">
											<p class="gpc_title">
												<a href="<%=basePath%>gdsyxw/gdsyxwview"><strong>广东11选5</strong></a>
											</p>
											<p class="gpc_con">
												<a href="<%=basePath%>gdsyxw/gdsyxwview">每天<span
													class="c_ba2636">84</span><span class="c_ba2636">期</span>，<span
													class="c_ba2636">每十分钟一期</span>
												</a>
											</p>
										</div>
										<div class="gpc_betBtn">
											<a title="立即投注" class="btnSubmint"
												href="<%=basePath%>gdsyxw/gdsyxwview"></a>
										</div>
									</div>
								</dd>
							</dl>
							<div class="bet_title">
								<h3>数字彩：</h3>
								<ul class="quickbuy_menu">

									<li class="active"><a href="javascript:alert('暂停销售')">福彩3D</a></li>
								</ul>
							</div>
							<dl class="gpcBet_con">

								<dd class="quickBetD11">
									<div class="clearfix">
										<h3 class="czLogo icon_x3d">
											<a title="福彩3D" href="javascript:alert('暂停销售')"></a>
										</h3>
										<div class="gpc_main">
											<p class="gpc_title">
												<a href="javascript:alert('暂停销售')"><strong>福彩3D</strong>&nbsp;&nbsp;<span
													class="c_ba2636">2元</span>赢取<span class="c_ba2636">1000元</span></a>
											</p>
											<p class="gpc_con">
												<a href="javascript:alert('暂停销售')">每天晚上20点30分开奖，天天开奖</a>
											</p>
										</div>
										<div class="gpc_betBtn">
											<a title="立即投注" class="btnSubmint"
												href="javascript:alert('暂停销售')"></a>
										</div>
									</div>
								</dd>

							</dl>
							<script>
								$('.quickbuy_menu li')
										.mouseover(
												function() {
													$(this).parent().children()
															.removeClass("active");
													$(this).addClass("active");
													var ind = $(this).index();
													var s = $(this).parent().parent().next();
													s.find('dd').hide();
													s.find('dd:eq('+ ind+ ')').show();
												})
							</script>
						</div>
						<div class="betinfoBox">
							<div id="promotion">
								<div class="promotionText">
									<ul id="topInfoTab" class="grayTitle">
										<li class="active">公告</li>

									</ul>
									<div id="topNotice" class="promotion_con">
										<ul class="promotion_list">
											<c:forEach var="art" items="${requestScope.notice }">
												<li><em>[公告]</em> <a
													href="<%=basePath %>article/article?id=${art.id }"
													target="_blank" title="${art.title }">${art.title }</a></li>
											</c:forEach>
										</ul>
									</div>
									<p class="helplinks"></p>
								</div>
							</div>
							<h3>
								<strong>最新中奖</strong>
							</h3>

							<div class="latestWin_con" id="slider_lu">
								<ul class="latestWin_list" id="slider">

								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- 中部广告 -->
				<div style="clear: both" id="advertCenter">
					<img src="<%=basePath%>static/new/images/adindexcenter.jpg">
				</div>
				<!-- 中部广告结束-->
				<div id="groupBuy">
					<div class="group_title">
						<ul id="hmcase" class="group_menu">
							<li class="active" lotid="">合买推荐</li>
							<!-- <li lotid="重庆时时彩">重庆时时彩</li>
							<li lotid="十一运夺金">江西11选5</li>
							<li lotid="广东11选5">广东11选5</li> -->
						</ul>
						<div class="MoreLinks">
							<div class="linkBox">
								<a rel="nofollow" target="_blank"
									href="<%=basePath%>hemai/hemaiview">合买大厅&gt;&gt;</a>
							</div>
						</div>
						<div class="group_con">
							<table id="list_data" class="rec_table">
								<colgroup>
									<col width="14%">
									<col width="14%">
									<col width="14%">
									<col width="16%">
									<col width="14%">
									<col width="14%">
									<col width="14%">
								</colgroup>
								<thead>
									<tr>
										<th>发起人</th>
										<th>方案金额</th>
										<th>每份金额</th>
										<th>方案进度</th>
										<th>剩余份数</th>
										<th>认购份数</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="order"
										items="${requestScope.heMaiOrderDetails }">
										<tr class="tab_hemai_2">
											<td style="display: none">1</td>
											<td style="padding-left: 15px;">${order.memberUser.userName}</td>

											<td><span class="new_hemai_red">${order.order.totalMoney}元</span></td>
											<td><span class="new_hemai_red"><fmt:formatNumber
														value="${order.order.totalMoney/order.fensum}"
														pattern="##.##" minFractionDigits="2" /></span></td>
											<td style="color: #333;"><span style="float: left;">
													<fmt:formatNumber
														value="${(order.fensum - order.subGuaranteeSum) * 100 / order.fensum }"
														pattern="##.##" minFractionDigits="2" />% + <fmt:formatNumber
														value="${( order.fensum - order.otherBuyNum) * 100 / order.fensum }"
														pattern="##.##" minFractionDigits="2" />% </td>
											<td>${order.otherBuyNum }</td>


											<c:choose>
												<c:when test="${2 == order.order.orderStatus}">
													<td class="new_hemai_srk"><span
														style="margin-left: 20px">-</span></td>
													<td class="new_hemai_an"><span
														style="margin-left: 25px">超时</span></td>
												</c:when>
												<c:otherwise>
													<c:choose>
														<c:when test="${1 == order.status}">
															<td class="new_hemai_srk"><span
																style="margin-left: 20px">-</span></td>
															<td class="new_hemai_an"><span
																style="margin-left: 25px">成功</span></td>
														</c:when>
														<c:otherwise>
															<c:if test="${order.order.orderStatus ==4}">
																<td class="new_hemai_srk"><span
																	style="margin-left: 20px">-</span></td>
																<td class="new_hemai_an"><span
																	style="margin-left: 25px">订单取消</span></td>
															</c:if>
															<c:if test="${order.order.orderStatus ==0}">
																<td class="new_hemai_srk"><input name="buynum"
																	type="text" class="rec_text" id="${order.id}" value="0" />
																</td>
																<td class="new_hemai_an"><a
																	onclick="javascript:btnBuy(this);"
																	style="margin-left: 25px; cursor: pointer; text-decoration: underline; color: blue;"
																	id="${order.id}"> <input type="hidden"
																		value="${order.id}" /> <input type="hidden"
																		value="${order.otherBuyNum }" /> <input type="hidden"
																		value="${order.otherBuyNum }" /> 购买
																</a></td>
															</c:if>
														</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div id="infoBox">
							<div class="zx_module clearfix">
								<div class="info_title">
									<a target="_blank" href="/News/" title="彩票资讯">彩票资讯</a>
								</div>
								<div class="zx_block">
									<ul class="news_list">

										<c:forEach var="art" items="${requestScope.zixian }">
											<li
												style="width: 500px; height: 22px; overflow: hidden; line-height: 22px; margin: 6px;">
												<em>[资讯]</em> <a
												href="<%=basePath %>article/article?id=${art.id }"
												target="_blank" title="${art.title }" style="color: #333;">${art.title }</a>
											</li>
										</c:forEach>
									</ul>
								</div>
								<div class="zx_block">
									<div id="sfCon">
										<ul class="news_list">
											<c:forEach var="art" items="${requestScope.zixian2 }">
												<li
													style="width: 500px; height: 22px; overflow: hidden; line-height: 22px; margin: 6px;">
													<em>[资讯]</em> <a
													href="<%=basePath %>article/article?id=${art.id }"
													target="_blank" title="${art.title }" style="color: #333;">${art.title }</a>
												</li>
											</c:forEach>

										</ul>
									</div>
								</div>


							</div>
						</div>
					</div>
				</div>
				<!--合买结束-->
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			zjxb();
			 getcqssc();
			getgd11c5();
			getjx11c5(); 
			setInterval(zjxb, 30000);
			setInterval(getcqssc, 50000);
			setInterval(getjx11c5, 50000);
			setInterval(getjx11c5, 50000);
		});
		function getcqssc(){
			getlottery("cqssc",'cqssctime','cqssc','cqsscnum');
		}
		function getgd11c5(){
			getlottery("gd11x5",'gd11c5time','gd11c5','gd11c5num');
		}
		function getjx11c5(){
			getlottery("jx11x5",'jx11c5time','jx11c5','jx11c5num');
		}
		function getlottery(lotteryTypeId,timetype,type,num){
			$.ajax({
				url : "<%=basePath%>getHistory",
				dataType : "text",
				data : {
					"lotteryTypeId" : lotteryTypeId,
					t : Math.random()
				},
				success : function(data2) {
					data2 = eval("(" + data2 + ")");
					var phase = data2.periodNumber;
					var firstPhase = phase;
					var lastPhase =$('#'+type).text();
					if (firstPhase == lastPhase) {
						// don't need to update
					} else {
						$('#'+type).html(phase);
						var numbers = data2.lotteryPeriod;
						drawNumber(numbers,num)
						var time = data2.opentime;
						$('#'+timetype).html(time.substr(5,time.length)+"&nbsp")
					}
					
					
				}
			});
			
		}
		function drawNumber(number,type) {
			number = number.trim();
			if (number != "") {
				var numbers = [];
				numbers = number.split(',');
				var html = "";
				for(var i=0;i<numbers.length;i++){
					html += "<em><b>" + numbers[i] + "</b></em>";
				}
				$("#"+type).html(html);
			}
		}

		//中奖喜报
		function zjxb() {
			$.ajax({
				url : "<%=basePath%>cqssc/winningrecord",
						dataType : "json",
						data : {
							t : Math.random()
						},
						success : function(data2) {
							if (data2) {
								$("#slider>li").remove();
								for (var i = 0; i < data2.length; i++) {
									var vo = data2[i];
									$("#slider")
											.append(
													"<li><span>恭喜</span><span style='overflow: hidden;'>"
															+ vo.username
															+ "</span><span style='color:red'>喜中 <b >"
															+ vo.prize
															+ "</b> 元</span></li>");
								}

							}
						}
					});
		}
	</script>
<div class="footer_bj">
		<div class="footer">
			<ul class="fo1">
				<h1>
					<img alt="快购彩票网"
						src="http://www.ld3j.com/res/index/picture/fo1.png" />
				</h1>
				<li>交易安全</li>
				<li>购买便捷</li>
				<li>派奖快速</li>
			</ul>
			<ul class="fo2">
				<h1>
					<img alt="快购彩票网"
						src="http://www.ld3j.com/res/index/picture/fo2.png" />
				</h1>
				<li>・<a href="http://www.ld3j.com/article?id=cz1">充值方式</a></li>
				<li>・<a href="http://www.ld3j.com/article?id=cz2">充值流程</a></li>
				<li>・<a href="http://www.ld3j.com/article?id=cz3">修改真实姓名</a></li>
				<li>・<a href="http://www.ld3j.com/article?id=cz4">修改银行卡</a></li>
			</ul>
			<ul class="fo3">
				<h1>
					<img alt="快购彩票网"
						src="http://www.ld3j.com/res/index/picture/fo3.png" />
				</h1>
				<li>・<a href="http://www.ld3j.com/article?id=tk1">如何提款</a></li>
				<li>・<a href="http://www.ld3j.com/article?id=tk2">到账时间</a></li>
				<li>・<a href="http://www.ld3j.com/article?id=tk3">银行提款费率</a></li>
				<li>・<a href="http://www.ld3j.com/article?id=tk4">提款注意</a></li>
			</ul>
			<ul class="fo4" style="border-right: none">
				<h1>
					<img alt="快购彩票网"
						src="http://www.ld3j.com/res/index/picture/fo4.png" />
				</h1>
				<li>・<a href="http://www.ld3j.com/article?id=bz1">如何注册网站会员</a></li>
				<li>・<a href="http://www.ld3j.com/article?id=bz2">注册时需注意什么</a></li>
				<li>・<a href="http://www.ld3j.com/article?id=bz3">如何注销会员帐户</a></li>
				<li>・<a href="http://www.ld3j.com/article?id=bz4">密码忘记了怎么办</a></li>
			</ul>

		</div>
	</div>
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>