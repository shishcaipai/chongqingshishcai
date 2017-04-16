<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE></TITLE>
<link href="<%=basePath%>static/css/hmtz.css" type="text/css"
	rel="stylesheet">
<link href="<%=basePath%>static/new/css/page_left.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>static/new/css/head.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>static/css/jqueryui.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>static/css/style.css" type="text/css"
	rel="stylesheet" />
<script type="text/javascript"
	src="<%=basePath%>static/js/jquery-1.7.2.min.js"></script>
	<script src="<%=basePath%>static/js/commonUtil.js"
	type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>static/js/Method.js"></script>
<script type="text/javascript">
		function chexiao() {
			var  orderNO = $("#orderNo").val();
			//保存
			$.ajax({
				url : '<%=basePath%>hemai/chexiao',
			data : {
				orderId : orderNO
			},
			type : 'post',
			dataType : 'json',
			success : function(result) {
				if (result.code == 1) {
					alert("操作成功");
				} else {
					alert("撤销失败");
				}

			}
		});

	}
</script>
</HEAD>
<BODY>
	<jsp:include page="../header2.jsp"></jsp:include>
	<div class="header clearfix">
		<jsp:include page="../header3.jsp"></jsp:include>
		<div id="account">
			<div class="account_left">
				<jsp:include page="memberLeftMenu.jsp"></jsp:include>
			</div>
			<div class="account_right">
				<div class="menu">
					<div class="cy_hm">
						<table class="tc_tzxq_02" border="0" cellspacing="0"
							cellpadding="0">

							<tbody>
								<tr>
									<td></td>
									<td class="tc_tzxq_nr"><span
										style="float: left; font-family: Arial; color: #333; font-weight: bold; padding-top: 3px;">
											<b style="font-weight: normal;">发起人:</b>
									</span> <span
										style="float: left; font-family: Arial; color: #333; font-weight: bold; padding-top: 3px;">
											<b style="font-weight: normal;"> <c:choose>
													<c:when test="${order.orderType==4}">
											${porder.memberUser.userName}</b>*** </c:when> <c:otherwise>
											${order.memberUser.userName}</b>***
											</c:otherwise> </c:choose>
									</span> <span
										style="float: left; padding-right: 15px; padding-top: 2px;">
											&nbsp; </span></td>
								</tr>

								<tr>
									<td></td>
									<td class="tc_tzxq_nr">彩种:&nbsp;&nbsp;
										${caipiaotype}&nbsp; <span class="hemai_red">${parsh}</span>&nbsp;期
										方案编号:<span style="color: #999;"> <c:choose>
												<c:when test="${order.orderType==4}">
											${porder.orderNo}
										</c:when>
												<c:otherwise>
											${order.orderNo}
											</c:otherwise>
											</c:choose>
									</span>&nbsp;&nbsp;&nbsp; 此方案发起时间：<span style="color: #999;"> <c:choose>
												<c:when test="${order.orderType==4}">
											<fmt:formatDate type="both" value="${porder.createDate}" />
										</c:when>
												<c:otherwise>
											<fmt:formatDate  type="both" value="${order.createDate}" />
											</c:otherwise>
											</c:choose>
									</span>&nbsp;&nbsp;&nbsp; 认购截止时间：<span style="color: #999;">${endDate}</span>
									</td>
								</tr>

								<tr>
									<td></td>
									<td class="tc_tzxq_nr">方案信息:<br />
										<table class="cy_hm_04" width="100%" border="0"
											cellspacing="0" cellpadding="0">
											<tbody>
												<tr class="cy_hm_04bt">
													<td >总金额</td>
													<td >倍数</td>
													<td >购买时间</td>
													<td >购买进度</td>
													<td >认购状态</td>
													<td >是否停止追号</td>
												</tr>
												<tr class="cy_hm_04nr">
													<td>￥<span class="hemai_red"> <c:choose>
																<c:when test="${order.orderType==4}">
											${porder.totalMoney}
										</c:when>
																<c:otherwise>
											${order.totalMoney}
											</c:otherwise>
															</c:choose>
													</span>元
													</td>
													<td>${beisu}倍</td>
													<td><span class="hemai_red">
													<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${order.createDate}" />
													</span></td>
													<c:if test="${order.orderType ==2}">
														<td></td>
													</c:if>
													<c:if test="${order.orderType ==3}">
														<td>${leftNum/heDetail.fensum*100}%</td>
													</c:if>
													<c:if test="${order.orderType ==4}">
														<td>${leftNum/heDetail.fensum*100}%</td>
													</c:if>
													<td><c:if test="${order.orderStatus ==0}">下单待确认</c:if>
														<c:if test="${order.orderStatus ==1}"> 成功</c:if> <c:if
															test="${order.orderStatus ==-1}">待支付</c:if> <c:if
															test="${order.orderStatus ==2}"> 失败</c:if> <c:if
															test="${order.orderStatus ==3}"> 超时</c:if> <c:if
															test="${order.orderStatus ==4}"> 订单撤销</c:if></td>
													<td>
														<%-- <c:if test="${order.isZhuiHao ==0}">
                                         否
                                    	</c:if> <c:if
															test="${order.isZhuiHao ==1}">
                                         是
                                    	</c:if> | --%> <c:if
															test="${order.isCut ==0}">
                                         否
                                    	</c:if> <c:if test="${order.isCut ==1}">
                                         是
                                    	</c:if>
													</td>
												</tr>
											</tbody>
										</table>

									</td>
								</tr>
								<tr>
									<td class="tc_tzxq_bt"></td>
									<td class="tc_tzxq_nr">方案内容:<br /> <textarea
											style="display: block;" class="cy_hm_12" cols="40" rows="4"
											readonly="readonly">
								<c:if test="${order.orderType ==2}">
									<c:forEach var="orderDetail" items="${requestScope.details}">
                                           ${orderDetail.buyCaiNumber}；
									</c:forEach> 
									</c:if>			
									<c:if test="${order.orderType ==3}">
													<c:if test="${heDetail.type ==1}"> 	<c:forEach
														var="orderDetail" items="${requestScope.details}">
                                           ${orderDetail.buyCaiNumber}；
									</c:forEach> </c:if>
										<c:if test="${heDetail.type ==2}">	<c:forEach
														var="orderDetail" items="${requestScope.details}">
                                           ${orderDetail.buyCaiNumber}；
									</c:forEach> </c:if>
										<c:if test="${heDetail.type ==3}">
									<c:if test="${order.memberUser.userName !=sessionScope.memberUser.userName}">
									   此方案保密
									</c:if>
									<c:if test="${order.memberUser.userName ==sessionScope.memberUser.userName}">
									<c:forEach
														var="orderDetail" items="${requestScope.details}">
                                           ${orderDetail.buyCaiNumber}；
									</c:forEach>
									</c:if>
										 </c:if>
										</c:if>
									<c:if test="${order.orderType ==4}">
														<c:if test="${heDetail.type ==1}"> 	<c:forEach
														var="orderDetail" items="${requestScope.details}">
                                           ${orderDetail.buyCaiNumber}；
									</c:forEach> </c:if>
										<c:if test="${heDetail.type ==2}">	<c:forEach
														var="orderDetail" items="${requestScope.details}">
                                           ${orderDetail.buyCaiNumber}；
									</c:forEach> </c:if>
										<c:if test="${heDetail.type ==3}">此方案保密 </c:if>
													</c:if>		
			
			
			</textarea></td>
								</tr>


								<tr>
									<td></td>
									<td class="tc_tzxq_nr">投注期号:
										<div style="float: right">
											<input id="orderNo" name="orderNo" type="hidden"
												value="${order.orderNo}"></input>
											<c:if test="${chexiao ==true}">
												<a href="javascript:void(0);" onclick="chexiao()"> 一键撤单</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</c:if>
										</div>
										<table class="cy_hm_04" width="100%" border="0"
											cellspacing="0" cellpadding="0">
											<tbody>
												<tr class="cy_hm_04bt">
													<td>开奖期号</td>
													<td>认购金额</td>
													<td>倍数</td>
													<td>开奖号码</td>
													<td>奖金</td>
													<td>状态</td>
												</tr>
												<c:forEach var="period" items="${requestScope.order.period}">
													<tr class="cy_hm_04nr">
														<td>${period.lotteryPeriod}</td>
														<td><span class="hemai_red">￥ <c:choose>
																	<c:when test="${order.orderType==4}">
											${porder.totalMoney}
										</c:when>
																	<c:otherwise>
											${order.totalMoney}
											</c:otherwise>
																</c:choose>
														</span>元</td>
														<td>${period.beisu}倍</td>
														<td>${period.letterPharse}</td>
														<td><span class="hemai_red">￥${period.money} </span>
															元</td>
														<td><font color="0000FF"> <c:if
																	test="${period.status ==0}">下单</c:if> <c:if
																	test="${period.status ==1}"> 已下注</c:if> <c:if
																	test="${period.status ==2}">撤销</c:if>

														</font></td>
													</tr>
												</c:forEach>



											</tbody>
										</table>
									</td>
								</tr>


								<tr>
									<td class="tc_tzxq_bt"></td>
									<c:if test="${order.orderType !=2}">

										<td class="tc_tzxq_nr">
											<p>参与用户:</p> <br />
											<div>
												<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>发起人</title>
