<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>重庆时时彩购买-|网上购彩|-|高频彩购买|-|投注|-|合买|--深受彩民信赖的购彩网站！</title>
<meta name="description" content="时时乐" />
<meta name="keywords" content="时时乐" />

	<link href="http://www.ib18.cn/res/css/commonEX.css" type="text/css" rel="stylesheet">
	
<script type="text/javascript"
	src="<%=basePath%>static/js/jquery-1.7.2.min.js"></script>
	<link href="http://www.ib18.cn/res/css/frequency.css" type="text/css" rel="stylesheet">
<script src="<%=basePath%>static/js/Jquery_marquee_frequency.js"
	type="text/javascript"></script>
	
<script src="<%=basePath%>static/js/zhs.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>static/js/Method.js" type="text/javascript"  charset="utf-8"></script>
<script src="<%=basePath%>static/js/Betting.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>static/js/loading.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>static/js/public.vbs"></script>
<link type="text/css" rel="stylesheet"
	href="chrome-extension://cpngackimfmofbokmjmljamhdncknpmg/style.css" />
<script type="text/javascript" charset="utf-8"
	src="chrome-extension://cpngackimfmofbokmjmljamhdncknpmg/page_context.js"></script>
<link href="<%=basePath%>static/css/jqueryui.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>static/css/style.css" type="text/css"
	rel="stylesheet" />
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="test_con" style="display: none">
		<div id="tab" class="tlh_denglu">
			<div id="Div1" class="tlh_denglu">
				<div id="tabtop" class="tlh_denglu_bt">
					<input type="button" id="Button1" value="&#160;&#160;"
						onclick="closeLayer()">

				</div>
				<div class="tlh_denglu_nr">
					<p>
						您好，第&nbsp;<span id="dqqh"></span>&nbsp;期已截止，请在下一期开售再进行投注。投注时请确认您选择的期号
					</p>


				</div>
			</div>
		</div>
	</div>

	<div class="sitebar">

		<!--最新中奖和彩种 开始-->

		<script src="<%=basePath%>static/js/jquery-1.7.2.min.js"
			type="text/javascript"></script>
		<script type="text/javascript">
var SysSecond; 
var InterValObj; 
var isError = false;
$(document).ready(function() { 
	 SysSecond = ${leftsecond}; 
	 if(SysSecond > 0 && !isError) {
		 var lotteryActive = "true";
		 if (lotteryActive == 'true') {
	   		InterValObj = window.setInterval(SetRemainTime, 1000); //间隔函数，1秒执行
		 } else {
			 $("#RemainSecond").html('暂停销售');
		 }
	 }
	 initPage();
});

  
	function initPage() {
		var lotteryTypeId = "1";
		$.ajax({
			url : "<%=basePath%>cqssc/shishicai",
			dataType : "json",
			async : false,
			data : {
				"lotteryTypeId" : lotteryTypeId,
				t : Math.random()
			},
			success : function(data) {
				//alert("服务器正常" + data);
				try {
					data = eval(data);
				} catch (error) {
					isError = true;
					alert("会话超时，请重新登陆");
					window.location = '';
				}
				isError = false;
				// 定时器
				initTimer(data);
				// 当前期号
				initCurrentPhase(data);
				// 可选期号
				initZhPhases(data);
			    SetTozhuExpect();
			},
			error : function(data) {
			alert("服务器异常" + data);
				isError = true;
				window.location = '';
			}
		});	
	}
	
	function initZhPhases(data) {
		var currentPhase = data.current.expect;
		$('#tbshowtozhuexpect tr').remove();
	  for(var obj in data.left){
		  if(obj==0){
			   $('#tbshowtozhuexpect').append("<tr>"
						  +"<td width='140' style=' text-indent:1em'>"
						  +"<input type='checkbox' name='checkbeishu' onchange='beishuselect(this)' checked='checked' >"
						  +"<font color='red'><span currentPhase='currentPhase' id='currentPhase2'>"+data.left[obj]+"【当前期】</span></font></td>"
						  +"<td align='left' width='160'>倍数："
						  +"		<input type='text' name='beishu_show' value='1' size='4' maxlength='4' > "
						  +"	<font color='red'>0</font>元"
						  +" 			<input type='hidden' name='expect_hidden' currentPhase='currentPhase' value="+data.left[obj]+"></td></tr>");        
						  
		  }else{
			   $('#tbshowtozhuexpect').append("<tr>"
		  +"<td width='140' style=' text-indent:1em'>"
		  +"<input type='checkbox' name='checkbeishu' onchange='beishuselect(this)'>"
		  +"<font color='red'><span currentPhase='currentPhase' id='currentPhase2'>"+data.left[obj]+"</span></font></td>"
		  +"<td align='left' width='160'>倍数："
		  +"		<input type='text' name='beishu_show' value='0' size='4' maxlength='4' disabled=''> "
		  +"	<font color='red'>0</font>元"
		  +" 			<input type='hidden' name='expect_hidden' currentPhase='currentPhase' value="+data.left[obj]+"></td></tr>");        
		  } 
		  $("#batchexpectsel").val(1);
			//SetIsStop();
	  }
	}
	
	function initTimer(data) {
		SysSecond = data.current.opentime;
	}
	
	function initCurrentPhase(data) {
		var currentPhase = data.current.expect;
		$('#headCurrentPhase').text(currentPhase);
		$('input[currentPhase=currentPhase]').val(currentPhase);
		$('span[currentPhase=currentPhase]').html(currentPhase);
		$('#currentPhase2').html(currentPhase);
	}
	
