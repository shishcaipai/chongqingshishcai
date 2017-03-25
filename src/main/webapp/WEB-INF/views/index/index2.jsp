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
<title>鸿运彩票彩票_鸿运彩票彩票合买平台</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html;charset=GBK">
<meta name="Keywords" content="">
<meta name="Description" content="">
<body>

<link rel="shortcut icon" href="<%=basePath%>static/images/favicon.new.ico" />
<link href="<%=basePath%>static/new/css/index.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="http://www.ld3j.com/res/index/js/jquery-ui-1.8.2.custom.min.js"></script>

<script type="text/javascript" src="http://www.ld3j.com/res/index/js/loginstatus.js"></script>
<script type="text/javascript" src="http://www.ld3j.com/res/index/js/tool2.js"></script>

<script type="text/javascript" src="http://www.ld3j.com/res/index/js/lotterymode.js"></script>
<SCRIPT type="text/javascript" src="http://www.ld3j.com/res/index/js/jquery.nivo.slider.js"></SCRIPT>
<SCRIPT type="text/javascript" src="http://www.ld3j.com/res/index/js/superfish.js"></SCRIPT>
<SCRIPT type="text/javascript" src="http://www.ld3j.com/res/index/js/jquery.autocomplete.min.js"></SCRIPT>
<script type="text/javascript" src="http://www.ld3j.com/res/index/js/lotterymode.js"></script>
<script type="text/javascript">
$(function(){
	


		$.ajax({
			type : "post",
			url  : "user/getUser",
			success : function(res) {
				res = eval(res);
				var money = res[0].money;
				var frozenMoney = res[0].frozenMoney;
				$('.mytotalMoney').html((money - frozenMoney).toFixed(2));
				$("#mymoeny").mouseover(function(){
					if ($(this).hasClass("over")) {
						$(this).removeClass("over");
						$(this).html("***");
					} else {
						$(this).addClass("over");
						$(this).html((money - frozenMoney).toFixed(2));
					}
				}); 
				
				$("#mymoeny").addClass("over").html((money - frozenMoney).toFixed(2));
				$("#username").html(res[0].username);
			}
		});
		
		if(GetUrlRelativePath()!="/index"){
			$('#lotteryListEntry,#lotteryList').mouseover(function(){
				$(this).addClass('open');$('#lotteryList').show();
			}).mouseout(function(){
				$(this).removeClass('open');$('#lotteryList').hide();
			});}
else{
	 $('#lotteryListEntry,#lotteryList').addClass('open'); $('#lotteryList').show();
	$('.topNavHolder').css('background','none')
}
	});
function GetUrlRelativePath()
{
var url = document.location.toString();
var arrUrl = url.split("//");

var start = arrUrl[1].indexOf("/");
var relUrl = arrUrl[1].substring(start);

if(relUrl.indexOf("?") != -1){
relUrl = relUrl.split("?")[0];
}
return relUrl;
}
</script>
</head>
<div class="topbar">
<div class="div_m clearfix">
<div class="person_part">
<ul id="top_user_info" >
<li>欢迎您，<span><a id="username" href="http://www.ld3j.com/myAccount?type=money"></a></span>&nbsp;当前余额：<span style="cursor:pointer;color:#f30;" id="mymoeny">***</span>&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;<a rel="nofollow" href="http://www.ld3j.com/myAccount?type=money">我的账户</a> | <a href="http://www.ld3j.com/myAccount?type=pay" id="btn_chongz">充值</a> | <a href="http://www.ld3j.com/myAccount?type=drawings">提款</a> | [<a id="logoutLink" href="http://www.ld3j.com/login">退出</a>]
</ul>
</div>
</div>
</div>
<div class="header clearfix">
<div class="menu">
<div class="logo"><a href="http://www.ld3j.com/index" title="好运彩票"><img src="http://www.ld3j.com/res/img/sc_50.jpg" alt="好运彩票" ></a></div>
<div style="margin-left:217px;margin-top:-85px;height: 85px;width: 780px;">
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="780" height="80" title="1">
  <param name="movie" value="http://www.ld3j.com/res/index/flash/logo.swf">
  <param name="quality" value="high">
  <embed src="http://www.ld3j.com/res/index/flash/logo.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="780" height="80"></embed>
