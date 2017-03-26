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

<link href="<%=basePath%>static/css/commonEX.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>static/css/frequency.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>static/new/css/notice.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>static/new/css/news.css" type="text/css"
	rel="stylesheet" />
<script src="<%=basePath%>static/js/jquery-1.7.2.min.js"
	type="text/javascript"></script>
</head>
<body style="height: 100%;">
	<jsp:include page="../header2.jsp"></jsp:include>
	<div class="header clearfix">
		<jsp:include page="../header3.jsp"></jsp:include>
		<!--头部结束-->

		<div class="container">
			<div class="sub_left">
				<div class="ssq_news">
					<div class="M_box">
						<div class="M_title">
							<h2>公告</h2>
						</div>
						<div class="M_content">
							<div class="news_list">
								<ul>

									<c:forEach var="art" items="${requestScope.notice }">
										<li
											style="width: 500px; height: 22px; overflow: hidden; line-height: 22px; margin: 6px;">
											<em>[公告]</em> <a
											href="<%=basePath %>article/article?id=${art.id }"
											target="_blank" title="${art.title }" style="color: #333;">${art.title }</a>
										</li>
									</c:forEach>

								</ul>

							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>