//将时间减去1秒，计算天、时、分、秒 
function SetRemainTime() { 
  var url = window.location.href;
  var type = url.substring(url.indexOf("=") + 1, url.length);
 if (SysSecond > 1) { 
  SysSecond = SysSecond - 1; 
  var second = Math.floor(SysSecond % 60);             // 计算秒     
  var minite = Math.floor((SysSecond / 60) % 60);      //计算分 
  var hour = Math.floor((SysSecond / 3600) % 24);      //计算小时 
  var day = Math.floor((SysSecond / 3600) / 24);        //计算天 
  if (day == 0)
  {
	   $("#RemainSecond").html(hour + "小时" + minite + "分" + second + "秒"); 
  } else {
	   $("#RemainSecond").html(day + "天" + hour + "小时" + minite + "分" + second + "秒"); 
  }
 } else {//剩余时间小于或等于0的时候，就停止间隔函数
	 // clearInterval(InterValObj);
  //这里可以添加倒计时时间为0后需要执行的事件 
  // window.location.reload();
   if (!isError) {
	   if(document.hasFocus()){
	  		alert($('#headCurrentPhase').text() + "购买已结束，请购买下一期");
	   }
   }
  	initPage();
 } 
} 
</script>

		<ul class="yh_tz01">
			<li class="yh_tz02"><img
				src="<%=basePath%>static/images/ssc.png" width="57" height="57"></li>
			<li class="yh_tz03">
				<div>
					<h2>重庆时时彩</h2>
				</div>
				<div>
					每天120期,10：00到22：00每10分钟一期,22：00后每5分钟一期<br /> <span id="kjsj"></span>
				</div>
			</li>
			<li class="yh_tz04">
				<div id="dateEnd" style="display: none">2016-12-13 16:09:10</div>
				<div class="yh_tz05">
					<span id="activeexpectshow">第<font color="#FF3300"><b><span
								id="buyExpectShow"><span id="headCurrentPhase">${current}</span></span></b></font>期
					</span><br />
				</div>
				<div class="xxxx_01">
					<span class="t_tz05">离投注截止还有</span> <span id="RemainSecond"></span>
				</div>
			</li>

		</ul>
		<!--最新中奖和彩种 结束-->

		<!--投注主体 开始-->
		<div class="t_tz09">
			<table class="t_tz10" border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr>
						<td class="adtd02"><a href="javascript:;" class="menu1"
							value="12">前三直选</a> <a href="javascript:;" class="menu1 menu2"
							value="2">后三直选</a> <a href="javascript:;" class="menu1"
							value="13">前三组选</a> <a href="javascript:;" class="menu1"
							value="8">后三组选</a> <a href="javascript:;" class="menu1"
							value="14">前二</a> <a href="javascript:;" class="menu1" value="3">后二</a>
							<a href="javascript:;" class="menu1" value="10">不定位</a> <a
							href="javascript:;" class="menu1" value="11">定位胆</a></td>
					</tr>
				</tbody>
			</table>
		</div>


		<div class="Betting">
			<table class="t_tz15" cellpadding="0" cellspacing="0" border="0">
				<tbody>
					<tr>
						<td class="adtd04" style="border-bottom: none;"><span
							id="selex3xz3" style="display: none;"><input type="radio"
								name="radiobutton" value="11">组三</span> <span id="selex3xz6"
							style="display: none;"><input type="radio"
								name="radiobutton" value="12">组六</span> <span id="selex3xhz"
							style="display: none;"><input type="radio"
								name="radiobutton" value="14">组选和值</span> <span
							id="selex3xz3hz" style="display: none;"><input
								type="radio" name="radiobutton" value="22">组三和值</span> <span
							id="selex3xz6hz" style="display: none;"><input
								type="radio" name="radiobutton" value="23">组六和值</span> <span
							id="touzhufangshi_1" style="display: none;">直选：</span> <span
							id="selfs" style="display: inline;"><input type="radio"
								name="radiobutton" value="1">复式</span> <span id="selex3xzxhz"
							style=""><input type="radio" name="radiobutton" value="18">和值</span>
							<span id="selds" style="display: inline;"><input
								type="radio" name="radiobutton" value="2">单式</span> <span
							id="selex3xzxdt" style="display: none;"><input
								type="radio" name="radiobutton" value="19">直选胆拖</span> <span
							id="selex3xz3dt" style="display: none;"><input
								type="radio" name="radiobutton" value="15">组三胆拖</span> <span
							id="selex3xz6dt" style="display: none;"><input
								type="radio" name="radiobutton" value="16">组六胆拖</span> <span
							id="selex2xfshzds" style="display: none;"> <input
								type="radio" name="radiobutton" value="20">和值&nbsp;&nbsp;&nbsp;&nbsp;
								<font>组选：</font> <input type="radio" name="radiobutton"
								value="7">复式 <input type="radio" name="radiobutton"
								value="8">单式 <input type="radio" name="radiobutton"
								value="9">和值 <!--      <input type="radio" name="radiobutton" value="21">包胆-->
						</span> <span id="selbdw" style="display: none;"> <input
								type="radio" name="radiobutton" value="24">前三不定位 <input
								type="radio" name="radiobutton" value="25">后三不定位

						</span></td>
					</tr>
					<tr>
						<td class="t_tz16"><span class="t_tz17"></span><font
							color="#666666"><span id="zhexplain1">（从000~999中选一个三位数为一个投注号码，单注奖金<font
									color="red">1800</font>元）
							</span></font></td>
					</tr>
					<tr>
						<td class="adtd06">
							<div class="touzhu_kuang">
								<!--直选 开始-->
								<table id="numtb" cellspacing="0" cellpadding="0" width="100%"
									border="0" class="numtbTable" style="display: table;">
									<tbody>
										<tr style="display: none;">
											<td class="line_b1 cs_042" align="center" valign="top"
												width="62"><br>万位<br>
											<br>
											<font color="#2255aa" id="div_yl_1">遗漏</font></td>
											<td class="line_b1" style="padding-left: 5px">
												<table border="0">
													<tbody>
														<tr id="tr_vote_1">
															<td class="ball_r">0</td>
															<td class="ball_r">1</td>
															<td class="ball_r">2</td>
															<td class="ball_r">3</td>
															<td class="ball_r">4</td>
															<td class="ball_r">5</td>
															<td class="ball_r">6</td>
															<td class="ball_r">7</td>
															<td class="ball_r">8</td>
															<td class="ball_r">9</td>
															<td width="10">&nbsp;</td>
															<td><span class="pointer">全</span> <span
																class="pointer">大</span> <span class="pointer">小</span>
																<span class="pointer">奇</span> <span class="pointer">偶</span>
																<span class="pointer">清</span></td>
														</tr>
														<tr id="tr_yl_1">
															<td class="yl_1">0</td>
															<td class="yl_1">5</td>
															<td class="yl_1"><font color="red">22</font></td>
															<td class="yl_1"><font color="red">28</font></td>
															<td class="yl_1">10</td>
															<td class="yl_1">9</td>
															<td class="yl_1">14</td>
															<td class="yl_1">4</td>
															<td class="yl_1">1</td>
															<td class="yl_1">0</td>
															<td colspan="2">&nbsp;</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr style="display: none;">
											<td class="line_b1 cs_042" align="center" valign="top"
												width="62"><br>千位<br>
											<br>
											<font color="#2255aa" id="div_yl_2">遗漏</font></td>
											<td class="line_b1" style="padding-left: 5px">
												<table border="0">
													<tbody>
														<tr id="tr_vote_2">
															<td class="ball_r">0</td>
															<td class="ball_r">1</td>
															<td class="ball_r">2</td>
															<td class="ball_r">3</td>
															<td class="ball_r">4</td>
															<td class="ball_r">5</td>
															<td class="ball_r">6</td>
															<td class="ball_r">7</td>
															<td class="ball_r">8</td>
															<td class="ball_r">9</td>
															<td width="10">&nbsp;</td>
															<td><span class="pointer">全</span> <span
																class="pointer">大</span> <span class="pointer">小</span>
																<span class="pointer">奇</span> <span class="pointer">偶</span>
																<span class="pointer">清</span></td>
														</tr>
														<tr id="tr_yl_2">
															<td class="yl_1"><font color="red">29</font></td>
															<td class="yl_1">10</td>
															<td class="yl_1">5</td>
															<td class="yl_1">0</td>
															<td class="yl_1">1</td>
															<td class="yl_1"><font color="red">41</font></td>
															<td class="yl_1"><font color="red">25</font></td>
															<td class="yl_1">9</td>
															<td class="yl_1">2</td>
															<td class="yl_1">3</td>
															<td colspan="2">&nbsp;</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr style="">
											<td class="line_b1 cs_042" align="center" valign="top"
												width="62"><br>百位<br>
											<br>
											<font color="#2255aa" id="div_yl_3" style="">遗漏</font></td>
											<td class="line_b1" style="padding-left: 5px">
												<table border="0">
													<tbody>
														<tr id="tr_vote_3">
															<td class="ball_r">0</td>
															<td class="ball_r">1</td>
															<td class="ball_r">2</td>
															<td class="ball_r">3</td>
															<td class="ball_r">4</td>
															<td class="ball_r">5</td>
															<td class="ball_r">6</td>
															<td class="ball_r">7</td>
															<td class="ball_r">8</td>
															<td class="ball_r">9</td>
															<td width="10">&nbsp;</td>
															<td><span class="pointer">全</span> <span
																class="pointer">大</span> <span class="pointer">小</span>
																<span class="pointer">奇</span> <span class="pointer">偶</span>
																<span class="pointer">清</span></td>
														</tr>
														<tr id="tr_yl_3" style="">
															<td class="yl_1">13</td>
															<td class="yl_1">8</td>
															<td class="yl_1">0</td>
															<td class="yl_1">10</td>
															<td class="yl_1"><font color="red">21</font></td>
															<td class="yl_1">9</td>
															<td class="yl_1">3</td>
															<td class="yl_1">1</td>
															<td class="yl_1">6</td>
															<td class="yl_1">7</td>
															<td colspan="2">&nbsp;</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr style="">
											<td class="line_b1 cs_042" align="center" valign="top"
												width="62"><br>十位<br>
											<br>
											<font color="#2255aa" id="div_yl_4" style="">遗漏</font></td>
											<td class="line_b1" style="padding-left: 5px">
												<table border="0">
													<tbody>
														<tr id="tr_vote_4">
															<td class="ball_r">0</td>
															<td class="ball_r">1</td>
															<td class="ball_r">2</td>
															<td class="ball_r">3</td>
															<td class="ball_r">4</td>
															<td class="ball_r">5</td>
															<td class="ball_r">6</td>
															<td class="ball_r">7</td>
															<td class="ball_r">8</td>
															<td class="ball_r">9</td>
															<td width="10">&nbsp;</td>
															<td><span class="pointer">全</span> <span
																class="pointer">大</span> <span class="pointer">小</span>
																<span class="pointer">奇</span> <span class="pointer">偶</span>
																<span class="pointer">清</span></td>
														</tr>
														<tr id="tr_yl_4" style="">
															<td class="yl_1">4</td>
															<td class="yl_1">1</td>
															<td class="yl_1"><font color="red">39</font></td>
															<td class="yl_1">6</td>
															<td class="yl_1">3</td>
															<td class="yl_1">10</td>
															<td class="yl_1">9</td>
															<td class="yl_1">0</td>
															<td class="yl_1">7</td>
															<td class="yl_1">11</td>
															<td colspan="2">&nbsp;</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr style="">
											<td class="line_b1 cs_042" align="center" valign="top"
												width="62"><br>个位<br>
											<br>
											<font color="#2255aa" id="div_yl_5" style="">遗漏</font></td>
											<td class="line_b1" style="padding-left: 5px">
												<table border="0">
													<tbody>
														<tr id="tr_vote_5">
															<td class="ball_r">0</td>
															<td class="ball_r">1</td>
															<td class="ball_r">2</td>
															<td class="ball_r">3</td>
															<td class="ball_r">4</td>
															<td class="ball_r">5</td>
															<td class="ball_r">6</td>
															<td class="ball_r">7</td>
															<td class="ball_r">8</td>
															<td class="ball_r">9</td>
															<td width="10">&nbsp;</td>
															<td><span class="pointer">全</span> <span
																class="pointer">大</span> <span class="pointer">小</span>
																<span class="pointer">奇</span> <span class="pointer">偶</span>
																<span class="pointer">清</span></td>
														</tr>
														<tr id="tr_yl_5" style="">
															<td class="yl_1">10</td>
															<td class="yl_1">0</td>
															<td class="yl_1">9</td>
															<td class="yl_1">14</td>
															<td class="yl_1">4</td>
															<td class="yl_1">5</td>
															<td class="yl_1"><font color="red">21</font></td>
															<td class="yl_1">1</td>
															<td class="yl_1">7</td>
															<td class="yl_1">6</td>
															<td colspan="2">&nbsp;</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
								<!--直选 结束-->

								<!--大小单双 开始-->
								<table id="numta" cellspacing="0" cellpadding="0" border="0"
									width="540" class="numtbTable daxiaodanshuang"
									style="display: none;">
									<tbody>
										<tr>
											<td bgcolor="#f5f5f5" align="center" valign="middle"
												width="60">十位</td>
											<td>
												<table cellspacing="10" border="0" align="center">
													<tbody>
														<tr id="tr_vote_6">
															<td class="ball_r_1">大</td>
															<td class="ball_r_1">小</td>
															<td class="ball_r_1">单</td>
															<td class="ball_r_1">双</td>
														</tr>
													</tbody>
												</table>
											</td>
											<td bgcolor="#f5f5f5" align="center" valign="middle"
												width="60">个位</td>
											<td>
												<table cellspacing="10" border="0" align="center">
													<tbody>
														<tr id="tr_vote_7">
															<td class="ball_r_1">大</td>
															<td class="ball_r_1">小</td>
															<td class="ball_r_1">单</td>
															<td class="ball_r_1">双</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
								<!--大小单双 结束-->

								<!--单式 开始-->
								<table id="numtc" cellspacing="0" cellpadding="0" width="100%"
									border="0" class="numtbTable" style="display: none;">
									<tbody>
										<tr>
											<td></td>
										</tr>
										<tr>
											<td class="geshi">【提醒】直接在下面框中输入或粘贴投注内容，最多输入400注。<a
												id="gsexplain"
												href="http://cc.77qiu.com/Trade/CQSSC/Xml/dg/ssc_zxds.txt"
												style="color: #06c" target="_blank">
													<!-- 查看标准格式样本 -->
											</a><br>
												<table cellpadding="0 " width="100%" border="0">
													<tbody>
														<tr>
															<td width="311"><textarea name="pastecontent"
																	rows="8" cols="42" id="pastecontent"></textarea></td>
															<td width="10">&nbsp;</td>
															<td align="left">&nbsp;</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
								<!--单式 结束-->

								<!--二星组选复式/包胆 开始-->
								<table id="numtb_2xzxfs" border="0" class="numtbTable"
									style="display: none;">
									<tbody>
										<tr id="tr_vote_8">
											<td class="ball_r">0</td>
											<td class="ball_r">1</td>
											<td class="ball_r">2</td>
											<td class="ball_r">3</td>
											<td class="ball_r">4</td>
											<td class="ball_r">5</td>
											<td class="ball_r">6</td>
											<td class="ball_r">7</td>
											<td class="ball_r">8</td>
											<td class="ball_r">9</td>
											<td id="zhexplain3" style="padding-left: 10px">(1≤个数≤2)</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
									</tbody>
								</table>
								<!--二星组选复式/包胆 结束-->

								<!--二星组选和值 开始-->
								<table id="numtb_2xzxhz" border="0" class="numtbTable"
									style="display: none;">
									<tbody>
										<tr id="tr_vote_9">
											<td class="ball_r">0</td>
											<td class="ball_r">1</td>
											<td class="ball_r">2</td>
											<td class="ball_r">3</td>
											<td class="ball_r">4</td>
											<td class="ball_r">5</td>
											<td class="ball_r">6</td>
											<td class="ball_r">7</td>
											<td class="ball_r">8</td>
											<td class="ball_r">9</td>
											<td class="ball_r">10</td>
											<td class="ball_r">11</td>
											<td class="ball_r">12</td>
											<td class="ball_r">13</td>
											<td class="ball_r">14</td>
											<td class="ball_r">15</td>
											<td class="ball_r">16</td>
											<td class="ball_r">17</td>
											<td class="ball_r">18</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
									</tbody>
								</table>
								<!--二星组选和值 结束-->

								<!--组三/组六复式 开始-->
								<table id="numtb_3xz3fs" class="numtbTable"
									style="display: none;" width="100%" border="0" cellspacing="0"
									cellpadding="0">
									<tbody>
										<tr id="tr_vote_10">
											<td class="ball_r">0</td>
											<td class="ball_r">1</td>
											<td class="ball_r">2</td>
											<td class="ball_r">3</td>
											<td class="ball_r">4</td>
											<td class="ball_r">5</td>
											<td class="ball_r">6</td>
											<td class="ball_r">7</td>
											<td class="ball_r">8</td>
											<td class="ball_r">9</td>
											<!-- <td id="zhexplain4">(至少选2个号码)</td> -->
											<td width="10">&nbsp;</td>
											<td><span class="pointer">全</span> <span class="pointer">大</span>
												<span class="pointer">小</span> <span class="pointer">奇</span>
												<span class="pointer">偶</span> <span class="pointer">清</span>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td colspan="2">&nbsp;</td>
										</tr>
									</tbody>
								</table>
								<!--组三/组六复式 结束-->

								<!--三星包胆复式 开始-->
								<table id="numtb_3xbdfs" cellspacing="0" cellpadding="0"
									width="100%" border="0" class="numtbTable"
									style="display: none;">
									<tbody>
										<tr>
											<td width="62"><input type="radio" name="radiobd"
												value="1">包一胆</td>
											<td style="padding-left: 5px">
												<table border="0">
													<tbody>
														<tr id="tr_vote_11">
															<td class="ball_r">0</td>
															<td class="ball_r">1</td>
															<td class="ball_r">2</td>
															<td class="ball_r">3</td>
															<td class="ball_r">4</td>
															<td class="ball_r">5</td>
															<td class="ball_r">6</td>
															<td class="ball_r">7</td>
															<td class="ball_r">8</td>
															<td class="ball_r">9</td>
															<td>(只能选1个号码)</td>
														</tr>
														<tr>
															<td height="10"></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<td width="62"><input type="radio" name="radiobd"
												value="2">包二胆</td>
											<td style="padding-left: 5px">
												<table border="0" id="bdnumtwo">
													<tbody>
														<tr id="tr_vote_12">
															<td class="ball_r">0</td>
															<td class="ball_r">1</td>
															<td class="ball_r">2</td>
															<td class="ball_r">3</td>
															<td class="ball_r">4</td>
															<td class="ball_r">5</td>
															<td class="ball_r">6</td>
															<td class="ball_r">7</td>
															<td class="ball_r">8</td>
															<td class="ball_r">9</td>
															<td>(只能选1个号码)</td>
														</tr>
														<tr>
															<td height="10"></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
								<!--三星包胆复式 结束-->

								<!--三星组选/直选和值 开始-->
								<table id="numtb_3xzxhz" border="0" class="numtbTable"
									style="display: none;">
									<tbody>
										<tr id="tr_vote_13">
											<td class="ball_r">0</td>
											<td class="ball_r">1</td>
											<td class="ball_r">2</td>
											<td class="ball_r">3</td>
											<td class="ball_r">4</td>
											<td class="ball_r">5</td>
											<td class="ball_r">6</td>
											<td class="ball_r">7</td>
											<td class="ball_r">8</td>
											<td class="ball_r">9</td>
											<td class="ball_r">10</td>
											<td class="ball_r">11</td>
											<td class="ball_r">12</td>
											<td class="ball_r">13</td>
										</tr>
										<tr>
											<td height="12"></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr id="tr_vote_14">
											<td class="ball_r">14</td>
											<td class="ball_r">15</td>
											<td class="ball_r">16</td>
											<td class="ball_r">17</td>
											<td class="ball_r">18</td>
											<td class="ball_r">19</td>
											<td class="ball_r">20</td>
											<td class="ball_r">21</td>
											<td class="ball_r">22</td>
											<td class="ball_r">23</td>
											<td class="ball_r">24</td>
											<td class="ball_r">25</td>
											<td class="ball_r">26</td>
											<td class="ball_r">27</td>
										</tr>
									</tbody>
								</table>
								<!--三星组选/直选和值 结束-->

								<!--三星直选/组三/组六胆拖  开始-->
								<table id="numtb_3xz3fsdt" cellspacing="0" cellpadding="0"
									width="100%" border="0" class="numtbTable"
									style="display: none;">
									<tbody>
										<tr>
											<td class="line_b1" align="center" valign="middle" width="62">胆码</td>
											<td class="line_b1" style="padding-left: 5px"
												bgcolor="#f5f5f5">
												<table border="0">
													<tbody>
														<tr id="tr_vote_15">
															<td class="ball_r">0</td>
															<td class="ball_r">1</td>
															<td class="ball_r">2</td>
															<td class="ball_r">3</td>
															<td class="ball_r">4</td>
															<td class="ball_r">5</td>
															<td class="ball_r">6</td>
															<td class="ball_r">7</td>
															<td class="ball_r">8</td>
															<td class="ball_r">9</td>
															<td id="dtinfo_1"><font color="red">（0＜胆码个数≤2）</font></td>
														</tr>
														<tr>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<td class="line_b1" align="center" valign="middle">拖码</td>
											<td class="line_b1" style="padding-left: 5px"
												bgcolor="#f5f5f5">
												<table border="0">
													<tbody>
														<tr id="tr_vote_16">
															<td class="ball_r">0</td>
															<td class="ball_r">1</td>
															<td class="ball_r">2</td>
															<td class="ball_r">3</td>
															<td class="ball_r">4</td>
															<td class="ball_r">5</td>
															<td class="ball_r">6</td>
															<td class="ball_r">7</td>
															<td class="ball_r">8</td>
															<td class="ball_r">9</td>
															<td id="dtinfo_2"><font color="red">（3
																	≤胆码＋拖码）</font></td>
														</tr>
														<tr>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
								<!--三星直选/组三/组六胆拖  结束-->

								<!--三星直选组合复式  开始-->
								<table id="numtb_3xzxfs" border="0" class="numtbTable"
									style="display: none;">
									<tbody>
										<tr id="tr_vote_17">
											<td class="ball_r">0</td>
											<td class="ball_r">1</td>
											<td class="ball_r">2</td>
											<td class="ball_r">3</td>
											<td class="ball_r">4</td>
											<td class="ball_r">5</td>
											<td class="ball_r">6</td>
											<td class="ball_r">7</td>
											<td class="ball_r">8</td>
											<td class="ball_r">9</td>
											<td>(至少选3个号码)</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
									</tbody>
								</table>
								<!--三星直选组合复式  结束-->

								<!--三星组选组三和值 开始-->
								<table id="numtb_3xzxz3hz" border="0" class="numtbTable"
									style="display: none;">
									<tbody>
										<tr id="tr_vote_18">
											<td class="ball_r">1</td>
											<td class="ball_r">2</td>
											<td class="ball_r">3</td>
											<td class="ball_r">4</td>
											<td class="ball_r">5</td>
											<td class="ball_r">6</td>
											<td class="ball_r">7</td>
											<td class="ball_r">8</td>
											<td class="ball_r">9</td>
											<td class="ball_r">10</td>
											<td class="ball_r">11</td>
											<td class="ball_r">12</td>
											<td class="ball_r">13</td>
										</tr>
										<tr>
											<td height="12"></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr id="tr_vote_19">
											<td class="ball_r">14</td>
											<td class="ball_r">15</td>
											<td class="ball_r">16</td>
											<td class="ball_r">17</td>
											<td class="ball_r">18</td>
											<td class="ball_r">19</td>
											<td class="ball_r">20</td>
											<td class="ball_r">21</td>
											<td class="ball_r">22</td>
											<td class="ball_r">23</td>
											<td class="ball_r">24</td>
											<td class="ball_r">25</td>
											<td class="ball_r">26</td>
										</tr>
									</tbody>
								</table>
								<!--三星组选组三和值 结束-->

								<!--三星组选组六和值 开始-->
								<table id="numtb_3xzxz6hz" border="0" class="numtbTable"
									style="display: none;">
									<tbody>
										<tr id="tr_vote_20">
											<td class="ball_r">3</td>
											<td class="ball_r">4</td>
											<td class="ball_r">5</td>
											<td class="ball_r">6</td>
											<td class="ball_r">7</td>
											<td class="ball_r">8</td>
											<td class="ball_r">9</td>
											<td class="ball_r">10</td>
											<td class="ball_r">11</td>
											<td class="ball_r">12</td>
											<td class="ball_r">13</td>
										</tr>
										<tr>
											<td height="12"></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr id="tr_vote_21">
											<td class="ball_r">14</td>
											<td class="ball_r">15</td>
											<td class="ball_r">16</td>
											<td class="ball_r">17</td>
											<td class="ball_r">18</td>
											<td class="ball_r">19</td>
											<td class="ball_r">20</td>
											<td class="ball_r">21</td>
											<td class="ball_r">22</td>
											<td class="ball_r">23</td>
											<td class="ball_r">24</td>
										</tr>
									</tbody>
								</table>
								<!--组六和值 结束-->
							</div>
							<table border="0" cellspacing="0" cellpadding="0" class="t_tz18">
								<tbody>
									<tr>
										<td>
											<div style="line-height: 40px; margin-left: 150px;">
												<!-- 
											<b style="display: inline-block;float: left;">
		                                		已选择：<span id="temp_select_zhushu" style="color: red;">0</span> 注，共：<span id="temp_select_money" style="color: red;">0</span> 元
											</b>
											 -->
												<input type="button" id="button_add" name="button_add"
													class="button_add pointer" 
													style="display: inline-block; margin-left: 10px;" />
											</div>
										</td>
									</tr>
								</tbody>
							</table>

							<div class="touzhu_kuang02">
								<table cellspacing="0" cellpadding="0" border="0">
									<tbody>
										<tr>
											<td><select id="codesshow" size="6" name="codesshow"></select></td>
											<td>
												<table id="maindelfun" cellpadding="0">
													<tbody>
														<tr>
															<td width="90" height="28" align="left" valign="top"><input
																type="button" id="btn_jixuan1" name="btn_jixuan1"
																class="button1" value="机选一注"></td>
														</tr>
														<tr>
															<td width="90" height="28" align="left" valign="top"><input
																type="button" id="btn_jixuan5" name="btn_jixuan5"
																class="button1" value="机选五注"></td>
														</tr>
														<tr>
															<td width="90" height="28" align="left" valign="top"><input
																type="button" id="btn_jixuan10" name="btn_jixuan10"
																class="button1" value="机选十注"></td>
														</tr>
														<tr>
															<td width="90" height="28" align="left" valign="top"><input
																type="button" id="btn_delline" name="btn_delline"
																class="button1" value="删除选号"></td>
														</tr>
														<tr>
															<td width="90" height="28" align="left" valign="top"><input
																type="button" id="btn_clearall" name="btn_clearall"
																class="button1" value="清空投注"></td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
								<table class="t_tz20" border="0" cellpadding="0" cellspacing="0">
									<tbody>
										<tr>
											<td class="yh_tz_an_kd">
												<div class="t_tz19">
													<p>
														单倍注数：<span id="zhushushow2" class="bold red2">0</span>，金额：<font
															color="red">￥</font><span id="moneyshow2"
															class="bold red2">0</span>元，期数：<span id="expectnumshow"
															class="bold red2">1</span>，总金额：<font color="red">￥</font><span
															id="moneyshow3" class="bold red2">0</span>元 <span
															id="lotteryTypeId" style="display: none;">1</span> <span
															id="phase" style="display: none;"
															currentPhase="currentPhase">20161213061</span>
													</p>
												</div> <input type="button" id="btn_SubmitZ" name="btn_SubmitZ"
												>&nbsp; <input target="_blank"
												type="button" id="btn_SubmitHM" name="btn_SubmitHM"
												><br>
											<!--合买-->
											</td>
										</tr>
									</tbody>
								</table>

								<table class="t_tz20" border="0" cellpadding="0" cellspacing="0">
									<tbody>
										<tr>
											<td>

												<table width="0" border="0" class="touzhu_zh">
													<tbody>
														<tr>
															<td><input type="checkbox" name="IsZhuihao"
																id="IsZhuihao" onclick="ChangeStatus()"
																checked="checked"></td>
															<td>追号&nbsp;&nbsp;</td>
															<td><input type="checkbox" name="ZjStop" value="1"
																id="ZjStop"></td>
															<td>中奖后停止追号</td>
														</tr>
													</tbody>
												</table> <script language="javascript">
                                         function ChangeStatus()
                                        {
										  if (document.getElementById('IsZhuihao').checked == true)
											{   document.getElementById('zuihao').style.display = ""; }
										
										  if (document.getElementById('IsZhuihao').checked == false)
											{   document.getElementById('zuihao').style.display = "none"; }

                                        }
                                        </script>

											</td>
										</tr>

										<tr>
											<td id="zuihao">
												<!--日期 开始-->
												<ul class="tabDay">
													<li class="tab2 tab1" id="expectheadtd1">今日可选期号</li>
													<li class="tab2" id="btTab">倍投计算器</li>
												</ul> <!--日期 结束-->
												<div class="clear"></div>
												<div id="zhDiv">
													<ul class="tang_0114">
														<li><input type="checkbox" id="selectallexpect"
															name="selectallexpect"> <span>期数：</span> <input
															type="text" id="batchexpectsel" name="batchexpectsel"
															size="3" maxlength="4" value="1"></li>
														<li><span>倍数：</span> <input type="text"
															id="selectallbieshu" name="selectallbieshu" size="4"
															value="1" maxlength="4"></li>
													</ul>

													<div class="clear"></div>

													<input type="hidden" id="TouzhuExpectType"
														name="TouzhuExpectType" value="1"> <br />
													<div id="TzList" style="height: 190px">
														<table class="tlh_zhbgys" id="tbshowtozhuexpect"
															cellspacing="1" cellpadding="3" width="100%" border="0">
															<tbody>
																<c:forEach items="${requestScope.left }" var="pase">
																	<tr>
																		<td width="140" style="text-indent: 1em"><input
																			type="checkbox" name="checkbeishu"
																			onchange='beishuselect()'> <font color="red"><span
																				currentPhase="currentPhase" id="currentPhase2">${pase}</span>
																				<c:choose>
																					<c:when test="${pase==current}">  
                          [当前期]   
               </c:when>
																					<c:otherwise>

																					</c:otherwise>
																				</c:choose> </font></td>
																		<td align="left" width="160">倍数： <input
																			type="text" name="beishu_show" value="0" size="4"
																			maxlength="4" disabled=""> <font color="red">0</font>元
																			<input type="hidden" name="expect_hidden"
																			currentPhase="currentPhase" value=">${pase}">
																		</td>
																	</tr>


																</c:forEach>
														</table>
													</div>
												</div>
												<style>
