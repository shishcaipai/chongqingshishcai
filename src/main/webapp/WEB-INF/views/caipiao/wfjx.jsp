<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="http://www.ib18.cn/res/css/common.css" type="text/css"
	rel="stylesheet"/>
	<link href="<%=basePath%>static/css/jqueryui.css" type="text/css"
	rel="stylesheet" />
	<link href="<%=basePath%>static/css/style.css" type="text/css"
	rel="stylesheet" />
	<title>玩法介绍 - 时时牛</title>
	<link href="http://www.ib18.cn/res/css/together.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript">
	function setxxx(obj) {
	    var a = document.getElementById("howtoplay");
	    a.src = obj;
	}
</script>
</head>
<body style="height: 100%;">
	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../banner.jsp"></jsp:include>
	<!--头部结束-->
	<div class="q_main"
		style="width: 1000px; margin: 0 auto; clear: both; margin-top: 6px;">
		<ul id="tc_body">
			<li class="tc_a">
				<ul class="tc_a01">
					<li class="tc_a01_bt"><h2>玩法规则介绍</h2></li>
					<li class="tc_a01_nr">
						<ul class="yh_a01">

							<li class="yh_a01_nr"><span><a>重庆时时彩</a></span></li>

							<li class="yh_a01_nr"><span><a>广东11选5</a></span></li>

							<li class="yh_a01_nr"><span><a>山东十一运</a></span></li>

							<li class="yh_a01_nr"><span><a>江西11选5</a></span></li>

							<li class="yh_a01_nr"><span><a>福彩3D</a></span></li>

						</ul>
					</li>
				</ul>
			</li>
			<li class="tc_b">
				<div style="float: left; width: 852px;">
					<div style="width: 760px; margin: auto;">
						<iframe id="howtoplay" src="<%=basePath%>wfjx?type=cqcss" scrolling="no"
							frameborder="0" width="100%"
							onload="this.height=this.contentWindow.document.documentElement.scrollHeight"></iframe>
					</div>
				</div>

			</li>
		</ul>

	</div>
	<!--底部-->
</body>
</html>
