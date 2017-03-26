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
<title>鸿运彩票彩票_鸿运彩票彩票合买平台</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html;charset=GBK">
<meta name="Keywords" content="">
<meta name="Description" content="">
<link rel="shortcut icon"
	href="<%=basePath%>static/images/favicon.new.ico" />
<link href="<%=basePath%>static/new/css/index.css" type="text/css"
	rel="stylesheet">
<script type="text/javascript"
	src="<%=basePath%>static/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>static/new/js/jquery-ui-1.8.2.custom.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>static/new/js/lotterymode.js"></script>
<SCRIPT type="text/javascript"
	src="<%=basePath%>static/new/js/jquery.nivo.slider.js"></SCRIPT>
<SCRIPT type="text/javascript"
	src="<%=basePath%>static/new/js/superfish.js"></SCRIPT>
<SCRIPT type="text/javascript"
	src="<%=basePath%>static/new/js/jquery.autocomplete.min.js"></SCRIPT>
<link rel="stylesheet" type="text/css" href="<%=basePath%>static/new/css/szc.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>static/new/css/lotteryhall.css"/>

	
	
</head>
<body>
	<jsp:include page="../header2.jsp"></jsp:include>
	<div class="header clearfix">
		<jsp:include page="../header3.jsp"></jsp:include>

		 <div id="docBody">
        <h2 class="tit clearfix"><span>热销彩种推荐</span></h2>
        <ul id="tuijian" class="clearfix">
                  <li id="tj_kuai3" gid="kuai3"> 
                    <span class="szImg szImg_kuai3"></span>
                    <a href="<%=basePath%>cqssc/cqsscview" class="buyNow" ></a>
                    
                        <P>
                            	<a href="<%=basePath%>cqssc/cqsscview" >开奖公告</a>
                                <a href="<%=basePath%>zaoshi" >走势图</a>
                </li>
                <li id="tj_d11" gid="d11"> 
                    <span class="szImg szImg_d11"></span>
                    <a href="<%=basePath%>sdsyy/sdsyyview" class="buyNow" ></a>
                    
                        <P> 	
                            <a href="<%=basePath%>sdsyy/sdsyyview" >开奖公告</a>
                            <a href="<%=basePath%>zaoshi">走势图</a>
                        </P>
                </li>
                <li id="tj_jczq"  gid="jczq_spf_p" class="jczq">
                     
                    <span class="szImg szImg_jczq"></span>
                    <a href="<%=basePath%>gdsyxw/gdsyxwview" class="buyNow" ></a>
                        <P> 	
                            <a href="<%=basePath%>gdsyxw/gdsyxwview" >开奖公告</a>
                            <a href="<%=basePath%>zaoshi" >走势图</a>
                        </P>
                </li>
                 <li id="tj_ssq" gid="ssq"> 
                    <span class="szImg szImg_ssq"></span>
                    <a href="<%=basePath%>jxssc/jxsscview" class="buyNow" ></a>
                        <P>
                            <a href="<%=basePath%>jxssc/jxsscview" >开奖公告</a>
                            <a href="<%=basePath%>zaoshi" >走势图</a>
                        </P>
                </li>
                 <li id="tj_kuai3" gid="kuai3"> 
                    <span class="szImg szImg_x3d"></span>
                    <a href="javascript:alert('暂停销售')" class="buyNow" ></a>
                        <P>
                            <a href="javascript:alert('暂停销售')" >开奖公告</a>
                            <a href="javascript:alert('暂停销售')" >走势图</a>
                        </P>
                </li>
        </ul>

  
</div>

<div class="footer_bj">
		<div class="footer">
			<ul class="fo1">
				<h1>
					<img alt="快购彩票网"
						src="<%=basePath%>static/new/images/fo1.png" />
				</h1>
				<li>交易安全</li>
				<li>购买便捷</li>
				<li>派奖快速</li>
			</ul>
			<ul class="fo2">
				<h1>
					<img alt="快购彩票网"
						src="<%=basePath%>static/new/images/fo2.png" />
				</h1>
				<li>・<a href="<%=basePath%>articles?id=cz1">充值方式</a></li>
				<li>・<a href="<%=basePath%>articles?id=cz2">充值流程</a></li>
				<li>・<a href="<%=basePath%>articles?id=cz3">修改真实姓名</a></li>
				<li>・<a href="<%=basePath%>articles?id=cz4">修改银行卡</a></li>
			</ul>
			<ul class="fo3">
				<h1>
					<img alt="快购彩票网"
						src="<%=basePath%>static/new/images/fo3.png" />
				</h1>
				<li>・<a href="<%=basePath%>articles?id=tk1">如何提款</a></li>
				<li>・<a href="<%=basePath%>articles?id=tk2">到账时间</a></li>
				<li>・<a href="<%=basePath%>articles?id=tk3">银行提款费率</a></li>
				<li>・<a href="<%=basePath%>articles?id=tk4">提款注意</a></li>
			</ul>
			<ul class="fo4" style="border-right: none">
				<h1>
					<img alt="快购彩票网"
						src="<%=basePath%>static/new/images/fo4.png" />
				</h1>
				<li>・<a href="<%=basePath%>articles?id=bz1">如何注册网站会员</a></li>
				<li>・<a href="<%=basePath%>articles?id=bz2">注册时需注意什么</a></li>
				<li>・<a href="<%=basePath%>articles?id=bz3">如何注销会员帐户</a></li>
				<li>・<a href="<%=basePath%>articles?id=bz4">密码忘记了怎么办</a></li>
			</ul>

		</div>
	</div>
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>