<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
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
<link href="<%=basePath%>static/new/css/page_left.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>static/css/style.css" type="text/css"
	rel="stylesheet" />
<LINK href="<%=basePath%>static/new/css/head.css" type=text/css
	rel=stylesheet>
<link href="<%=basePath%>static/new/css/page.css" type="text/css"
	rel="stylesheet">
	<link rel="shortcut icon"
	href="<%=basePath%>static/images/favicon.new.ico" />
<link href="<%=basePath%>static/new/css/index.css" type="text/css"
	rel="stylesheet">
<title>个人中心</title>
</head>

<body>
	<jsp:include page="../header2.jsp"></jsp:include>
	<div class="header clearfix">
		<jsp:include page="../header3.jsp"></jsp:include>
	<div id="account">
		<div class="account_left">
			<jsp:include page="agentMemberLeftMenu.jsp"></jsp:include>
		</div>
		<div class="account_right">
			<div class="user_right">
				<div class="user_zhmx1">
					<table border="0" cellpadding="0" cellspacing="0"
						class="user_mxtable" id="accountDetail">
						<tr>
							<td style="color: #666; font-weight: bold">订单号</td>
							<td style="color: #666; font-weight: bold">订单名称</td>
							<td style="color: #666; font-weight: bold">交易时间</td>
							<td style="color: #666; font-weight: bold">消费类型</td>
							<td style="color: #666; font-weight: bold">金额</td>
							<!-- <td style="color: #666; font-weight: bold">状态</td> -->
							<!-- <td style="color: #666; font-weight: bold">备注</td>
							<td style="color: #666; font-weight: bold">详情</td> -->
						</tr>
						<c:forEach var="order" items="${requestScope.orders }">
							<tr>
								<td>
								<c:if
										test="${order.orderType ==4}">${order.otherId }</c:if> <c:if
										test="${order.orderType ==5}"> ${order.otherId }</c:if>
								<c:if test="${order.orderType ==1}">${order.orderNo }</c:if> <c:if
										test="${order.orderType ==2}"> ${order.orderNo } </c:if> <c:if
										test="${order.orderType ==3}"> ${order.orderNo }</c:if> 
										<c:if
										test="${order.orderType ==6}"> ${order.orderNo }</c:if>
										 <c:if
										test="${order.orderType ==7}"> ${order.otherId }</c:if>
								</td>
								<td>${order.name }</td>
								<td>	<fmt:formatDate  type="both" value="${order.createDate}" /></td>
								<td><c:if test="${order.orderType ==1}">用户充值</c:if> <c:if
										test="${order.orderType ==2}"> 用户购买彩票消费 </c:if> <c:if
										test="${order.orderType ==3}"> 合买方案</c:if> <c:if
										test="${order.orderType ==4}"> 用户参与合买方案消费</c:if> <c:if
										test="${order.orderType ==5}">  用户中奖返奖</c:if>
										 <c:if
										test="${order.orderType ==6}"> 用户提现</c:if>
										 <c:if
										test="${order.orderType ==7}"> 冻结返回</c:if>
										</td>
								<td>${order.totalMoney }</td>
								<%-- <td><c:if test="${order.orderStatus ==0}">下单待确认</c:if> <c:if
										test="${order.orderStatus ==1}"> 成功</c:if> <c:if
										test="${order.orderStatus ==-1}">待支付</c:if> <c:if
										test="${order.orderStatus ==2}"> 失败</c:if> <c:if
										test="${order.orderStatus ==3}"> 超时</c:if> <c:if
										test="${order.orderStatus ==4}">订单取消</c:if></td>
								<td>${order.content}</td> --%>
								<%-- <td width="10%" align="center" valign="middle">
								<c:if test="${order.orderType ==2}">
								<a href="<%=basePath%>user/orderdetail?orderId=${order.orderNo }">查看</a>
								</c:if>
								<c:if test="${order.orderType ==3}">
								<a href="<%=basePath%>user/orderdetail?orderId=${order.orderNo }">查看</a>
								</c:if>
								<c:if test="${order.orderType ==4}">
								<a href="<%=basePath%>user/orderdetail?orderId=${order.orderNo }">查看</a>
								</c:if>
								</td> --%>
							</tr>
						</c:forEach>
						<TR>
							<td colSpan=10>
								<table class="hm_page" border="0" cellpadding="0"
									cellspacing="0" width="100%" style="height: 36px;">
									<tbody>
										<tr>
											<td align="center" class="page" id="show_page_div">页次:<b><font
													color="red">${requestScope.pageNum}</font></b> /
												${requestScope.page} &nbsp;&nbsp;共有:${requestScope.size} 条记录
												<a href="<%=basePath%>agent/agentMembeInDetail?type=0&pageNum=1">首页</a>
												&nbsp;&nbsp;&nbsp;&nbsp; <a
												href="<%=basePath%>agent/agentMembeInDetail?type=0&pageNum=${requestScope.pageNum == 1 ? 1 : requestScope.pageNum - 1}">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
												<a
												href="<%=basePath%>agent/agentMembeInDetail?type=0&pageNum=${requestScope.pageNum == requestScope.page ? requestScope.pageNum : requestScope.pageNum + 1}">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
												<a
												href="<%=basePath%>agent/agentMembeInDetail?type=0&pageNum=${requestScope.page}">尾页</a>
												&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;跳转: <select
												name="pageNum"
												onchange='javascript:change(this.options[this.options.selectedIndex].value)'
												id="page">
													<option value="1" selected>1</option>
											</select> &nbsp;&nbsp;
											</td>
										</tr>
									</tbody>
								</table>

							</td>
						</TR>

					</table>
				</div>
			</div>
			<%-- <div class="userbox">
				<div class="base_acc">
					<dl class="fn_clear">
						<dt>
							<p>
								<em>可用金额：</em><cite>${memberUser.totalScore}元</cite>
							</p>
							<p>
								<em>可提现金额：</em><cite>${memberUser.availableScore}元</cite>
							</p>
							<p>
								<em>已冻结金额：</em><cite>${memberUser.totalScore - memberUser.availableScore}元</cite>
							</p>
							<a href="#" class="mx">账户明细</a>
						</dt>
						<dd>
							<a href="<%=basePath%>recharge"><img
								src="<%=basePath%>static/images/btn2.png" /></a><a
								href="<%=basePath%>money/apply"><img
								src="<%=basePath%>static/images/btn3.png" /></a>
						</dd>
						<dd>
							<a href="<%=basePath%>user/emailInfo">邮箱绑定</a> <a
								href="<%=basePath%>user/telephoneInfo">手机绑定</a> <a
								href="<%=basePath%>user/bankInfo">银行卡绑定</a> <a
								href="<%=basePath%>user/realNameInfo">实名认证</a>
						</dd>
					</dl>
				</div>

				<div class="alarm fn_clear">
					<c:choose>
						<c:when test="${empty memberUser.bankCode}">
							<h4>您的账户存在风险！</h4>
							<p>您还没有进行实名认证，银行卡未绑定，您还没有进行实名认证，银行卡未绑定，您还没有进行实名认证</p>
							<a href="<%=basePath%>user/securityCenter" class="rz"><img
								src="<%=basePath%>static/images/rz.png" /></a>
						</c:when>
						<c:otherwise>
							<h4>您的账户安全！</h4>
							<p>恭喜您已完成实名认证、已绑定支付宝账号</p>
							<a href="<%=basePath%>user/securityCenter" class="rz">查看</a>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="modelu">
					<div class="title">
						<em>近期投注记录</em>
					</div>
					<div class="mdbox">
						
					</div>
				</div>
			</div> --%>
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
	function change(index) {
		var type = $("#type").val();
		window.location.href = "<%=basePath%>agent/agentMembeInDetail?type="
					+ type + "&pageNum=" + index;
		}
		function page() {
			var html = "";
			var data = $
			{
				requestScope.page
			}
			;
			var currentPage = $
			{
				requestScope.pageNum
			}
			;
			for (var i = 0; i < data; i++) {
				var index = i + 1;
				if (currentPage == index) {
					html += "<option value="+index+" selected = true>" + index
							+ "</option>";
				} else {
					html += "<option value="+index+">" + index + "</option>";
				}

			}
			$("#page").html(html);
		}
		page();
	</script>
</body>
</html>
