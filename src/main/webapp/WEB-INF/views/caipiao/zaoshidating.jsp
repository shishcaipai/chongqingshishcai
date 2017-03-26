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
<script type="text/javascript"
	src="<%=basePath%>static/js/jquery-1.7.2.min.js"></script>
<link href="<%=basePath%>static/new/css/zaoshi.css" type="text/css"
	rel="stylesheet" />
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						// 走势图表高度重置
						$("#zoushiframe")
								.load(
										function() {
											var height = (this.Document ? this.Document.body.scrollHeight
													: this.contentDocument.body.offsetHeight) + 10;
											$(this).css("height", height);
										});
						// 查找子走势的ID，以便对应彩种show
						var lottery_nav_a_class = $("#zoushi_nav").find(
								"a[href='" + document.location + "']").parents(
								"div[id]").attr("id");
						$("." + lottery_nav_a_class).addClass("show");
						// 隐藏子走势
						$("#zoushi_nav").find(
								"a[href!='" + document.location + "']")
								.parents("div[class=zoushi-nav-main]").hide();
						$("#zoushi_nav").find(
								"a[href='" + document.location + "']").parents(
								"div[class=zoushi-nav-main]").fadeIn();
						// 子走势show
						$("#zoushi_nav").find(
								"a[href='" + document.location + "']")
								.addClass("show");
						// 隐藏走势分类
					});
	function zaoshi(type) {
		$("#zoushi_classify").hide();
		if(type==1){
			$("#zoushiframe").attr("src", "http://trend.caipiao.163.com/11xuan5/");
		}else if(type==2){
			$("#zoushiframe").attr("src", "http://trend.caipiao.163.com/11xuan5/");
		}if(type==3){
			$("#zoushiframe").attr("src", "http://trend.caipiao.163.com/pl3/");
		}if(type==4){
			$("#zoushiframe").attr("src", "http://trend.caipiao.163.com/jx11xuan5/");
		}if(type==5){
			$("#zoushiframe").attr("src", "http://trend.caipiao.163.com/cqssc");
		}if(type==6){
			$("#zoushiframe").attr("src", "http://trend.caipiao.163.com/cqssc");
		}if(type==7){
			$("#zoushiframe").attr("src", "http://trend.caipiao.163.com/x3d/");
		}
		
		
		$("#zoushiframe").location.reload();
		var ifm = document.getElementById("zoushiframe");
		ifm.height = document.documentElement.clientHeight;
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
			<p>有情提示所有走势图来源于网易：</p>
				<div class="lottery_nav_shuzi">
					<span>数字彩</span> <a class="fc3d" href="javascript:zaoshi(7);">福彩3D</a>
					<a class="pl3" href="javascript:zaoshi(1);">排列3</a>
				</div>
				<div class="lottery_nav_gaopin">
					<span>高频彩</span> <a class="cqssc" href="javascript:zaoshi(6);">重庆时时彩</a>
						<a class="jx11x5" href="javascript:zaoshi(3);">江西11选5</a> <a
						class="gd11x5" href="javascript:zaoshi(4);">广东11选5</a> <a
						class="sd11x5" href="javascript:zaoshi(5);">山东11选5</a>
				</div>
			</div>

			<!-- 走势导航 -->
			<div id="zoushi_nav">
				<div id="fc3d" class="zoushi-nav-main">
					<p style="margin: 13px;">
						<a href="javascript:zaoshi(7);">直选走势</a> <span class="separator">|</span>
						<a href="javascript:zaoshi(7);">组选走势</a> <span class="separator">|</span>
						<a href="javascript:zaoshi(7);">大小走势</a> <span class="separator">|</span>
						<a href="javascript:zaoshi(7);">奇偶走势</a> <span class="separator">|</span>
						<a href="javascript:zaoshi(7);">质合走势</a> <span class="separator">|</span>
						<a href="javascript:zaoshi(7);">除3余数</a> <span class="separator">|</span>
						<a href="javascript:zaoshi(7);">和值走势</a> <span class="separator">|</span>
						<a href="javascript:zaoshi(7);fc3d/spanTrend.zoushi">跨度走势</a> <span
							class="separator">|</span> <a
							href="javascript:zaoshi(7);fc3d/typeTrend.zoushi">类型走势</a> <span
							class="separator">|</span> <a
							href="javascript:zaoshi(7);fc3d/coldHotTrend.zoushi">冷热分析</a> <span
							class="separator">|</span> <a
							href="javascript:zaoshi(7);fc3d/hundredsPlaceKillTrend.zoushi">智能杀号</a>
					</p>
				</div>
				<div id="pl3" class="zoushi-nav-main">
					<p style="margin: 13px;">
						<a href="javascript:zaoshi(1);pl3/baseTrend.zoushi">直选走势</a> <span
							class="separator">|</span> <a
							href="javascript:zaoshi(1);pl3/groupBaseTrend.zoushi">组选走势</a> <span
							class="separator">|</span> <a
							href="javascript:zaoshi(1);pl3/bigSmallFormTrend.zoushi">大小走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(1);pl3/oddEvenFormTrend.zoushi">奇偶走势</a> <span
							class="separator">|</span> <a
							href="javascript:zaoshi(1);pl3/primeCompositeFormTrend.zoushi">质合走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(1);pl3/division3RemainderFirstTrend.zoushi">除3余数</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(1);pl3/sumTrend.zoushi">和值走势</a> <span
							class="separator">|</span> <a
							href="javascript:zaoshi(1);pl3/spanTrend.zoushi">跨度走势</a> <span
							class="separator">|</span> <a
							href="javascript:zaoshi(1);pl3/typeTrend.zoushi">类型走势</a> <span
							class="separator">|</span> <a
							href="javascript:zaoshi(1);pl3/coldHotTrend.zoushi">冷热分析</a>
					</p>
				</div>
				<div id="cqssc" class="zoushi-nav-main">
					<p style="margin: 13px;">
						五星： <a href="javascript:zaoshi(2);cqssc/baseTrend.zoushi">基本走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(2);cqssc/sumTrend.zoushi">和值走势</a>
					</p>
					<p style="margin: 13px;">
						三星： <a href="javascript:zaoshi(2);cqssc/threeStarsBaseTrend.zoushi">直选走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(2);cqssc/threeStarsGroupBaseTrend.zoushi">组选走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(2);cqssc/threeStarsSumTrend.zoushi">和值走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(2);cqssc/threeStarsBigSmallTrend.zoushi">大小走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(2);cqssc/threeStarsOddEvenTrend.zoushi">奇偶走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(2);cqssc/threeStarsPrimeCompositeTrend.zoushi">质合走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(2);cqssc/threeStarsDivision3RemainderTrend.zoushi">除3余数</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(2);cqssc/threeStarsSpanTrend.zoushi">跨度走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(2);cqssc/threeStarsMaxNumberTrend.zoushi">最大数</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(2);cqssc/threeStarsMinNumberTrend.zoushi">最小数</a>
					</p>
					<p style="margin: 13px;">
						二星： <a href="javascript:zaoshi(2);cqssc/twoStarsBaseTrend.zoushi">直选走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(2);cqssc/twoStarsGroupBaseTrend.zoushi">组选走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(2);cqssc/twoStarsSumTrend.zoushi">和值走势</a>
					</p>
					<p style="margin: 13px;">
						其它： <a href="javascript:zaoshi(2);cqssc/oneStarTrend.zoushi">一星走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(2);cqssc/bigSmallOddEvenTrend.zoushi">大小单双</a>
					</p>
				</div>
				<div id="jxssc" class="zoushi-nav-main">
					<p style="margin: 13px;">
						五星： <a href="javascript:zaoshi(3);jxssc/baseTrend.zoushi">基本走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(3);jxssc/sumTrend.zoushi">和值走势</a>
					</p>
					<p style="margin: 13px;">
						四星： <a href="javascript:zaoshi(3);jxssc/fourStarsBaseTrend.zoushi">基本走势</a>
					</p>
					<p style="margin: 13px;">
						三星： <a href="javascript:zaoshi(3);jxssc/threeStarsBaseTrend.zoushi">直选走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(3);jxssc/threeStarsGroupBaseTrend.zoushi">组选走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(3);jxssc/threeStarsSumTrend.zoushi">和值走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(3);jxssc/threeStarsBigSmallTrend.zoushi">大小走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(3);jxssc/threeStarsOddEvenTrend.zoushi">奇偶走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(3);jxssc/threeStarsPrimeCompositeTrend.zoushi">质合走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(3);jxssc/threeStarsDivision3RemainderTrend.zoushi">除3余数</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(3);jxssc/threeStarsSpanTrend.zoushi">跨度走势</a>
					</p>
					<p style="margin: 13px;">
						二星： <a href="javascript:zaoshi(3);jxssc/twoStarsBaseTrend.zoushi">直选走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(3);jxssc/twoStarsGroupBaseTrend.zoushi">组选走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(3);jxssc/twoStarsSumTrend.zoushi">和值走势</a>
					</p>
					<p style="margin: 13px;">
						其它： <a href="javascript:zaoshi(3);jxssc/oneStarTrend.zoushi">一星走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(3);jxssc/bigSmallOddEvenTrend.zoushi">大小单双</a>
					</p>
				</div>
				<div id="gd11x5" class="zoushi-nav-main">
					<p style="margin: 13px;">
						任选： <a href="javascript:zaoshi(4);gd11x5/baseTrend.zoushi">基本走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(4);gd11x5/bigSmallTrend.zoushi">大小走势</a> <span
							class="separator">|</span> <a
							href="javascript:zaoshi(4);gd11x5/oddEvenTrend.zoushi">奇偶走势</a> <span
							class="separator">|</span> <a
							href="javascript:zaoshi(4);gd11x5/primeCompositeTrend.zoushi">质合走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(4);gd11x5/sumTrend.zoushi">和值走势</a> <span
							class="separator">|</span> <a
							href="javascript:zaoshi(4);gd11x5/division3RemainderTrend.zoushi">除3余数</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(4);gd11x5/positionOneTrend.zoushi">分位走势</a>
					</p>
					<p style="margin: 13px;">
						前三： <a
							href="javascript:zaoshi(4);gd11x5/firstThreeBaseTrend.zoushi">直选走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(4);gd11x5/firstThreeGroupBaseTrend.zoushi">组选走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(4);gd11x5/firstThreeBigSmallTrend.zoushi">大小走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(4);gd11x5/firstThreeOddEvenTrend.zoushi">奇偶走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(4);gd11x5/firstThreePrimeCompositeTrend.zoushi">质合走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(4);gd11x5/firstThreeDivision3RemainderTrend.zoushi">除3余数</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(4);gd11x5/firstThreeSumTrend.zoushi">和值走势</a>
					</p>
					<p style="margin: 13px;">
						前二： <a href="javascript:zaoshi(4);gd11x5/firstTwoBaseTrend.zoushi">直选走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(4);gd11x5/firstTwoGroupBaseTrend.zoushi">组选走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(4);gd11x5/firstTwoSumTrend.zoushi">和值走势</a>
					</p>
				</div>
				<div id="jx11x5" class="zoushi-nav-main">
					<p style="margin: 13px;">
						任选： <a href="javascript:zaoshi(5);jx11x5/baseTrend.zoushi">基本走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(5);jx11x5/bigSmallTrend.zoushi">大小走势</a> <span
							class="separator">|</span> <a
							href="javascript:zaoshi(5);jx11x5/oddEvenTrend.zoushi">奇偶走势</a> <span
							class="separator">|</span> <a
							href="javascript:zaoshi(5);jx11x5/primeCompositeTrend.zoushi">质合走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(5);jx11x5/sumTrend.zoushi">和值走势</a> <span
							class="separator">|</span> <a
							href="javascript:zaoshi(5);jx11x5/division3RemainderTrend.zoushi">除3余数</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(5);jx11x5/positionOneTrend.zoushi">分位走势</a>
					</p>
					<p style="margin: 13px;">
						前三： <a
							href="javascript:zaoshi(5);jx11x5/firstThreeBaseTrend.zoushi">直选走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(5);jx11x5/firstThreeGroupBaseTrend.zoushi">组选走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(5);jx11x5/firstThreeBigSmallTrend.zoushi">大小走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(5);jx11x5/firstThreeOddEvenTrend.zoushi">奇偶走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(5);jx11x5/firstThreePrimeCompositeTrend.zoushi">质合走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(5);jx11x5/firstThreeDivision3RemainderTrend.zoushi">除3余数</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(5);jx11x5/firstThreeSumTrend.zoushi">和值走势</a>
					</p>
					<p style="margin: 13px;">
						前二： <a href="javascript:zaoshi(5);jx11x5/firstTwoBaseTrend.zoushi">直选走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(5);jx11x5/firstTwoGroupBaseTrend.zoushi">组选走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(5);jx11x5/firstTwoSumTrend.zoushi">和值走势</a>
					</p>
				</div>
				<div id="sd11x5" class="zoushi-nav-main">
					<p style="margin: 13px;">
						任选： <a href="javascript:zaoshi(6);sd11x5/baseTrend.zoushi">基本走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(6);sd11x5/bigSmallTrend.zoushi">大小走势</a> <span
							class="separator">|</span> <a
							href="javascript:zaoshi(6);sd11x5/oddEvenTrend.zoushi">奇偶走势</a> <span
							class="separator">|</span> <a
							href="javascript:zaoshi(6);sd11x5/primeCompositeTrend.zoushi">质合走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(6);sd11x5/sumTrend.zoushi">和值走势</a> <span
							class="separator">|</span> <a
							href="javascript:zaoshi(6);sd11x5/division3RemainderTrend.zoushi">除3余数</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(6);sd11x5/positionOneTrend.zoushi">分位走势</a>
					</p>
					<p style="margin: 13px;">
						前三： <a
							href="javascript:zaoshi(6);sd11x5/firstThreeBaseTrend.zoushi">直选走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(6);sd11x5/firstThreeGroupBaseTrend.zoushi">组选走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(6);sd11x5/firstThreeBigSmallTrend.zoushi">大小走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(6);sd11x5/firstThreeOddEvenTrend.zoushi">奇偶走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(6);sd11x5/firstThreePrimeCompositeTrend.zoushi">质合走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(6);sd11x5/firstThreeDivision3RemainderTrend.zoushi">除3余数</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(6);sd11x5/firstThreeSumTrend.zoushi">和值走势</a>
					</p>
					<p style="margin: 13px;">
						前二： <a href="javascript:zaoshi(6);sd11x5/firstTwoBaseTrend.zoushi">直选走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(6);sd11x5/firstTwoGroupBaseTrend.zoushi">组选走势</a>
						<span class="separator">|</span> <a
							href="javascript:zaoshi(6);sd11x5/firstTwoSumTrend.zoushi">和值走势</a>
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
								<td><a href="javascript:zaoshi(7);fc3d/baseTrend.zoushi">直选走势</a></td>
								<td><a href="javascript:zaoshi(7);">组选走势</a></td>
								<td><a href="javascript:zaoshi(7);">大小走势</a></td>
								<td><a href="javascript:zaoshi(7);">奇偶走势</a></td>
								<td><a href="javascript:zaoshi(7);">质合走势</a></td>
								<td><a href="javascript:zaoshi(7);">除3余数</a></td>
							</tr>
							<tr>
								<td><a href="javascript:zaoshi(7);">和值走势</a></td>
								<td><a href="javascript:zaoshi(7);">跨度走势</a></td>
								<td><a href="javascript:zaoshi(7);">类型走势</a></td>
								<td><a href="javascript:zaoshi(7);">冷热分析</a></td>
								<td><a href="javascript:zaoshi(7);">智能杀号</a></td>
							</tr>
						</table>
					</div>
					<div class="pl3">
						<span>排列3</span>
						<table>
							<tr>
								<td><a href="javascript:zaoshi(7);pl3/baseTrend.zoushi">直选走势</a></td>
								<td><a href="javascript:zaoshi(7);pl3/groupBaseTrend.zoushi">组选走势</a></td>
								<td><a
									href="javascript:zaoshi(7);pl3/bigSmallFormTrend.zoushi">大小走势</a></td>
								<td><a
									href="javascript:zaoshi(7);pl3/oddEvenFormTrend.zoushi">奇偶走势</a></td>
								<td><a
									href="javascript:zaoshi(7);pl3/primeCompositeFormTrend.zoushi">质合走势</a></td>
							</tr>
							<tr>
								<td><a
									href="javascript:zaoshi(7);pl3/division3RemainderFirstTrend.zoushi">除3余数</a></td>
								<td><a href="javascript:zaoshi(7);pl3/sumTrend.zoushi">和值走势</a></td>
								<td><a href="javascript:zaoshi(7);pl3/spanTrend.zoushi">跨度走势</a></td>
								<td><a href="javascript:zaoshi(7);pl3/typeTrend.zoushi">类型走势</a></td>
								<td><a href="javascript:zaoshi(7);pl3/coldHotTrend.zoushi">冷热分析</a></td>
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
								<td><a href="javascript:zaoshi(5);cqssc/baseTrend.zoushi">基本走势</a></td>
								<td><a href="javascript:zaoshi(5);cqssc/sumTrend.zoushi">和值走势</a></td>
							</tr>
							<tr>
								<th>三星：</th>
								<td><a
									href="javascript:zaoshi(5);cqssc/threeStarsBaseTrend.zoushi">直选走势</a></td>
								<td><a
									href="javascript:zaoshi(5);cqssc/threeStarsGroupBaseTrend.zoushi">组选走势</a></td>
								<td><a
									href="javascript:zaoshi(5);cqssc/threeStarsSumTrend.zoushi">和值走势</a></td>
								<td><a
									href="javascript:zaoshi(5);cqssc/threeStarsBigSmallTrend.zoushi">大小走势</a></td>
								<td><a
									href="javascript:zaoshi(5);cqssc/threeStarsOddEvenTrend.zoushi">奇偶走势</a></td>
								<td><a
									href="javascript:zaoshi(5);cqssc/threeStarsPrimeCompositeTrend.zoushi">质合走势</a></td>
								<td><a
									href="javascript:zaoshi(5);cqssc/threeStarsDivision3RemainderTrend.zoushi">除3余数</a></td>
								<td><a
									href="javascript:zaoshi(5);cqssc/threeStarsSpanTrend.zoushi">跨度走势</a></td>
								<td><a
									href="javascript:zaoshi(5);cqssc/threeStarsMaxNumberTrend.zoushi">最大数</a></td>
								<td><a
									href="javascript:zaoshi(5);cqssc/threeStarsMinNumberTrend.zoushi">最小数</a></td>
							</tr>
							<tr>
								<th>二星：</th>
								<td><a
									href="javascript:zaoshi(5);cqssc/twoStarsBaseTrend.zoushi">直选走势</a></td>
								<td><a
									href="javascript:zaoshi(5);cqssc/twoStarsGroupBaseTrend.zoushi">组选走势</a></td>
								<td><a
									href="javascript:zaoshi(5);cqssc/twoStarsSumTrend.zoushi">和值走势</a></td>
							</tr>
							<tr>
								<th>其它：</th>
								<td><a href="javascript:zaoshi(5);cqssc/oneStarTrend.zoushi">一星走势</a></td>
								<td><a
									href="javascript:zaoshi(5);cqssc/bigSmallOddEvenTrend.zoushi">大小单双</a></td>
							</tr>
						</table>
					</div>
					<div class="jxssc">
						<span>江西时时彩</span>
						<table>
							<tr>
								<th>五星：</th>
								<td><a href="javascript:zaoshi(5);jxssc/baseTrend.zoushi">基本走势</a></td>
								<td><a href="javascript:zaoshi(5);jxssc/sumTrend.zoushi">和值走势</a></td>
							</tr>
							<tr>
								<th>四星：</th>
								<td><a
									href="javascript:zaoshi(5);jxssc/fourStarsBaseTrend.zoushi">基本走势</a></td>
							</tr>
							<tr>
								<th>三星：</th>
								<td><a
									href="javascript:zaoshi(5);jxssc/threeStarsBaseTrend.zoushi">直选走势</a></td>
								<td><a
									href="javascript:zaoshi(5);jxssc/threeStarsGroupBaseTrend.zoushi">组选走势</a></td>
								<td><a
									href="javascript:zaoshi(5);jxssc/threeStarsSumTrend.zoushi">和值走势</a></td>
								<td><a
									href="javascript:zaoshi(5);jxssc/threeStarsBigSmallTrend.zoushi">大小走势</a></td>
								<td><a
									href="javascript:zaoshi(5);jxssc/threeStarsOddEvenTrend.zoushi">奇偶走势</a></td>
								<td><a
									href="javascript:zaoshi(5);jxssc/threeStarsPrimeCompositeTrend.zoushi">质合走势</a></td>
								<td><a
									href="javascript:zaoshi(5);jxssc/threeStarsDivision3RemainderTrend.zoushi">除3余数</a></td>
								<td><a
									href="javascript:zaoshi(5);jxssc/threeStarsSpanTrend.zoushi">跨度走势</a></td>
							</tr>
							<tr>
								<th>二星：</th>
								<td><a
									href="javascript:zaoshi(5);jxssc/twoStarsBaseTrend.zoushi">直选走势</a></td>
								<td><a
									href="javascript:zaoshi(5);jxssc/twoStarsGroupBaseTrend.zoushi">组选走势</a></td>
								<td><a
									href="javascript:zaoshi(5);jxssc/twoStarsSumTrend.zoushi">和值走势</a></td>
							</tr>
							<tr>
								<th>其它：</th>
								<td><a href="javascript:zaoshi(5);jxssc/oneStarTrend.zoushi">一星走势</a></td>
								<td><a
									href="javascript:zaoshi(5);jxssc/bigSmallOddEvenTrend.zoushi">大小单双</a></td>
							</tr>
						</table>
					</div>
					<div class="gd11x5">
						<span>广东11选5</span>
						<table>
							<tr>
								<th>任选：</th>
								<td><a href="javascript:zaoshi(5);gd11x5/baseTrend.zoushi">基本走势</a></td>
								<td><a
									href="javascript:zaoshi(5);gd11x5/bigSmallTrend.zoushi">大小走势</a></td>
								<td><a
									href="javascript:zaoshi(5);gd11x5/oddEvenTrend.zoushi">奇偶走势</a></td>
								<td><a
									href="javascript:zaoshi(5);gd11x5/primeCompositeTrend.zoushi">质合走势</a></td>
								<td><a href="javascript:zaoshi(5);gd11x5/sumTrend.zoushi">和值走势</a></td>
								<td><a
									href="javascript:zaoshi(5);gd11x5/division3RemainderTrend.zoushi">除3余数</a></td>
								<td><a
									href="javascript:zaoshi(5);gd11x5/positionOneTrend.zoushi">分位走势</a></td>
							</tr>
							<tr>
								<th>前三：</th>
								<td><a
									href="javascript:zaoshi(5);gd11x5/firstThreeBaseTrend.zoushi">直选走势</a></td>
								<td><a
									href="javascript:zaoshi(5);gd11x5/firstThreeGroupBaseTrend.zoushi">组选走势</a></td>
								<td><a
									href="javascript:zaoshi(5);gd11x5/firstThreeBigSmallTrend.zoushi">大小走势</a></td>
								<td><a
									href="javascript:zaoshi(5);gd11x5/firstThreeOddEvenTrend.zoushi">奇偶走势</a></td>
								<td><a
									href="javascript:zaoshi(5);gd11x5/firstThreePrimeCompositeTrend.zoushi">质合走势</a></td>
								<td><a
									href="javascript:zaoshi(5);gd11x5/firstThreeDivision3RemainderTrend.zoushi">除3余数</a></td>
								<td><a
									href="javascript:zaoshi(5);gd11x5/firstThreeSumTrend.zoushi">和值走势</a></td>
							</tr>
							<tr>
								<th>前二：</th>
								<td><a
									href="javascript:zaoshi(5);gd11x5/firstTwoBaseTrend.zoushi">直选走势</a></td>
								<td><a
									href="javascript:zaoshi(5);gd11x5/firstTwoGroupBaseTrend.zoushi">组选走势</a></td>
								<td><a
									href="javascript:zaoshi(5);gd11x5/firstTwoSumTrend.zoushi">和值走势</a></td>
							</tr>
						</table>
					</div>
					<div class="jx11x5">
						<span>江西11选5</span>
						<table>
							<tr>
								<th>任选</th>
								<td><a href="javascript:zaoshi(5);jx11x5/baseTrend.zoushi">基本走势</a></td>
								<td><a
									href="javascript:zaoshi(5);jx11x5/bigSmallTrend.zoushi">大小走势</a></td>
								<td><a
									href="javascript:zaoshi(5);jx11x5/oddEvenTrend.zoushi">奇偶走势</a></td>
								<td><a
									href="javascript:zaoshi(5);jx11x5/primeCompositeTrend.zoushi">质合走势</a></td>
								<td><a href="javascript:zaoshi(5);jx11x5/sumTrend.zoushi">和值走势</a></td>
								<td><a
									href="javascript:zaoshi(5);jx11x5/division3RemainderTrend.zoushi">除3余数</a></td>
								<td><a
									href="javascript:zaoshi(5);jx11x5/positionOneTrend.zoushi">分位走势</a></td>
							</tr>
							<tr>
								<th>前三</th>
								<td><a
									href="javascript:zaoshi(5);jx11x5/firstThreeBaseTrend.zoushi">直选走势</a></td>
								<td><a
									href="javascript:zaoshi(5);jx11x5/firstThreeGroupBaseTrend.zoushi">组选走势</a></td>
								<td><a
									href="javascript:zaoshi(5);jx11x5/firstThreeBigSmallTrend.zoushi">大小走势</a></td>
								<td><a
									href="javascript:zaoshi(5);jx11x5/firstThreeOddEvenTrend.zoushi">奇偶走势</a></td>
								<td><a
									href="javascript:zaoshi(5);jx11x5/firstThreePrimeCompositeTrend.zoushi">质合走势</a></td>
								<td><a
									href="javascript:zaoshi(5);jx11x5/firstThreeDivision3RemainderTrend.zoushi">除3余数</a></td>
								<td><a
									href="javascript:zaoshi(5);jx11x5/firstThreeSumTrend.zoushi">和值走势</a></td>
							</tr>
							<tr>
								<th>前二</th>
								<td><a
									href="javascript:zaoshi(5);jx11x5/firstTwoBaseTrend.zoushi">直选走势</a></td>
								<td><a
									href="javascript:zaoshi(5);jx11x5/firstTwoGroupBaseTrend.zoushi">组选走势</a></td>
								<td><a
									href="javascript:zaoshi(5);jx11x5/firstTwoSumTrend.zoushi">和值走势</a></td>
							</tr>
						</table>
					</div>
					<div class="sd11x5">
						<span>山东11选5</span>
						<table>
							<tr>
								<th>任选</th>
								<td><a href="javascript:zaoshi(5);sd11x5/baseTrend.zoushi">基本走势</a></td>
								<td><a
									href="javascript:zaoshi(5);sd11x5/bigSmallTrend.zoushi">大小走势</a></td>
								<td><a
									href="javascript:zaoshi(5);sd11x5/oddEvenTrend.zoushi">奇偶走势</a></td>
								<td><a
									href="javascript:zaoshi(5);sd11x5/primeCompositeTrend.zoushi">质合走势</a></td>
								<td><a href="javascript:zaoshi(5);sd11x5/sumTrend.zoushi">和值走势</a></td>
								<td><a
									href="javascript:zaoshi(5);sd11x5/division3RemainderTrend.zoushi">除3余数</a></td>
								<td><a
									href="javascript:zaoshi(5);sd11x5/positionOneTrend.zoushi">分位走势</a></td>
							</tr>
							<tr>
								<th>前三</th>
								<td><a
									href="javascript:zaoshi(5);sd11x5/firstThreeBaseTrend.zoushi">直选走势</a></td>
								<td><a
									href="javascript:zaoshi(5);sd11x5/firstThreeGroupBaseTrend.zoushi">组选走势</a></td>
								<td><a
									href="javascript:zaoshi(5);sd11x5/firstThreeBigSmallTrend.zoushi">大小走势</a></td>
								<td><a
									href="javascript:zaoshi(5);sd11x5/firstThreeOddEvenTrend.zoushi">奇偶走势</a></td>
								<td><a
									href="javascript:zaoshi(5);sd11x5/firstThreePrimeCompositeTrend.zoushi">质合走势</a></td>
								<td><a
									href="javascript:zaoshi(5);sd11x5/firstThreeDivision3RemainderTrend.zoushi">除3余数</a></td>
								<td><a
									href="javascript:zaoshi(5);sd11x5/firstThreeSumTrend.zoushi">和值走势</a></td>
							</tr>
							<tr>
								<th>前二</th>
								<td><a
									href="javascript:zaoshi(5);sd11x5/firstTwoBaseTrend.zoushi">直选走势</a></td>
								<td><a
									href="javascript:zaoshi(5);sd11x5/firstTwoGroupBaseTrend.zoushi">组选走势</a></td>
								<td><a
									href="javascript:zaoshi(5);sd11x5/firstTwoSumTrend.zoushi">和值走势</a></td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<!-- 走势图表 -->
			<div>
				<iframe id="zoushiframe" src="" frameborder="0" scrolling="no"
					width="100%" height="800"></iframe>
			</div>

		</div>
	</div>







	<jsp:include page="../footer.jsp"></jsp:include>
	</body>
</html>

