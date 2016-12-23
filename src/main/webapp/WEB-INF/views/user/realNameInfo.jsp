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
            	<div class="title"><em>实名认证</em></div>
            	<input id="userName" type="hidden" value="${sessionScope.memberUser.userName}"/>
            	<input id="realNameHidden" type="hidden" value="${memberUser.realName}"/>
                <div class="mdbox">
                	<p style="margin-bottom:10px; padding:10px; background:#f6f6f6;">实名认证、核实会员真实姓名和身份证号码、真实姓名绑定支付宝账号<span class="red">如需修改，请联系客服</span></p>
                	<div class="serbox serbox2" style="padding:30px" id="realNameEdit">
                    	<table cellpadding="6" cellspacing="6" class="tb2">
                        	<tr>
                            	<td align="right">真实姓名：</td>
                                <td><input id="realName" type="text" class="inp3" size="30" <c:if test="${not empty memberUser.realName}">readonly=\"readonly\"</c:if> value="${memberUser.realName}"/></td>
                            </tr>
                            <tr>
                            	<td align="right">身份证号：</td>
                                <td><input id="identityCard" type="text" class="inp3" size="30" <c:if test="${not empty memberUser.identityCard}">readonly=\"readonly\"</c:if> value="${memberUser.identityCard}"/></td>
                            </tr>
                            <c:if test="${empty memberUser.identityCard}">
	                            <tr>
	                            	<td align="right">确认身份证号：</td>
	                                <td><input id="reIdentityCard" type="text" class="inp3" size="30"  <c:if test="${not empty memberUser.identityCard}">readonly=\"readonly\"</c:if> value="${memberUser.identityCard}"/></td>
	                            </tr>
	                            <tr>
	                            	<td align="right"></td>
	                                <td>
	                               		<input type="button" class="btn3" value="保存" onclick="realNameSubmit()"/>
	                                </td>
	                            </tr>
                            </c:if>
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
	function realNameSubmit(){
		if($("#realName").val().trim()==''){
			 custom_alert("真实姓名不能为空","提示");
			 return;
		}
		if(!checkChineseName($("#realName").val().trim())){
			 custom_alert("中文姓名格式不正确","提示");
			 return;
		}
		if($("#identityCard").val().trim()==''){
	    	 custom_alert("身份证号码不能为空","提示");
			 return;
		}
		if(!isCardNo($("#identityCard").val().trim())){
			 custom_alert("身份证输入不合法","提示");
			 return;  
		}
		if($("#reIdentityCard").val().trim()==''){
	    	 custom_alert("确认身份证号码不能为空","提示");
			 return;
		}
		if($("#identityCard").val().trim()!=$("#reIdentityCard").val().trim()){
	    	 custom_alert("两次输入身份证号码不一致","提示");
			 return;
		}
		
		var memberUser={};
	    	memberUser["userName"]=$("#userName").val().trim();
			memberUser["identityCard"]=$("#identityCard").val().trim();
			memberUser["realName"]=$("#realName").val().trim();

		//保存
		$.ajax({
			url : '<%=basePath %>user/saveRealNameInfo',
			data: memberUser,
			type:'post',
			dataType:'text',
			success : function(result) {
				custom_alert(result,'提示');
			}    
		});
	}
	
	$(document).ready(function(){
		$("#realNameInfoMenu").addClass("hover");
	}); 
</script>
</body>
</html>

