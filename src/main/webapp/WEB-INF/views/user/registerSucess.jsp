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
<title>1000万-用户注册成功</title>
</head>

<body class="bg1">
<div class="login fn_clear">
	<div class="title">
    	<div class="wrap fn_clear">
        	<div class="logo"><a href="<%=basePath %>"><img src="<%=basePath %>static/images/logo2.png" /></a><cite class="txt">用户登录</cite></div>
            <div class="list"><cite>品质专业的彩票网</cite><cite>千万彩民的共同选择</cite><cite>成就千万梦想</cite></div>
        </div>
    </div>
    
    <div class="message fn_clear">
    	<div class="mswrap">
            <div class="mst fn_clear">
                <em class="ok"></em><cite class="orange">恭喜您：<i>${sessionScope.memberUser.userName}</i>，成功注册为本站用户</cite>
            </div>
            <div class="msbox fn_clear">
            	<p class="fn_clear"><a href="<%=basePath%>user/securityCenter" class="cz">充值试下运气！</a><cite>充值金额系统流水记录，资金安全有保障！</cite></p>
                <p>担心资金安全？ 立即 <a href="<%=basePath%>user/securityCenter">绑定身份证，手机号码</a> 提高账户安全！</p>
            </div>
        </div>
    </div>
    
    
</div>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