.btab {
	clear: both;
	font-weight: 100;
	width: 100%;
}

.btab table {
	font-size: 12px;
	font-weight: bold;
}

.btab table th {
	background: url("http://www.cp114.com/images/frequency/gp_89.gif")
		repeat-x scroll transparent;
	text-align: center;
}

.bta {
	overflow-x: hidden;
	overflow-y: scroll;
	width: 100%;
	height: 279px;
}

.bta table {
	background: none repeat scroll 0 0 #f9f6fc;
	color: #555555;
	font-size: 12px;
	width: 710px;
}

.bta table tbody td {
	border-right: 1px solid #FFFFFF;
	border-top: 1px solid #FFFFFF;
	height: 27px;
	text-align: center;
}

.height12 {
	height: 172px
}

#btDiv .beitou_z {
	height: 28px;
	overflow: hidden;
	padding-top: 10px;
	width: 100%;
	background: url("http://www.cp114.com/images/frequency/bg2.png")
		repeat-x scroll 0 -831px transparent;;
}

#btDiv .beitou_z label {
	float: left;
	font-size: 12px;
	line-height: 24px;
	margin-left: 10px;
}

#btDiv .beitou_z select {
	float: left;
	width: 189px;
}

#btDiv .beitou_z input {
	float: left;
	margin-left: 5px;
	width: 58px;
}

