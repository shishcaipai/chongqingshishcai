<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
</html>
