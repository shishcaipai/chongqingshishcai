<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0042)http://cc.77qiu.com/Trade/cqssc/cqssc.html -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>广东十一选五</title>
<meta name="description" content="十一运">
<meta name="keywords" content="十一运">
<link href="<%=basePath%>static/css/commonEX.css" type="text/css" rel="stylesheet">
<link href="http://www.ld3j.com/res/css/frequency.css" type="text/css" rel="stylesheet">
<script src="<%=basePath%>static/js/Jquery_marquee_frequency.js" type="text/javascript"></script>
<script src="<%=basePath%>static/js/zhs.js" type="text/javascript"></script>
<script src="<%=basePath%>static/js/Method2.js" type="text/javascript"></script>
<script src="<%=basePath%>static/js/Betting2.js" type="text/javascript"></script>
<script src="<%=basePath%>static/js/public.vbs"></script>
<script src="<%=basePath%>static/js/loading.js" type="text/javascript"></script>
</head>
<body><div id="div_company_mini" style="display: none; position: fixed; right: 0px; bottom: 0px; width: 403px; height: 378px; overflow: hidden; z-index: 10089; cursor: move;"><div id="hz6d_cname_mini_div" style="font-size:16px;overflow:hidden;position:absolute;top:7px;left:10px;width:330px;height:20px;color:#fff;text-indent:30px;background:url(http://www11.53kf.com/style/chat/minichat2/img/minchat_ns_1.png) -79px 0 no-repeat;font-weight:bold;font-family:Arial;">好运相随</div><div title="缩小" mini_narrow="缩小" mini_recover="还原" max_min="max" style="position:absolute;top:10px;right:46px;width:12px;height:12px;background:url(http://www11.53kf.com/style/chat/minichat2/img/min.png?11) no-repeat; cursor:pointer;" onclick="max_min_company_mini(this);"></div><div title="切换到正常窗口" style="position:absolute;top:10px;right:28px;width:12px;height:12px;background:url(http://www11.53kf.com/style/chat/minichat2/img/maxto.gif) no-repeat; cursor:pointer;" onclick="max_from_company_mini(this);"></div><div title="关闭" style="position:absolute;top:10px;right:10px;width:12px;height:12px;background:url(http://www11.53kf.com/style/chat/minichat2/img/minchat_ns_1.png) -18px 0 no-repeat;cursor:pointer;" onclick="close_company_mini();"></div><div id="mini_header_bg_div" style="position:static;width:403px;height:35px;background:url(http://www11.53kf.com/style/chat/minichat2/img/header_bg_1.png?111) no-repeat;"></div><div id="iframe_company_mini_div" style="width:100%;height:100%;"><iframe id="iframe_company_mini" frameborder="0" width="100%" height="100%"></iframe></div></div><div id="kfivtwin" style="display: none; overflow: visible;"><div id="acc_title" class="Lelem" minheight="100" minwidth="100" maxheight="400" maxwidth="400" style="position: relative; z-index: 10000; overflow: visible;"><div class="Lelem" type="img" style="display: block; cursor: default; position: absolute; top: 64px; left: 5px; z-index: 10001; width: 390px; height: 196px;"><img style="width: 390px; height: 196px;" src="http://www11.53kf.com/style/setting/ver06/img/icon/logo-skin/common_bg_inv/commonbg_3.png"></div><div style="display: block; cursor: default; position: absolute; top: 73px; left: 19px; z-index: 10002; width: 106px; height: 22px; color: rgb(255, 255, 255);" type="text" class="Lelem"><span style="vertical-align: top; font-size: 15.4px; line-height: 22px; color: rgb(255, 255, 255); font-family: 宋体;" iseditable="1">53KF在线客服</span></div><div style="display: block; cursor: pointer; position: absolute; top: 70px; left: 358px; z-index: 10003; width: 22px; height: 24px;" onclick="onliner_zdfq=3;hidden_ivt();;" type="img" class="Lelem"><img src="http://www11.53kf.com/style/setting/ver06/img/icon/logo-skin/close_btn/closebtn_2.png" style="width: 22px; height: 24px;"></div><div style="display: block; cursor: default; position: absolute; top: 104px; left: 14px; z-index: 10004; width: 125px; height: 139px;" type="img" class="Lelem"><img src="http://www11.53kf.com/style/setting/ver06/img/icon/logo-skin/other_img/otherimg_11.png" style="width: 125px; height: 139px;"></div><div style="display: block; cursor: default; position: absolute; top: 103px; left: 163px; z-index: 10005; width: 139px; height: 41px;" type="text" class="Lelem"><span style="vertical-align: top; font-size: 28.7px;" iseditable="1">欢迎咨询</span></div><div style="display: block; cursor: default; position: absolute; top: 147px; left: 162px; z-index: 10006; width: 227px; height: 17px;" type="text" class="Lelem"><span style="vertical-align: top; font-family: 宋体; font-size: 12px;" iseditable="1">53KF.com，感谢大家的支持！</span></div><div style="display: block; cursor: default; position: absolute; top: 167px; left: 164px; z-index: 10007; width: 192px; height: 17px;" type="text" class="Lelem"><span style="vertical-align: top; font-family: 宋体; font-size: 12px;" iseditable="1">请问有什么可以帮您？</span></div><div class="Lelem" type="img" onclick="onliner_zdfq=2;hz6d_is_exist(&quot;window.open(%22http%3A%2F%2Fwww11.53kf.com%2FwebCompany.php%3Farg%3D10145634%26style%3D1%26kflist%3Doff%26kf%3D%26zdkf_type%3D1%26language%3Dzh-cn%26charset%3Dgbk%26username%3D%26userinfo%3D%26introurl%3D%26lyurl%3D%26lytype%3D0%26copartner%3D%26referer%3Dhttp%253A%252F%252Fwww.ib18.cn%252FlotteryType%253Fid%253D8%26keyword%3Dhttp%253A%252F%252Fwww.ib18.cn%252Flogin%26brief%3D%26logo%3D%26question%3D%26uid%3D2e7d649d16935cf1628867f589afa9d4%26tfrom%3D2%22%2C%22_blank%22%2C%22height%3D473%2Cwidth%3D703%2Ctop%3D200%2Cleft%3D200%2Cstatus%3Dyes%2Ctoolbar%3Dno%2Cmenubar%3Dno%2Cresizable%3Dyes%2Cscrollbars%3Dno%2Clocation%3Dno%2Ctitlebar%3Dno%22)&quot;);hidden_ivt();;" style="display: block; cursor: pointer; position: absolute; top: 199px; left: 162px; z-index: 10008; width: 118px; height: 37px;"><img style="width: 118px; height: 37px;" src="http://www11.53kf.com/style/setting/ver06/img/icon/logo-skin/click_btn/clickbtn_10.png"></div><div style="display: block; cursor: pointer; position: absolute; top: 237px; left: 18px; z-index: 10009; width: 101px; height: 17px;" type="text" class="Lelem"><a href="http://www.53kf.com" target="_blank" style="text-decoration:none;cursor:pointer;"><span style="vertical-align: top; font-size: 10px; line-height: 17px; color: rgb(138, 131, 126); font-family: 宋体;" iseditable="1">这是什么工具？</span></a></div><div style="display: block; cursor: pointer; position: absolute; top: 236px; left: 293px; z-index: 10010; width: 101px; height: 17px;" type="text" class="Lelem"><a href="http://www.53kf.com" target="_blank" style="text-decoration:none;cursor:pointer;"><span style="vertical-align: top; font-size: 10px; line-height: 17px; color: rgb(138, 131, 126); font-family: 宋体;" iseditable="1">Powered by 53KF</span></a></div></div></div><div id="kfivteffect" style="display: none; position: absolute; width: 0px; height: 0px; overflow: hidden; border: 1px solid rgb(27, 136, 208); z-index: 10087; background: rgb(214, 238, 253);"></div><iframe id="kfiframe" src="" frameborder="0" scrolling="no" style="display: none; overflow: hidden;"></iframe><div id="iconDiv1" style="height: auto; width: auto;"><iframe style="position:absolute;z-index:7998;width:0px;height:0px;top:0px;left:0px;" frameborder="0"></iframe></div>
<!--头部开始-->

