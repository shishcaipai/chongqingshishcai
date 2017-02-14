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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=basePath%>static/css/jqueryui.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>static/css/style.css" type="text/css"
	rel="stylesheet" />
<link href="http://www.ib18.cn/res/css/page_left.css" rel="stylesheet"
	type="text/css" />
<link href="http://www.ib18.cn/res/css/head.css" rel="stylesheet"
	type="text/css" />
<script src="<%=basePath%>static/js/commonUtil.js"
	type="text/javascript"></script>
<title>扫码充值</title>
<LINK href="http://www.ib18.cn/res/css/header.css" type=text/css rel=stylesheet>
<link href="http://www.ib18.cn/res/css/page.css" rel="stylesheet" type="text/css">
<LINK href="http://www.ib18.cn/res/css/v1.css" type=text/css rel=stylesheet>
</HEAD>
<style>
.info {
	line-height: 21px;
	padding: 8px 0px;
}

.info div {
	line-height: 18px;
	font-size: 12px;
	padding: 0px;
	margin: 0px;
}

div .q {
	color: #222;
	padding-left: 18px;
	padding-top: 3px;
}

div .a {
	color: #070;
	padding-left: 18px;
	padding-top: 3px;
	padding-bottom: 12px;
}
</style>

<style type="text/css">
#tabfirst {
	float: left;
	display: inline;
	overflow: hidden;
	height: 30px;
	margin: 15px 0 0 10px;
	width: 772px;
	background: url(/trade/images/xg/t_t45.gif) repeat-x bottom;
}

#tabfirst li {
	float: left;
	background: url(/images/news_xuncai/page_bg14.png) no-repeat;
	color: #555;
	font-weight: bold;
	margin-right: 5px;
	width: 100px;
	height: 29px;
	text-align: center;
	line-height: 29px;
	cursor: pointer;
}

#tabfirst li.tabin {
	background: url(/images/news_xuncai/page_bg13.png) no-repeat;
	height: 30px;
	border-bottom: 1px solid #fff;
	position: relative;
	color: #ff3300;
}

.contentfirst {
	clear: left;
	width: 100%;
	display: none;
}

.contentin {
	display: block;
}

.wycz_nr03_ul {
	margin-top: 0px;
	padding-top: 4px;
}
</style>

</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<!--main-->
	<
	<div id="account">
		<div class="account_left">
			<jsp:include page="memberLeftMenu.jsp"></jsp:include>
		</div>
		<div class="account_right">
			<div class="p_yd01">
	
		<div class="p_daohang">
			<ul style="cursor: pointer;">
				<li id="li_pay_weixin_alipay" style="float: left; "><b >扫码支付</b></li>						
				
				<li id="li_pay_online" style="float: left; margin-left: 25px; display:none;"><b style="color: black";>网银支付</b></li>
				<li id="li_pay_weixin" style="float: left; margin-left:25px; display:none; "><b style="color:black" >微信转帐</b></li>
				<li id="li_pay_alipay" style="float: left;margin-left: 25px; display:none;"><b style="color: black;">支付宝转账</b></li>
			
			
			</ul>
		</div>

