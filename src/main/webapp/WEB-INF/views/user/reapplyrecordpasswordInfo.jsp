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
<link href="<%=basePath%>static/css/jqueryui.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>static/css/style.css" type="text/css"
	rel="stylesheet" />
<script src="<%=basePath%>static/js/commonUtil.js"
	type="text/javascript"></script>
<link href="http://www.ib18.cn/res/css/page_left.css" rel="stylesheet"
	type="text/css" />
<link href="http://www.ib18.cn/res/css/head.css" rel="stylesheet"
	type="text/css" />
<link href="http://www.ib18.cn/res/css/page.css" type="text/css" rel="stylesheet"/>
	
<title>修改密码</title>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<!--main-->
	<div id="account">
		<div class="account_left">
			<jsp:include page="memberLeftMenu.jsp"></jsp:include>
		</div>
		<div class="account_right">

			<div class="p_yd01">

				<div class="p_daohang">
					<ul>
						<li style="float: left;"><b>修改提款密码</b></li>
						<li style="float: right;"></li>
					</ul>
				</div>

				<div class="tc_yhzx_k">
					<div class="p_nr">
						<div id="pwd" style="display: none">22da2e049b90db454e4942405c405ace</div>
						<table border="0" cellspacing="0" cellpadding="0"
							class="table_u_all">

							<tr>
								<td class="tikuan_a2">旧&nbsp;密&nbsp;码：</td>
								<td class="tikuan_a3"><input
			id="password" type="password" class="zlxg_srk" size="30" />&nbsp;<SPAN
										class=zlxg_red>您原来的密码</SPAN></td>
							</tr>
							<tr>
								<td class="tikuan_a2">新&nbsp;密&nbsp;码：</td>
								<td class="tikuan_a3"><input id="resetPassword1"
			type="password" class="zlxg_srk" size="30" />&nbsp;<SPAN>密码长度6到16位</SPAN></td>
							</tr>
							<tr>
								<td class="tikuan_a2">确认新密码：</td>
								<td class="tikuan_a3"><input id="resetPassword2"
			type="password" class="zlxg_srk" size="30" />&nbsp;重填上面的新密码</td>
							</tr>
						</table>
						<div
							style="float: left; width: 772px; padding-top: 10px; padding-left: 10px;">
								<input type="image" class="zlxg_tijiao"
			src="<%=basePath%>static/images/bc.png"
			onclick="resetPasswordSubmit()"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--main end -->


	<div class="opacity">
		<div class="dialog">
			<div class="diatitle">
				<em>提示</em>
			</div>
			<div class="diabox">提示信息</div>
		</div>
	</div>

	<script type="text/javascript" src="<%=basePath%>static/js/jquery.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>static/js/jqueryui.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/slides.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/effects.js"></script>
	<script type="text/javascript">
    function resetPasswordSubmit(){
    	if($("#password").val()==''){
    		alert("当前密码不能为空");
			 $("#resetPassword1").focus();
			 return false;
		}
    	if($("#resetPassword1").val()==''){
    		alert("新密码不能为空");
			 $("#resetPassword1").focus();
			 return false;
		}
		var pwdStr=/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/;
		if(!pwdStr.test($("#resetPassword1").val())){
             alert("新密码必须是数字和字母的组合");
             return false;
        }
		if($("#resetPassword2").val()==''){
			alert("确认新密码不能为空");
	    	 $("#resetPassword2").focus();
			 return false;
		}
		if($("#resetPassword1").val()!=$("#resetPassword2").val()){
	    	 alert("两次输入新密码不一致");
	    	 $("#resetPassword1").focus();
			 return false;
		}
    
    	$.ajax({
			url : '<%=basePath%>user/resetApplyPassword',
				data : 'password=' + $("#password").val() + '&resetPassword='
						+ $("#resetPassword1").val(),
				type : 'post',
				dataType : 'text',
				success : function(result) {
					alert(result);
				}
			});
		}

		$(document).ready(function() {
			$("#resetPasswordInfoMenu").addClass("hover");
		});
	</script>
</body>
</html>