</object>


</div>
<div id="topTabBox">
<div id="topTab">
<ul id="funcTab">
<li id="lotteryListEntry" class="open">
<a class="topNavHolder" hidefocus="true" rel="nofollow">选择彩种<i></i></a>
<div id="lotteryList" style="left:0px; display:none">
<div class="lotteryListWrap" >
<ul>
<li class="zyGame"><a href="http://www.ld3j.com/lotteryType?id=1"><em class="cz_logo35 logo35_ssc"></em><strong>重庆时时彩</strong><span class="grayWords">每天120期哦</span></a></li>
<li class="zyGame"><a href="http://www.ld3j.com/lotteryType?id=3"><em class="cz_logo35 logo35_d11"></em><strong>山东十一运</strong><span class="grayWords">返奖率高达59%</span></a></li>
<li class="zyGame"><a href="http://www.ld3j.com/lotteryType?id=4"><em class="cz_logo35 logo35_jxd11"></em><strong>江西11选5</strong><span class="grayWords">每天78期</span></a></li>
<li class="zyGame"><a href="http://www.ld3j.com/lotteryType?id=8"><em class="cz_logo35 logo35_jxd11"></em><strong>广东11选5</strong><span class="grayWords">每天84期</span></a></li>
<li class="zyGame"><a href="http://www.ld3j.com/lotteryType?id=5"><em class="cz_logo35 logo35_x3d"></em><strong>福彩3D</strong><span class="grayWords">每天84期</span></a></li>

</ul>

