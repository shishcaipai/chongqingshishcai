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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=basePath%>static/new/css/page_left.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>static/new/css/head.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>static/new/css/page.css" type="text/css"
	rel="stylesheet">
<link href="<%=basePath%>static/css/jqueryui.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>static/css/style.css" type="text/css"
	rel="stylesheet" />
<script src="<%=basePath%>static/js/commonUtil.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="<%=basePath%>static/js/jquery-1.7.2.min.js"></script>
<title>我要提款</title>
</head>

<body>
	<jsp:include page="../header2.jsp"></jsp:include>
	<div class="header clearfix">
		<jsp:include page="../header3.jsp"></jsp:include>
		<!--main-->
		<div id="account">
			<div class="account_left">
				<jsp:include page="memberLeftMenu.jsp"></jsp:include>
			</div>
			<div class="account_right">
				<div class="tc_yhzx_k">
					<p>
						<h4>注意： 为了您的资金能及时到账，提款前请仔细核对你银行卡账号与姓名</h4>
					</p>
					<div class="p_nr">

						<table border="0" cellspacing="0" cellpadding="0"
							class="table_u_all">
							<tr>
								<td class="tikuan_a2"><span class="zlxg_red">*</span>用户名：</td>
								<td class="tikuan_a3"><SPAN class=zlxg_red>${sessionScope.memberUser.userName}</SPAN></td>
							</tr>
							<tr>
								<td class="tikuan_a2">提现到:</td>
								<td class="tikuan_a3"><input type="radio" id="cardType"
									name="cardType" value='1' checked  onchange="zfbbank(1)"/>支付宝<input type="radio"
									id="cardType" name="cardType" value='2' onchange="zfbbank(2)"/>银行卡</td>
							</tr>
        
							<tr >
								<td  class="tikuan_a2">
								<div id="zfb1"><span class="zlxg_red">支付宝帐号：</span>
								</div>
								<div id="bank1" style="display:none;"><span class="zlxg_red">银行卡帐号：</span></td>
								</div>
								<td class="tikuan_a3" >
								<div id="zfb2">${sessionScope.memberUser.zfbCode}&nbsp;</div>
								
									<div id="bank2" style="display:none;">${sessionScope.memberUser.bankCode}&nbsp;</div>
									</td>
								
							</tr>

							<tr>
								<td align="right" class="tikuan_a2"><span class="zlxg_red"></span>提款人姓名：</td>
								<td class="tikuan_a3">${sessionScope.memberUser.realName}</td>
							</tr>

							<tr>
								<td align="right" class="tikuan_a2">提款金额：</td>
								<td class="tikuan_a3"><input id="applyMoney" type="text"
									class="zlxg_srk" size="35" /> 元&nbsp;&nbsp; <span
									class="orange"> 账户可提取金额：${memberUser.availableScore} 元</span></td>
							</tr>
							<tr>
								<td class="tikuan_a2"><span class="zlxg_red">*</span>提款密码：</td>
								<td class="tikuan_a3"><input class="zlxg_srk"
									id="withdrawPassword" name="drawPwd" type="password" size="10"
									maxlength="20"> <span class="zlxg_red">初始提款密码为888888</span></td>
							</tr>
						</table>

						<div
							style="float: left; width: 772px; padding-left: 40px; padding-top: 8px;">
							<p style="padding-left: 130px;">
								<input type="image" src="<%=basePath%>static/images/tk.png"
									onclick="applyMoney()" />
							</p>
						</div>
						<div class="alarm fn_clear">
							<br></br> <br></br>
							<p>
								<h4>提款需知：:</h4>
							</p>
							1.提款手续费是根据不同银行的标准资费由银行扣除，本网站不会收取您任何提款费用。
							</p>
							<p>2.除法定节假日外，周一至周五全天处理提款。</p>
							<p>3.每日5万以下提款22:00之前申请提款财务在当日处理，22:00之后申请提款财务次日处理。</p>
							<p>
								4.每日5万以上提款17:00之前申请提款财务在当日处理，17:00之后申请提款财务次日处理。(22:00点之前可以通知客服加急处理当天到账)
							</p>
							<p>5.每笔提款申请，最低提款金额为50元；当您的账户资金低于50元时，则无法进行提款。</p>
							<p>6.节假日因用户开户行填写格式有误或银行系统处理不及时导致的延误，最迟在假期后的第一个工作日内到账</p>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!--main end -->

	<div class="opacity">
		<div class="dialog">
			<div class="diatitle">
				<em>提示</em>
			</div>
			<div class="diabox">提示信息</div>
		</div>
	</div>

	<script type="text/javascript">
		//验证正整数

		function isNumber(oNum) {

			if (!oNum)
				return false;

			var strP = /^\d+$/; //正整数

			if (!strP.test(oNum))
				return false;

			return true;

		}

		function applyMoney() {
			var cardType = $("input[name='cardType']:checked").val();
			var applyMoney = $("#applyMoney").val();
			var withdrawPassword = $("#withdrawPassword").val();
			 if (withdrawPassword == "") {
				alert("请输入提款密码", '提示');
				return false;
			} else if (applyMoney == "") {
				alert("提款金额不能为空!", '提示');
				return false;
			} else if (isNumber(applyMoney) == false) {
				alert("请输入正整数", '提示');
				return false;
			} else {
				$.ajax({
							type : "post",
							url : "${pageContext.request.contextPath}/money/apply/save",
							dataType : "json",
							data : {
								"cardType" : cardType,
								"withdrawPassword" : withdrawPassword,
								"applyMoney" : applyMoney
							},
							success : function(data) {
								if (data.sucess) {
									alert("申请提款成功!");
									window.location.reload();
								} else {
									alert(data.msg, '提示');
								}

							}
						});
			}
		}
		function zfbbank(id){
			var trs1 = $("#zfb1"); 
			var trs3 = $("#zfb2"); 
			var trs2 = $("#bank1");
			var trs4 = $("#bank2"); 
			if(id==2){
				trs1.attr("style","display:none;");
				trs2.attr("style","display:block;"); 	
				trs3.attr("style","display:none;");
				trs4.attr("style","display:block;"); 	
			}else{
				trs2.attr("style","display:none;");
				trs1.attr("style","display:block;"); 	
				trs4.attr("style","display:none;");
				trs3.attr("style","display:block;"); 
			}
			
		}
		
	</script>

</body>
</html>

