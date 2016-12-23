<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="top">
	<div class="wrap">
    	
        <!--submenu-->
        <div class="submenu fn_clear">
        	<div class="left">
        	<c:choose>
        	    <c:when test="${sessionScope.memberUser.userName != null}">
                     <a href="<%=basePath %>user/memberCenter" class="orange">${sessionScope.memberUser.userName}</a><a href="<%=basePath %>user/loginout" class="orange">退出</a>
                </c:when>
                <c:otherwise>
                      <a href="<%=basePath %>user/login" class="orange">登录</a><a href="<%=basePath %>user/register" class="orange">注册</a>
               </c:otherwise>
        	</c:choose>   
        	   
        	   <a href="<%=basePath %>recharge">充值</a></div>
            <div class="right">
            	<a href="<%=basePath %>">首页</a>
                <a href="#">购买彩票</a>
                <a href="#">咨询</a>
                <em>
                	<a href="#">网站导航</a>
                	<cite>
                    	<a href="#">手机客户端</a>
                        <a href="#">号码篮</a>
                        <a href="#">中奖计算器</a>
                        <a href="#">复式计算器</a>
                        <a href="#">奖金预算器</a>
                        <a href="#">彩票软件</a>
                    </cite>
                </em>
            </div>
        </div>
        <!--submenu end -->
        
        <!--logos and-->
        <div class="ads">
        	<div class="logo"><a href="#"><img src="<%=basePath %>static/images/logo.png" /></a></div>
            <div class="adtop"><a href="#"><img src="<%=basePath %>static/images/ad1.jpg" /></a></div>
            <div class="hotline"><img src="<%=basePath %>static/images/phone.jpg" /></div>
        </div>
        <!--logos and-->
    </div>
</div>