#btDiv .beitou_z span {
	float: left;
	font-size: 12px;
	line-height: 24px;
	margin-left: 3px;
}

.jsuan {
	height: 140px;
	width: 100%;
	background: url("http://www.cp114.com/images/frequency/bg2.png")
		repeat-x scroll 0 -1309px #fff;
}

.jsuan .tjan {
	float: left;
	width: 440px;
}

.jsuan .tjan p {
	font-size: 12px;
	height: 28px;
	line-height: 28px;
	text-indent: 10px;
}

.jsuan .tjan p .input_06 {
	background: none repeat scroll 0 0 #FFFFFF;
	border: 1px solid #DDDDDD;
	height: 16px;
	width: 40px;
}

.jsuan .jsqr {
	background: url("http://www.cp114.com/images/frequency/gp_124.gif")
		no-repeat scroll 0 50px transparent;
	float: left;
	height: 120px;
	width: 260px;
}

.jsuan .jsqr input {
	border: 0 none;
	cursor: pointer;
	height: 39px;
	margin: 45px 0 15px 80px;
	width: 125px;
	background: url("<%=basePath%>static/images/jsuan.png") no-repeat;
}

.jsuan .jsqr p {
	font-size: 12px;
	text-align: center;
}

.jsuan .jsqr p span {
	color: #DE4500;
}
</style>
												<div id="btDiv" style="display: none">
													<div class="beitou_z">
														<label>起始期：</label> <select id="btStartList" name="Adigit">
															<c:forEach items="${requestScope.left }" var="pase"
																varStatus="status">
																<option value="${pase}">[
																	<c:out value="${status.count}" />]${pase}
																	<c:choose>
																		<c:when test="${pase==current}">  
                         (当前期号)
               </c:when>
																		<c:otherwise>

																		</c:otherwise>
																	</c:choose>
															</c:forEach>

															</option>

															<label>我要追</label>
															<input type="text" value="5" maxlength="4" size="4"
															id="btIssueNum" name="sq">
															<span>期</span>
													</div>
													<div class="jsuan">

														<div class="tjan">
															<p>
																<label>起始倍数： </label> <input type="text" value="1"
																	class="input_06" style="width: 45px;" name="sb"
																	maxlength="6" id="btStartMultiple"> <label>
																	最大倍投不超过</label> <input type="text" style="width: 50px;"
																	value="100" class="input_06" name="sbMax"
																	id="btMaxMultiple"> <label> 倍 单倍奖金：</label> <input
																	type="text" class="input_06" name="dj" id="btBonus"
																	maxlength="6" size="6" value=""> <label>
																	元</label>
															</p>
															<p>
																<strong>收益率设置</strong>
															</p>
															<p>
																<input type="radio" name="rdoWinCondition" value="1"
																	checked="checked"> <label>全程收益：</label> <input
																	type="text" value="30" maxlength="6" size="6"
																	class="input_06" name="NumInput2" id="allMargin">
																<label> %</label>
															</p>
															<p>
																<input type="radio" name="rdoWinCondition" value="2">
																<label>前 </label> <input type="text" value="10"
																	maxlength="6" size="6" class="input_06"
																	name="NumInput2" id="preIssueNum" disabled="">
																<label> 期收益率：</label> <input type="text" value="10"
																	class="input_06" name="NumInput2" id="preMargin"
																	disabled=""> <label> %，之后收益率</label> <input
																	type="text" value="5" class="input_06" name="NumInput2"
																	id="afterMargin" disabled=""> <label>%</label>
															</p>
															<p>
																<input type="radio" name="rdoWinCondition" value="3">
																<label>累积收益不低于 </label> <input type="text" value="100"
																	class="input_06" style="width: 50px;" name="NumInput2"
																	id="minMoney" disabled=""> <label> 元</label>
															</p>
														</div>
														<div class="jsqr">
															<input type="button" name="Input3" id="btnCalc">
															<p>
																(期数：<span id="btIssueCount" class="red">0</span>期，总投入：<span
																	id="btInvestment" class="red">0</span>元，总收益：<span
																	id="btRevenue" class="red">0</span>元)
															</p>
														</div>
													</div>
													<div class="btab">
														<table width="100%" cellspacing="1" bgcolor="#f3eee2">
															<colgroup>
																<col width="20%">
																<col width="13%">
																<col width="13%">
																<col width="13%">
																<col width="13%">
																<col width="13%">
																<col width="15%">
															</colgroup>
															<thead>
																<tr>
																	<th height="30">期号</th>
																	<th>投入倍数</th>
																	<th>当期投入</th>
																	<th>累计投入</th>
																	<th>当期奖金</th>
																	<th>累计收益</th>
																	<th>收益率</th>
																</tr>
															</thead>
														</table>
													</div>
													<div class="bta height12">
														<table id="btTable" cellspacing="0">
															<colgroup>
																<col width="20%">
																<col width="13%">
																<col width="13%">
																<col width="13%">
																<col width="13%">
																<col width="13%">
																<col width="15%">
															</colgroup>
															<tbody>
															</tbody>
														</table>
													</div>
												</div>



											</td>
										</tr>
									</tbody>
								</table>
							</div>


						</td>
					</tr>
				</tbody>
			</table>

		</div>
		<!--投注主体 结束-->
		<script language="javascript">
 $(function(){
 	var _tab=$('ul#tabfirst_01>li');
	var _con=$('div#tab_box_01>div');
	var _conthis;
	var _index=0;
	
	_tab.click(function(){
		_index=_tab.index(this);
		$(this).addClass('tabin_01').siblings().removeClass('tabin_01');
		_con.filter(':visible').stop(true,true).fadeOut(200,function(){
			_con.eq(_index).fadeIn(200)
		})
	});
})
</script>
		<!-- 历史开奖中奖排行 -->
		<style type="text/css">
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
	background: url(http://www.vb6g.com/res/img/yh14_34.png) no-repeat;
	color: #275fb6;
}

