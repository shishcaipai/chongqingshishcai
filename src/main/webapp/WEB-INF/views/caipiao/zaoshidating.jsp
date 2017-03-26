<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>走势图表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="Generator" content="EditPlus">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.7.2.min.js"></script>
<link href="<%=basePath%>static/new/css/zaoshi.css" type="text/css"
	rel="stylesheet" />
<script type="text/javascript">
$(document).ready(function (){
	// 走势图表高度重置
	$("#zoushiframe").load(function (){
		var height=(this.Document ? this.Document.body.scrollHeight : this.contentDocument.body.offsetHeight) + 10;
		$(this).css("height", height);
	});
	// 查找子走势的ID，以便对应彩种show
	var lottery_nav_a_class = $("#zoushi_nav").find("a[href='"+document.location+"']").parents("div[id]").attr("id");
	$("."+lottery_nav_a_class).addClass("show");
	// 隐藏子走势
	$("#zoushi_nav").find("a[href!='"+document.location+"']").parents("div[class=zoushi-nav-main]").hide();
	$("#zoushi_nav").find("a[href='"+document.location+"']").parents("div[class=zoushi-nav-main]").fadeIn();
	// 子走势show
	$("#zoushi_nav").find("a[href='"+document.location+"']").addClass("show");
	// 隐藏走势分类
});
function zaoshi(){
		$("#zoushi_classify").hide();
		$("#zoushiframe").attr("src","http://www.ld3j.com/jxssc/baseTrend.action?onlyBody=true");
		$("#zoushiframe").location.reload();
		var ifm= document.getElementById("zoushiframe");
		ifm.height=document.documentElement.clientHeight;
}
</script>

