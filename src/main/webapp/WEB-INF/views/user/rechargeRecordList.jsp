<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=basePath%>static/css/jqueryui.css" type="text/css" rel="stylesheet" />
<link href="<%=basePath%>static/css/style.css" type="text/css" rel="stylesheet" />
<title>账户明细-充值记录</title>
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
            	<div class="title"><em>我的充值记录</em></div>
                
                <div class="tabt">
               		<a href="<%=basePath%>myrecharge/list" class="hover">充值记录</a><a href="<%=basePath%>money/applyrecord/list" >提现记录</a>
                </div>
                
                <div class="mdbox">
                	<div class="serbox">
                    	<table>
                        	<tr>
                                <td class="pdl8">起始日期：</td>
                                <td><input type="text" class="datepicker" size="15" /></td>
                                <td class="pdl8">终止日期：</td>
                                <td><input type="text" class="datepicker" size="15" /></td>
                                <td class="pdl8"><input type="image" src="<%=basePath%>static/images/ser.png" /></td>
                            </tr>
                        </table>
                    </div>
                    
                	<table class="tb1" cellpadding="1" cellspacing="1" width="100%">
                    	<tr>
                        	<th>申请时间</th>
                            <th>提款金额（元）</th>
                            <th>申请人</th>
                            <th>身份证号</th>
                            <th>申请状态</th>
                            <th>银行</th>
                        </tr>
                        <c:forEach var="record" items="${requestScope.recordList }">
                       	 <tr>
                        	<td style="text-align:center;">${record.createDate }</td>
                        	<td style="text-align:center;">${record.applyMoney }</td>
                        	<td style="text-align:center;">${record.applyName }</td>
                        	<td style="text-align:center;">${record.idCardNo }</td>
                        	<td style="text-align:center;"><c:choose> <c:when test = "${record.auditStatus == 2 }">未审核 </c:when><c:when test = "${record.auditStatus == 1 }">审核失败 </c:when><c:otherwise>审核通过</c:otherwise> </c:choose></td>
                        	<td style="text-align:center;">${record.bankName }</td>
                         </tr>
                        </c:forEach>
                        
                    </table>
                </div>
                
                <div class="alarm fn_clear">
                    <h4>温馨提示</h4>
                    <p>1、系统默认查询一周内的账户明细。其他时间的数据请自行选择日期范围；</p>
                    <p>2、充值时，如果您的银行卡或支付宝账户已扣款，但是网站账户未添加，请与客服联系，确认后我们第一时间为您添加上！</p>
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

<script type="text/javascript">
	$(document).ready(function(){
    	$("#myrechargeListMenu").addClass("hover");
    });
</script>

</body>
</html>

