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
            	<div class="title"><em>安全中心</em></div>
                <div class="mdbox">
                	<div class="serbox aqjb">您的账号安全级别为：<cite>中</cite><em>上次登录：2014-01-14 16:51:25.0</em></div>
                    <table class="tb3" cellpadding="0" cellspacing="1" width="100%">
                    	<tr>
                        	<td><em class="ok">登录密码</em></td>
                            <td>建议使用字母加数字组合，混合大小写等提高密码强度。</td>
                            <td><a href="<%=basePath%>user/resetPasswordInfo">修改</a></td>
                        </tr>
                        <tr>
                       		<c:choose>
                       			<c:when test="${empty memberUser.telephone}">
                       				<td><em class="no">手机绑定</em></td>
                       				<td>绑定手机，可以定制中奖通知、帐号异动通知等服务</td>
                       			</c:when>
                       			<c:otherwise>
                       				<td><em class="ok">手机绑定</em></td>
                       				<td>你绑定的手机：<cite>${memberUser.telephone}</cite></td>
                       			</c:otherwise>
                       		</c:choose>
                            <td><a href="<%=basePath%>user/telephoneInfo">修改</a></td>
                        </tr>
                        <tr>
                        	<c:choose>
                       			<c:when test="${empty memberUser.activated}">
                       				<td><em class="no">账号激活</em></td>
                       				<td>通过发送验证邮件、激活帐号</td>
                       				<td><a href="<%=basePath%>user/emailInfo"><img src="<%=basePath %>static/images/bd.png" /></a></td>
                       			</c:when>
                       			<c:otherwise>
                       				<td><em class="ok">账号激活</em></td>
                       				<td>你绑定的邮箱：<cite>${memberUser.userName}</cite></td>
                       				<td><a href="<%=basePath%>user/emailInfo">查看</a></td>
                       			</c:otherwise>
                       		</c:choose>
                        </tr>
                        <tr>
                       		<c:choose>
                       			<c:when test="${empty memberUser.realName}">
                       				<td><em class="no">实名认证</em></td>
                       				<td>实名认证、核实会员真实姓名和身份证号码、真实姓名绑定支付宝账号</td>
                       				<td><a href="<%=basePath%>user/realNameInfo">认证</a></td>
                       			</c:when>
                       			<c:otherwise>
                       				<td><em class="ok">实名认证</em></td>
									<td>您已认证的真实姓名：<cite>${memberUser.realName}</cite>身份证号码：<cite>${memberUser.identityCard}</cite>
									</td>
									<td><a href="<%=basePath%>user/realNameInfo">查看</a></td>                        			
                       			</c:otherwise>
                       		</c:choose>
                        </tr>
                        <tr>
                       		<c:choose>
                       			<c:when test="${empty memberUser.bankCode}">
                       				<td><em class="no">支付宝绑定</em></td>
                       				<td>绑定支付宝是您提款时的唯一账户，是资金提取的安全保证。</td>
                       				<td><a href="<%=basePath%>user/bankInfo"><img src="<%=basePath %>static/images/bd.png" /></a></td>
                       			</c:when>
                       			<c:otherwise>
                       				<td><em class="ok">支付宝绑定</em></td>
                       				<td>你绑定的支付宝账号：<cite>${memberUser.bankCode}</cite></td>
                       				<td><a href="<%=basePath%>user/bankInfo">查看</a></td>
                       			</c:otherwise>
                       		</c:choose>
                        </tr>
                    </table>
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

<script type="text/javascript">
$(document).ready(function(){
	$("#securityCenterMenu").addClass("hover");
});
</script>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jqueryui.js"></script>
<script type="text/javascript" src="js/slides.js"></script>
<script type="text/javascript" src="js/effects.js"></script>
</body>
</html>
