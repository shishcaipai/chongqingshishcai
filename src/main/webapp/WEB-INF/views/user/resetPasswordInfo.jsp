<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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
<script src="<%=basePath %>static/js/commonUtil.js" type="text/javascript"></script>
<title>1000万不是梦想！</title>
</head>

<body>
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../banner.jsp"></jsp:include>
<!--main-->
<div class="main fn_clear user">
	<div class="wrap">
        <jsp:include page="memberLeftMenu.jsp"></jsp:include>
        
        <div class="userbox">
            <div class="modelu">
            	<div class="title"><em>修改密码</em></div>
                <div class="mdbox">
                	<p style="margin-bottom:10px; padding:10px; background:#f6f6f6;">当前密码强度：<i class="orange f14 fb">低</i> 建议使用字母加数字组合、混合大小写等提高密码强度。</p>
                	<div class="serbox serbox2" style="padding:30px">
                    	<table cellpadding="6" cellspacing="6" class="tb2">
                        	<tr>
                            	<td align="right">当前密码：</td>
                                <td><input id="password" type="password" class="inp3" size="30" /></td>
                            </tr>
                            <tr>
                            	<td align="right">新密码：</td>
                                <td><input id="resetPassword1" type="password" class="inp3" size="30" /></td>
                            </tr>
                            <tr>
                            	<td align="right">确认新密码：</td>
                                <td><input id="resetPassword2" type="password" class="inp3" size="30" /></td>
                            </tr>
                            
                            <tr>
                            	<td align="right"></td>
                                <td><input type="image" src="<%=basePath%>static/images/bc.png" onclick="resetPasswordSubmit()"/></td>
                            </tr>
                            
                        </table>
                    </div>
                </div>
            </div>
       </div>
        
    </div>
</div>
<!--main end -->
<jsp:include page="../footer.jsp"></jsp:include>


<div class="opacity">
	<div class="dialog">
    	<div class="diatitle"><em>提示</em></div>
        <div class="diabox">
        	提示信息
        </div>
    </div>
</div>

<script type="text/javascript" src="<%=basePath %>static/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>static/js/jqueryui.js"></script>
<script type="text/javascript" src="<%=basePath %>static/js/slides.js"></script>
<script type="text/javascript" src="<%=basePath %>static/js/effects.js"></script>
<script type="text/javascript">
    function resetPasswordSubmit(){
    	if($("#password").val()==''){
			 custom_alert("当前密码不能为空","提示");
			 $("#resetPassword1").focus();
			 return false;
		}
    	if($("#resetPassword1").val()==''){
			 custom_alert("新密码不能为空","提示");
			 $("#resetPassword1").focus();
			 return false;
		}
		var pwdStr=/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/;
		if(!pwdStr.test($("#resetPassword1").val())){
             custom_alert("新密码必须是数字和字母的组合","提示");
             return false;
        }
		if($("#resetPassword2").val()==''){
	    	 custom_alert("确认新密码不能为空","提示");
	    	 $("#resetPassword2").focus();
			 return false;
		}
		if($("#resetPassword1").val()!=$("#resetPassword2").val()){
	    	 custom_alert("两次输入新密码不一致","提示");
	    	 $("#resetPassword1").focus();
			 return false;
		}
    
    	$.ajax({
			url : '<%=basePath %>user/resetPassword',
			data : 'password=' + $("#password").val()+'&resetPassword='+$("#resetPassword1").val(),
			type : 'post',
			dataType : 'text',
			success : function(result) {
				custom_alert(result,'提示');
			}
		});
	}

    $(document).ready(function(){
    	$("#resetPasswordInfoMenu").addClass("hover");
    });
</script>
</body>
</html>

