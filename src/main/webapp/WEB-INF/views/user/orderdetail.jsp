<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<link href="<%=basePath%>static/new/css/head.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>static/css/jqueryui.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>static/css/style.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>static/new/css/page.css" type="text/css"
	rel="stylesheet">
	<script type="text/javascript"
	src="<%=basePath%>static/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>static/js/Method.js"></script>
<title>个人中心</title>
</head>

<body>
	<jsp:include page="../header2.jsp"></jsp:include>
	<div class="header clearfix">
		<jsp:include page="../header3.jsp"></jsp:include>
	<div id="account">
		<div class="account_left">
			<jsp:include page="memberLeftMenu.jsp"></jsp:include>
		</div>
		<div class="account_right">
			<div class="user_right">
				<div class="user_yhxx">
					<table border="0" cellpadding="0" cellspacing="0"
						class="user_yhxxta">
						<tr>
							<td style="font-size: 14px; font-weight: bold; color: #666">订单号：${order.orderNo}
							</td>
							<td style="color: #666">订单名称：${order.name}<b
								style="color: #dc0000;"</b></td>
						</tr>

						<tr>
							<td>订单类型：<b style="color: #dc0000;"><c:if
										test="${order.orderType ==1}">订单充值</c:if> <c:if
										test="${order.orderType ==2}"> 彩票订单 </c:if> <c:if
										test="${order.orderType ==3}"> 合买方案</c:if> <c:if
										test="${order.orderType ==4}"> 合买订单</c:if> <c:if
										test="${order.orderType ==5}"> 返现充值订单</c:if></b></td>
							<td>总金额:<b style="color: #dc0000;">￥${order.totalMoney}</b></td>
						</tr>
						<tr>
							<td style="font-size: 14px; font-weight: bold; color: #666">订单状态：<c:if
									test="${order.orderStatus ==0}">下单待确认</c:if> <c:if
									test="${order.orderStatus ==1}"> 成功</c:if> <c:if
									test="${order.orderStatus ==-1}">待支付</c:if> <c:if
									test="${order.orderStatus ==2}"> 失败</c:if> <c:if
									test="${order.orderStatus ==3}"> 超时</c:if>
							</td>
							<td style="color: #666">支付状态：<c:if
									test="${order.payStatus ==0}">未支付</c:if> <c:if
									test="${order.payStatus ==1}"> 支付成功 </c:if> <c:if
									test="${order.payStatus ==2}">支付失败</c:if> <c:if
									test="${order.payStatus ==3}"> 支付超时</c:if><b
								style="color: #dc0000;"</b></td>
						</tr>
					</table>
				</div>
				<div class="user_yhxx">
					<table border="0" cellpadding="0" cellspacing="0"
						class="user_yhxxta">

						<c:if test="${order.orderType ==2}">
							<tr>
								<td class="tc_tzxq_nr">方案内容:<br /> <textarea
										style="display: block;" class="cy_hm_12" cols="40" rows="4"
										readonly="readonly">
									<c:forEach var="orderDetail" items="${requestScope.details}">
                                           ${orderDetail.buyCaiNumber};
									</c:forEach>
									
								
								</textarea>
								</td>
							</tr>

							</td>
							</tr>

							<c:forEach var="period" items="${requestScope.order.period}">
								<tr>
									<TD STYLE="COLOR: #666">投注期号： ${period.lotteryPeriod}<b
										style="color: #dc0000;"</b>
									</td>
									<TD STYLE="COLOR: #666">投注倍数： ${period.beisu}<b
										style="color: #dc0000;"</b>
									</td>
									<TD STYLE="COLOR: #666">中奖金额： ${period.money}<b
										style="color: #dc0000;"</b>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td style="font-size: 14px; font-weight: bold; color: #666">是否追号：
									<c:if test="${order.isZhuiHao ==0}">
                                         否
                                    	</c:if> <c:if
										test="${order.isZhuiHao ==1}">
                                         是
                                    	</c:if>
								</td>
								<td style="font-size: 14px; font-weight: bold; color: #666">中奖后停止：
									<c:if test="${order.isCut ==0}">
                                         否
                                    	</c:if> <c:if test="${order.isCut ==1}">
                                         是
                                    	</c:if>
								</td>
							</tr>
						</c:if>

					</table>
				</div>
				<div class="user_yhxx">
					<table border="0" cellpadding="0" cellspacing="0"
						class="user_yhxxta">
						<c:if test="${order.orderType ==3||order.orderType ==4}">
							<c:if
								test="${heDetail.type ==3&&(order.orderStatus ==1&&heDetail.type ==2)}">
								<tr>
									<td style="font-size: 14px; font-weight: bold; color: #666">投注内容：
										<c:forEach var="orderDetail" items="${requestScope.details}">
                                           ${orderDetail.buyCaiNumber}<br />
										</c:forEach>
									</td>
								</tr>

								<c:forEach var="period" items="${requestScope.order.period}">
									<tr>
										<TD STYLE="COLOR: #666">投注期号： ${period.lotteryPeriod}<b
											style="color: #dc0000;"</b>
										</td>
										<TD STYLE="COLOR: #666">投注倍数： ${period.beisu}<b
											style="color: #dc0000;"</b>
										</td>
										<TD STYLE="COLOR: #666">中奖金额： ${period.money}<b
											style="color: #dc0000;"</b>
										</td>
									</tr>
								</c:forEach>
							</c:if>

							<tr>
								<td style="font-size: 14px; font-weight: bold; color: #666">是否追号：
									<c:if test="${order.isZhuiHao ==0}">
                                         否
                                    	</c:if> <c:if
										test="${order.isZhuiHao ==1}">
                                         是
                                    	</c:if>
								</td>
								<td style="font-size: 14px; font-weight: bold; color: #666">中奖后停止：
									<c:if test="${order.isCut ==0}">
                                         否
                                    	</c:if> <c:if test="${order.isCut ==1}">
                                         是
                                    	</c:if>
								</td>
							</tr>
							<c:if test="${chexiao ==true}">
								<tr>
									<td><a
										href="<%=basePath%>hemai/chexiao?orderId=${order.orderNo}">可撤单</a></td>
									</td>
								</tr>
							</c:if>
							<tr>
								<td style="font-size: 14px; font-weight: bold; color: #666">分成方案：${heDetail.fensum}
								</td>
								<td style="color: #666">发起人：${heDetail.memberUser.userName}<b
									style="color: #dc0000;"</b></td>
							</tr>
							<tr>
								<td style="font-size: 14px; font-weight: bold; color: #666">金额描述：${heDetail.desc}
								</td>
								<td style="color: #666">发起人：${heDetail.memberUser.userName}<b
									style="color: #dc0000;"</b></td>
							</tr>
							<c:if
								test="${heDetail.type ==3&&(order.orderStatus ==1&&heDetail.type ==2)}">
								<tr>
									<td style="font-size: 14px; font-weight: bold; color: #666">发起人购买：${heDetail.subGuaranteeSum}
									</td>
									<td style="color: #666">发起人保底：${heDetail.minimumGuaranteeSum}<b
										style="color: #dc0000;"</b></td>
								</tr>
							</c:if>
						</c:if>
					</table>
				</div>
				<div class="user_yhxx">
					<table border="0" cellpadding="0" cellspacing="0"
						class="user_yhxxta">
						<c:if test="${order.orderType ==3}">
							<c:forEach var="hemaiOrder" items="${requestScope.hemaiorders}">
								<tr>
									<TD STYLE="COLOR: #666">投注人：
										${hemaiOrder.memberUser.userName}<b style="color: #dc0000;"</b>
									</td>
									<TD STYLE="COLOR: #666">认购份数：
										${hemaiOrder.subGuaranteeSum}<b style="color: #dc0000;"</b>
									</td>
									<TD STYLE="COLOR: #666">认购金额： ${hemaiOrder.floatManay}<b
										style="color: #dc0000;"</b>
									</td>
								</tr>
							</c:forEach>

						</c:if>
						<c:if test="${order.orderType ==4}">
							<tr>
								<TD STYLE="COLOR: #666">投注人：
									${hemaiorder.memberUser.userName}<b style="color: #dc0000;"</b>
								</td>
								<TD STYLE="COLOR: #666">认购份数： ${hemaiorder.subGuaranteeSum}<b
									style="color: #dc0000;"</b>
								</td>
								<TD STYLE="COLOR: #666">认购金额： ${hemaiOrder.floatManay}<b
									style="color: #dc0000;"</b>
								</td>
							</tr>

						</c:if>

					</table>

				</div>
			</div>
		</div>
	</div>
	</div>
	<!--main end -->
</body>
</html>
