<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript"
	src="<%=basePath%>static/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
window.onload = function(){
var url = window.location.href;
alert(url);
$.ajax({
	url : "<%=basePath%>/user/register",
	dataType : "json",
	async : false,
	data : {
		t : Math.random()
	},
	success : function(data) {
		<%
		request.getRequestDispatcher("/user/register").forward(request,response);
		%>
	},
	error : function(data) {
		<%
		request.getRequestDispatcher("404.jsp").forward(request,response);
		%>
	}
});	
}
 </script>
</head>

<body>
</body>
</html>