<link href="http://www.ld3j.com/res/css/together.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<table class="cy_hm_16" width=100% " id="SchemeList" border="0"
		cellspacing="0" cellpadding="0">
		<tbody>
			<tr class="tab_hemai">
				<td style="padding-left: 15px; width: 14%;">发起人</td>
				<td style="width: 14%;">方案金额</td>
				<td style="width: 14%;">每份金额</td>
				<td style="width: 14%;">方案进度</td>
				<td style="width: 14%;">认购份数</td>
				<td style="width: 14%;">操作</td>
				<td style="text-align: center;"></td>
			</tr>
			<tr class="tab_hemai_2">
				<td style="display: none"></td>
				<td style="padding-left: 15px;">${heDetail.memberUser.userName}***</td>

				<td><span class="new_hemai_red"> <c:choose>
							<c:when test="${order.orderType==4}">
											${porder.totalMoney}
										</c:when>
							<c:otherwise>
											${order.totalMoney}
											</c:otherwise>
						</c:choose> 元
				</span></td>
				<td><span class="new_hemai_red">￥ <c:choose>
							<c:when test="${order.orderType==4}">
											${porder.totalMoney/heDetail.fensum}
										</c:when>
							<c:otherwise>
											${order.totalMoney/heDetail.fensum}
											</c:otherwise>
						</c:choose> 元
				</span></td>
				<td><span class="new_hemai_red">${leftNum/heDetail.fensum*100}%</span></td>
				<td>${heDetail.fensum-heDetail.subGuaranteeSum}</td>
				<td class="new_hemai_an">&nbsp;&nbsp;&nbsp;&nbsp; <span
					style="margin-left: 25px"><c:if
							test="${order.orderStatus ==0}">下单待确认</c:if> <c:if
							test="${order.orderStatus ==1}"> 成功</c:if> <c:if
							test="${order.orderStatus ==-1}">待支付</c:if> <c:if
							test="${order.orderStatus ==2}"> 失败</c:if> <c:if
							test="${order.orderStatus ==3}"> 超时</c:if> <c:if
							test="${order.orderStatus ==4}"> 订单撤销</c:if> </span>
				</td>


			</tr>
			<TR>
				<td colSpan=10>
					<table class="hm_page" border="0" cellpadding="0" cellspacing="0"
						width="100%" style="height: 36px;">
						<tbody>

						</tbody>
					</table>

				</td>
			</TR>


		</tbody>
	</table>