#newWinerMq ul {
	width: 238px;
	font-size: 14px;
	color: #333;
}

#newWinerMq ul>li {
	float: left;
	padding: 5px;
	width: 228px;
}

#newWinerMq ul>li>span {
	float: left;
	margin-right: 8px;
}

#newWinerMq ul>li>span:first-child {
	text-align: left;
}

#newWinerMq ul>li>span:last-child {
	margin: 0px;
	color: red;
}
</style>
		<script src="<%=basePath%>static/js/jquery-1.7.2.min.js"
			type="text/javascript"></script>
		<script type="text/javascript">
$(document).ready(function() {
	var lotteryTypeId = "1";
	queryHistoryDrawNumbers();
	zjxb();
	function queryHistoryDrawNumbers() {
		$.ajax({
			url : "<%=basePath%>cqssc/shishicaihistroy",
			dataType : "json",
			data : {
				"lotteryTypeId" : lotteryTypeId,
				t : Math.random()
			},
			success : function(data2) {
				data2 = eval(data2 );
				var firstPhase = data2.chongqingReturn[0].lotteryPeriod;
				var lastPhase = $('#lastPhase').text();
				if (firstPhase == lastPhase) {
					// don't need to update
				} else {
					
					$('#lastPhase').text(data2.chongqingReturn[0].periodNumber);					
					$('#qssj').text(data2.chongqingReturn[0].opentime);
					$('#winnumber').text(data2.chongqingReturn[0].lotteryPeriod);
					drawNumber();
					
					$('#CodeListTable > tbody > tr:eq(0)').find('.history_phase').text(data2.chongqingReturn[0].periodNumber);
					$('#CodeListTable > tbody > tr:eq(0)').find('.history_date').text(data2.chongqingReturn[0].opentime.substring(10,16));
					$('#CodeListTable > tbody > tr:eq(0)').find('.history_number').text(data2.chongqingReturn[0].lotteryPeriod);
					var d = new Date(data2.chongqingReturn[0].opentime);
					if (d && d.getHours()) {
						$('#CodeListTable > tbody > tr:eq(0)').find('.history_date').text(d.getHours() + ":" + d.getMinutes());
					}
					
					$('#CodeListTable > tbody > tr:gt(0)').each(function(i){
						var tr = $(this);
						var p = data2.chongqingReturn[i + 1];
						tr.find('.history_phase').text(p.periodNumber);
						tr.find('.history_date').text(p.opentime.substring(10,16));
						tr.find('.history_number').text(p.lotteryPeriod);
					});
					
				}
			}
		});
		
		//中奖喜报
		zjxb();
		
	}

	
	setInterval(queryHistoryDrawNumbers, 30000);
});