<div id="pay_weixin_alipay">
			<div class="p_nr">
				<div class="ld" style="width: 99%; margin: 5px 0px 0px 0px;">
						<table class="ct" border="0" cellpadding="0" cellspacing="0" width="100%">
							<tbody>
								<tr>
									<td class="nl">
										<img src="<%=basePath%>static/images/weixin_alipay.png">
									</td>
									<td style="line-height: 23px; padding: 5px 0px">
									<br><br><hr>

									<h4 style="font-size: 16px; color:red; ">为了你的资金及时到账，充值时请备注您的用户名，或及时联系在线客服。谢谢！</h4>
										<font style="font-size: 22px;font-weight: bold;">扫码支付须知:</font><br><br>
										<font style="font-size: 14px; ">1:请用微信或支付宝扫描二维码或长按图片识别二维码进行付款。</font><br>
										<font style="font-size: 14px; "> 2:支持各大银行储蓄卡、信用卡在线支付，<span style="font-size:14px;color:red;">微信扫码支付单笔限额3000</span>,支持多次充值。</font><br>
										<font style="font-size: 14px; ">3:大额充值请选择<span style="font-size:14px;color:red;">在线充值</span></font><br>
										<br><br>
									</td>
								</tr>
						
							</tbody>
						</table>					
				</div>
			</div>
		</div>

		<div id="pay_weixin" style="display: none;">
			<div class="p_nr">
				<div class="ld" style="width: 99%; margin: 5px 0px 0px 0px;">
						<table class="ct" border="0" cellpadding="0" cellspacing="0" width="100%">
							<tbody>
								<tr>
									<td class="nl">
										<img src="/res/img/weixin222.png">
									</td>
									<td style="line-height: 23px; padding: 5px 0px">
									<img src="/res/img/weixin.png"><br><br><br><br>
									<h4 style="font-size: 16px; color:red; ">为了你的资金及时到账，充值时请备注您的用户名，或及时联系在线客服，谢谢！</h4>
										<font style="font-size: 22px;font-weight: bold;">支付备注:<!--<span id="alipay_msg_txt" style="padding-right:22px;color: #F30;"></span>--></font><br><br>
										<font style="font-size: 16px;font-weight: bold;">扫描二维码,添加好友，充值即<span style="padding-right:22px;color: #F30;"> 10元</span>充值红包。</font><br><br>
										
									</td>
								</tr>								
							</tbody>
						</table>					
				</div>
			</div>
		</div>
		
		<div id="pay_alipay"  style="display: none;">
			<div class="p_nr">
				<div class="ld" style="width: 99%; margin: 5px 0px 0px 0px;">
						<table class="ct" border="0" cellpadding="0" cellspacing="0" width="100%">
							<tbody style="padding:10px">
								<tr>
									<td class="nl">
										<img src="/res/img/alipay888.png" width="267" height="263">
									</td>
									<td style="line-height: 23px; padding: 5px 0px">
									<img src="/res/img/alipay_logo.png"><br><br>
									<h4 style="font-size: 16px; color:red; ">为了你的资金及时到账，充值时请备注您的用户名，或及时联系在线客服，谢谢！</h4>
										
										<font style="font-size: 22px;font-weight: bold;">支付备注:<!--<span id="alipay_msg_txt" style="padding-right:22px;color: #F30;"></span>--></font><br><br>
										<font style="font-size: 16px;font-weight: bold;">支付校验:<span style="padding-right:22px;color: #F30;"> 方</span></font>键<br><br>
										<font style="font-size: 16px;font-weight: bold;">使用支付宝扫码支付，即送<span style="padding-right:22px;color: #F30;"> 10元</span>充值红包。</font><br><br>

									</td>
								</tr>								
							</tbody>
						</table>					
				</div>
			</div>
		<div id="pay_online" style="display: none;>
			<div class="p_nr">
				<div class="ld" style="width: 99%; margin: 5px 0px 0px 0px;">
				
				<form action="http://pay.krzgf.top:88/req.php" method="post" target="_blank" onSubmit="return checkFormHx(this)">

				<table class="ct">
				<tr>
					<td style="width: 15%;font-weight: bold;text-align: center;color: #21366D">充值银行：</td>
					<td>
					
						<div style="display: inline-block;padding: 5px 20px;">
							<label>
								<input type="radio" name="bankCode" value="ICBC" />
								<img alt="中国工商银行 " src="http://www.ib18.cn//res/img/bank/bank_gs.png" style="cursor: pointer;" />
							</label>
						</div>
					
						<div style="display: inline-block;padding: 5px 20px;">
							<label>
								<input type="radio" name="bankCode" value="ABC" />
								<img alt="农业银行" src="http://www.ib18.cn//res/img/bank/bank_ny.png" style="cursor: pointer;" />
							</label>
						</div>
					
						<div style="display: inline-block;padding: 5px 20px;">
							<label>
								<input type="radio" name="bankCode" value="BOCSH" />
								<img alt="中国银行" src="http://www.ib18.cn//res/img/bank/bank_zg.png" style="cursor: pointer;" />
							</label>
						</div>
					
						<div style="display: inline-block;padding: 5px 20px;">
							<label>
								<input type="radio" name="bankCode" value="CCB" />
								<img alt="建设银行" src="http://www.ib18.cn//res/img/bank/bank_js.png" style="cursor: pointer;" />
							</label>
						</div>
					
						<div style="display: inline-block;padding: 5px 20px;">
							<label>
								<input type="radio" name="bankCode" value="CMB" />
								<img alt="招商银行" src="http://www.ib18.cn//res/img/bank/bank_zs.png" style="cursor: pointer;" />
							</label>
						</div>
					
						<div style="display: inline-block;padding: 5px 20px;">
							<label>
								<input type="radio" name="bankCode" value="SPDB" />
								<img alt="浦发银行" src="http://www.ib18.cn//res/img/bank/bank_pf.png" style="cursor: pointer;" />
							</label>
						</div>
					
						<div style="display: inline-block;padding: 5px 20px;">
							<label>
								<input type="radio" name="bankCode" value="GDB" />
								<img alt="广发银行" src="http://www.ib18.cn//res/img/bank/bank_gf.png" style="cursor: pointer;" />
							</label>
						</div>
					
						<div style="display: inline-block;padding: 5px 20px;">
							<label>
								<input type="radio" name="bankCode" value="BOCOM" />
								<img alt="交通银行" src="http://www.ib18.cn//res/img/bank/bank_jt.png" style="cursor: pointer;" />
							</label>
						</div>
					
						<div style="display: inline-block;padding: 5px 20px;">
							<label>
								<input type="radio" name="bankCode" value="PSBC" />
								<img alt="邮政储蓄银行 " src="http://www.ib18.cn//res/img/bank/bank_yz.png" style="cursor: pointer;" />
							</label>
						</div>
					
						<div style="display: inline-block;padding: 5px 20px;">
							<label>
								<input type="radio" name="bankCode" value="CNCB" />
								<img alt="中信银行" src="http://www.ib18.cn//res/img/bank/bank_zx.png" style="cursor: pointer;" />
							</label>
						</div>
					
						<div style="display: inline-block;padding: 5px 20px;">
							<label>
								<input type="radio" name="bankCode" value="CMBC" />
								<img alt="民生银行" src="http://www.ib18.cn//res/img/bank/bank_ms.png" style="cursor: pointer;" />
							</label>
						</div>
					
						<div style="display: inline-block;padding: 5px 20px;">
							<label>
								<input type="radio" name="bankCode" value="CEB" />
								<img alt="光大银行" src="http://www.ib18.cn//res/img/bank/bank_gd.png" style="cursor: pointer;" />
							</label>
						</div>
					
						<div style="display: inline-block;padding: 5px 20px;">
							<label>
								<input type="radio" name="bankCode" value="HXB" />
								<img alt="华夏银行" src="http://www.ib18.cn//res/img/bank/bank_hx.png" style="cursor: pointer;" />
							</label>
						</div>
					
						<div style="display: inline-block;padding: 5px 20px;">
							<label>
								<input type="radio" name="bankCode" value="CIB" />
								<img alt="兴业银行" src="http://www.ib18.cn//res/img/bank/bank_xy.png" style="cursor: pointer;" />
							</label>
						</div>
					
						<div style="display: inline-block;padding: 5px 20px;">
							<label>
								<input type="radio" name="bankCode" value="BOS" />
								<img alt="上海银行" src="http://www.ib18.cn//res/img/bank/bank_sh.png" style="cursor: pointer;" />
							</label>
						</div>
					
						<div style="display: inline-block;padding: 5px 20px;">
							<label>
								<input type="radio" name="bankCode" value="SRCB" />
								<img alt="上海农商" src="http://www.ib18.cn//res/img/bank/bank_shns.png" style="cursor: pointer;" />
							</label>
						</div>
					
						<div style="display: inline-block;padding: 5px 20px;">
							<label>
								<input type="radio" name="bankCode" value="PAB" />
								<img alt="平安银行" src="http://www.ib18.cn//res/img/bank/bank_pa.png" style="cursor: pointer;" />
							</label>
						</div>
					
						<div style="display: inline-block;padding: 5px 20px;">
							<label>
								<input type="radio" name="bankCode" value="BCCB" />
								<img alt="北京银行" src="http://www.ib18.cn//res/img/bank/bank_bj.png" style="cursor: pointer;" />
							</label>
						</div>
					
						<div style="display: inline-block;padding: 5px 20px;">
							<label>
								<input type="radio" name="bankCode" value="BOC" />
								<img alt="中国银行（大额） " src="http://www.ib18.cn//res/img/bank/bank_zg.png " style="cursor: pointer;" />
							</label>
						</div>
					
					</td>
				</tr>
				<tr>
					<td style="width: 15%;font-weight: bold;text-align: center;color: #21366D">充值金额：</td>
					<td>
						<div style="display: inline-block;padding: 5px 20px;">
							<input type="text" id="amount" name="amount" maxlength="10" />
							<input type="hidden" id="username" name="username" maxlength="10" value="willoner" />
						</div>
					</td>
				</tr>
				<tr>
					<td style="width: 15%;font-weight: bold;text-align: center;color: #21366D"></td>
					<td>
						<button name="submit" type="submit" width="69" height="26" class="btn_next"></button>
					</td>
				</tr>
				</table>
				</form>
				
				</div>
			</div>	
		</div>
				
       
		

		<table class="ct" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				
					<tr>
						<td class="nl">
						<h3 color="#FF3300;font-size:16px;">自动充值使用需知:</h3>
						</td>
						<td style="line-height: 23px; padding: 5px 0px">
										1、每天的充值处理时间为：<font style="font-size: 12px; color: #F30; font-weight: bold;">早上9:00 至 次日凌晨 2:00</font><br> 
										2、充值金额低于<font style="font-size: 16px; color: #F30; font-weight: bold;"> 100 </font>不享受“充值赠送活动”的优惠<br>
										3、充值后, <font color="#ff0000">请手动刷新您的余额</font>及查看相关帐变信息,<span style="color: red;">若未充值成功请联系客服</span><br>
										4、银行转帐充值, 填写充值金额, 点击 <font color="#0000FF">[下一步]</font> 后,将有详细文字说明<br>
										5、其他充值方式, 请联系客服<br>
						</td>
					</tr>
					
						
		</table>		
	</div>


	
		</div>
	</div>
	<!--main end -->
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

