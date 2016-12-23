<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String context = request.getContextPath();
pageContext.setAttribute("context_", context);
%>

<script type="text/javascript">
<!--

var context_ = "${pageContext.request.contextPath}";

//-->
</script>


<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.js"></script>


<!--[if IE]> 
<script src="${pageContext.request.contextPath}/js/html5.js"></script>
<![endif]-->

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("basePath",basePath);
%>
<script type="text/javascript" >
	var basepath='${basePath}';
</script>
