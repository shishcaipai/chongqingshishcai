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
            	<div class="title"><em>手机绑定</em></div>
            	<input id="userName" type="hidden" value="${sessionScope.memberUser.userName}"/>
                <div class="mdbox">
                	<p style="margin-bottom:10px; padding:10px; background:#f6f6f6;">绑定手机，可以定制中奖通知、帐号异动通知等服务</p>
                	<div id="telephoneEdit" class="serbox serbox2" style="padding:30px">
                    	<table cellpadding="6" cellspacing="6" class="tb2">
                        	<tr>
                            	<td align="right">手机号：</td>
                                <td><input id="telephone" type="text" class="inp3" size="30" <c:if test="${not empty memberUser.telephone}">readonly=\"readonly\"</c:if> value="${memberUser.telephone}"/></td>
                            </tr>
                            <tr>
                            	<td align="right"></td>
                                <td>
                                	<c:if test="${empty memberUser.telephone}">
                               			<a href="javascript:void(0)" onclick="javascript:telephoneSubmit()"><img src="<%=basePath%>static/images/bd.png" /></a>
                                	</c:if>
                                </td>
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
	function telephoneSubmit(){
		if($("#telephone").val().trim()==''){
			 custom_alert("手机号不能为空","提示");
			 return;
		}
		if(!checkPhone($("#telephone").val().trim())){
			 custom_alert("手机号格式不正确","提示");
			 return;
		}
		//保存
		$.ajax({
			url : '<%=basePath %>user/telephoneSave',
			data: 'userName='+$("#userName").val()+'&telephone='+$("#telephone").val().trim(),
			type:'post',
			dataType:'text',
			success : function(result) {
				custom_alert(result,'提示');
			}    
		});
	}
	
	$(document).ready(function(){
		$("#telephoneInfoMenu").addClass("hover");
	});
</script>
</body>
</html>

