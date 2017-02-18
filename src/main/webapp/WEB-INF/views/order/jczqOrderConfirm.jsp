<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<link href="http://www.ib18.cn/res/css/index.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="<%=basePath%>static/js/jquery-1.7.2.min.js"></script>
<title>鸿运彩票</title>
</head>

<body>
<jsp:include page="../header.jsp"></jsp:include>
<!--main-->
<div class="banner" >
<div style="margin:0 auto; width:996px; height:100px; border:1px solid #F00">
<div class="order_page">
<div class="oreder_title">
<em>时时彩投注确认支付页面 </em>
</div>
<table cellSpacing=0 cellPadding=0 border="0" border=0 class="page_tzjl">
<tr>
<td class="td1">投注号码</td>
<td> <div class="tdback">
<table cellpadding="0" cellspacing="0" border="0" width="800px">
<tr>
<th>投注类型</th>
<th>投注号码</th>
<th>投注期号|倍数</th>
<th>投注注数</th>
<th>是否追号</th>
</tr>

<tr>
<td>${name}</td>
<td>${lotteryCodes}</td>
<td>${periods}</td>
<td>${lotteryCountStr}</td>
<td>${ZJCut}</td>
</tr>
</table>
</div>

</td>
</tr>

<tr>
<td class="td1">确认投注</td>
<td> 总金额<i class="red">￥${totalMoneyStr }   </i>。
</td>
</tr>

<tr>
<td class="td1">确认购买并支付</td>
<td> <p class="f12 fn_clear"
	style="line-height: 30px; margin-bottom: 5px;">
<a href="javascript:void(0)" style="float: left;" onclick="toBuy()"><img
	src="<%=basePath%>static/images/ljgm.png" /></a> <a
	href="javascript:history.go(-1)">返回修改</a>
</p>
</td>
</tr>

</table>
</div>

</div>
</div>
<!--main end -->
<div class="opacity">
<div class="dialog">
<div class="diatitle">
<em>提示</em>
</div>
<div class="diabox"> 提示信息 </div>
</div>
</div>

<script type="text/javascript">
   function toBuy(){
        var name="时时彩";
        var totalMoney="${totalMoneyStr}";
        var orderId="${orderId}"
		            	window.location.href="${pageContext.request.contextPath}/sscorder/alipay?name="+name+"&totalMoney="+totalMoney+"&orderId="+orderId;
    }
</script>
</body>
</html>

