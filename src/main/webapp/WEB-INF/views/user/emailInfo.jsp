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
            	<div class="title"><em>绑定邮箱</em></div>
                <div class="mdbox">
                	<p style="margin-bottom:10px; padding:10px; background:#f6f6f6;">绑定邮箱，方便找回密码，同时激活会员账号</p>
                	<div class="serbox serbox2" style="padding:30px">
                    	<table cellpadding="6" cellspacing="6" class="tb2">
                   			<tr>
                           		<td align="right">邮箱：</td>
                               	<td>${memberUser.userName}</td>
                            </tr>
                            <tr>
                            	<td align="right"></td>
                                <td><input type="button" class="btn3" value="发送邮件" onclick="emailCommit()"/></td>
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
    
    function emailCommit(){
    	$.ajax({
			url : '<%=basePath %>user/validateEmail',
			type : 'post',
			dataType : 'text',
			success : function(result) {
				custom_alert(result,'提示');
			}
		});
	}
	
    $(document).ready(function(){
    	$("#emailInfoMenu").addClass("hover");
    });
</script>
</body>
</html>

