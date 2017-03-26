<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<link href="<%=basePath%>static/new/css/page_left.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>static/css/jqueryui.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>static/css/style.css" type="text/css"
	rel="stylesheet" />
<LINK href="<%=basePath%>static/css/head.css" type=text/css
	rel=stylesheet>
<link href="<%=basePath%>static/new/css/page.css" type="text/css"
	rel="stylesheet">
<link href="<%=basePath%>static/new/css/common.css" type="text/css"
	rel="stylesheet">
<link href="<%=basePath%>static/new/css/cps.css" type="text/css"
	rel="stylesheet">
<title>推广管理</title>
</head>

<body>
	<jsp:include page="../header2.jsp"></jsp:include>
	<div class="header clearfix">
		<jsp:include page="../header3.jsp"></jsp:include>
	<div id="account">
		<div class="account_left">
			<jsp:include page="agentMemberLeftMenu.jsp"></jsp:include>
		</div>
		<div class="account_right">
			<div class="user_right">
			<div class="p_nr">
<table align="center" cellspacing="0" cellpadding="0" border="0" class="ylf_tg_bg">
	<thead>
	<tr>
		<th height="28" align="center" colspan="2"><strong style="color:#dc0000;">代理链接</strong></th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td bgcolor="#FFFFFF" align="center" style="padding: 10px;" class="hui" colspan="2">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" bgcolor="#fdd79d">
			<tbody>
            <tr>
				<td height="28" bgcolor="#fafafa" align="right" style="color:#333;">链接地址：</td>
				<td height="28" bgcolor="#FFFFFF" align="left" style="padding-left: 10px;">
					<span class="red bold" id="spanLinkUrl" style="font-size:14px">
							${pathUrl}
					</span><input style="background:none; border:none; cursor:pointer; width:42px; height:18px; color:#dc0000;" type="button" onclick="copyUrl($('#spanLinkUrl').text())" value="复制">
				</td>                        
			</tr>
            <tr>
				<td height="28" bgcolor="#fafafa" align="right" style="color:#333;">CPS模式：</td>
				<td height="28" bgcolor="#FFFFFF" align="left" style="padding-left: 10px;">
                	<font class="red">代理商 </font>
				</td>
			</tr>
			</tbody>
			</table>
		</td>
	</tr>
</tbody>
</table>
</div>
			</div>
		</div>
	</div>
	</div>
	<!--main end -->
<script type="text/javascript">
	function change(index) {
		var type = $("#type").val();
		window.location.href = "<%=basePath%>betting_record?type=" + type + "&pageNum=" + index;
	}
	function page(){
		var html = "";
		var data = ${requestScope.page};
		var currentPage = ${requestScope.pageNum};
		for(var i=0;i<data;i++){
			var index = i+1;
			if(currentPage == index){
				html += "<option value="+index+" selected = true>"+index+"</option>";
			}else{
				html += "<option value="+index+">"+index+"</option>";
			}
			
		}
		$("#page").html(html);
	}
	page();
</script>
</body>
</html>

