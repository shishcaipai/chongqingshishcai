<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=basePath %>static/css/jqueryui.css" type="text/css" rel="stylesheet" />
<link href="<%=basePath %>static/css/style.css" type="text/css" rel="stylesheet" />
<script src="<%=basePath %>static/js/commonUtil.js" type="text/javascript"></script>
<title>1000万不是梦想！</title>
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
            	<div class="title"><em>银行卡绑定</em></div>
            	<input id="userName" type="hidden" value="${sessionScope.memberUser.userName}"/>
                <div class="mdbox">
                	<p style="margin-bottom:10px; padding:10px; background:#f6f6f6;">绑定支付宝是您提款时的唯一账户，是资金提取的安全保证。 <span class="red">如需修改，请联系客服</span></p>
                	<div id="bankInfoEdit" class="serbox serbox2" style="padding:30px">
                		<c:choose>
                            <c:when test="${empty memberUser.identityCard}"><p>您还未完善个人信息，请先 <a href="<%=basePath%>user/realNameInfo">实名认证</a></p></c:when>
                            <c:otherwise>
								<table cellpadding="6" cellspacing="6" class="tb2">
		                        	<tr>
		                            	<td align="right">真实姓名：</td>
		                                <td>${memberUser.realName}</td>
		                            </tr>
		                            <tr>
		                            	<td align="right">支付宝账号：</td>
		                                <td><input id="bankCode" type="text" class="inp3" size="30" <c:if test="${not empty memberUser.bankCode}">readonly=\"readonly\"</c:if> value="${memberUser.bankCode}" /><span class="gray">此支付宝账号必须和上述真实姓名一致！</span></td>
		                            </tr>
		                            <c:if test="${empty memberUser.bankCode}">
			                            <tr>
			                            	<td align="right">网站登录密码：</td>
			                                <td><input id="password" type="password" class="inp3" size="30"/></td>
			                            </tr>
			                            <tr>
			                            	<td></td>
			                                <td>
			                               		<input type="button" class="btn3" value="保存" onclick="bankCodeSubmit()"/>
			                                </td>
			                            </tr>
		                            </c:if>
		                        </table>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</div>
<!--main end -->

<jsp:include page="../footer.jsp"></jsp:include>

<div class="opacity">
	<div class="dialog">
    	<div class="diatitle"><em>提示</em></div>
        <div class="diabox">
        	提示信息
        </div>
    </div>
</div>

<script type="text/javascript" src="<%=basePath %>static/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>static/js/jqueryui.js"></script>
<script type="text/javascript" src="<%=basePath %>static/js/slides.js"></script>
<script type="text/javascript" src="<%=basePath %>static/js/effects.js"></script>
	<script type="text/javascript">
	    function bankCodeSubmit(){
		    if($("#bankCode").val().trim()==''){
				 custom_alert("支付宝账号不能为空","提示");
				 return;
			}
			if(!validateEmail($("#bankCode").val().trim())
				&&!checkPhone($("#bankCode").val().trim())){
				 custom_alert("请输入支付宝账号（手机号/邮箱地址）","提示");
				 return;
			}
			if($("#password").val().trim()==''){
		    	 custom_alert("网站登录密码不能为空","提示");
				 return;
			}
			
			var memberUser={};
		    	memberUser["bankCode"]=$("#bankCode").val().trim();
				memberUser["pwd"]=$("#password").val().trim();
				memberUser["userName"]=$("#userName").val().trim();
	
			//保存
			$.ajax({
				url : '<%=basePath %>user/saveBankInfo',
				data: memberUser,
				type:'post',
				dataType:'text',
				success : function(result) {
					custom_alert(result,'提示');
				}    
			});
	    }
	    
		$(document).ready(function(){
			$("#bankInfoMenu").addClass("hover");
	    });
    </script>
</body>
</html>