<link href="<%=basePath%>static/css/head.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="<%=basePath%>static/images/favicon.new.ico">
<script src="ajaxfileupload.jsajaxfileupload.js" type="text/javascript"></script>

<script src="<%=basePath%>static/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<jsp:include page="../header2.jsp"></jsp:include>
	<div class="header clearfix">
		<jsp:include page="../header3.jsp"></jsp:include>
<script src="<%=basePath%>static/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
var SysSecond; 
var InterValObj; 
var isError = false;
$(document).ready(function() { 
	 // var starttime = $("#dateEnd").html().replace(/-/g, "/");
	 /* var starttime = '2017/02/15 10:57:50';
	 var startmm = parseInt(new Date(starttime).getTime());
	 var nowmm = parseInt(new Date().getTime()); */
	 // SysSecond = (startmm - nowmm)/1000; //这里获取倒计时的起始时间 (秒)
	 // SysSecond -= 1;
	 SysSecond = ${leftsecond};
	 // SysSecond = 10;
	 if(SysSecond > 0 && !isError) {
		 var lotteryActive = "true";
		 if (lotteryActive == 'true') {
	   		InterValObj = window.setInterval(SetRemainTime, 1000); //间隔函数，1秒执行
		 } else {
			 $("#RemainSecond").html('暂停销售');
		 }
	 }
});


	function initPage() {
		var lotteryTypeId = "8";
		$.ajax({
			url : "http://www.ld3j.com/lotteryType/getLotteryInfo",
			dataType : "text",
			async : false,
			data : {
				"lotteryTypeId" : lotteryTypeId,
				t : Math.random()
			},
			success : function(data) {
				try {
					data = eval('(' + data + ')');
				} catch (error) {
					isError = true;
					alert("会话超时，请重新登陆");
					window.location = '';
				}
				isError = false;
				// 可选期号
				initZhPhases(data);
				// 定时器
				initTimer(data);
				// 当前期号
				initCurrentPhase(data);
				$('#tbshowtozhuexpect tr:eq(0) td:eq(0) input[type=checkbox]').trigger('click');
				SetTozhuExpect();
				$('#tbshowtozhuexpect tr:eq(1)').remove();
				if ($('#tbshowtozhuexpect tr:eq(0) td:eq(0) input[type=checkbox]').attr('checked') != 'checked') {
					$('#tbshowtozhuexpect tr:eq(0) td:eq(0) input[type=checkbox]').trigger('click');	
				}
				SetTozhuExpect();
			},
			error : function(data) {
				// alert("服务器异常" + data);
				isError = true;
				window.location = '';
			}
		});	
	}
	
	function initZhPhases(data) {
		var currentPhase = data.phases[0].phase;
		// $('#tbshowtozhuexpect tr:eq(0) td:eq(0)').html(currentPhase + "期");
		// $('#tbshowtozhuexpect tr:eq(0) td:eq(0) input[type=checkbox]').attr('checked', false);
		
		//$('#tbshowtozhuexpect tr:eq(0) td:eq(0) input[type=checkbox]').trigger('click');
		//$('#tbshowtozhuexpect tr:eq(1)').remove();
		
		// Check_Show_BeiShu_Even();
		
	}
	
	function initTimer(data) {
		/* var starttime = data.remainDate;
		var startmm = parseInt(new Date(starttime).getTime());
		var nowmm = parseInt(new Date().getTime()); */
		//SysSecond = (startmm - nowmm)/1000; //这里获取倒计时的起始时间 (秒)
		//SysSecond -= 1;
		// SysSecond = 10;
		// SetRemainTime();
		SysSecond = data.remainSeconds;
	}
	
	function initCurrentPhase(data) {
		var currentPhase = data.phases[0].phase;
		$('#headCurrentPhase').text(currentPhase);
		$('input[currentPhase=currentPhase]').val(currentPhase);
		$('span[currentPhase=currentPhase]').html(currentPhase);
		$('#currentPhase2').html(currentPhase);
		// alert("currentPhase = " + currentPhase);
		// alert($('#lastPhase').html());
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
<!--

//-->


<script>
	
</script>
<ul class="yh_tz01">
	<li class="yh_tz02"><img src="http://www.ib18.cn/res/img/11x5.png" width="57" height="57"></li>
	<li class="yh_tz03">
		<div><h2>广东11选5</h2></div>
		<div>
			每天84期,每10分钟一期<br>
			<span id="kjsj"></span>
		</div>
	</li>
	<li class="yh_tz04">
		<div id="dateEnd" style="display:none">2017-02-15 10:57:50</div>
		<div class="yh_tz05">
			<span id="activeexpectshow">第<font color="#FF3300"><b><span id="buyExpectShow"><span id="headCurrentPhase">${current}</span></span></b></font>期 </span><br>
		</div>
		<div class="xxxx_01">
			<span class="t_tz05">离投注截止还有</span>
			<span id="RemainSecond"></span>
		</div>
	</li>
	<!-- <li class="yh_tz06">
		<a href="#">彩票资讯</a>&nbsp;|&nbsp;<a href="#">全国开奖</a>&nbsp;|&nbsp;<a href="#">玩法介绍</a>
	</li> -->
</ul>
    <!--最新中奖和彩种 结束-->
	
    <!--投注主体 开始-->
		<div class="t_tz09">
			<table class="t_tz10" border="0" cellspacing="0" cellpadding="0">
				<tbody><tr>
					<td class="adtd02">
						<a href="javascript:;" class="menu1 menu2" value="1">任选复式</a>
								<a href="javascript:;" class="menu1" value="2">任选单式</a>
								<a href="javascript:;" class="menu1" value="3">任选胆拖</a>
								<a href="javascript:;" class="menu1" value="4">前三投注</a>
								<a href="javascript:;" class="menu1" value="5">前二投注</a>
                                
					</td>
				</tr>
			</tbody></table>
		</div>
			
    	<div class="Betting">
            <table class="t_tz15" cellpadding="0" cellspacing="0" border="0">
            	<tbody>
                    <tr>
                        <td class="adtd04">
                        	<span id="sytz" style="display: inline;">
                            	<span id="c1" style="display: inline;"><input type="radio" name="radiobutton" value="1">选一</span>
                                <span id="c2"><input type="radio" name="radiobutton" value="2">选二</span>
                                <span id="c3"><input type="radio" name="radiobutton" value="3">选三</span>
                                <span id="c4"><input type="radio" name="radiobutton" value="4">选四</span>
                                <span id="c5"><input type="radio" name="radiobutton" value="5">选五</span>
                                <span id="c6" style="display: inline;"><input type="radio" name="radiobutton" value="6">选六</span>
                                <span id="c7" style="display: inline;"><input type="radio" name="radiobutton" value="7">选七</span>
                                <span id="c8" style="display: inline;"><input type="radio" name="radiobutton" value="8">选八</span>
                            </span>
                            <span id="fstz" style="display: none;">直选：
                            	<span id="3xfs"><input type="radio" name="radiobutton" value="9">复式</span>
                                <span id="3xds"><input type="radio" name="radiobutton" value="11">单式</span>&nbsp;&nbsp;&nbsp;&nbsp;组选：
                                <span id="3xzxfs"><input type="radio" name="radiobutton" value="12">复式</span>
                                <span id="3xzxds"><input type="radio" name="radiobutton" value="13">单式</span>
                            </span>
                            <span id="2xfstz" style="display: none;">直选：
                            	<span id="2xfs"><input type="radio" name="radiobutton" value="14">复式</span>
                                <span id="2xds"><input type="radio" name="radiobutton" value="15">单式</span>&nbsp;&nbsp;&nbsp;&nbsp;组选：
                                <span id="2xzxfs"><input type="radio" name="radiobutton" value="16">复式</span>
                                <span id="2xzxds"><input type="radio" name="radiobutton" value="17">单式</span>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td class="t_tz16"><span class="t_tz17"></span><font color="#666666"><span id="zhexplain1">（至少选择1个号码投注，选号与开奖号码第1位一致即中奖<font color="red">18</font>元。）</span></font></td>
                    </tr>
                    <tr>
                        <td class="adtd06">
                        	<div class="touzhu_kuang">
                        	<!--任选复式 开始-->
                        	<table id="numtb" cellspacing="0" cellpadding="0" width="100%" border="0" class="numtbTable" style="display: table;">
                        	<tbody>
                        		<tr>
                                    <td class="line_b1 cs_042" align="center" valign="top" width="62"><br>号码<br><br><font color="#2255aa" id="div_yl_1">遗漏</font></td>
                                    <td class="line_b1" style="padding-left:5px">
                                        <table border="0">
                                        <tbody>
                                        	<tr id="tr_vote_1">
                                                <td class="ball_r">01</td>
                                                <td class="ball_r">02</td>
                                                <td class="ball_r">03</td>
                                                <td class="ball_r">04</td>
                                                <td class="ball_r">05</td>
                                                <td class="ball_r">06</td>
                                                <td class="ball_r">07</td>
                                                <td class="ball_r">08</td>
                                                <td class="ball_r">09</td>
                                                <td class="ball_r">10</td>
                                                <td class="ball_r">11</td>
                                                <td width="10">&nbsp;</td>
                                                <td>
                                                	<span class="pointer">全</span>
                                                	<span class="pointer">大</span>
                                                    <span class="pointer">小</span>
                                                    <span class="pointer">奇</span>
                                                    <span class="pointer">偶</span>
                                                    <span class="pointer">清</span>
                                                 </td>
                                        	</tr>
                                        	<tr id="tr_yl_1">
                                                <td class="yl_1">0</td>
                                                <td class="yl_1">2</td>
                                                <td class="yl_1">0</td>
                                                <td class="yl_1">0</td>
                                                <td class="yl_1">0</td>
                                                <td class="yl_1">4</td>
                                                <td class="yl_1">0</td>
                                                <td class="yl_1">1</td>
                                                <td class="yl_1">2</td>
                                                <td class="yl_1">3</td>
                                                <td class="yl_1">1</td>
                                                <td colspan="2">&nbsp;</td>
                                        	</tr>
                                        </tbody>
                                    	</table>
                                    </td>
                                </tr>
                        	</tbody>
                        	</table>
                        	<!--任选复式 结束-->
                                                        
                            <!--单式 开始-->
							<table id="numtc" cellspacing="0" cellpadding="0" width="100%" border="0" class="numtbTable" style="display: none;">
                        	<tbody>
                                <tr>
									<td>
 										<!--<table border="0" cellspacing="0" cellpadding="0">
                                        <tbody>
                                			<tr>
												<td width="70" height="25"><b>单式上传:</b></td>
											    <td width="309"><IFRAME id=ProPic name=ProPic src="upload.asp" frameBorder=0  width="100%" scrolling=no height=24></IFRAME></td>
                                			</tr>
                                        </tbody>
                                        </table>-->  
									</td>
                                </tr>
                                <tr>
									<td class="geshi">【提醒】直接在下面框中输入或粘贴投注内容，最多输入400注。<a id="gsexplain" href="/Trade/syy/Xml/dg/r1.txt" style="color:#06c" target="_blank"><!-- 查看标准格式样本 --></a><br>
                                        <table cellpadding="0 " width="100%" border="0">
                                        <tbody>
                                            <tr>
                                                <td width="311"><textarea name="pastecontent" rows="8" cols="42" id="pastecontent"></textarea></td>
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
                            
                            <!--胆拖投注 开始-->
                        	<table id="numtb_dt" cellspacing="0" cellpadding="0" width="100%" border="0" class="numtbTable" style="display: none;">
                        	<tbody>
                        		<tr>
                                    <td class="line_b1 cs_042" style="background:none;" align="center" valign="top" width="62"><br>胆码<br></td>
                                    <td>
                                        <table style="margin-left:5px;">
                                        <tbody>
                                        	<tr id="tr_vote_2">
                                                <td class="ball_r">01</td>
                                                <td class="ball_r">02</td>
                                                <td class="ball_r">03</td>
                                                <td class="ball_r">04</td>
                                                <td class="ball_r">05</td>
                                                <td class="ball_r">06</td>
                                                <td class="ball_r">07</td>
                                                <td class="ball_r">08</td>
                                                <td class="ball_r">09</td>
                                                <td class="ball_r">10</td>
                                                <td class="ball_r">11</td>
                                                <td id="dtinfo_1"><font color="red">（0＜胆码个数＜2）</font></td>
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
                                                <td colspan="2">&nbsp;</td>
                                        	</tr>
                                        </tbody>
                                    	</table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="line_b1 cs_042" style="background:none;line-height:16px;" align="center" valign="top" width="62"><br>拖码</td>
                                    <td>
                                        <table style="margin-left:5px;" id="bdnumtwo">
                                        <tbody>
                                        	<tr id="tr_vote_3">
                                        		<td class="ball_r">01</td>
                                                <td class="ball_r">02</td>
                                                <td class="ball_r">03</td>
                                                <td class="ball_r">04</td>
                                                <td class="ball_r">05</td>
                                                <td class="ball_r">06</td>
                                                <td class="ball_r">07</td>
                                                <td class="ball_r">08</td>
                                                <td class="ball_r">09</td>
                                                <td class="ball_r">10</td>
                                                <td class="ball_r">11</td>
                                                <td id="dtinfo_2"><font color="red">（3 ≤胆码＋拖码）</font></td>
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
                                                <td colspan="2">&nbsp;</td>
                                        	</tr>
                                        </tbody>
                                    	</table>
                                    </td>
                                </tr>
                            </tbody>
                            </table>
                            <!--胆拖投注 结束-->
                            
                            <!--三行号码 开始-->
                        	<table id="numta" cellspacing="0" cellpadding="0" border="0" class="numtbTable" style="display: none; margin-left: 8px;">
                        	<tbody>
                        		<tr>
                                    <td class="line_b1 cs_042" align="center" valign="top" width="62"><br>第一位<br><br><font color="#2255aa" id="div_yl_1">遗漏</font></td>
                                    <td class="line_b1" style="padding-left:5px">
                                        <table border="0">
                                        <tbody>
                                        	<tr id="tr_vote_4">
                                                <td class="ball_r">01</td>
                                                <td class="ball_r">02</td>
                                                <td class="ball_r">03</td>
                                                <td class="ball_r">04</td>
                                                <td class="ball_r">05</td>
                                                <td class="ball_r">06</td>
                                                <td class="ball_r">07</td>
                                                <td class="ball_r">08</td>
                                                <td class="ball_r">09</td>
                                                <td class="ball_r">10</td>
                                                <td class="ball_r">11</td>
                                                <td width="10">&nbsp;</td>
                                                <td>
                                                	<span class="pointer">全</span>
                                                	<span class="pointer">大</span>
                                                    <span class="pointer">小</span>
                                                    <span class="pointer">奇</span>
                                                    <span class="pointer">偶</span>
                                                    <span class="pointer">清</span>
                                                 </td>
                                        	</tr>
                                        	<tr id="tr_yl_4">
                                                <td class="yl_1">11</td>
                                                <td class="yl_1">2</td>
                                                <td class="yl_1">0</td>
                                                <td class="yl_1"><font color="red">39</font></td>
                                                <td class="yl_1">13</td>
                                                <td class="yl_1">14</td>
                                                <td class="yl_1"><font color="red">34</font></td>
                                                <td class="yl_1">4</td>
                                                <td class="yl_1"><font color="red">23</font></td>
                                                <td class="yl_1">6</td>
                                                <td class="yl_1">3</td>
                                                <td colspan="2">&nbsp;</td>
                                        	</tr>
                                        </tbody>
                                    	</table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="line_b1 cs_042" align="center" valign="top" width="62"><br>第二位<br><br><font color="#2255aa" id="div_yl_1">遗漏</font></td>
                                    <td class="line_b1" style="padding-left:5px">
                                        <table border="0">
                                        <tbody>
                                        	<tr id="tr_vote_5">
                                                <td class="ball_r">01</td>
                                                <td class="ball_r">02</td>
                                                <td class="ball_r">03</td>
                                                <td class="ball_r">04</td>
                                                <td class="ball_r">05</td>
                                                <td class="ball_r">06</td>
                                                <td class="ball_r">07</td>
                                                <td class="ball_r">08</td>
                                                <td class="ball_r">09</td>
                                                <td class="ball_r">10</td>
                                                <td class="ball_r">11</td>
                                                <td width="10">&nbsp;</td>
                                                <td>
                                                	<span class="pointer">全</span>
                                                	<span class="pointer">大</span>
                                                    <span class="pointer">小</span>
                                                    <span class="pointer">奇</span>
                                                    <span class="pointer">偶</span>
                                                    <span class="pointer">清</span>
                                                 </td>
                                        	</tr>
                                        	<tr id="tr_yl_2">
                                                <td class="yl_1">3</td>
                                                <td class="yl_1">6</td>
                                                <td class="yl_1">10</td>
                                                <td class="yl_1">2</td>
                                                <td class="yl_1">9</td>
                                                <td class="yl_1"><font color="red">25</font></td>
                                                <td class="yl_1">0</td>
                                                <td class="yl_1">15</td>
                                                <td class="yl_1">13</td>
                                                <td class="yl_1">12</td>
                                                <td class="yl_1">4</td>
                                                <td colspan="2">&nbsp;</td>
                                        	</tr>
                                        </tbody>
                                    	</table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="line_b1 cs_042" align="center" valign="top" width="62"><br>第三位<br><br><font color="#2255aa" id="div_yl_1">遗漏</font></td>
                                    <td class="line_b1" style="padding-left:5px">
                                        <table border="0">
                                        <tbody>
                                        	<tr id="tr_vote_6">
                                                <td class="ball_r">01</td>
                                                <td class="ball_r">02</td>
                                                <td class="ball_r">03</td>
                                                <td class="ball_r">04</td>
                                                <td class="ball_r">05</td>
                                                <td class="ball_r">06</td>
                                                <td class="ball_r">07</td>
                                                <td class="ball_r">08</td>
                                                <td class="ball_r">09</td>
                                                <td class="ball_r">10</td>
                                                <td class="ball_r">11</td>
                                                <td width="10">&nbsp;</td>
                                                <td>
                                                	<span class="pointer">全</span>
                                                	<span class="pointer">大</span>
                                                    <span class="pointer">小</span>
                                                    <span class="pointer">奇</span>
                                                    <span class="pointer">偶</span>
                                                    <span class="pointer">清</span>
                                                 </td>
                                        	</tr>
                                        	<tr id="tr_yl_3">
                                                <td class="yl_1">1</td>
                                                <td class="yl_1">7</td>
                                                <td class="yl_1">13</td>
                                                <td class="yl_1">5</td>
                                                <td class="yl_1">0</td>
                                                <td class="yl_1">4</td>
                                                <td class="yl_1">6</td>
                                                <td class="yl_1">3</td>
                                                <td class="yl_1">2</td>
                                                <td class="yl_1">10</td>
                                                <td class="yl_1">11</td>
                                                <td colspan="2">&nbsp;</td>
                                        	</tr>
                                        </tbody>
                                    	</table>
                                    </td>
                                </tr>
                        	</tbody>
                        	</table>
                        	<!--三行号码 结束-->
</div>
                            <table border="0" cellspacing="0" cellpadding="0" class="t_tz18">
                            <tbody>
                            	<tr>
                                	<td>
										<div style="line-height: 40px;margin-left: 150px;">
											<!-- 
											<b style="display: inline-block;float: left;">
		                                		已选择：<span id="temp_select_zhushu" style="color: red;">0</span> 注，共：<span id="temp_select_money" style="color: red;">0</span> 元
											</b>
											 -->
											<input type="button" id="button_add" name="button_add" class="button_add pointer" value="" style="display: inline-block;margin-left: 10px;">
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
<td width="90" height="28" align="left" valign="top"><input type="button" id="btn_jixuan1" name="btn_jixuan1" class="button1" value="机选一注"></td>
</tr>
<tr>
<td width="90" height="28" align="left" valign="top"><input type="button" id="btn_jixuan5" name="btn_jixuan5" class="button1" value="机选五注"></td>
</tr>
<tr>
<td width="90" height="28" align="left" valign="top"><input type="button" id="btn_jixuan10" name="btn_jixuan10" class="button1" value="机选十注"></td>
</tr>
<tr>
<td width="90" height="28" align="left" valign="top"><input type="button" id="btn_delline" name="btn_delline" class="button1" value="删除选号"></td>
</tr>
<tr>
<td width="90" height="28" align="left" valign="top"><input type="button" id="btn_clearall" name="btn_clearall" class="button1" value="清空投注"></td>
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
<p> 单倍注数：<span id="zhushushow2" class="bold red2">0</span>，金额：<font color="red">￥</font><span id="moneyshow2" class="bold red2">0</span>元，期数：<span id="expectnumshow" class="bold red2">1</span>，总金额：<font color="red">￥</font><span id="moneyshow3" class="bold red2">0</span>元
<span id="lotteryTypeId" style="display:none;">8</span>
<span id="phase" style="display:none;" currentphase="currentPhase">17021513</span>
</p>
								</div>
								<input type="button" id="btn_SubmitZ" name="btn_SubmitZ" value="&nbsp;&nbsp;">&nbsp;
								<input type="button" id="btn_SubmitHM" name="btn_SubmitHM" value="&nbsp;&nbsp;"><br>
								
<!--<table width="0" border="0">
  <tr>
    <td valign="middle"><input type="checkbox" checked="checked" name="confirmxy"></td>
    <td valign="middle">我已阅读了<a style="color:#555;" id="userxieyi" href="/../../help/hmxy.asp" class="Black">《用户合买代购协议》</a>并同意其中条款</td>
  </tr>
</table>
-->
                                </td>
                                </tr>
                            </tbody>
                            </table>				
							
                            <table class="t_tz20" border="0" cellpadding="0" cellspacing="0">
                            <tbody>
								<tr>
								<td>
								
									<table width="0" border="0" class="touzhu_zh">
									  <tbody><tr>
										<td><input type="checkbox" name="IsZhuihao" id="IsZhuihao" onclick="ChangeStatus()"></td>
										<td>追号&nbsp;&nbsp;</td>
										<td><input disabled="disabled" type="checkbox" name="ZjStop" value="1" id="ZjStop"></td>
										<td>中奖后停止追号</td>
									  </tr>
									</tbody></table>

                                </td>
                                </tr>
								  <script language="javascript">
                                         function ChangeStatus()
                                        {
										  if (document.getElementById('IsZhuihao').checked == true)
											{   document.getElementById('zuihao').style.display = ""; }
										
										  if (document.getElementById('IsZhuihao').checked == false)
											{   document.getElementById('zuihao').style.display = "none"; }

                                        }
                                        </script>
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
.btab {clear: both;font-weight: 100;width: 100%;}
.btab table {font-size: 12px;font-weight:bold;}
.btab table th{background: url("http://www.cp114.com/images/frequency/gp_89.gif") repeat-x scroll transparent; text-align:center;}
.bta {overflow-x: hidden;overflow-y:scroll;width: 100%;height: 279px; }
.bta table {background: none repeat scroll 0 0 #f9f6fc;color: #555555;font-size: 12px;width: 710px;}
.bta table tbody td {border-right: 1px solid #FFFFFF;border-top: 1px solid #FFFFFF;height: 27px;text-align: center;}
.height12{height:172px}
#btDiv .beitou_z {height: 28px;overflow: hidden;padding-top: 10px;width: 100%;background: url("http://www.cp114.com/images/frequency/bg2.png") repeat-x scroll 0 -831px transparent;;}
#btDiv .beitou_z label {float: left;font-size: 12px;line-height: 24px;margin-left: 10px;}
#btDiv .beitou_z select {float: left;width: 189px;}
#btDiv .beitou_z input {float: left;margin-left: 5px;width: 58px;}
#btDiv .beitou_z span {float: left;font-size: 12px;line-height: 24px;margin-left: 3px;}
.jsuan {height: 140px;width: 100%;background: url("http://www.cp114.com/images/frequency/bg2.png") repeat-x scroll 0 -1309px #fff;}
.jsuan .tjan { float: left; width: 440px;}
.jsuan .tjan p {font-size: 12px;height: 28px;line-height: 28px;text-indent: 10px;}
.jsuan .tjan p .input_06 {background: none repeat scroll 0 0 #FFFFFF;border: 1px solid #DDDDDD;height: 16px;width: 40px;}
.jsuan .jsqr {background: url("http://www.cp114.com/images/frequency/gp_124.gif") no-repeat scroll 0 50px transparent;float: left; height: 120px;width: 260px;}
.jsuan .jsqr input {border: 0 none;cursor: pointer;height: 39px;margin: 45px 0 15px 80px;width: 125px;background: url("http://www.ib18.cn/res/img/jsuan.png") no-repeat;}
.jsuan .jsqr p {font-size: 12px;text-align: center;}
.jsuan .jsqr p span {color: #DE4500;}
</style>    
                             <div id="btDiv" style="display:none">
                                <div class="beitou_z">
                                      <label>起始期：</label>
                                  <!--   <select id="btStartList" name="select"> </select>-->
                                     <select id="btStartList" name="Adigit"> </select>
                                      <label>我要追</label>
                                      <input type="text" value="5" maxlength="4" size="4" id="btIssueNum" name="sq">
                                      <span>期</span>          
                                </div>
                                <div class="jsuan">
                              
                                    <div class="tjan">
                                        <p>
                                          <label>起始倍数： </label>
                                          <input type="text" value="1" class="input_06" style="width:45px;" name="sb" maxlength="6" id="btStartMultiple">
                                          <label> 最大倍投不超过</label>
                                          <input type="text" style="width:50px;" value="100" class="input_06" name="sbMax" id="btMaxMultiple">
                                          <label> 倍 单倍奖金：</label>
                                          <input type="text" class="input_06" name="dj" id="btBonus" maxlength="6" size="6" value="">
                                          <label> 元</label>
                                        </p>
                                        <p><strong>收益率设置</strong></p>
                                        <p>
                                          <input type="radio" name="rdoWinCondition" value="1" checked="checked">
                                          <label>全程收益：</label>
                                          <input type="text" value="30" maxlength="6" size="6" class="input_06" name="NumInput2" id="allMargin"> 
                                          <label> %</label>
                                        </p>
                                        <p>
                                          <input type="radio" name="rdoWinCondition" value="2">
                                          <label>前 </label>
                                          <input type="text" value="10" maxlength="6" size="6" class="input_06" name="NumInput2" id="preIssueNum" disabled="">
                                          <label> 期收益率：</label>
                                          <input type="text" value="10" class="input_06" name="NumInput2" id="preMargin" disabled="">
                                          <label> %，之后收益率</label>
                                          <input type="text" value="5" class="input_06" name="NumInput2" id="afterMargin" disabled="">
                                          <label>%</label>
                                        </p>
                                        <p>
                                          <input type="radio" name="rdoWinCondition" value="3">
                                          <label>累积收益不低于 </label>
                                          <input type="text" value="100" class="input_06" style="width:50px;" name="NumInput2" id="minMoney" disabled="">
                                          <label> 元</label>
                                        </p>
                                    </div>
                                    <div class="jsqr">
                                        <input type="button" name="Input3" id="btnCalc">
                                        <p>(期数：<span id="btIssueCount" class="red">0</span>期，总投入：<span id="btInvestment" class="red">0</span>元，总收益：<span id="btRevenue" class="red">0</span>元) </p>
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
    <!--投注主体 结束--><script src="/jquery-ui/jquery-1.5.1.min.js" type="text/javascript" language="javascript"></script>
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
#tabfirst_01 li{float:left; display:inline;text-align:center; line-height:27px;width:34px; height:27px; margin-top:9px; margin-left:10px; color:#333; cursor:pointer;}
#tabfirst_01 li.tabin_01{ background:url(http://www.ib18.cn/res/img/yh14_34.png) no-repeat; color:#275fb6;}
#newWinerMq ul {width: 238px;font-size: 14px;color: #333;}
#newWinerMq ul>li {float: left;padding: 5px;width: 228px;}
#newWinerMq ul>li>span {float: left;margin-right: 8px;}
#newWinerMq ul>li>span:first-child {text-align: left;}
#newWinerMq ul>li>span:last-child {margin: 0px;color: red;}
</style>
<script src="http://www.ib18.cn/res/js/jquery-1.7.2.min.js" type="text/javascript"></script> 
<script src="http://www.ib18.cn/res/js/jquery.marquee.js" type="text/javascript"></script> 
<script type="text/javascript">
$(document).ready(function() {
	var lotteryTypeId = "8";

	queryHistoryDrawNumbers();
	drawNumber();
	zjxb();
	
	function queryHistoryDrawNumbers() {
		$.ajax({
			url : "<%=basePath%>gdsyxw/gdsyxwhistroy",
			dataType : "json",
			data : {
				"lotteryTypeId" : lotteryTypeId,
				t : Math.random()
			},
			success : function(data2) {
				data2 = eval(data2);
				var firstPhase = data2.gdsyxwReturn[0].periodNumber;
				var lastPhase = $('#lastPhase').text();
				
				if (firstPhase == lastPhase) {
					// don't need to update
				} else {
					$('#lastPhase').text(data2.gdsyxwReturn[0].periodNumber);					
					$('#qssj').text(data2.gdsyxwReturn[0].opentime);
					$('#winnumber').text(data2.gdsyxwReturn[0].lotteryPeriod);
					
			    	drawNumber();
				
					$('#CodeListTable > tbody > tr:eq(0)').find('.history_phase').text(data2.gdsyxwReturn[0].periodNumber);
					$('#CodeListTable > tbody > tr:eq(0)').find('.history_date').text(data2.gdsyxwReturn[0].opentime.substring(10,16));
					$('#CodeListTable > tbody > tr:eq(0)').find('.history_number').text(data2.gdsyxwReturn[0].lotteryPeriod);
					var d = new Date(data2.gdsyxwReturn[0].opentime);
					if (d && d.getHours()) {
						$('#CodeListTable > tbody > tr:eq(0)').find('.history_date').text(d.getHours() + ":" + d.getMinutes());
					}
					
					$('#CodeListTable > tbody > tr:gt(0)').each(function(i){
						var tr = $(this);
						var p = data2.gdsyxwReturn[i + 1];
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

//测试用，写死的数据
function today() {
	$("#tab_box_01").hide();
	var oldContent = $("#tab_box_02").html();
	$("#tab_box_02").html('加载中...');
	
	var lotteryTypeId = "8";
	$.ajax({
		url : "http://www.ib18.cn/lotteryType/getTodayTopPrize",
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
				li += '<span class="yh_phb_02">' + data[i].username + '</span>';
				if (i < 3) {
					li += '<span class="yh_phb_03" style="color:red;"><b>' + parseFloat(data[i].prize).toFixed(2) + '</b>&nbsp;</span>';
				} else {
					li += '<span class="yh_phb_03"><b>' + parseFloat(data[i].prize).toFixed(2) + '</b>&nbsp;</span>';
				}
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
		<li class="yhzt_y02_bt"><h2 style="margin-left: 35px;">广东11选5 历史开奖</h2></li>
		<li class="yhzt_y02_nr">
			<ul class="yhzt_y03">
				<li class="yhzt_y03_01">
					<p>
					第 <span id="activeexpectshow1"><span id="buyExpectShow"><span id="lastPhase"></span></span></span> 期开奖<br>
					开奖时间：<span id="qssj">2017-02-15 10:52:08</span>
					</p>
				</li>
				<li class="yhzt_y03_02" id="kjhm">&nbsp;&nbsp;<span id="winnumber"></span></li>
			</ul>
			<table width="0" border="0" cellspacing="0" cellpadding="0" class="yhzt_y04" id="CodeListTable">
				<thead>
				  <tr>
					<td class="yhzt_y04_01">期号</td>
                    <td class="yhzt_y04_01">时间</td>
					<td class="yhzt_y04_02">号码</td>
				  </tr>
				 </thead>
				 <tbody>
				 
					 <tr>
						 <td class="yhzt_y04_01">&nbsp;<span class="history_phase">17021511</span>&nbsp;</td>
						 <td class="yhzt_y04_01">
						 <font color="red"><span class="history_date">10:52</span></font>
						 </td>
					 	<td class="yhzt_y04_02">
					 		<span class="history_number">
					 	03&nbsp;&nbsp;07&nbsp;&nbsp;05&nbsp;&nbsp;01&nbsp;&nbsp;04
					 	</span>
					 	</td>
					 </tr>
				 
				 
					 <tr>
						 <td class="yhzt_y04_01">&nbsp;<span class="history_phase">17021510</span>&nbsp;</td>
						 <td class="yhzt_y04_01">
						 <font color="red"><span class="history_date">10:42</span></font>
						 </td>
					 	<td class="yhzt_y04_02">
					 		<span class="history_number">
					 	03&nbsp;&nbsp;07&nbsp;&nbsp;01&nbsp;&nbsp;08&nbsp;&nbsp;11
					 	</span>
					 	</td>
					 </tr>
					 
				 
					 <tr>
						 <td class="yhzt_y04_01">&nbsp;<span class="history_phase">17021509</span>&nbsp;</td>
						 <td class="yhzt_y04_01">
						 <font color="red"><span class="history_date">10:32</span></font>
						 </td>
					 	<td class="yhzt_y04_02">
					 		<span class="history_number">
					 	02&nbsp;&nbsp;04&nbsp;&nbsp;09&nbsp;&nbsp;11&nbsp;&nbsp;01
					 	</span>
					 	</td>
					 </tr>
					 
				 
					 <tr>
						 <td class="yhzt_y04_01">&nbsp;<span class="history_phase">17021508</span>&nbsp;</td>
						 <td class="yhzt_y04_01">
						 <font color="red"><span class="history_date">10:22</span></font>
						 </td>
					 	<td class="yhzt_y04_02">
					 		<span class="history_number">
					 	11&nbsp;&nbsp;01&nbsp;&nbsp;08&nbsp;&nbsp;03&nbsp;&nbsp;10
					 	</span>
					 	</td>
					 </tr>
					 
				 
					 <tr>
						 <td class="yhzt_y04_01">&nbsp;<span class="history_phase">17021507</span>&nbsp;</td>
						 <td class="yhzt_y04_01">
						 <font color="red"><span class="history_date">10:12</span></font>
						 </td>
					 	<td class="yhzt_y04_02">
					 		<span class="history_number">
					 	08&nbsp;&nbsp;11&nbsp;&nbsp;06&nbsp;&nbsp;10&nbsp;&nbsp;05
					 	</span>
					 	</td>
					 </tr>
					 
			</tbody></table>
		</li>
	</ul>

	
	<ul class="yhzt_y02">
		<li class="yhzt_y02_bt"><h2 style="margin-left: 35px;">中奖喜报</h2></li>
		<li class="yhzt_y02_nr">
			<div id="newWinerMq" style="position: relative; width: 238px; height: 240px; overflow: hidden;">
				<ul>
							<li>中奖喜报加载中…</li>
						</ul>
			</div>
			<!--
			<marquee id="newWinerMq" onmouseover="this.stop()" onmouseout="this.start()" scrollamount="2" scrolldelay="20" direction="up" height="99%">
				<table cellspacing=5>
					<tbody></tbody>
				</table>
			</marquee>
			-->
		</li>
	</ul>
	
</div>

</div>
<form id="formh8" name="formh8" method="post" target="_blank">
    <input type="hidden" id="expectlistsuc1" name="expectlistsuc1" value="17021513">
    <input type="hidden" id="beishulistsuc1" name="beishulistsuc1" value="1">
    <input type="hidden" id="expectlistsuc2" name="expectlistsuc2">
    <input type="hidden" id="beishulistsuc2" name="beishulistsuc2">
    <input type="hidden" id="expectlistsuc3" name="expectlistsuc3">
    <input type="hidden" id="beishulistsuc3" name="beishulistsuc3">
     <!--2013-126-->
    <input type="hidden" id="expectlistsuc4" name="expectlistsuc4">
    <input type="hidden" id="beishulistsuc4" name="beishulistsuc4">
    <input type="hidden" id="playcode" name="playcode" value="c1">
    
    <input type="hidden" id="allmoney" name="allmoney" value="">
    <input type="hidden" id="expectnum" name="expectnum" value="">
    <input type="hidden" id="Zhuihao" name="Zhuihao" value="">
    <input type="hidden" id="expectlistsuc" name="expectlistsuc" value="">
    <input type="hidden" id="beishulistsuc" name="beishulistsuc" value="">
    <input type="hidden" id="codes" name="codes" value="">
    <input type="hidden" id="buyExpect" name="buyExpect" value="">
    <input type="hidden" id="playtypeid" name="playtypeid" value="">
    <input type="hidden" id="zhushunum" name="zhushunum" value="">
	<input type="hidden" id="ZjCut" name="ZjCut" value="">
</form>
<div class="clear"></div>
	
	<jsp:include page="../footer.jsp"></jsp:include>
</div>



<script>
function updateOmitValue(omitValue) {
		// alert(omitValue);
		omitValue = eval("(" + omitValue + ")");
		
		var arr = new Array();
		arr[5] = 'ge';
		arr[4] = 'wan';
		arr[3] = 'bai';
		arr[2] = 'qian';
		arr[1] = 'all';
		arr[0] = '';
		for (var i = 1; i <= 4; i++) {
			var t = i;
			$('#tr_yl_' + i).children('.yl_1').each(function(j) {
				j += 1;
				var val = omitValue[arr[t]][j];
				// alert(val);
				var html;
				if (val >= 20) {
					html = '<font color="red">' + val + '</font>';
				} else {
					html = val;
				}
				$(this).html(html);
				// tr_yl_5
				// alert($(this).html());
				// alert('parentId: ' + $(this).parent('tr').attr('id'));
				
			});
			
		}		
	}
	
	var omitValue = '{"all":{"0":"38918","11":"1","1":"0","2":"2","3":"0","4":"0","5":"0","6":"4","7":"0","8":"1","9":"2","10":"3"},"bai":{"0":"38918","11":"11","1":"1","2":"7","3":"13","4":"5","5":"0","6":"4","7":"6","8":"3","9":"2","10":"10"},"ge":{"0":"38918","11":"1","1":"2","2":"8","3":"16","4":"0","5":"4","6":"5","7":"12","8":"13","9":"24","10":"3"},"qian":{"0":"38918","11":"4","1":"3","2":"6","3":"10","4":"2","5":"9","6":"25","7":"0","8":"15","9":"13","10":"12"},"shi":{"0":"38918","11":"2","1":"0","2":"13","3":"3","4":"14","5":"10","6":"9","7":"17","8":"1","9":"34","10":"4"},"wan":{"0":"38918","11":"3","1":"11","2":"2","3":"0","4":"39","5":"13","6":"14","7":"34","8":"4","9":"23","10":"6"}}';
	updateOmitValue(omitValue);
</script>


