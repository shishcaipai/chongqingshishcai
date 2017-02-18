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
<link href="<%=basePath%>static/css/bjdc.css" rel="stylesheet"
	type="text/css">
	<link href="<%=basePath%>static/css/public.css" rel="stylesheet"
		type="text/css">
<link href="<%=basePath%>static/css/style.css" type="text/css"
	rel="stylesheet" />
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>公告！</title>
<meta name="description" content="时时乐" />
<meta name="keywords" content="时时乐" />

<link href="http://www.80cb.cn/res/css/commonEX.css" type="text/css"
	rel="stylesheet" />
<link href="http://www.80cb.cn/res/css/frequency.css" type="text/css"
	rel="stylesheet" />
<link href="http://www.80cb.cn/res/css/notice.css" type="text/css"
	rel="stylesheet" />
<link rel="shortcut icon"
	href="http://www.80cb.cn/res/img/favicon.new.ico" />
<script src="http://www.80cb.cn/res/js/ajaxfileupload.js"
	type="text/javascript"></script>

<script src="http://www.80cb.cn/res/js/jquery-1.7.2.min.js"
	type="text/javascript"></script>
</head>
<body style="height: 100%;">
	<jsp:include page="../header.jsp"></jsp:include>
	<!--头部结束-->
	<div class="box">
		<!--左边-->
		<div class="poNLeft">

			<div class="poncon">
				<span class="DivH15"></span>
				<div style="text-align: center;">


					<h1 style="color: red;">
						<c:choose>
							<c:when test="${article.type==0}">
									【公告】		
												</c:when>
							<c:otherwise>
									【推荐】
											</c:otherwise>
						</c:choose>
						${article.title }
					</h1>



				</div>
				<span class="DivH15"></span>
				<div class="from">
					<div class="TimeShare">
						<div class="PSource">作者：${article.author }
							来源：${article.source } 更新时间：${article.updateDate }</div>
						<div class="baidushare">
							<div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare"></div>
						</div>
					</div>
				</div>

				<div class="content">
					<div class="start">
						<div style="width: 600px; margin: 50px auto;">
							${article.content }</div>
					</div>
				</div>

			</div>
		</div>
	</div>



</body>
	</html>