function drawNumber() {
	var number = $("#winnumber").html();
	if (number != "") {
		var numbers = [];
		numbers = number.split(',');
		var html = "&nbsp;&nbsp;";
		for(var i in numbers) {
			html += "<span class='yhzt_hongqiu'>" + numbers[i] + "</span>";
		}
		$("#kjhm").html(html);
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
			
				$("#newWinerMq>ul>li").remove();
				for ( var index in data2) {
					var vo = data2[index];
					$("#newWinerMq>ul").append("<li><span>恭喜</span><span style='overflow: hidden;'>"+vo.user+"</span><span>喜中 <b>"+vo.money+"</b> 元</span></li>");
				}
			
			}
		}
	});
}

	

function total() {
	$("#tab_box_01").show();
	$("#tab_box_02").hide();
}

$(function() {
	$("#newWinerMq").marquee({
		auto: true,
		interval: 2000,
		showNum: 10,
		stepLen: 3,
		type: 'vertical'
	});
});

</script>
		<div class="yhzt_y01">
			<ul class="yhzt_y02">
				<li class="yhzt_y02_bt"><h2 style="margin-left: 35px;">重庆时时彩
						历史开奖</h2></li>
				<li class="yhzt_y02_nr">
					<ul class="yhzt_y03">
						<li class="yhzt_y03_01">
							<p>
								第 <span id="activeexpectshow1"><span id="buyExpectShow"><span
										id="lastPhase"></span></span></span> 期开奖<br> 开奖时间：<span id="qssj">2016-12-13
									16:01:39</span>
							</p>
						</li>
						<div id="winnumber" style="display: none">0,0,3,6,4</div>
						<li class="yhzt_y03_02" id="kjhm"></li>
					</ul>
					<table width="0" border="0" cellspacing="0" cellpadding="0"
						class="yhzt_y04" id="CodeListTable">
						<thead>
							<tr>
								<td class="yhzt_y04_01">期号</td>
								<td class="yhzt_y04_01">时间</td>
								<td class="yhzt_y04_02">号码</td>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td class="yhzt_y04_01">&nbsp;<span class="history_phase">20161213050</span>&nbsp
								</td>
								<td class="yhzt_y04_01"><font color="red"><span
										class="history_date">14:21</span></font></td>
								<td class="yhzt_y04_02"><span class="history_number">
										7&nbsp;&nbsp;0&nbsp;&nbsp;3&nbsp;&nbsp;4&nbsp;&nbsp;3 </span></td>
							</tr>
							<tr>
								<td class="yhzt_y04_01">&nbsp;<span class="history_phase">20161213050</span>&nbsp
								</td>
								<td class="yhzt_y04_01"><font color="red"><span
										class="history_date">14:21</span></font></td>
								<td class="yhzt_y04_02"><span class="history_number">
										7&nbsp;&nbsp;0&nbsp;&nbsp;3&nbsp;&nbsp;4&nbsp;&nbsp;3 </span></td>
							</tr>
							<tr>
								<td class="yhzt_y04_01">&nbsp;<span class="history_phase">20161213050</span>&nbsp
								</td>
								<td class="yhzt_y04_01"><font color="red"><span
										class="history_date">14:21</span></font></td>
								<td class="yhzt_y04_02"><span class="history_number">
										7&nbsp;&nbsp;0&nbsp;&nbsp;3&nbsp;&nbsp;4&nbsp;&nbsp;3 </span></td>
							</tr>
							<tr>
								<td class="yhzt_y04_01">&nbsp;<span class="history_phase">20161213050</span>&nbsp
								</td>
								<td class="yhzt_y04_01"><font color="red"><span
										class="history_date">14:21</span></font></td>
								<td class="yhzt_y04_02"><span class="history_number">
										7&nbsp;&nbsp;0&nbsp;&nbsp;3&nbsp;&nbsp;4&nbsp;&nbsp;3 </span></td>
							</tr>
							<tr>
								<td class="yhzt_y04_01">&nbsp;<span class="history_phase">20161213050</span>&nbsp
								</td>
								<td class="yhzt_y04_01"><font color="red"><span
										class="history_date">14:21</span></font></td>
								<td class="yhzt_y04_02"><span class="history_number">
										7&nbsp;&nbsp;0&nbsp;&nbsp;3&nbsp;&nbsp;4&nbsp;&nbsp;3 </span></td>
							</tr>
							<tr>
								<td class="yhzt_y04_01">&nbsp;<span class="history_phase">20161213050</span>&nbsp
								</td>
								<td class="yhzt_y04_01"><font color="red"><span
										class="history_date">14:21</span></font></td>
								<td class="yhzt_y04_02"><span class="history_number">
										7&nbsp;&nbsp;0&nbsp;&nbsp;3&nbsp;&nbsp;4&nbsp;&nbsp;3 </span></td>
							</tr>
							<tr>
								<td class="yhzt_y04_01">&nbsp;<span class="history_phase">20161213050</span>&nbsp
								</td>
								<td class="yhzt_y04_01"><font color="red"><span
										class="history_date">14:21</span></font></td>
								<td class="yhzt_y04_02"><span class="history_number">
										7&nbsp;&nbsp;0&nbsp;&nbsp;3&nbsp;&nbsp;4&nbsp;&nbsp;3 </span></td>
							</tr>
							<tr>
								<td class="yhzt_y04_01">&nbsp;<span class="history_phase">20161213050</span>&nbsp
								</td>
								<td class="yhzt_y04_01"><font color="red"><span
										class="history_date">14:21</span></font></td>
								<td class="yhzt_y04_02"><span class="history_number">
										7&nbsp;&nbsp;0&nbsp;&nbsp;3&nbsp;&nbsp;4&nbsp;&nbsp;3 </span></td>
							</tr>
							<tr>
								<td class="yhzt_y04_01">&nbsp;<span class="history_phase">20161213050</span>&nbsp
								</td>
								<td class="yhzt_y04_01"><font color="red"><span
										class="history_date">14:21</span></font></td>
								<td class="yhzt_y04_02"><span class="history_number">
										7&nbsp;&nbsp;0&nbsp;&nbsp;3&nbsp;&nbsp;4&nbsp;&nbsp;3 </span></td>
							</tr>
					</table>
				</li>
			</ul>


			<ul class="yhzt_y02">
				<li class="yhzt_y02_bt"><h2 style="margin-left: 35px;">中奖喜报</h2></li>
				<li class="yhzt_y02_nr">
					<div id="newWinerMq">
						<ul>
							<li>中奖喜报加载中…</li>
						</ul>
					</div>
				</li>
			</ul>

		</div>

	</div>
	<form id="formh8" name="formh8" method="post" target="_blank">
		<input type="hidden" id="expectlistsuc1" name="expectlistsuc1">
		<input type="hidden" id="beishulistsuc1" name="beishulistsuc1"
			value="1"> <input type="hidden" id="expectlistsuc2"
			name="expectlistsuc2"> <input type="hidden"
			id="beishulistsuc2" name="beishulistsuc2"> <input
			type="hidden" id="expectlistsuc3" name="expectlistsuc3"> <input
			type="hidden" id="beishulistsuc3" name="beishulistsuc3"> <input
			type="hidden" id="expectlistsuc4" name="expectlistsuc4"> <input
			type="hidden" id="beishulistsuc4" name="beishulistsuc4"> <input
			type="hidden" id="playcode" name="playcode" value="3x"> <input
			type="hidden" id="allmoney" name="allmoney" value=""> <input
			type="hidden" id="expectnum" name="expectnum" value=""> <input
			type="hidden" id="Zhuihao" name="Zhuihao" value=""> <input
			type="hidden" id="expectlistsuc" name="expectlistsuc" value="">
		<input type="hidden" id="beishulistsuc" name="beishulistsuc" value="">
		<input type="hidden" id="codes" name="codes" value=""> <input
			type="hidden" id="buyExpect" name="buyExpect" value=""> <input
			type="hidden" id="playtypeid" name="playtypeid" value=""> <input
			type="hidden" id="zhushunum" name="zhushunum" value=""> <input
			type="hidden" id="ZjCut" name="ZjCut" value="">
	</form>

	</div>
	</div>

	<script>
	function updateOmitValue(omitValue) {
		// alert(omitValue);
		omitValue = eval("(" + omitValue + ")");
		
		var arr = new Array();
		arr[5] = 'ge';
		arr[4] = 'shi';
		arr[3] = 'bai';
		arr[2] = 'qian';
		arr[1] = 'wan';
		arr[0] = '';
		for (var i = 0; i <= 5; i++) {
		$('#tr_yl_' + i).children('.yl_1').each(function(j) {
			var val = omitValue[arr[i]][j];
			// alert(val);
			var html;
			if (val >= 20) {
				html = '<font color="red">' + val + '</font>';
			} else {
				html = val;
			}
			$(this).html(html);
			
		});
			
		}
	}
	
	var omitValue = '{"all":{"0":"0","11":"101429","1":"1","2":"2","3":"0","4":"0","5":"2","6":"0","7":"1","8":"4","9":"4","10":"101429"},"bai":{"0":"32","11":"101429","1":"1","2":"37","3":"0","4":"7","5":"15","6":"16","7":"2","8":"11","9":"4","10":"101429"},"ge":{"0":"12","11":"101429","1":"3","2":"7","3":"4","4":"0","5":"15","6":"6","7":"8","8":"19","9":"16","10":"101429"},"qian":{"0":"0","11":"101429","1":"22","2":"17","3":"4","4":"6","5":"2","6":"8","7":"1","8":"21","9":"11","10":"101429"},"shi":{"0":"23","11":"101429","1":"8","2":"2","3":"42","4":"10","5":"5","6":"0","7":"7","8":"4","9":"14","10":"101429"},"wan":{"0":"0","11":"101429","1":"3","2":"8","3":"1","4":"5","5":"12","6":"2","7":"4","8":"17","9":"26","10":"101429"}}';
	updateOmitValue(omitValue);
</script>

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