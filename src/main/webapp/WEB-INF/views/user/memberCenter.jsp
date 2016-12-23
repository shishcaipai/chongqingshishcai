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
<title>个人中心</title>
</head>

<body>
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../banner.jsp"></jsp:include>
<!--main-->
<div class="main fn_clear user">
	<div class="wrap">
        
        <jsp:include page="memberLeftMenu.jsp"></jsp:include>
        <div class="userbox">
        	
            <div class="base_acc">
            	<dl class="fn_clear">
                	<dt>
                    	<p><em>可用金额：</em><cite>${memberUser.totalScore}元</cite></p>
                        <p><em>可提现金额：</em><cite>${memberUser.availableScore}元</cite></p>
                        <p><em>已冻结金额：</em><cite>${memberUser.totalScore - memberUser.availableScore}元</cite></p>
                        <a href="#" class="mx">账户明细</a>
                    </dt>
                    <dd>
                    	<a href="#"><img src="<%=basePath %>static/images/btn2.png" /></a><a href="#"><img src="<%=basePath %>static/images/btn3.png" /></a>
                    </dd>
                    <dd>
		                <a href="<%=basePath%>user/emailInfo">邮箱绑定</a>
		                <a href="<%=basePath%>user/telephoneInfo">手机绑定</a>
		                <a href="<%=basePath%>user/bankInfo">银行卡绑定</a>
		                <a href="<%=basePath%>user/realNameInfo">实名认证</a>
                    </dd>
                </dl>
            </div>
            
            <div class="alarm fn_clear">
                <c:choose>
                  	<c:when test="${empty memberUser.bankCode}">
						<h4>您的账户存在风险！</h4>
                		<p>您还没有进行实名认证，银行卡未绑定，您还没有进行实名认证，银行卡未绑定，您还没有进行实名认证</p>
                		<a href="<%=basePath%>user/securityCenter" class="rz"><img src="<%=basePath %>static/images/rz.png" /></a>			                
					</c:when>
                  	<c:otherwise>
                  		<h4>您的账户安全！</h4>
                  		<p>恭喜您已完成实名认证、已绑定支付宝账号</p>
                  		<a href="<%=basePath%>user/securityCenter" class="rz">查看</a>
                  	</c:otherwise>
                </c:choose>
            </div>
            
            <div class="modelu">
            	<div class="title"><em>近期投注记录</em></div>
                <div class="mdbox">
                	<table class="tb1" cellpadding="1" cellspacing="1" width="100%">
                    	<tr>
                        	<th>彩种</th>
                            <th>期号</th>
                            <th>发起人</th>
                            <th>方案金额</th>
                            <th>认购金额</th>
                            <th>方案状态</th>
                            <th>认购时间</th>
                            <th>操作</th>
                        </tr>
                        <tr>
                        	<td>七星彩</td>
                            <td>1125478</td>
                            <td>小尼姑</td>
                            <td>320058</td>
                            <td>20</td>
                            <td>未知</td>
                            <td>2014-3-18</td>
                            <td><a href="#">删除</a><a href="#">查看</a></td>
                        </tr>
                        <tr>
                        	<td>七星彩</td>
                            <td>1125478</td>
                            <td>小尼姑</td>
                            <td>320058</td>
                            <td>20</td>
                            <td>未知</td>
                            <td>2014-3-18</td>
                            <td><a href="#">删除</a><a href="#">查看</a></td>
                        </tr>
                        <tr>
                        	<td>七星彩</td>
                            <td>1125478</td>
                            <td>小尼姑</td>
                            <td>320058</td>
                            <td>20</td>
                            <td>未知</td>
                            <td>2014-3-18</td>
                            <td><a href="#">删除</a><a href="#">查看</a></td>
                        </tr>
                        <tr>
                        	<td>七星彩</td>
                            <td>1125478</td>
                            <td>小尼姑</td>
                            <td>320058</td>
                            <td>20</td>
                            <td>未知</td>
                            <td>2014-3-18</td>
                            <td><a href="#">删除</a><a href="#">查看</a></td>
                        </tr>
                        <tr>
                        	<td>七星彩</td>
                            <td>1125478</td>
                            <td>小尼姑</td>
                            <td>320058</td>
                            <td>20</td>
                            <td>未知</td>
                            <td>2014-3-18</td>
                            <td><a href="#">删除</a><a href="#">查看</a></td>
                        </tr>
                        <tr>
                        	<td>七星彩</td>
                            <td>1125478</td>
                            <td>小尼姑</td>
                            <td>320058</td>
                            <td>20</td>
                            <td>未知</td>
                            <td>2014-3-18</td>
                            <td><a href="#">删除</a><a href="#">查看</a></td>
                        </tr>
                        
                    </table>
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

</body>
</html>
