<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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

				<div class="p_nr">

					<table border="0" cellspacing="0" cellpadding="0"
						class="table_u_all">
						<tr>
							<td class="tikuan_a2"><span class="zlxg_red">*</span>用户名：</td>
							<td class="tikuan_a3"><SPAN class=zlxg_red>${sessionScope.memberUser.userName}</SPAN></td>
						</tr>
						<tr>
							<td class="tikuan_a2"><span class="zlxg_red"></span>支付宝帐号：</td>
							<td class="tikuan_a3"><input class="zlxg_srk" value="${sessionScope.memberUser.bankCode}"
								id="alipayNo" type="text" name="alipayNo"  />&nbsp;</td>
						</tr>
						<tr>
							<td align="right" class="tikuan_a2"><span class="zlxg_red"></span>提款人姓名：</td>
							<td  class="tikuan_a3"><input type="text" id="applyName" class="zlxg_srk" size="35" /></td>
						</tr>
						<tr>
							<td class="tikuan_a2">提款人身份证号：</td>
							<td class="tikuan_a3"><input type="text" id="idCardNo" class="zlxg_srk" size="35" /></td>
						</tr>
						<%-- <tr>
							<td align="right" class="tikuan_a2">开户银行：</td>
							<td class="tikuan_a3"><select id="bankCode" style="width: 140px">
								 	<option value="">请选择银行</option>
									<c:forEach var="bank" items="${requestScope.bankList }">
										<option value="${bank.code }">${bank.name }</option>
									</c:forEach>
							</select> &nbsp;&nbsp; <span class="gray">此银行卡开户人必须和上述真实姓名一致！</span></td>
						</tr>
						<tr>
							<td align="right" class="tikuan_a2">银行卡号：</td>
							<td class="tikuan_a3"><input type="text" id="bamkCardNo" class="zlxg_srk"
								size="35" /></td>
						</tr> --%>

						<tr>
							<td align="right" class="tikuan_a2">提款金额：</td>
							<td class="tikuan_a3"><input id="applyMoney" type="text" class="zlxg_srk"
								size="35" /> 元&nbsp;&nbsp; <span class="orange">
									账户可提取金额：${memberUser.availableScore} 元</span></td>
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
				   <br></br>
				   <br></br>
					  <p>
						<h4>说明:</h4>
						</p>
						<p>
							1、本站周一至周五每日处理提款（法定节日除外）；您在当日16点前申请提款，我们会在当日为您处理；您在当日16点后申请提款，我们会在次日为您处理。
							<span class="orange">仅支持借记卡提款</span>
						</p>
						<p>2、一般情况下，提款后1-3个工作日内到账，视各银行转账处理时长而定；</p>
						<p>3、每笔提款申请,最低提款金额为10元；</p>
						<p>
							4、提款手续费：提款手续费为银行及支付宝收取，费用由用户承担，从用户的账户提现后的余额中扣除。网银提款：提款金额小于2万元，每笔2元；大于或等于2万且小于5万元，每笔5元；大于或等于5万元的，每笔10元。
						</p>
						<p>
							5、异常提款处理：为了防范可能出现的利用信用卡套现和洗钱行为，保护用户的资金安全，针对购彩账户异常提款做出以下规定：累计消费金额（现金购买彩票成功的累计数）小于累计存入金额（不包含购彩中奖奖金）30%的账户的提款，须致电客服人工申请，同时，提款到账日自提出申请之日起，不少于15天。
						</p>
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

		    var idCardNo = $("#idCardNo").val();
			var applyName = $("#applyName").val();
			var bankCode = "ZFB";
			var bamkCardNo = $("#bamkCardNo").val();
			var applyMoney = $("#applyMoney").val();
			var withdrawPassword = $("#withdrawPassword").val();
			if (applyName == "") {
				alert("提款人姓名不能为空!", '提示');
				return false;
			} /* else if (idCardNo == "") {
				alert("提款人身份证号码不能为空!", '提示');
				return false;
			} */ else if (withdrawPassword == "") {
				alert("请输入提款密码", '提示');
				return false;
			} else if (bamkCardNo == "") {
				alert("银行卡账号不能为空!", '提示');
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
								"idCardNo" : idCardNo,
								"applyName" : applyName,
								"bankCode" : bankCode,
								"bamkCardNo" : bamkCardNo,
								"withdrawPassword":withdrawPassword,
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

		$(document).ready(function() {
			$("#moneyApplyMenu").addClass("hover");
		});
	</script>

</body>
</html>