</body>
												</html>
											</div>
											<div class="cy_hm_14">
												<ul id="tabfirst">
													<li class="tabin">参与用户(<span class="hemai_red">${size}</span>)
													</li>
												</ul>
											</div>
											<div id="allBetUserDiv" class="cy_hm_15">
												<div id="tab_box">
													<div class="contentin contentfirst">
														<table class="cy_hm_16" width="100%" border="0"
															cellspacing="0" cellpadding="0">

															<tbody>
																<tr class="cy_hm_16bt">
																	<td>用户名</td>
																	<td>认购份数</td>
																	<td>认购金额</td>
																	<td>购买时间</td>
																	<td>奖金</td>
																</tr>
																<c:forEach var="hemaiOrder"
																	items="${requestScope.hemaiorders}">
																	<tr class="cy_hm_16nr">
																		<td>${hemaiOrder.memberUser.userName}***</b>
																		</td>
																		<TD>${hemaiOrder.subGuaranteeSum}</b>
																		</td>
																		<TD>认购金额： ${hemaiOrder.floatManay}</td>
																		<td>${hemaiOrder.createDate}</td>
																		<td><span class="hemai_red">￥${hemaiOrder.currentWPMoney}
																		</span>元</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>

												</div>
											</div>
										</td>
									</c:if>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>