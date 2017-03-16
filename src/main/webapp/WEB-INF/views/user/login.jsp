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

<meta content="yes" name="apple-mobile-web-app-capable">
<meta name="viewport"
	content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<title>会员登录</title>

<link href="<%=basePath%>static/css/denglu.css" rel="stylesheet"
	type="text/css"></link>
<script src="<%=basePath%>static/js/commonUtil.js"
	type="text/javascript"></script>
	<script src="<%=basePath%>static/js/jquery-1.7.2.min.js" type="text/javascript"></script>

<style>
.ssssssss {
	color: #333;
}

.ssssssss:HOVER {
	color: red;
	cursor: pointer;
	text-decoration: underline;
}
</style>
</head>

<body>
<div style="margin: 10px auto 0;width: 1000px;">
		<div style="float: right;">
			<div id="need_login" style="display:block;">
				<span style="color: #666;">您好！欢迎来到鸿运彩票网！</span>
				<a class="ssssssss">登录</a>&nbsp;|
				<a class="ssssssss">免费注册</a>&nbsp;|
                <a class="ssssssss">反馈建议</a>&nbsp;|
                <a class="ssssssss">帮助中心</a>
            </div>
		</div>
	</div>
	
	<div style="clear:both;"></div>
	
	 <form id="loginForm" action="<%=basePath %>user/dologin" method="post">
		<div style="margin: 10px auto 0;width: 1000px;">
			<div style="width:1000px;height:600px;background: url('<%=basePath%>static/images/login.bg.2015.jpg') no-repeat 0px 50px; ">
				<div style="float: right;margin-top: 150px;">
				<div style="width: 100px;margin: auto;color: #666;margin-bottom: 20px;margin-left: 90px;"><h1>用户登录</h1></div>
				<table class="xc_dl04" border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td>用户名：</td>
							<td class="xc_dl02">
								<input id="userName" name="userName" type="text" class="sk" errormsg="用户名为5到20个字符！"/>
							</td>
						</tr>
						<tr>
							<td>密&nbsp;&nbsp;&nbsp;码：</td>
							<td class="xc_dl02">
								<input id="pwd" name="pwd" type="password" class="sk"  onkeypress="disableEnter(event);" />
							</td>
						</tr>
						<tr>
							<td>验证码：</td>
							<td class="xc_dl02">
								<input  name="randomCode" type="text" class="sk" onkeypress="disableEnter(event);" style="float: left; width:40%" />
								<div class="imgValidate"  title="换一个" onclick="this.style.background='url(<%=basePath %>imageServlet?'+Math.random()+')';"></div>
							</td>
						</tr>
						<tr>
							<td></td>
							<td class="xc_dl02" style="width:60%;">
								<input type="submit" id="loginForm" value="登&nbsp;&nbsp;录" onclick="checkForm()"  style="width:250px;height:40px;cursor: pointer;color: #FFF;background: #D12B2D;border: none;font-weight: bold;font-size: 16px;" />
							</td>
						</tr>
					</tbody>
				</table>
				</div>
			</div>
		</div>
	</form>
	
	<!--底部-->
	<div style="margin: 10px auto 0;width: 1000px;text-align: center;">
		<div>
			<span class="ssssssss">首页</span>&nbsp;&nbsp;
			<span>|</span>&nbsp;&nbsp;
			<span class="ssssssss">存书签</span>&nbsp;&nbsp;
			<span>|</span>&nbsp;&nbsp;
			<span class="ssssssss">新手</span>&nbsp;&nbsp;
			<span>|</span>&nbsp;&nbsp;
			<span class="ssssssss">回顶部↑</span>&nbsp;&nbsp;
		</div>
		<div style="margin-top: 5px;">
			<span class="ssssssss">彩版</span>&nbsp;&nbsp;
			<span>|</span>&nbsp;&nbsp;
			<b class="ssssssss">触屏版</b>&nbsp;&nbsp;
			<span class="ssssssss">|</span>&nbsp;&nbsp;
			<span class="ssssssss">客户端</span>&nbsp;&nbsp;
			<span class="ssssssss">中国电信合作伙伴</span>&nbsp;&nbsp;
			<span class="ssssssss">粤ICP备13075023号</span>&nbsp;&nbsp;
		</div>
	</div>

	<script type="text/javascript"
		src="<%=basePath%>static/js/Validform_v5.3.2_min.js"></script>
	<script type="text/javascript">
	    function imgValidate() {
			$(".imgValidate").css({background: "url(<%=basePath%>imageServlet?"+Math.random()+")"});
		}
		$(document).ready(function(){
			var resultMsg = '${msg}';
			if (resultMsg != null && resultMsg != "") {
				alert(resultMsg, "提示");
			}
			imgValidate();
		});

		function disableEnter(event){
			 var keyCode = event.keyCode?event.keyCode:event.which?event.which:event.charCode;
			 if (keyCode ==13){
				login();
			 }
		}
	</script>

</body>

</html>


<%-- 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=basePath %>static/css/jqueryui.css" type="text/css" rel="stylesheet" />
<link href="<%=basePath %>static/css/style.css" type="text/css" rel="stylesheet" />
<link href="<%=basePath %>static/css/vstyle.css" type="text/css" rel="stylesheet" />
<script src="<%=basePath %>static/js/commonUtil.js" type="text/javascript"></script>
<title>1000万-登录</title>
</head>

<body class="bg1">
<div class="login fn_clear">
	<div class="title">
    	<div class="wrap fn_clear">
        	<div class="logo"><a href="<%=basePath %>"><img src="<%=basePath %>static/images/logo2.png" /></a><cite class="txt">用户登录</cite></div>
            <div class="list"><cite>品质专业的彩票网</cite><cite>千万彩民的共同选择</cite><cite>成就千万梦想</cite></div>
        </div>
    </div>
    <div class="box">
    	<div class="wrap fn_clear">
        	<div class="formbox fn_clear">
            	<div class="ftitle fn_clear"><em>会员登录</em><a href="<%=basePath %>user/register">免费注册</a></div>
                <form id="loginForm" action="<%=basePath %>user/dologin" method="post">
                <div class="formc">
                	<dl class="fn_clear">
                    	<dt>用户名：</dt>
                        <dd><input type="text" name="userName" errormsg="用户名为5到20个字符！" /></dd>
                    </dl>
                    <dl class="fn_clear">
                    	<dt>密码：</dt>
                        <dd><input type="password" name="pwd" datatype="*" /></dd>
                    </dl>
                    <dl class="fn_clear">
                    	<dt>验证码：</dt>
                        <dd><input type="text" name="randomCode" datatype="s4-4" errormsg="验证码为4位字符！" class="yz" /><img id="imageCode" src="<%=basePath %>imageServlet" class="yz" /><a href="javascript:refresh();" class="yz"></a></dd>
                    </dl>
                    <dl class="fn_clear">
                    	<dt>&nbsp;</dt>
                        <dd><input class="btn" type="submit" onclick="checkForm()" value="登 录" /><a href="#">忘记密码？</a></dd>
                    </dl>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath %>static/js/Validform_v5.3.2_min.js"></script>
	<script type="text/javascript">
	    function refresh() {
	        $("#imageCode").attr("src","<%=basePath %>imageServlet?"+Math.random());
	    }
	    
	    function checkForm(){
	      $("#loginForm").Validform();
	    }
	    
	    $(document).ready(function(){
	       var resultMsg='${resultMsg}';
	       if(resultMsg != null && resultMsg != ""){
	         	custom_alert(resultMsg,"提示");
	       }
	    });
    </script>
</body>
</html> --%>