</head>
<body>
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
</head>
<jsp:include page="../header2.jsp"></jsp:include>
	<div class="header clearfix">
		<jsp:include page="../header3.jsp"></jsp:include>

	
	<div style="width: 100%">
		<div style="margin: 20px auto 0px; width: 1000px;">
			
			<!-- 彩种导航 -->
			<div id="lottery_nav">
				<div class="lottery_nav_shuzi">
					<span>数字彩</span>
					<a class="fc3d" href="javascript:zaoshi();">福彩3D</a>
					<a class="pl3" href="javascript:zaoshi();">排列3</a>
				</div>
				<div class="lottery_nav_gaopin">
					<span>高频彩</span>
					<a class="cqssc" href="javascript:zaoshi();">重庆时时彩</a>
					<a class="jxssc" href="javascript:zaoshi();">江西时时彩</a>
					<a class="jx11x5" href="javascript:zaoshi();">江西11选5</a>
					<a class="gd11x5" href="javascript:zaoshi();">广东11选5</a>
					<a class="sd11x5" href="javascript:zaoshi();">山东11选5</a>
				</div>
			</div>
			
			<!-- 走势导航 -->
			<div id="zoushi_nav">
				<div id="fc3d" class="zoushi-nav-main">
					<p style="margin: 13px;">
						<a href="javascript:zaoshi();">直选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();">组选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();">大小走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();">奇偶走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();">质合走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();">除3余数</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();">和值走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();fc3d/spanTrend.zoushi">跨度走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();fc3d/typeTrend.zoushi">类型走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();fc3d/coldHotTrend.zoushi">冷热分析</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();fc3d/hundredsPlaceKillTrend.zoushi">智能杀号</a>
					</p>
				</div>
				<div id="pl3" class="zoushi-nav-main">
					<p style="margin: 13px;">
						<a href="javascript:zaoshi();pl3/baseTrend.zoushi">直选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();pl3/groupBaseTrend.zoushi">组选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();pl3/bigSmallFormTrend.zoushi">大小走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();pl3/oddEvenFormTrend.zoushi">奇偶走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();pl3/primeCompositeFormTrend.zoushi">质合走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();pl3/division3RemainderFirstTrend.zoushi">除3余数</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();pl3/sumTrend.zoushi">和值走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();pl3/spanTrend.zoushi">跨度走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();pl3/typeTrend.zoushi">类型走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();pl3/coldHotTrend.zoushi">冷热分析</a>
					</p>
				</div>
				<div id="cqssc" class="zoushi-nav-main">
					<p style="margin: 13px;">五星：
						<a href="javascript:zaoshi();cqssc/baseTrend.zoushi">基本走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();cqssc/sumTrend.zoushi">和值走势</a>
					</p>
					<p style="margin: 13px;">三星：
						<a href="javascript:zaoshi();cqssc/threeStarsBaseTrend.zoushi">直选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();cqssc/threeStarsGroupBaseTrend.zoushi">组选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();cqssc/threeStarsSumTrend.zoushi">和值走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();cqssc/threeStarsBigSmallTrend.zoushi">大小走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();cqssc/threeStarsOddEvenTrend.zoushi">奇偶走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();cqssc/threeStarsPrimeCompositeTrend.zoushi">质合走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();cqssc/threeStarsDivision3RemainderTrend.zoushi">除3余数</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();cqssc/threeStarsSpanTrend.zoushi">跨度走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();cqssc/threeStarsMaxNumberTrend.zoushi">最大数</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();cqssc/threeStarsMinNumberTrend.zoushi">最小数</a>
					</p>
					<p style="margin: 13px;">二星：
						<a href="javascript:zaoshi();cqssc/twoStarsBaseTrend.zoushi">直选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();cqssc/twoStarsGroupBaseTrend.zoushi">组选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();cqssc/twoStarsSumTrend.zoushi">和值走势</a>
					</p>
					<p style="margin: 13px;">其它：
						<a href="javascript:zaoshi();cqssc/oneStarTrend.zoushi">一星走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();cqssc/bigSmallOddEvenTrend.zoushi">大小单双</a>
					</p>
				</div>
				<div id="jxssc" class="zoushi-nav-main">
					<p style="margin: 13px;">五星：
						<a href="javascript:zaoshi();jxssc/baseTrend.zoushi">基本走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jxssc/sumTrend.zoushi">和值走势</a>
					</p>
					<p style="margin: 13px;">四星：
						<a href="javascript:zaoshi();jxssc/fourStarsBaseTrend.zoushi">基本走势</a>
					</p>
					<p style="margin: 13px;">三星：
						<a href="javascript:zaoshi();jxssc/threeStarsBaseTrend.zoushi">直选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jxssc/threeStarsGroupBaseTrend.zoushi">组选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jxssc/threeStarsSumTrend.zoushi">和值走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jxssc/threeStarsBigSmallTrend.zoushi">大小走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jxssc/threeStarsOddEvenTrend.zoushi">奇偶走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jxssc/threeStarsPrimeCompositeTrend.zoushi">质合走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jxssc/threeStarsDivision3RemainderTrend.zoushi">除3余数</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jxssc/threeStarsSpanTrend.zoushi">跨度走势</a>
					</p>
					<p style="margin: 13px;">二星：
						<a href="javascript:zaoshi();jxssc/twoStarsBaseTrend.zoushi">直选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jxssc/twoStarsGroupBaseTrend.zoushi">组选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jxssc/twoStarsSumTrend.zoushi">和值走势</a>
					</p>
					<p style="margin: 13px;">其它：
						<a href="javascript:zaoshi();jxssc/oneStarTrend.zoushi">一星走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jxssc/bigSmallOddEvenTrend.zoushi">大小单双</a>
					</p>
				</div>
				<div id="gd11x5" class="zoushi-nav-main">
					<p style="margin: 13px;">任选：
						<a href="javascript:zaoshi();gd11x5/baseTrend.zoushi">基本走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();gd11x5/bigSmallTrend.zoushi">大小走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();gd11x5/oddEvenTrend.zoushi">奇偶走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();gd11x5/primeCompositeTrend.zoushi">质合走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();gd11x5/sumTrend.zoushi">和值走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();gd11x5/division3RemainderTrend.zoushi">除3余数</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();gd11x5/positionOneTrend.zoushi">分位走势</a>
					</p>
					<p style="margin: 13px;">前三：
						<a href="javascript:zaoshi();gd11x5/firstThreeBaseTrend.zoushi">直选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();gd11x5/firstThreeGroupBaseTrend.zoushi">组选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();gd11x5/firstThreeBigSmallTrend.zoushi">大小走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();gd11x5/firstThreeOddEvenTrend.zoushi">奇偶走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();gd11x5/firstThreePrimeCompositeTrend.zoushi">质合走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();gd11x5/firstThreeDivision3RemainderTrend.zoushi">除3余数</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();gd11x5/firstThreeSumTrend.zoushi">和值走势</a>
					</p>
					<p style="margin: 13px;">前二：
						<a href="javascript:zaoshi();gd11x5/firstTwoBaseTrend.zoushi">直选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();gd11x5/firstTwoGroupBaseTrend.zoushi">组选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();gd11x5/firstTwoSumTrend.zoushi">和值走势</a>
					</p>
				</div>
				<div id="jx11x5" class="zoushi-nav-main">
					<p style="margin: 13px;">任选：
						<a href="javascript:zaoshi();jx11x5/baseTrend.zoushi">基本走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jx11x5/bigSmallTrend.zoushi">大小走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jx11x5/oddEvenTrend.zoushi">奇偶走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jx11x5/primeCompositeTrend.zoushi">质合走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jx11x5/sumTrend.zoushi">和值走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jx11x5/division3RemainderTrend.zoushi">除3余数</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jx11x5/positionOneTrend.zoushi">分位走势</a>
					</p>
					<p style="margin: 13px;">前三：
						<a href="javascript:zaoshi();jx11x5/firstThreeBaseTrend.zoushi">直选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jx11x5/firstThreeGroupBaseTrend.zoushi">组选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jx11x5/firstThreeBigSmallTrend.zoushi">大小走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jx11x5/firstThreeOddEvenTrend.zoushi">奇偶走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jx11x5/firstThreePrimeCompositeTrend.zoushi">质合走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jx11x5/firstThreeDivision3RemainderTrend.zoushi">除3余数</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jx11x5/firstThreeSumTrend.zoushi">和值走势</a>
					</p>
					<p style="margin: 13px;">前二：
						<a href="javascript:zaoshi();jx11x5/firstTwoBaseTrend.zoushi">直选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jx11x5/firstTwoGroupBaseTrend.zoushi">组选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();jx11x5/firstTwoSumTrend.zoushi">和值走势</a>
					</p>
				</div>
				<div id="sd11x5" class="zoushi-nav-main">
					<p style="margin: 13px;">任选：
						<a href="javascript:zaoshi();sd11x5/baseTrend.zoushi">基本走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();sd11x5/bigSmallTrend.zoushi">大小走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();sd11x5/oddEvenTrend.zoushi">奇偶走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();sd11x5/primeCompositeTrend.zoushi">质合走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();sd11x5/sumTrend.zoushi">和值走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();sd11x5/division3RemainderTrend.zoushi">除3余数</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();sd11x5/positionOneTrend.zoushi">分位走势</a>
					</p>
					<p style="margin: 13px;">前三：
						<a href="javascript:zaoshi();sd11x5/firstThreeBaseTrend.zoushi">直选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();sd11x5/firstThreeGroupBaseTrend.zoushi">组选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();sd11x5/firstThreeBigSmallTrend.zoushi">大小走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();sd11x5/firstThreeOddEvenTrend.zoushi">奇偶走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();sd11x5/firstThreePrimeCompositeTrend.zoushi">质合走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();sd11x5/firstThreeDivision3RemainderTrend.zoushi">除3余数</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();sd11x5/firstThreeSumTrend.zoushi">和值走势</a>
					</p>
					<p style="margin: 13px;">前二：
						<a href="javascript:zaoshi();sd11x5/firstTwoBaseTrend.zoushi">直选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();sd11x5/firstTwoGroupBaseTrend.zoushi">组选走势</a>
						<span class="separator">|</span>
						<a href="javascript:zaoshi();sd11x5/firstTwoSumTrend.zoushi">和值走势</a>
					</p>
				</div>
			</div>
			
			<!-- 走势分类 -->
			<div id="zoushi_classify">
				<!-- 数字彩走势图 -->
				<div class="shuzi-cai-classify">
					<span>数字彩—走势图</span>
					<div class="fc3d">
						<span>福彩3D</span>
						<table>
							<tr>
								<td><a href="javascript:zaoshi();fc3d/baseTrend.zoushi">直选走势</a></td>
								<td><a href="javascript:zaoshi();">组选走势</a></td>
								<td><a href="javascript:zaoshi();">大小走势</a></td>
								<td><a href="javascript:zaoshi();">奇偶走势</a></td>
								<td><a href="javascript:zaoshi();">质合走势</a></td>
								<td><a href="javascript:zaoshi();">除3余数</a></td>
							</tr>
							<tr>
								<td><a href="javascript:zaoshi();">和值走势</a></td>
								<td><a href="javascript:zaoshi();">跨度走势</a></td>
								<td><a href="javascript:zaoshi();">类型走势</a></td>
								<td><a href="javascript:zaoshi();">冷热分析</a></td>
								<td><a href="javascript:zaoshi();">智能杀号</a></td>
							</tr>
						</table>
					</div>
					<div class="pl3">
						<span>排列3</span>
						<table>
							<tr>
								<td><a href="javascript:zaoshi();pl3/baseTrend.zoushi">直选走势</a></td>
								<td><a href="javascript:zaoshi();pl3/groupBaseTrend.zoushi">组选走势</a></td>
								<td><a href="javascript:zaoshi();pl3/bigSmallFormTrend.zoushi">大小走势</a></td>
								<td><a href="javascript:zaoshi();pl3/oddEvenFormTrend.zoushi">奇偶走势</a></td>
								<td><a href="javascript:zaoshi();pl3/primeCompositeFormTrend.zoushi">质合走势</a></td>
							</tr>
							<tr>
								<td><a href="javascript:zaoshi();pl3/division3RemainderFirstTrend.zoushi">除3余数</a></td>
								<td><a href="javascript:zaoshi();pl3/sumTrend.zoushi">和值走势</a></td>
								<td><a href="javascript:zaoshi();pl3/spanTrend.zoushi">跨度走势</a></td>
								<td><a href="javascript:zaoshi();pl3/typeTrend.zoushi">类型走势</a></td>
								<td><a href="javascript:zaoshi();pl3/coldHotTrend.zoushi">冷热分析</a></td>
							</tr>
						</table>
					</div>
				</div>
				<!-- 高频彩走势图 -->
				<div class="gaopin-cai-classify">
					<span>高频彩—走势图</span>
					<div class="cqssc">
						<span>重庆时时彩</span>
						<table>
							<tr>
								<th>五星：</th>
								<td><a href="javascript:zaoshi();cqssc/baseTrend.zoushi">基本走势</a></td>
								<td><a href="javascript:zaoshi();cqssc/sumTrend.zoushi">和值走势</a></td>
							</tr>
							<tr>
								<th>三星：</th>
								<td><a href="javascript:zaoshi();cqssc/threeStarsBaseTrend.zoushi">直选走势</a></td>
								<td><a href="javascript:zaoshi();cqssc/threeStarsGroupBaseTrend.zoushi">组选走势</a></td>
								<td><a href="javascript:zaoshi();cqssc/threeStarsSumTrend.zoushi">和值走势</a></td>
								<td><a href="javascript:zaoshi();cqssc/threeStarsBigSmallTrend.zoushi">大小走势</a></td>
								<td><a href="javascript:zaoshi();cqssc/threeStarsOddEvenTrend.zoushi">奇偶走势</a></td>
								<td><a href="javascript:zaoshi();cqssc/threeStarsPrimeCompositeTrend.zoushi">质合走势</a></td>
								<td><a href="javascript:zaoshi();cqssc/threeStarsDivision3RemainderTrend.zoushi">除3余数</a></td>
								<td><a href="javascript:zaoshi();cqssc/threeStarsSpanTrend.zoushi">跨度走势</a></td>
								<td><a href="javascript:zaoshi();cqssc/threeStarsMaxNumberTrend.zoushi">最大数</a></td>
								<td><a href="javascript:zaoshi();cqssc/threeStarsMinNumberTrend.zoushi">最小数</a></td>
							</tr>
							<tr>
								<th>二星：</th>
								<td><a href="javascript:zaoshi();cqssc/twoStarsBaseTrend.zoushi">直选走势</a></td>
								<td><a href="javascript:zaoshi();cqssc/twoStarsGroupBaseTrend.zoushi">组选走势</a></td>
								<td><a href="javascript:zaoshi();cqssc/twoStarsSumTrend.zoushi">和值走势</a></td>
							</tr>
							<tr>
								<th>其它：</th>
								<td><a href="javascript:zaoshi();cqssc/oneStarTrend.zoushi">一星走势</a></td>
								<td><a href="javascript:zaoshi();cqssc/bigSmallOddEvenTrend.zoushi">大小单双</a></td>
							</tr>
						</table>
					</div>
					<div class="jxssc">
						<span>江西时时彩</span>
						<table>
							<tr>
								<th>五星：</th>
								<td><a href="javascript:zaoshi();jxssc/baseTrend.zoushi">基本走势</a></td>
								<td><a href="javascript:zaoshi();jxssc/sumTrend.zoushi">和值走势</a></td>
							</tr>
							<tr>
								<th>四星：</th>
								<td><a href="javascript:zaoshi();jxssc/fourStarsBaseTrend.zoushi">基本走势</a></td>
							</tr>
							<tr>
								<th>三星：</th>
								<td><a href="javascript:zaoshi();jxssc/threeStarsBaseTrend.zoushi">直选走势</a></td>
								<td><a href="javascript:zaoshi();jxssc/threeStarsGroupBaseTrend.zoushi">组选走势</a></td>
								<td><a href="javascript:zaoshi();jxssc/threeStarsSumTrend.zoushi">和值走势</a></td>
								<td><a href="javascript:zaoshi();jxssc/threeStarsBigSmallTrend.zoushi">大小走势</a></td>
								<td><a href="javascript:zaoshi();jxssc/threeStarsOddEvenTrend.zoushi">奇偶走势</a></td>
								<td><a href="javascript:zaoshi();jxssc/threeStarsPrimeCompositeTrend.zoushi">质合走势</a></td>
								<td><a href="javascript:zaoshi();jxssc/threeStarsDivision3RemainderTrend.zoushi">除3余数</a></td>
								<td><a href="javascript:zaoshi();jxssc/threeStarsSpanTrend.zoushi">跨度走势</a></td>
							</tr>
							<tr>
								<th>二星：</th>
								<td><a href="javascript:zaoshi();jxssc/twoStarsBaseTrend.zoushi">直选走势</a></td>
								<td><a href="javascript:zaoshi();jxssc/twoStarsGroupBaseTrend.zoushi">组选走势</a></td>
								<td><a href="javascript:zaoshi();jxssc/twoStarsSumTrend.zoushi">和值走势</a></td>
							</tr>
							<tr>
								<th>其它：</th>
								<td><a href="javascript:zaoshi();jxssc/oneStarTrend.zoushi">一星走势</a></td>
								<td><a href="javascript:zaoshi();jxssc/bigSmallOddEvenTrend.zoushi">大小单双</a></td>
							</tr>
						</table>
					</div>
					<div class="gd11x5">
						<span>广东11选5</span>
						<table>
							<tr>
								<th>任选：</th>
								<td><a href="javascript:zaoshi();gd11x5/baseTrend.zoushi">基本走势</a></td>
								<td><a href="javascript:zaoshi();gd11x5/bigSmallTrend.zoushi">大小走势</a></td>
								<td><a href="javascript:zaoshi();gd11x5/oddEvenTrend.zoushi">奇偶走势</a></td>
								<td><a href="javascript:zaoshi();gd11x5/primeCompositeTrend.zoushi">质合走势</a></td>
								<td><a href="javascript:zaoshi();gd11x5/sumTrend.zoushi">和值走势</a></td>
								<td><a href="javascript:zaoshi();gd11x5/division3RemainderTrend.zoushi">除3余数</a></td>
								<td><a href="javascript:zaoshi();gd11x5/positionOneTrend.zoushi">分位走势</a></td>
							</tr>
							<tr>
								<th>前三：</th>
								<td><a href="javascript:zaoshi();gd11x5/firstThreeBaseTrend.zoushi">直选走势</a></td>
								<td><a href="javascript:zaoshi();gd11x5/firstThreeGroupBaseTrend.zoushi">组选走势</a></td>
								<td><a href="javascript:zaoshi();gd11x5/firstThreeBigSmallTrend.zoushi">大小走势</a></td>
								<td><a href="javascript:zaoshi();gd11x5/firstThreeOddEvenTrend.zoushi">奇偶走势</a></td>
								<td><a href="javascript:zaoshi();gd11x5/firstThreePrimeCompositeTrend.zoushi">质合走势</a></td>
								<td><a href="javascript:zaoshi();gd11x5/firstThreeDivision3RemainderTrend.zoushi">除3余数</a></td>
								<td><a href="javascript:zaoshi();gd11x5/firstThreeSumTrend.zoushi">和值走势</a></td>
							</tr>
							<tr>
								<th>前二：</th>
								<td><a href="javascript:zaoshi();gd11x5/firstTwoBaseTrend.zoushi">直选走势</a></td>
								<td><a href="javascript:zaoshi();gd11x5/firstTwoGroupBaseTrend.zoushi">组选走势</a></td>
								<td><a href="javascript:zaoshi();gd11x5/firstTwoSumTrend.zoushi">和值走势</a></td>
							</tr>
						</table>
					</div>
					<div class="jx11x5">
						<span>江西11选5</span>
						<table>
							<tr>
								<th>任选</th>
								<td><a href="javascript:zaoshi();jx11x5/baseTrend.zoushi">基本走势</a></td>
								<td><a href="javascript:zaoshi();jx11x5/bigSmallTrend.zoushi">大小走势</a></td>
								<td><a href="javascript:zaoshi();jx11x5/oddEvenTrend.zoushi">奇偶走势</a></td>
								<td><a href="javascript:zaoshi();jx11x5/primeCompositeTrend.zoushi">质合走势</a></td>
								<td><a href="javascript:zaoshi();jx11x5/sumTrend.zoushi">和值走势</a></td>
								<td><a href="javascript:zaoshi();jx11x5/division3RemainderTrend.zoushi">除3余数</a></td>
								<td><a href="javascript:zaoshi();jx11x5/positionOneTrend.zoushi">分位走势</a></td>
							</tr>
							<tr>
								<th>前三</th>
								<td><a href="javascript:zaoshi();jx11x5/firstThreeBaseTrend.zoushi">直选走势</a></td>
								<td><a href="javascript:zaoshi();jx11x5/firstThreeGroupBaseTrend.zoushi">组选走势</a></td>
								<td><a href="javascript:zaoshi();jx11x5/firstThreeBigSmallTrend.zoushi">大小走势</a></td>
								<td><a href="javascript:zaoshi();jx11x5/firstThreeOddEvenTrend.zoushi">奇偶走势</a></td>
								<td><a href="javascript:zaoshi();jx11x5/firstThreePrimeCompositeTrend.zoushi">质合走势</a></td>
								<td><a href="javascript:zaoshi();jx11x5/firstThreeDivision3RemainderTrend.zoushi">除3余数</a></td>
								<td><a href="javascript:zaoshi();jx11x5/firstThreeSumTrend.zoushi">和值走势</a></td>
							</tr>
							<tr>
								<th>前二</th>
								<td><a href="javascript:zaoshi();jx11x5/firstTwoBaseTrend.zoushi">直选走势</a></td>
								<td><a href="javascript:zaoshi();jx11x5/firstTwoGroupBaseTrend.zoushi">组选走势</a></td>
								<td><a href="javascript:zaoshi();jx11x5/firstTwoSumTrend.zoushi">和值走势</a></td>
							</tr>
						</table>
					</div>
					<div class="sd11x5">
						<span>山东11选5</span>
						<table>
							<tr>
								<th>任选</th>
								<td><a href="javascript:zaoshi();sd11x5/baseTrend.zoushi">基本走势</a></td>
								<td><a href="javascript:zaoshi();sd11x5/bigSmallTrend.zoushi">大小走势</a></td>
								<td><a href="javascript:zaoshi();sd11x5/oddEvenTrend.zoushi">奇偶走势</a></td>
								<td><a href="javascript:zaoshi();sd11x5/primeCompositeTrend.zoushi">质合走势</a></td>
								<td><a href="javascript:zaoshi();sd11x5/sumTrend.zoushi">和值走势</a></td>
								<td><a href="javascript:zaoshi();sd11x5/division3RemainderTrend.zoushi">除3余数</a></td>
								<td><a href="javascript:zaoshi();sd11x5/positionOneTrend.zoushi">分位走势</a></td>
							</tr>
							<tr>
								<th>前三</th>
								<td><a href="javascript:zaoshi();sd11x5/firstThreeBaseTrend.zoushi">直选走势</a></td>
								<td><a href="javascript:zaoshi();sd11x5/firstThreeGroupBaseTrend.zoushi">组选走势</a></td>
								<td><a href="javascript:zaoshi();sd11x5/firstThreeBigSmallTrend.zoushi">大小走势</a></td>
								<td><a href="javascript:zaoshi();sd11x5/firstThreeOddEvenTrend.zoushi">奇偶走势</a></td>
								<td><a href="javascript:zaoshi();sd11x5/firstThreePrimeCompositeTrend.zoushi">质合走势</a></td>
								<td><a href="javascript:zaoshi();sd11x5/firstThreeDivision3RemainderTrend.zoushi">除3余数</a></td>
								<td><a href="javascript:zaoshi();sd11x5/firstThreeSumTrend.zoushi">和值走势</a></td>
							</tr>
							<tr>
								<th>前二</th>
								<td><a href="javascript:zaoshi();sd11x5/firstTwoBaseTrend.zoushi">直选走势</a></td>
								<td><a href="javascript:zaoshi();sd11x5/firstTwoGroupBaseTrend.zoushi">组选走势</a></td>
								<td><a href="javascript:zaoshi();sd11x5/firstTwoSumTrend.zoushi">和值走势</a></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			
			<!-- 走势图表 -->
			<div>
				<iframe id="zoushiframe" src="" frameborder="0" scrolling="no" width="100%" height="800"></iframe>
			</div>
			
		</div>
	</div>
	






<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>

