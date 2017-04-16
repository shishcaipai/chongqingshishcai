<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script src="<%=basePath%>static/js/commonUtil.js"
	type="text/javascript"></script>
<link href="<%=basePath%>static/new/css/page_left.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>static/new/css/head.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>static/new/css/page.css" type="text/css"
	rel="stylesheet" />
<title>银行信息</title>
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
			<div class="p_yd01">
				<div class="p_daohang">
					<ul>
						<li style="float: left;"><b>绑定银行卡</b></li>
						<li style="float: right;"></li>
					</ul>
				</div>

				<div class="tc_yhzx_k">

					<div class="p_nr">
						<input id="userName" type="hidden"
							value="${sessionScope.memberUser.userName}" />
						<p
							style="margin-bottom: 10px; padding: 10px; background: #f6f6f6;">
							绑定支付宝是您提款时的唯一账户，是资金提取的安全保证。 <span class="red">如需修改，请联系客服</span>
						</p>
						<%--  --%><c:choose>
						<%-- 	<c:when test="${empty memberUser.identityCard}">
								<p>
									您还未完善个人信息，请先 <a href="<%=basePath%>user/realNameInfo">实名认证</a>
								</p>
							</c:when> --%>
						<%-- 	<c:otherwise> --%>
								<table cellpadding="6" cellspacing="6" class="table_u_all">
									<tr>
										<td class="tikuan_a2" align="right">真实姓名：</td>
										<td class="tikuan_a3">${memberUser.realName}</td>
									</tr>
									<tr>
										<td class="tikuan_a2" align="right">支付宝账号：</td>
										<td class="tikuan_a3"><input id="zfbCode" type="text"
											class="zlxg_srk" size="30"
											<c:if test="${not empty memberUser.zfbCode}">readonly=\"readonly\"</c:if>
											value="${memberUser.zfbCode}" /><span class="gray">此支付宝账号必须和上述真实姓名一致！</span></td>
									</tr>
									<tr>
										<td class="tikuan_a2" align="right">银行名称：</td>
										<td class="tikuan_a3"><input id="bankName" type="text"
											class="zlxg_srk" size="30"
											<c:if test="${not empty memberUser.bankName}">readonly=\"readonly\"</c:if>
											value="${memberUser.bankName}" /></td>
									</tr>
									<tr>
										<td class="tikuan_a2" align="right">所在地城市：</td>
										<td class="tikuan_a3"><input id="city" type="text"
											class="zlxg_srk" size="30"
											<c:if test="${not empty memberUser.city}">readonly=\"readonly\"</c:if>
											value="${memberUser.city}" /><span class="gray"></span></td>
									</tr>
									<tr>
										<td class="tikuan_a2" align="right">银行卡开户行：</td>
										<td class="tikuan_a3"><input id="openBank" type="text"
											class="zlxg_srk" size="30"
											<c:if test="${not empty memberUser.openBank}">readonly=\"readonly\"</c:if>
											value="${memberUser.openBank}" /><span class="gray"></span></td>
									</tr>
									<tr>
										<td class="tikuan_a2" align="right">绑定银行卡号码：</td>
										<td class="tikuan_a3"><input id="bankCode" type="text"
											class="zlxg_srk" size="30"
											<c:if test="${not empty memberUser.bankCode}">readonly=\"readonly\"</c:if>
											value="${memberUser.bankCode}" /><span class="gray">此银行卡账号必须和上述真实姓名一致！</span></td>
									</tr>
									<c:if test="${empty memberUser.zfbCode}">
										<tr>
											<td class="tikuan_a2" align="right">网站登录密码：</td>
											<td class="tikuan_a3"><input id="password"
												type="password" class="zlxg_srk" size="30" /></td>
										</tr>
										<tr>
											<td class="tikuan_a2"></td>
											<td class="tikuan_a3">
                        <input  id="btnCommit" type="submit" value="提&nbsp;交" name="Submit" onclick="bankCodeSubmit()" />
										</tr>
									</c:if>
								</table>
							<%-- </c:otherwise>
						</c:choose> --%>

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

	<script type="text/javascript" src="<%=basePath%>static/js/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/jqueryui.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/slides.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/effects.js"></script>
	<script type="text/javascript">
	    function bankCodeSubmit(){
		    if($("#bankCode").val().trim()==''){
		    	alert("支付宝账号不能为空");
				 return;
			}
			if(!validateEmail($("#zfbCode").val().trim())
				&&!checkPhone($("#zfbCode").val().trim())){
				alert("请输入支付宝账号（手机号/邮箱地址）");
				 return;
			}
			if($("#bankCode").val().trim()==''){
		    	alert("银行账号不能为空");
				 return;
			}
			if($("#openBank").val().trim()==''){
		    	alert("开户行不能为空");
				 return;
			}
			if($("#bankName").val().trim()==''){
		    	alert("银行名称不能为空");
				 return;
			}
			if($("#city").val().trim()==''){
		    	alert("所在地城市不能为空");
				 return;
			}
			if($("#password").val().trim()==''){
				alert("网站登录密码不能为空");
				 return;
			}
			
			var memberUser={};
		    	memberUser["bankCode"]=$("#bankCode").val().trim();
		    	memberUser["zfbCode"]=$("#zfbCode").val().trim();
		    	memberUser["openBank"]=$("#openBank").val().trim();
		    	memberUser["bankName"]=$("#bankName").val().trim();
		    	memberUser["city"]=$("#city").val().trim();
		    	
				memberUser["pwd"]=$("#password").val().trim();
				memberUser["userName"]=$("#userName").val().trim();
	
			//保存
			$.ajax({
				url : '<%=basePath%>user/saveBankInfo',
				data : memberUser,
				type : 'post',
				dataType : 'text',
				success : function(result) {
					alert(result);
				}
			});
		}

		$(document).ready(function() {
			$("#bankInfoMenu").addClass("hover");
		});
	</script>
</body>
</html>

