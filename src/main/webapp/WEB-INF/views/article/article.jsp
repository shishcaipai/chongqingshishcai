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
	<link href="<%=basePath%>static/new/css/public.css" rel="stylesheet"
		type="text/css">
<link href="<%=basePath%>static/css/style.css" type="text/css"
	rel="stylesheet" />
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><c:choose>
							<c:when test="${article.type==0}">
									公告		
												</c:when>
							<c:otherwise>
								
									<c:choose>
							<c:when test="${article.type==1}">
										资讯
												</c:when>
							<c:otherwise>
									网站帮助
											</c:otherwise>
						</c:choose>
									
									
											</c:otherwise>
						</c:choose></title>
<meta name="description" content="时时乐" />
<meta name="keywords" content="时时乐" />
<link href="<%=basePath%>static/new/css/notice.css?t=2" type="text/css"
	rel="stylesheet" />

<script src="<%=basePath%>static/js/jquery-1.7.2.min.js"
	type="text/javascript"></script>
</head>
<body style="height: 100%;">
	<jsp:include page="../header2.jsp"></jsp:include>
	<div class="header clearfix">
		<jsp:include page="../header3.jsp"></jsp:include>
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
									【公告】	${article.title }	
												</c:when>
							<c:otherwise>
										<c:choose>
							<c:when test="${article.type==1}">
										【推荐】${article.title }
												</c:when>
							<c:otherwise>
							${article.title }
											</c:otherwise>
						</c:choose>
											</c:otherwise>
						</c:choose>
						
					</h1>



				</div>
				<span class="DivH15"></span>
				<div class="from">
					<div class="TimeShare">
						<div class="PSource">
						
						<c:choose>
							<c:when test="${article.type==3}">
												</c:when>
							<c:otherwise>
						作者：${article.author }
							来源：${article.source } 更新时间：${article.updateDate }
											</c:otherwise>
						</c:choose>
						</div>
						<div class="baidushare">
							<div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare"></div>
						</div>
					</div>
				</div>
				<div class="content">
					<div class="start">
						<div style="width:100%;height:100%;margin: 50px auto;">
							${article.content }</div>
					</div>
				</div>

			</div>
		</div>
	</div>
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
				<li>・<a href="<%=basePath%>article/article?id=cz1">充值方式</a></li>
				<li>・<a href="<%=basePath%>article/article?id=cz2">充值流程</a></li>
				<li>・<a href="<%=basePath%>article/article?id=cz3">修改真实姓名</a></li>
				<li>・<a href="<%=basePath%>article/article?id=cz4">修改银行卡</a></li>
			</ul>
			<ul class="fo3">
				<h1>
					<img alt="快购彩票网"
						src="<%=basePath%>static/new/images/fo3.png" />
				</h1>
				<li>・<a href="<%=basePath%>article/article?id=tk1">如何提款</a></li>
				<li>・<a href="<%=basePath%>article/article?id=tk2">到账时间</a></li>
				<li>・<a href="<%=basePath%>article/article?id=tk3">银行提款费率</a></li>
				<li>・<a href="<%=basePath%>article/article?id=tk4">提款注意</a></li>
			</ul>
			<ul class="fo4" style="border-right: none">
				<h1>
					<img alt="快购彩票网"
						src="<%=basePath%>static/new/images/fo4.png" />
				</h1>
				<li>・<a href="<%=basePath%>article/article?id=bz1">如何注册网站会员</a></li>
				<li>・<a href="<%=basePath%>article/article?id=bz2">注册时需注意什么</a></li>
				<li>・<a href="<%=basePath%>article/article?id=bz3">如何注销会员帐户</a></li>
				<li>・<a href="<%=basePath%>article/article?id=bz4">密码忘记了怎么办</a></li>
			</ul>

		</div>
	</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
	</html>