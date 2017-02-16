<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta name="viewport"
	content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">

<meta charset="utf-8">
<title>用户注册</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link href="<%=basePath%>static/css/register.css" rel="stylesheet">
<link href="<%=basePath%>static/css/header.css" rel="stylesheet">
<script type="text/javascript"
	src="<%=basePath%>static/js/jquery-1.7.2.min.js"></script>
</head>
<body>
	<!-- 公共头部分 start -->
	<script type="text/javascript">
		function hover(a, b) {
			$(a).hover(function() {
				$(this).addClass(b);
			}, function() {
				$(this).removeClass(b);
			})
		}
		hover('.other-link-list', 'cur');
		hover('#notice', 'current');
		hover('#account', 'current');
	</script>
	<!-- 立即注册 -->
	<h3 class="register-title">用户注册</h3>
	<div class="register">
		<div class="register-box clearfix">
			<form id="reg_form" action="" method="post">
				<input type="hidden" id="urlpath" value="${parentId}" /> <input
					type="hidden" name="parentId" id="parentId" value="${parentId}" />
				<div class="register-now input">
					<ul>
						<li class="right" id="reg_username"><span><em>*</em>用户名：</span><input
							type="text" value="" id="username" name="username"><i
							class="hint">4-14位字符，无特殊符号，建议用微信号或手机号</i><i class="ico"
							style="display: none;"></i><i class="warn">报错信息</i></li>
						<li class="right" id="reg_pw"><span><em>*</em>密码：</span> <input
							name="pw" type="password" value="" id="pw"> <i
							class="hint">请输入您的密码</i><i class="ico" style="display: none;"></i><i
							class="warn">密码格式不正确</i></li>
						<li class="right" id="reg_repw"><span><em>*</em>确认密码：</span>
							<input name="repw" type="password" value="" id="repw"> <i
							class="hint"></i><i class="ico" style="display: none;"></i><i
							class="warn">密码格式不正确</i></li>
						<!-- <li class="right" id="reg_nickname"><span><em>*</em>昵称：</span><input type="text" value="" id="nickname" name="nickname"><i class="hint">请输入昵称</i><i class="ico" style="display: none; "></i><i class="warn">报错信息</i></li> -->
						<li class="right" id="reg_realname"><span><em>*</em>真实姓名：</span><input
							type="text" value="" id="realname" name="realname"><i
							class="hint">请输入真实姓名</i><i class="ico" style="display: none;"></i><i
							class="warn">报错信息</i></li>
						<li class="right" id="sex"><span><em>*</em>性别：</span> <select
							id="sex" style="width: 120px">
								<option value="0">男</option>
								<option value="1">女</option>
						</select></li>
						<li class="right" id="reg_email"><span>邮箱：</span><input
							name="email" type="text" value="" id="email"><i
							class="hint">请输入您的邮箱号</i><i class="ico" style="display: none;"></i><i
							class="warn"></i></li>
						<li class="right" id="reg_qq"><span><em>*</em>Q&nbsp;Q&nbsp;：</span><input
							id="qq" name="qq" type="text" value=""><i class="hint">请输入您的qq号</i><i
							class="ico" style="display: none;"></i><i class="warn">报错信息</i></li>
						<li class="right" id="reg_phone"><span>手机：</span><input
							id="phone" name="phone" type="text" value=""><i
							class="hint">请输入您的手机号</i><i class="ico" style="display: none;"></i><i
							class="warn">报错信息</i></li>
					</ul>
					<div class="register-submit">
						<a href="javascript:void(0);" class="submit" value="立即注册"
							onClick="check_from(reg_form);">立即注册</a><br>
					</div>

				</div>
			</form>
			<div class="login">
			
				<div class="login-area">
					已有账号，请选择<a href="<%=basePath%>user/login">登 录</a>
				</div>
				<dl>

				</dl>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=basePath%>static/js/md5.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>static/js/user_register.js"></script>

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
<title>1000万-会员注册</title>
</head>

<body class="bg1">
<div class="login fn_clear">
	<div class="title">
    	<div class="wrap fn_clear">
        	<div class="logo"><a href="<%=basePath %>"><img src="<%=basePath %>static/images/logo2.png" /></a><cite class="txt">用户登录</cite></div>
            <div class="list"><cite>品质专业的彩票网</cite><cite>千万彩民的共同选择</cite><cite>成就千万梦想</cite></div>
        </div>
    </div>
    
    <div class="reg">
    	<div class="wrap fn_clear">
    		<div class="regt"><em>填写信息</em><cite>注册成功</cite></div>
    		<form id="registerForm" action="<%=basePath %>/user/doregister" method="post">
	            <div class="regbox">
	            	<dl class="fn_clear">
	                    	<dt>账户名：</dt>
	                        <dd><input id="userName" type="text" name="userName"/></dd>
	                    </dl>
	                    <dl class="fn_clear">
	                    	<dt>创建密码：</dt>
	                        <dd><input type="password" name="pwd1" datatype="s5-15" errormsg="密码范围为5到15个字符！" /></dd>
	                    </dl>
	                    <dl class="fn_clear">
	                    	<dt>确认密码：</dt>
	                        <dd><input type="password" name="pwd" datatype="*" recheck="pwd1" errormsg="您两次输入的账号密码不一致！" /></dd>
	                    </dl>
	                    <dl class="fn_clear" style="padding-bottom:15px;">
	                    	<dt>验证码：</dt>
	                        <dd><input type="text" name="randomCode" class="yz" datatype="s4-4" errormsg="验证码为4位字符！" /><img id="imageCode" src="<%=basePath %>imageServlet" class="yz" /><a href="javascript:refresh();">看不清，换一张</a></dd>
	                    </dl>
	                    <dl class="fn_clear" style="padding-bottom:10px;">
	                    	<dt>&nbsp;</dt>
	                        <dd><input  type="checkbox" checked="checked" />我已经年满18岁并同意<a href="#">《1000wcj.com服务条款》</a></dd>
	                    </dl>
	                    <dl class="fn_clear">
	                    	<dt>&nbsp;</dt>
	                        <dd><input class="btn" onclick="return checkForm()" type="submit" value="提交注册" /></dd>
	                    </dl>
	              </div>
              </form>
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
	    	var field = $("#userName").val().trim();
			var apos = field.indexOf("@");
			var dotpos = field.lastIndexOf(".");
			if (apos<1||dotpos-apos<2) {
				custom_alert("请使用邮箱注册账号！","提示");
				return false;
			}
	    		
	       $("#registerForm").Validform();
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