</div>
</div>
</li>
<li pid="home" ><a href="http://www.ld3j.com/index">网站首页</a>|</li>
<li pid="hall"><a href="http://www.ld3j.com/gcdt" title="彩票购彩大厅">购彩大厅</a>|</li>
<li pid="groupbuy"><a href="http://www.ld3j.com/together?type=0" title="彩票合买大厅">合买大厅</a>|</li>
<li pid="award"><a href="http://www.ld3j.com/howplay" title="中国彩票开奖">玩法介绍</a>|</li>
<li pid="trend"><a href="http://www.ld3j.com/zoushi" title="福彩体彩走势图">走势图表</a>|</li>
<li pid="cpInfo"><a href="http://www.ld3j.com/articles" title="彩票资讯">彩票资讯</a>|</li>
<li pid="coupon"><a href="http://www.ld3j.com/notices" title="网站公告">网站公告</a>|</li>
<li pid="mobile"><a href="http://www.ld3j.com/myAccount?type=money" title="手机购买彩票"><span class="icon_mob"></span>我的帐户</a></li>
</ul>
</div>
</div>

	<div class="docBody clearfix">
    <div class="siderBox">
	<!--滚动logo结束--> <!--开奖号码开始-->
	<div id="awardLists">
		<dl id="awardListTab" class="grayTitle clearfix">
			<dt>
				<span>开奖公告</span>
			</dt>
			
		</dl>
		<ul id="awardList01" class="awardList_con" style="display:block;">
  <li>
    <p><strong><a href="http://www.ld3j.com/lotteryType?id=1" target="_blank">重庆时时彩</a></strong> <span id="cqssc"></span></p>
    <p id="cqsscnum"></p>
    <p class="tr m-r" ><span id="cqssctime"></span><a href="http://www.ld3j.com/zoushi" >走势</a> | <a href="http://www.ld3j.com/lotteryType?id=1" >投注</a></p>
  </li>
 
  <li>
    <p><strong><a href="http://www.ld3j.com/lotteryType?id=8" target="_blank">广东11选5</a></strong> <span id="gd11c5"></span></p>
    <p id="gd11c5num"></p>
    <p class="tr m-r" ><span id="gd11c5time"></span><a href="http://www.ld3j.com/zoushi" >走势</a> | <a href="http://www.ld3j.com/lotteryType?id=8" >投注</a></p>
  </li>
  <li>
    <p><strong><a href="http://www.ld3j.com/lotteryType?id=4" target="_blank">江西11选5</a></strong> <span id="jx11c5"></span></p>
    <p id="jx11c5num"></p>
    <p class="tr m-r" ><span id="jx11c5time"></span><a href="http://www.ld3j.com/zoushi" >走势</a> | <a href="http://www.ld3j.com/lotteryType?id=4" >投注</a></p>
  </li>
  
        </ul>
	
		
    </div><!--开奖号码结束-->
 <!--排行榜开始-->
	<div id="rankingList">
		<h2 style=" border-top: none;" class="grayTitle">
			总排行榜
		</h2>
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
                
                <tr>
                <td><span class='xh_top'>1</span></td>
                <td><span class="nickNames">大家***</span></td>
                <td class="t_r">1408749.00&nbsp;元</td>
				 </tr>
				
                <tr>
                <td><span class='xh_top'>2</span></td>
                <td><span class="nickNames">兵哥***</span></td>
                <td class="t_r">1364304.00&nbsp;元</td>
				 </tr>
				
                <tr>
                <td><span class='xh_top'>3</span></td>
                <td><span class="nickNames">票票***</span></td>
                <td class="t_r">1171308.00&nbsp;元</td>
				 </tr>
				
                <tr>
                <td><span class='xh_top'>4</span></td>
                <td><span class="nickNames">财气***</span></td>
                <td class="t_r">1044153.00&nbsp;元</td>
				 </tr>
				
                <tr>
                <td><span class='xh_top'>5</span></td>
                <td><span class="nickNames">人生***</span></td>
                <td class="t_r">1002042.00&nbsp;元</td>
				 </tr>
				
                <tr>
                <td><span class='xh_top'>6</span></td>
                <td><span class="nickNames">煇煌***</span></td>
                <td class="t_r">939552.00&nbsp;元</td>
				 </tr>
				
                <tr>
                <td><span class='xh_top'>7</span></td>
                <td><span class="nickNames">小小***</span></td>
                <td class="t_r">910428.00&nbsp;元</td>
				 </tr>
				
                <tr>
                <td><span class='xh_top'>8</span></td>
                <td><span class="nickNames">财运***</span></td>
                <td class="t_r">882942.00&nbsp;元</td>
				 </tr>
				
                <tr>
                <td><span class='xh_top'>9</span></td>
                <td><span class="nickNames">艳艳***</span></td>
                <td class="t_r">867024.00&nbsp;元</td>
				 </tr>
				
                <tr>
                <td><span class='xh_top'>10</span></td>
                <td><span class="nickNames">有财***</span></td>
                <td class="t_r">860946.00&nbsp;元</td>
				 </tr>
				
                </tr>

                </tbody>
			</table>
		</div>
	</div>
	<!--排行榜结束--> <!--彩票走势图-->
	<div id="analysisTool">
		<h2 class="grayTitle">
			<a  href="http://www.ld3j.com/zoushi">彩票走势图</a>
		</h2>
		<dl class="chartList clearfix">
			<dt>
				<a  href="http://www.ld3j.com/zoushi">彩票走势图</a>
			</dt>
			<dd class="separator clearfix">
				<span>数字彩：</span><br>  <span><a
						href="http://www.ld3j.com/zoushi">福彩3D</a></span>
			<dd>
				<span>高频彩：</span><br> <span><a
						href="http://www.ld3j.com/zoushi" >重庆时时彩</a></span> <span><a
						href="http://www.ld3j.com/zoushi" >广东11选5</a></span> <span><a
						href="http://www.ld3j.com/zoushi" >江西11选5</a></span> 
			</dd>
		</dl>
	</div>
	<!--走势图结束--> </div> 
    <div class="maincontent"> <!--首页logo--> 
        <div id="SlideBox">
        <div class="theme-default">
        <div id="slider3" class="nivoSlider">
        <a href="javascript:void(0)"><img src="http://www.ld3j.com/res/index/picture/20130301150629_7687.jpg" width="100%" height="250"></a>
        <a href="javascript:void(0)"><img src="http://www.ld3j.com/res/index/picture/20130306133049_6844.jpg" width="100%" height="250"></a>
        <a href="javascript:void(0)"><img src="http://www.ld3j.com/res/index/picture/20130308120827_5124.jpg" width="100%" height="250"></a>
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
						<li class="active"><a href="http://www.ld3j.com/lotteryType?id=1">重庆时时彩</a></li>
						<li><a href="http://www.ld3j.com/lotteryType?id=4">江西11选5</a></li>
						<li><a href="http://www.ld3j.com/lotteryType?id=8">广东11选5</a></li>
					</ul>
				</div>
				<dl class="gpcBet_con">
					<dd>
						<div class="clearfix">
							<h3 class="czLogo icon_ssq">
								<a title="重庆时时彩" href="http://www.ld3j.com/lotteryType?id=1"></a>
							</h3>
							<div class="gpc_main">
								<p class="gpc_title">
									<a href="http://www.ld3j.com/lotteryType?id=1"><strong>重庆时时彩</strong>&nbsp;&nbsp;每天<strong
										class="gpc_period">120</strong>期<span class="retimeBlock">白天10分钟，晚上5分钟</span></a>
								</p>
								<p class="gpc_con">
									<a href="/Trade/Ssq/">每周<span class="c_ba2636">二</span>、<span
										class="c_ba2636">四</span>、<span class="c_ba2636">日</span>晚上21:30开奖
									</a>
								</p>
							</div>
							<div class="gpc_betBtn">
								<a title="立即投注" class="btnSubmint" href="http://www.ld3j.com/lotteryType?id=1"></a>
							</div>
						</div>
					</dd>
					<dd class="hide">
						<div class="clearfix">
							<h3 class="czLogo icon_dlt">
								<a title="江西11选5" href="http://www.ld3j.com/lotteryType?id=4"></a>
							</h3>
							<div class="gpc_main">
								<p class="gpc_title">
									<a href="http://www.ld3j.com/lotteryType?id=4"><strong>江西11选5</strong></a>
								</p>
								<p class="gpc_con">
									<a href="http://www.ld3j.com/lotteryType?id=4">每天<span class="c_ba2636">78</span><span
										class="c_ba2636">期</span>，<span class="c_ba2636">每十分钟一期</span>
									</a>
								</p>
							</div>
							<div class="gpc_betBtn">
								<a title="立即投注" class="btnSubmint" href="http://www.ld3j.com/lotteryType?id=4"></a>
							</div>
						</div>
					</dd>
					<dd class="hide">
						<div class="clearfix">
							<h3 class="czLogo icon_dlt">
								<a title="广东11选5" href="http://www.ld3j.com/lotteryType?id=8"></a>
							</h3>
							<div class="gpc_main">
								<p class="gpc_title">
									<a href="http://www.ld3j.com/lotteryType?id=8"><strong>广东11选5</strong></a>
								</p>
								<p class="gpc_con">
									<a href="http://www.ld3j.com/lotteryType?id=8">每天<span class="c_ba2636">84</span><span
										class="c_ba2636">期</span>，<span class="c_ba2636">每十分钟一期</span>
									</a>
								</p>
							</div>
							<div class="gpc_betBtn">
								<a title="立即投注" class="btnSubmint" href="http://www.ld3j.com/lotteryType?id=8"></a>
							</div>
						</div>
					</dd>
				</dl>
				<div class="bet_title">
					<h3>高频彩：</h3>
					<ul class="quickbuy_menu">
						<li class="active"><a href="http://www.ld3j.com/lotteryType?id=1">重庆时时彩</a></li>
						<li><a href="http://www.ld3j.com/lotteryType?id=4">江西11选5</a></li>
						<li><a href="http://www.ld3j.com/lotteryType?id=8">广东11选5</a></li>
					</ul>
				</div>
					<dl class="gpcBet_con">
					<dd>
						<div class="clearfix">
							<h3 class="czLogo icon_ssq">
								<a title="重庆时时彩" href="http://www.ld3j.com/lotteryType?id=1"></a>
							</h3>
							<div class="gpc_main">
								<p class="gpc_title">
									<a href="http://www.ld3j.com/lotteryType?id=1"><strong>重庆时时彩</strong>&nbsp;&nbsp;每天<strong
										class="gpc_period">120</strong>期<span class="retimeBlock">白天10分钟，晚上5分钟</span></a>
								</p>
								<p class="gpc_con">
									<a href="/Trade/Ssq/">每周<span class="c_ba2636">二</span>、<span
										class="c_ba2636">四</span>、<span class="c_ba2636">日</span>晚上21:30开奖
									</a>
								</p>
							</div>
							<div class="gpc_betBtn">
								<a title="立即投注" class="btnSubmint" href="http://www.ld3j.com/lotteryType?id=1"></a>
							</div>
						</div>
					</dd>
					<dd class="hide">
						<div class="clearfix">
							<h3 class="czLogo icon_dlt">
								<a title="江西11选5" href="http://www.ld3j.com/lotteryType?id=4"></a>
							</h3>
							<div class="gpc_main">
								<p class="gpc_title">
									<a href="http://www.ld3j.com/lotteryType?id=4"><strong>江西11选5</strong></a>
								</p>
								<p class="gpc_con">
									<a href="http://www.ld3j.com/lotteryType?id=4">每天<span class="c_ba2636">78</span><span
										class="c_ba2636">期</span>，<span class="c_ba2636">每十分钟一期</span>
									</a>
								</p>
							</div>
							<div class="gpc_betBtn">
								<a title="立即投注" class="btnSubmint" href="http://www.ld3j.com/lotteryType?id=4"></a>
							</div>
						</div>
					</dd>
					<dd class="hide">
						<div class="clearfix">
							<h3 class="czLogo icon_dlt">
								<a title="广东11选5" href="http://www.ld3j.com/lotteryType?id=8"></a>
							</h3>
							<div class="gpc_main">
								<p class="gpc_title">
									<a href="http://www.ld3j.com/lotteryType?id=8"><strong>广东11选5</strong></a>
								</p>
								<p class="gpc_con">
									<a href="http://www.ld3j.com/lotteryType?id=8">每天<span class="c_ba2636">84</span><span
										class="c_ba2636">期</span>，<span class="c_ba2636">每十分钟一期</span>
									</a>
								</p>
							</div>
							<div class="gpc_betBtn">
								<a title="立即投注" class="btnSubmint" href="http://www.ld3j.com/lotteryType?id=8"></a>
							</div>
						</div>
					</dd>
				</dl>
				<div class="bet_title">
					<h3>数字彩：</h3>
					<ul class="quickbuy_menu">
						
						<li class="active"><a href="http://www.ld3j.com/lotteryType?id=5">福彩3D</a></li>
					</ul>
				</div>
				<dl class="gpcBet_con">
					
					<dd class="quickBetD11">
						<div class="clearfix">
							<h3 class="czLogo icon_x3d">
								<a title="福彩3D" href="http://www.ld3j.com/lotteryType?id=5"></a>
							</h3>
							<div class="gpc_main">
								<p class="gpc_title">
									<a href="http://www.ld3j.com/lotteryType?id=5"><strong>福彩3D</strong>&nbsp;&nbsp;<span
										class="c_ba2636">2元</span>赢取<span class="c_ba2636">1000元</span></a>
								</p>
								<p class="gpc_con">
									<a href="http://www.ld3j.com/lotteryType?id=5">每天晚上20点30分开奖，天天开奖</a>
								</p>
							</div>
							<div class="gpc_betBtn">
								<a title="立即投注" class="btnSubmint"
									href="http://www.ld3j.com/lotteryType?id=5"></a>
							</div>
						</div>
					</dd>
				
				</dl>
				<script>
					$('.quickbuy_menu li').mouseover(function() {
						$(this).parent().children().removeClass("active");
						$(this).addClass("active");
						var ind = $(this).index();
						var s = $(this).parent().parent().next();
						s.find('dd').hide();
						s.find('dd:eq(' + ind + ')').show();
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
						
			<li >
				
					<em>[公告]</em>
				
				<a href="http://www.ld3j.com/notice?id=117" target="_blank" title="07月02日 提银行卡通知">提银行卡通知</a>
			</li>
		
			<li >
				
					<em>[公告]</em>
				
				<a href="http://www.ld3j.com/notice?id=113" target="_blank" title="11月03日 微信充值公告">微信充值公告</a>
			</li>
		
			<li >
				
					<em>[公告]</em>
				
				<a href="http://www.ld3j.com/notice?id=111" target="_blank" title="08月01日 充值即送彩金,最高赠送15%！你敢来我敢送！">充值即送彩金,最高赠送15%！你敢来我敢送！</a>
			</li>
		
			<li >
				
					<em>[公告]</em>
				
				<a href="http://www.ld3j.com/notice?id=116" target="_blank" title="06月18日 关于提款到帐时间">关于提款到帐时间</a>
			</li>
		
			<li >
				
					<em>[公告]</em>
				
				<a href="http://www.ld3j.com/notice?id=118" target="_blank" title=" 提款细则">提款细则</a>
			</li>
		
					</ul>
				</div>
				
				
				<p class="helplinks">
					
				</p>
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
	<div style="clear:both" id="advertCenter">
		<img src="http://www.ld3j.com/res/index/picture/adindexcenter.jpg">
	</div>
	<!-- 中部广告结束-->
	<div id="groupBuy">
		<div class="group_title">
			<ul id="hmcase" class="group_menu">
				<li class="active" lotid="">合买推荐</li>
				<li lotid="重庆时时彩">重庆时时彩</li>
				<li lotid="十一运夺金">江西11选5</li>
				<li lotid="广东11选5">广东11选5</li>
			</ul>
			<div class="MoreLinks">
				<div class="linkBox">
					<a rel="nofollow" target="_blank" href="http://www.ld3j.com/together?type=0">合买大厅&gt;&gt;</a>
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
                                </tbody>
			</table>
		</div>
<div id="infoBox">
<div class="zx_module clearfix">
<div class="info_title"><a target="_blank" href="/News/" title="彩票资讯">彩票资讯</a></div>
	<div class="zx_block">
	<ul class="news_list">

	  		
				<li style="width:500px; height:22px; overflow:hidden; line-height:22px; margin:6px;">
					
						<em>[技巧]</em>
					
					<a href="http://www.ld3j.com/notice?id=102" target="_blank" title="老时时彩投注技巧" style="color:#333;">老时时彩投注技巧</a>
				</li>
			
		
	  		
				<li style="width:500px; height:22px; overflow:hidden; line-height:22px; margin:6px;">
					
						<em>[资讯]</em>
					
					<a href="http://www.ld3j.com/notice?id=103" target="_blank" title="男子因系统出票晚7秒失近1亿 告7年倒赔50万" style="color:#333;">男子因系统出票晚7秒失近1亿 告7年倒赔50万</a>
				</li>
			
		
	  		
				<li style="width:500px; height:22px; overflow:hidden; line-height:22px; margin:6px;">
					
						<em>[资讯]</em>
					
					<a href="http://www.ld3j.com/notice?id=104" target="_blank" title="2元机选换来1011万大奖 89后美女求信息保密" style="color:#333;">2元机选换来1011万大奖 89后美女求信息保密</a>
				</li>
			
		
	  		
				<li style="width:500px; height:22px; overflow:hidden; line-height:22px; margin:6px;">
					
						<em>[技巧]</em>
					
					<a href="http://www.ld3j.com/notice?id=105" target="_blank" title="时时彩投注技巧分享推荐：大小号法助力大奖" style="color:#333;">时时彩投注技巧分享推荐：大小号法助力大奖</a>
				</li>
			
		
	  		
				<li style="width:500px; height:22px; overflow:hidden; line-height:22px; margin:6px;">
					
						<em>[技巧]</em>
					
					<a href="http://www.ld3j.com/notice?id=106" target="_blank" title="时时彩投注技巧推荐：如何根据定位胆选号" style="color:#333;">时时彩投注技巧推荐：如何根据定位胆选号</a>
				</li>
			
		
</ul>
	</div>
    <div class="zx_block">
        <div id="sfCon">
<ul class="news_list">

	  		
				<li style="width:500px; height:22px; overflow:hidden; line-height:22px; margin:6px;">
					
						<em>[技巧]</em>
					
					<a href="http://www.ld3j.com/notice?id=102" target="_blank" title="老时时彩投注技巧" style="color:#333;">老时时彩投注技巧</a>
				</li>
			
		
	  		
				<li style="width:500px; height:22px; overflow:hidden; line-height:22px; margin:6px;">
					
						<em>[资讯]</em>
					
					<a href="http://www.ld3j.com/notice?id=103" target="_blank" title="男子因系统出票晚7秒失近1亿 告7年倒赔50万" style="color:#333;">男子因系统出票晚7秒失近1亿 告7年倒赔50万</a>
				</li>
			
		
	  		
				<li style="width:500px; height:22px; overflow:hidden; line-height:22px; margin:6px;">
					
						<em>[资讯]</em>
					
					<a href="http://www.ld3j.com/notice?id=104" target="_blank" title="2元机选换来1011万大奖 89后美女求信息保密" style="color:#333;">2元机选换来1011万大奖 89后美女求信息保密</a>
				</li>
			
		
	  		
				<li style="width:500px; height:22px; overflow:hidden; line-height:22px; margin:6px;">
					
						<em>[技巧]</em>
					
					<a href="http://www.ld3j.com/notice?id=105" target="_blank" title="时时彩投注技巧分享推荐：大小号法助力大奖" style="color:#333;">时时彩投注技巧分享推荐：大小号法助力大奖</a>
				</li>
			
		
	  		
				<li style="width:500px; height:22px; overflow:hidden; line-height:22px; margin:6px;">
					
						<em>[技巧]</em>
					
					<a href="http://www.ld3j.com/notice?id=106" target="_blank" title="时时彩投注技巧推荐：如何根据定位胆选号" style="color:#333;">时时彩投注技巧推荐：如何根据定位胆选号</a>
				</li>
			
		
</ul>
        </div>
    </div>
  
    
</div>
	</div>
		</div>
	</div>
	<!--合买结束--> </div>
    </div>
    </div>
<script type="text/javascript" src="http://www.ld3j.com/res/index/js/index.js"></script>
<script type="text/javascript">
$(function(){
	zjxb();
	getcqssc();
	getgd11c5();
	getjx11c5(); 
	setInterval(getcqssc, 30000)
	setInterval(getgd11c5, 30000)
	setInterval(getjx11c5, 30000)

	/* setInterval(getcqssc, 30000);*/
}); 
function getcqssc(){
	getlottery(1,'cqssctime','cqssc','cqsscnum');
}
function getgd11c5(){
	getlottery(8,'gd11c5time','gd11c5','gd11c5num');
}
function getjx11c5(){
	getlottery(4,'jx11c5time','jx11c5','jx11c5num');
}
function getlottery(lotteryTypeId,timetype,type,num){
	$.ajax({
		url : "http://www.ld3j.com/lotteryType/getHistoryDrawPhases",
		dataType : "text",
		data : {
			"lotteryTypeId" : lotteryTypeId,
			t : Math.random()
		},
		success : function(data2) {
			data2 = eval("(" + data2 + ")");
			var phase = data2[0].phase;
			var firstPhase = phase;
			var lastPhase =$('#'+type).text();
			if (firstPhase == lastPhase) {
				// don't need to update
			} else {
				$('#'+type).html(phase);
				var numbers = data2[0].drawNumber;
				drawNumber(numbers,num)
				var time = data2[0].drawStr1;
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
function zjxb() {
	$.ajax({
		url : "http://www.ld3j.com/zjxb",
		dataType : "json",
		data : {
			t : Math.random()
		},
		success : function(data2) {
			if (data2) {
			
			
				$("#slider>li").remove();
				for (var i = 0;i<data2.length;i++) {
					var vo = data2[i];
					$("#slider").append("<li><span>恭喜</span><span style='overflow: hidden;'>"+vo.username+"</span><span style='color:red'>喜中 <b >"+vo.prize+"</b> 元</span></li>");
				}
			
			}
		}
	});
}

</script>









<div class="footer_bj">
<div class="footer">
<ul class="fo1">
<h1><img alt="快购彩票网" src="http://www.ld3j.com/res/index/picture/fo1.png" /></h1>
<li>交易安全</li>
<li>购买便捷</li>
<li>派奖快速</li>
</ul>
<ul class="fo2">
<h1><img alt="快购彩票网" src="http://www.ld3j.com/res/index/picture/fo2.png" /></h1>
<li>・<a href="http://www.ld3j.com/article?id=cz1">充值方式</a></li>
<li>・<a href="http://www.ld3j.com/article?id=cz2">充值流程</a></li>
<li>・<a href="http://www.ld3j.com/article?id=cz3">修改真实姓名</a></li>
<li>・<a href="http://www.ld3j.com/article?id=cz4">修改银行卡</a></li>
</ul>
<ul class="fo3">
<h1><img alt="快购彩票网" src="http://www.ld3j.com/res/index/picture/fo3.png" /></h1>
<li>・<a href="http://www.ld3j.com/article?id=tk1">如何提款</a></li>
<li>・<a href="http://www.ld3j.com/article?id=tk2">到账时间</a></li>
<li>・<a href="http://www.ld3j.com/article?id=tk3">银行提款费率</a></li>
<li>・<a href="http://www.ld3j.com/article?id=tk4">提款注意</a></li>
</ul>
<ul class="fo4" style="border-right:none">
<h1><img alt="快购彩票网" src="http://www.ld3j.com/res/index/picture/fo4.png" /></h1>
<li>・<a href="http://www.ld3j.com/article?id=bz1">如何注册网站会员</a></li>
<li>・<a href="http://www.ld3j.com/article?id=bz2">注册时需注意什么</a></li>
<li>・<a href="http://www.ld3j.com/article?id=bz3">如何注销会员帐户</a></li>
<li>・<a href="http://www.ld3j.com/article?id=bz4">密码忘记了怎么办</a></li>
</ul>

</div>
</div>

<div class="copy_new">
<p><img src="http://www.ld3j.com/res/index/picture/wljc.gif"><img src="http://www.ld3j.com/res/index/picture/wangan.gif"><img src="http://www.ld3j.com/res/index/picture/wsjy.gif"><img src="http://www.ld3j.com/res/index/picture/xylh.gif"><img src="http://www.ld3j.com/res/index/picture/kxwz.gif"></p>
<p>ICP备案号：粤ICP备13088888号| 版权所有：好运彩票 | 开发公司：好运网络科技公司<BR><span class="red">！好运彩票郑重提示：彩票有风险，投注需谨慎</span> 不向未满18周岁的青少年出售彩票</p>
<script>
(function() {
  var _53code = document.createElement("script");
  _53code.src = "//tb.53kf.com/code/code/10144644/1";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(_53code, s);
})();
</script>	
</div>

</body>
</html>