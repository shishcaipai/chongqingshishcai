<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0042)http://cc.77qiu.com/Trade/cqssc/cqssc.html -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>时时彩购买-|网上购彩|-|高频彩购买|-|投注|-|合买|--深受彩民信赖的购彩网站！</title>
<meta name="description" content="时时乐" />
<meta name="keywords" content="时时乐" />

<meta HTTP-EQUIV="pragma" CONTENT="no-cache" />
<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate" />
<meta HTTP-EQUIV="expires" CONTENT="0" />
<script>
	function seturl(obj) {
		var a = document.getElementById("frame_content");
		a.src = obj;
	}
</script>
<link href="http://www.ib18.cn/res/css/index.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>static/css/together.css" type="text/css"
	rel="stylesheet">
<link href="<%=basePath%>static/css/jqueryui.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>static/css/style.css" type="text/css"
	rel="stylesheet" />
<script src="<%=basePath%>static/js/buyTogether.js"
	type="text/javascript"></script>
<script src="<%=basePath%>static/js/jquery.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<ul id="tc_body">
		<li class="tc_a">
			<ul class="tc_a01">
				<li class="tc_a01_bt"><h2>彩票合买</h2></li>
				<li class="tc_a01_nr">
					<ul class="yh_a01">
						<li class="yh_a01_nr"><a href="<%=basePath%>hemai/hemaiview">全部彩种</a></li>

						<li class="yh_a01_nr"><a href="<%=basePath%>hemai/hemaiview">重庆时时彩</a></li>


					</ul>
				</li>
			</ul>
		</li>
		<li class="tc_b">
			<div class="toucai_hemai">
				<div class="toucai_hm_01">
					<input type="hidden" value=0 id="type" />
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td class="toucai_hm_03"><h2
										style="margin-left: 30px; margin-top: -12px">全部彩种</h2></td>
								<td class="toucai_hm_04"></td>
							</tr>
						</tbody>
					</table>
				</div>


				<div class="toucai_hm_05">
					<table width="100%" id="SchemeList" border="0" cellspacing="0"
						cellpadding="0">
						<tbody>
							<tr class="tab_hemai">
								<td style="padding-left: 15px; width: 120px;">发起人</td>
								<td style="width: 120px;">方案金额</td>
								<td style="width: 120px;">每份金额</td>
								<td style="width: 120px;">方案进度</td>
								<td style="width: 120px;">剩余份数</td>
								<td style="width: 120px;">认购份数</td>
								<td style="text-align: center;">操作</td>
							</tr>

							<form action="" method="post"></form>
							<input name="pid" type="hidden" value="810592502">
							<input name="classId" type="hidden" value="401">
							<c:forEach var="order" items="${requestScope.heMaiOrderDetails }">
								<tr class="tab_hemai_2">
									<td style="display: none">1</td>
									<td style="padding-left: 15px;">${order.memberUser.userName}</td>

									<td><span class="new_hemai_red">${order.order.totalMoney}元</span></td>
									<td><span class="new_hemai_red"><fmt:formatNumber
												value="${order.order.totalMoney/order.fensum}"
												pattern="##.##" minFractionDigits="2" /></span></td>
									<td style="color: #333;"><span style="float: left;">
											<fmt:formatNumber
												value="${(order.fensum - order.subGuaranteeSum) * 100 / order.fensum }"
												pattern="##.##" minFractionDigits="2" />% + <fmt:formatNumber
												value="${( order.fensum - order.otherBuyNum) * 100 / order.fensum }"
												pattern="##.##" minFractionDigits="2" />% </td>
									<td>${order.otherBuyNum }</td>


									<c:choose>
										<c:when test="${2 == order.order.orderStatus}">
											<td class="new_hemai_srk"><span
												style="margin-left: 20px">-</span></td>
											<td class="new_hemai_an"><span style="margin-left: 25px">超时</span></td>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${1 == order.status}">
													<td class="new_hemai_srk"><span
														style="margin-left: 20px">-</span></td>
													<td class="new_hemai_an"><span
														style="margin-left: 25px">成功</span></td>
												</c:when>
												<c:otherwise>
												<c:if test="${order.order.orderStatus ==4}"><td class="new_hemai_srk"><span
														style="margin-left: 20px">-</span></td>
													<td class="new_hemai_an"><span
														style="margin-left: 25px">订单取消</span></td></c:if>
														<c:if test="${order.order.orderStatus ==0}">
													<td class="new_hemai_srk"><input name="buynum"
														type="text" class="rec_text" id="${order.id}" value="0" />
													</td>
													<td class="new_hemai_an"><a
														onclick="javascript:btnBuy(this);"
														style="margin-left: 25px; cursor: pointer; text-decoration: underline; color: blue;"
														id="${order.id}"> <input type="hidden"
															value="${order.id}" /> <input type="hidden"
															value="${order.otherBuyNum }" /> <input type="hidden"
															value="${order.otherBuyNum }" /> 购买
													</a></td>
													</c:if>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>

								</tr>
							</c:forEach>
							<form></form>
							<TR>
								<td colSpan=10>
									<table class="hm_page" border="0" cellpadding="0"
										cellspacing="0" width="100%" style="height: 36px;">
										<tbody>
											<tr>
												<td align="center" class="page" id="show_page_div">页次:<b><font
														color="red">${requestScope.pageNum}</font></b> /
													${requestScope.page} &nbsp;&nbsp;共有:${requestScope.size}
													条记录 <a href="<%=basePath%>hemai/hemaiview?type=0&pageNum=1">首页</a>
													&nbsp;&nbsp;&nbsp;&nbsp; <a
													href="<%=basePath%>hemai/hemaiview?type=0&pageNum=${requestScope.pageNum == 1 ? 1 : requestScope.pageNum - 1}">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
													<a
													href="<%=basePath%>hemai/hemaiview?type=0&pageNum=${requestScope.pageNum == requestScope.page ? requestScope.pageNum : requestScope.pageNum + 1}">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
													<a
													href="<%=basePath%>hemai/hemaiview?type=0&pageNum=${requestScope.page}">尾页</a>
													&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;跳转: <select
													name="pageNum"
													onchange='javascript:change(this.options[this.options.selectedIndex].value)'
													id="page">
														<option value="1" selected>1</option>
												</select> &nbsp;&nbsp;
												</td>
										</tbody>
									</table>

								</td>
							</TR>


						</tbody>
					</table>
				</div>
			</div>
		</li>
	</ul>
	<script type="text/javascript">
	function change(index) {
		var type = $("#type").val();
		window.location.href = "<%=basePath%>hemai/hemaiview?type=" + type
					+ "&pageNum=" + index;
		}
		function page() {
			var html = "";
			var data = ${requestScope.page};
			var currentPage = ${requestScope.pageNum};
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
	<script type="text/javascript">
		function reinitIframe() {
			var iframe = document.getElementById("ifname");
			try {
				var bHeight = iframe.contentWindow.document.body.scrollHeight;
				var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
				var height = Math.max(bHeight, dHeight);
				iframe.height = height;
			} catch (ex) {
			}
		}
		window.setInterval("reinitIframe()", 200);
	</script>

</body>
</html>
