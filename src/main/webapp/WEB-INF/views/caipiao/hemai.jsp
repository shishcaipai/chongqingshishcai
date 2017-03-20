<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<HTML xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>发起合买</title>
<link href="<%=basePath%>static/css/bjdc.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>static/css/public.css" rel="stylesheet"
	type="text/css">
<script src="<%=basePath%>static/js/ga.js" async=""
	type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>static/js/boot.js"></script>
<script type="text/javascript" src="<%=basePath%>static/js/esunjs.js"></script>
<script type="text/javascript" src="<%=basePath%>static/js/trade.js"></script>
<script type="text/javascript"
	src="<%=basePath%>static/js/project_fqck.js"></script>
<script type="text/javascript" src="<%=basePath%>static/js/sg_split.js"></script>

<link href="<%=basePath%>static/css/style.css" type="text/css"
	rel="stylesheet" />
</head>
<body style="height: 100%;">

	<script type="text/javascript"
		src="<%=basePath%>static/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#divideCount").blur(function() {

				var totalmoney = $("#totalmoney").val();
				var divideCount = $("#divideCount").val();
				$("#perMoney").html(totalmoney / divideCount);
				var buyCount = $("#buyCount").val();
				var divideCount = $("#divideCount").val();
				$("#buyMoney").html(totalmoney / divideCount * buyCount);
				var sca = (buyCount / divideCount) * 100 + "" + "%";
				$("#buyScale").html(sca);
			});
			$("#buyCount").blur(
					function() {
						var totalmoney = $("#totalmoney").val();
						var buyCount = $("#buyCount").val();
						var divideCount = $("#divideCount").val();
						$("#buyMoney")
								.html(totalmoney / divideCount * buyCount);
						var sca = (buyCount / divideCount) * 100 + "" + "%";
						$("#buyScale").html(sca);
						if ($("#isbaodi").attr("checked")) {
							$("#baodiCount").attr('disabled', false);
							var totalmoney = $("#totalmoney").val();
							var baodiCount = $("#baodiCount").val();
							var divideCount = $("#divideCount").val();
							$("#baodiMoney").html(
									totalmoney / divideCount * baodiCount);
							var sca = (baodiCount / divideCount) * 100 + ""
									+ "%";
							$("#baodiScale").html(sca);
						}

					});
			$("#isbaodi").click(function() {
				if ($("#isbaodi").attr("checked")) {
					$("#baodiCount").attr('disabled', false);

				} else {
					$("#baodiCount").attr('disabled', true);
					$("#baodiCount").val('');
				}
			});
			$("#baodiCount").blur(function() {
				var totalmoney = $("#totalmoney").val();
				var baodiCount = $("#baodiCount").val();
				var divideCount = $("#divideCount").val();
				$("#baodiMoney").html(totalmoney / divideCount * baodiCount);
				var sca = (baodiCount / divideCount) * 100 + "" + "%";
				$("#baodiScale").html(sca);

			});
			$("#btn_submit").click(function() {
				var divideCount = $("#divideCount").val();
				var baodiCount = $("#baodiCount").val();
				var buyCount = $("#buyCount").val();
				if (buyCount <= 0) {
					alert("发起购买必须大于一份");
					return;
				}
				if (buyCount == divideCount) {
					alert("发起购买不能等于总份数");
					return;
				}
				if (baodiCount > divideCount) {
					alert(divideCount+"保底不能大于总份数"+baodiCount);
					return;
				}
				$("#Form1").submit();
			});
		});
	</script>
	<jsp:include page="../header.jsp"></jsp:include>
	<!--头部结束-->

	<div class="q_main"
		style="width: 1000px; margin: 0 auto; clear: both; margin-top: 6px;">

		<form name="Form1" action="<%=basePath%>hemai/placeorder"
			method="post" id="Form1" style="margin: 0px;">

			<div class="infoqihao">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td class="r"><img src="<%=basePath%>static/images/ssc.png"></td>
							<td class="l">
								<h2>重庆时时彩 合买投注</h2>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<table class="listtable" width="100%" border="0" cellpadding="0"
				cellspacing="0">
				<tbody>
					<tr>
						<td colspan="3" class="yh_hmxx01">&nbsp;&nbsp;填写方案信息</td>
					</tr>

					<tr>
						<td class="listtable_t">合买设置</td>
						<td colspan="2" class="listtable_c"
							style="padding: 10px 0 10px 10px;">

							<table class="fangan_table" style="width: 845px; font-size: 12px"
								border="0" cellpadding="0" cellspacing="0">
								<tbody>
									<tr>
										<th>方案金额</th>
										<th>分成份数</th>
										<th>发起认购</th>
										<!-- <th>提成比例</th> -->
										<th style="border-right: none;">是否保底</th>
									</tr>
									<tr>
										<td><span class="red_b">￥${order.totalMoney}</span> 元 <input
											id="totalmoney" value="${order.totalMoney}" name="allmoney"
											type="hidden"></td>
										<td><input id="divideCount" name="allnum" size="5"
											tabindex="1" value="" type="text">份，每份<span
											class="red" id="perMoney">￥0.00</span>元</td>
										<td><input id="buyCount" name="buynum" size="5"
											tabindex="2" type="text">份，<span class="red"
											id="buyMoney">￥0.00</span> 元（ <span class="red" id="buyScale">0%</span>
											）
											<td style="border-right: none;"><input id="isbaodi"
												name="isbaodi" value="1" tabindex="3" type="checkbox"><input
												id="baodiCount" name="baodinum" disabled="disabled"
												value="0" size="5" tabindex="4" type="text">份，<span
												class="red" id="baodiMoney">￥0.00</span> 元（ <span
												class="red" id="baodiScale">0%</span> ）</td>
									</tr>
									<tr>
										<td colspan="5"
											style="border-right: none; height: 40px; color: #333;">
											是否公开：<input name="isopen" type="radio" value="1"
											checked="checked" /> 方案公开 <input name="isopen" type="radio"
											value="0" /> 跟单后公开<input name="isopen" type="radio"
											value="2" /> 完全保密
										</td>
									</tr>
								</tbody>
							</table>

						</td>
					</tr>
					<tr>
						<td class="listtable_t">方案宣传描述</td>
						<td colspan="2" class="listtable_c"
							style="padding: 10px 0 10px 10px;"><span
							style="display: none"><input name="checkbox"
								type="checkbox" id="chkViewMore"
								onclick="hm.showMore.call(this)" checked="checked"></span> <textarea
								id="caseDescription" name="content" cols="50" rows="3"
								onkeyup="value=value.replace(/[\d]/g,'') "
								onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[\d]/g,''))"></textarea>
							最多500个字</td>
					</tr>

					<tr>
						<td class="listtable_t" style="border-bottom: none;">&nbsp;</td>

						<td colspan="2" class="listtable_c"
							style="border-bottom: none; padding-top: 10px;"><img
							src="<%=basePath%>/static/images/yh97.png" id="btn_submit"
							style="cursor: pointer;" border="0"> <br></td>
					</tr>
				</tbody>
			</table>

			<input name="orderId" value="${order.orderNo}" type="hidden">
		</form>
	</div>
</body>
</html>
