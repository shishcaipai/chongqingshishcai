<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="nav">
	<div class="wrap">
    	<a href="<%=basePath %>index" class="hover">首页</a>
    	<a href="<%=basePath%>cqssc/cqsscview">重庆时时彩</a>
    	<a href="<%=basePath%>4cjq">双色球</a>
        <a href="<%=basePath%>hemai/hemaiview">合买中心</a>
        <a href="<%=basePath%>jzjqs">进球数</a>
        <a href="<%=basePath%>jzbqc">半全场</a>
        <a href="<%=basePath%>4cjq">四场进球</a>
        <a href="<%=basePath %>user/memberCenter">个人中心</a>
        <a href="#" class="last">充值</a>
        <em><a href="#">手机版</a></em>
    </div>
</div>