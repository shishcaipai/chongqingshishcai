<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<link href="http://www.ib18.cn/res/css/page_left.css" rel="stylesheet"
	type="text/css" />
<link href="http://www.ib18.cn/res/css/page.css" rel="stylesheet"
	type="text/css" />
<link href="http://www.ib18.cn/res/css/head.css" rel="stylesheet"
	type="text/css" />
<title>账户明细-充值记录</title>
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
						<li style="float: left;"><b>我的充值记录</b></li>
						<li style="float: right;"></li>
					</ul>
				</div>
				<div class="tc_yhzx_k">
					
				</div>

				<div class="tc_yhzx_k">
					<div class="p_nr">
					<form action="<%=basePath%>myrecharge/list">
						<table cellpadding="6" cellspacing="6" class="table_u_all">
							<tr>
								<td class="pdl8">起始日期：</td>
								<td><input type="text" name='startDate' class="datepicker" size="15" /></td>
								<td class="pdl8">终止日期：</td>
								<td><input type="text"  name='endDate'class="datepicker" size="15" /></td>
								<td class="pdl8"><input type="submit"
									src="<%=basePath%>static/images/ser.png"  /></td>
							</tr>
						</table>
						</form>
					</div>
<div class="p_nr">
					<table cellSpacing=0 cellPadding=0 border="0" border=0 class="page_tzjl">
						<tr class="page_tzjl01">
							<th  style="text-align: center;">申请时间</th>
							<th  style="text-align: center;">提款金额（元）</th>
							<th  style="text-align: center;">申请人</th>
							<th  style="text-align: center;">身份证号</th>
							<th  style="text-align: center;">申请状态</th>
							<th  style="text-align: center;">银行</th>
						</tr>
						<c:forEach var="record" items="${requestScope.recordList }">
							<tr class="page_tzjl01">
								<td style="text-align: center;" ><fmt:formatDate pattern="yyyy-MM-dd" value="${record.createDate}" /></td>
								<td  style="text-align: center;" >${record.applyMoney }</td>
								<td style="text-align: center;" >${record.applyName }</td>
								<td  style="text-align: center;">${record.idCardNo }</td>
								<td  style="text-align: center;" ><c:choose>
										<c:when test="${record.auditStatus == 2 }">未审核 </c:when>
										<c:when test="${record.auditStatus == 1 }">审核失败 </c:when>
										<c:otherwise>审核通过</c:otherwise>
									</c:choose></td>
								<td  style="text-align: center;">${record.bankName }</td>
							</tr>
						</c:forEach>

					</table>
					</div>
				</div>

				<div class="alarm fn_clear">
					<h4>温馨提示</h4>
					<p>1、系统默认查询一周内的账户明细。其他时间的数据请自行选择日期范围；</p>
					<p>2、充值时，如果您的银行卡或支付宝账户已扣款，但是网站账户未添加，请与客服联系，确认后我们第一时间为您添加上！</p>
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

	<script type="text/javascript">
		$(document).ready(function() {
			$("#myrechargeListMenu").addClass("hover");
		});
	</script>

</body>
</html>

