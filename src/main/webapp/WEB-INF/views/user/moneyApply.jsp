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
		<script src="<%=basePath %>static/js/commonUtil.js" type="text/javascript"></script>
		<title>我要提款</title>
	</head>

	<body>
		<jsp:include page="../header.jsp"></jsp:include>
		<jsp:include page="../banner.jsp"></jsp:include>
		<!--main-->
		<div class="main fn_clear user">
			<div class="wrap">

				<jsp:include page="memberLeftMenu.jsp"></jsp:include>

				<div class="userbox">

					<div class="modelu">
						<div class="title">
							<em>我要提款</em>
						</div>

						<div class="tabt">
							<cite>提款人信息</cite>
						</div>

						<div class="mdbox">
							<div class="serbox serbox2">
								<div class="addin">
									请认真核实提款信息，错误的信息会造成提款失败。
									<a href="#">完善并确认个人信息</a>
								</div>
								<table cellpadding="6" cellspacing="6" class="tb2">
									<tr>
										<td align="right">
											提款人姓名：
										</td>
										<td>
											<input type="text" id="applyName" class="inp3" size="35" />
										</td>
									</tr>
									<tr>
										<td>
											提款人身份证号：
										</td>
										<td>
											<input type="text" id="idCardNo" class="inp3" size="35" />
										</td>
									</tr>
								</table>
							</div>
						</div>

						<div class="tabt">
							<cite>提款申请</cite>
						</div>

						<div class="mdbox">
							<div class="serbox serbox2">
								<table cellpadding="6" cellspacing="6" class="tb2">
									<tr>
										<td align="right">
											开户银行：
										</td>
										<td>
											<select id="bankCode" style="width: 140px">
												<option value="">
													请选择银行
												</option>
												<c:forEach var="bank" items="${requestScope.bankList }">
													<option value="${bank.code }">
														${bank.name }
													</option>
												</c:forEach>
											</select>
											&nbsp;&nbsp;
											<span class="gray">此银行卡开户人必须和上述真实姓名一致！</span>
										</td>
									</tr>
									<tr>
										<td align="right">
											银行卡号：
										</td>
										<td>
											<input type="text" id="bamkCardNo" class="inp3" size="35" />
										</td>
									</tr>

									<tr>
										<td align="right">
											提款金额：
										</td>
										<td>
											<input id="applyMoney" type="text" class="inp3" size="35" />
											元&nbsp;&nbsp;
											<span class="orange"> 账户可提取金额：￥0.0元</span>
										</td>
									</tr>
								</table>
							</div>

							<p style="padding-left: 130px;">
								<input type="image" src="<%=basePath%>static/images/tk.png"
									onclick="applyMoney()" />
							</p>

						</div>

						<div class="alarm fn_clear">
							<h4>
								说明:
							</h4>
							<p>
								1、本站周一至周五每日处理提款（法定节日除外）；您在当日16点前申请提款，我们会在当日为您处理；您在当日16点后申请提款，我们会在次日为您处理。
								<span class="orange">仅支持借记卡提款</span>
							</p>
							<p>
								2、一般情况下，提款后1-3个工作日内到账，视各银行转账处理时长而定；
							</p>
							<p>
								3、每笔提款申请,最低提款金额为10元；
							</p>
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
		<!--main end -->
		<jsp:include page="../footer.jsp"></jsp:include>

		<div class="opacity">
			<div class="dialog">
				<div class="diatitle">
					<em>提示</em>
				</div>
				<div class="diabox">
					提示信息
				</div>
			</div>
		</div>

		<script type="text/javascript">
  //验证正整数

	function isNumber(oNum){
	
	  if(!oNum) return false;
	
	  var strP=/^\d+$/; //正整数
	
	  if(!strP.test(oNum)) return false;
	
	  return true;
	
	}

  

  function applyMoney(){
  
    var idCardNo=$("#idCardNo").val();
    var applyName=$("#applyName").val();
    var bankCode=$("#bankCode").val();
    var bamkCardNo=$("#bamkCardNo").val();
    var applyMoney=$("#applyMoney").val();
    
    if(applyName == ""){
    	custom_alert("提款人姓名不能为空!",'提示');
      return false;
    }else if(idCardNo == ""){
    	custom_alert("提款人身份证号码不能为空!",'提示');
      return false;
    }else if(bankCode == ""){
    	custom_alert("请选择开户银行!",'提示');
      return false;
    }else if(bamkCardNo == ""){
    	custom_alert("银行卡账号不能为空!",'提示');
      return false;
    }else if(applyMoney == ""){
    	custom_alert("提款金额不能为空!",'提示');
       return false;
    }else if(isNumber(applyMoney) == false){
    	custom_alert("请输入正整数",'提示');
       return false;
    }
    else{
         $.ajax({  
		        type : "post",  
		        url : "${pageContext.request.contextPath}/money/apply/save",  
		        dataType:"json",  
		        data:{
		           "idCardNo":idCardNo,
		           "applyName":applyName,
		           "bankCode":bankCode,
		           "bamkCardNo":bamkCardNo,
		           "applyMoney":applyMoney
		        },
		        success : function(data) {
		           if(data.sucess){
		        	   custom_alert("申请提款成功!",'提示');
                        alert("申请提款成功!");
                        window.location.reload();
		           }else{
		        	   custom_alert(data.msg,'提示');
		           }
		          
		        }  
		    });
    }
  }
  
  $(document).ready(function(){
		$("#moneyApplyMenu").addClass("hover");
  });

</script>

	</body>
</html>

