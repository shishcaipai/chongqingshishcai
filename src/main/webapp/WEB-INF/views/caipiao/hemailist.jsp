<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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

<link href="<%=basePath%>static/css/jqueryui.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>static/css/style.css" type="text/css"
	rel="stylesheet" />
<script>
	function seturl(obj) {
		var a = document.getElementById("frame_content");
		a.src = obj;
	}
</script>
<link href="<%=basePath%>static/css/together.css" type="text/css"
	rel="stylesheet">
<script src="<%=basePath%>static/js/buyTogether.js"
	type="text/javascript"></script>
<script src="<%=basePath%>static/js/jquery.js"
	type="text/javascript"></script>
<script>
	function gopage(obj) {
		window.location.href = "sInfo1.asp?page=" + obj.value + "&classid="
				+ 401;
	}
</script>
</head>
<body>

	<script type="text/javascript">
		$(function() {
			$.ajax({
				type : "post",
				url : "user/getUser",
				success : function(res) {
					res = eval(res);
					var money = res[0].money;
					var frozenMoney = res[0].frozenMoney;

					$("#mymoeny").mouseover(function() {
						if ($(this).hasClass("over")) {
							$(this).removeClass("over");
							$(this).html("***");
						} else {
							$(this).addClass("over");
							$(this).html((money - frozenMoney).toFixed(2));
						}
					});

					$("#mymoeny").addClass("over").html(
							(money - frozenMoney).toFixed(2));
					$("#username").html(res[0].username);
				}
			});
		});
	</script>
	<div class="mainbody">
		<jsp:include page="../header.jsp"></jsp:include>
		<jsp:include page="../banner.jsp"></jsp:include>

		<ul id="tc_body">
			<li class="tc_a">
				<ul class="tc_a01">
					<li class="tc_a01_bt"><h2>彩票合买</h2></li>
					<li class="tc_a01_nr">
						<ul class="yh_a01">
							<li class="yh_a01_nr"><a href="together?type=0">全部彩种</a></li>

							<li class="yh_a01_nr"><a href="together?type=1">重庆时时彩</a></li>

							<li class="yh_a01_nr"><a href="together?type=8">广东11选5</a></li>

							<li class="yh_a01_nr"><a href="together?type=3">山东十一运</a></li>

							<li class="yh_a01_nr"><a href="together?type=4">江西11选5</a></li>

							<li class="yh_a01_nr"><a href="together?type=5">福彩3D</a></li>

						</ul>
					</li>
				</ul>
			</li>
			<li class="tc_b">
				<!-- <iframe id="ifname" width="100%" frameborder="0" scrolling="no" align="middle" src="sInfo" name="sInfo1" height="1075"></iframe> -->







				<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
				<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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

						<td><span class="new_hemai_red">${order.order.totalMoney}</span></td>
						<td><span class="new_hemai_red">${order.order.totalMoney/order.fensum}</span></td>
						<td style="color: #333;"><span style="float: left;">
								${order.floatManay/order.order.totalMoney*100}% +
								${(order.fensum - order.subGuaranteeSum)/order.fensum * 100 }% </td>
						<td>${order.fensum - order.subGuaranteeSum }</td>


						<td class="new_hemai_srk"><input name="buynum" type="text"
							class="rec_text" id="btnBuy1num" value="0" /></td>
						<td class="new_hemai_an"><a
							onclick="javascript:btnBuy(this);"
							style="margin-left: 25px; cursor: pointer; text-decoration: underline; color: blue;"
							id="btnBuy1"> <input type="hidden" value="10522" /> <input
								type="hidden" value="2" /> <input type="hidden" value="28.00" />
								<input type="hidden" value="0" /> 购买
						</a> <!-- <input name="提交" type="submit" class="btn_Dora_s" value="" onclick="return confirm(&#39;是否认购？&#39;)" /> -->
						</td>



					</tr>
				</c:forEach>
				<form></form>
				<TR>
					<td colSpan=10>
						<table class="hm_page" border="0" cellpadding="0" cellspacing="0"
							width="100%" style="height: 36px;">
							<tbody>
								<tr>
									<td align="center" class="page" id="show_page_div">页次:<b><font
											color="red">${requestScope.pageNum}</font></b> /
										${requestScope.page} &nbsp;&nbsp;共有:${requestScope.size} 条记录 <a
										href="<%=basePath%>hemai/hemaiview?type=0&pageNum=1">首页</a>
										&nbsp;&nbsp;&nbsp;&nbsp; <a
										href="<%=basePath%>hemai/hemaiview?type=0&pageNum=${requestScope.pageNum == 1 ? 1 : requestScope.pageNum - 1}">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
										<a
										href="<%=basePath%>hemai/hemaiview?type=0&pageNum=${requestScope.pageNum == requestScope.page ? requestScope.pageNum : requestScope.pageNum + 1}">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
										<a
										href="<%=basePath%>hemai/hemaiview?type=0&pageNum=${requestScope.page}">尾页</a>
										&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;跳转:
										 <select
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

<script type="text/javascript">
	function change(index) {
		var type = $("#type").val();
		window.location.href = "<%=basePath%>hemai/hemaiview?type=" + type + "&pageNum=" + index;
	}
	function page(){
		var html = "";
		var data = ${requestScope.page};
		var currentPage = ${requestScope.pageNum};
		for(var i=0;i<data;i++){
			var index = i+1;
			if(currentPage == index){
				html += "<option value="+index+" selected = true>"+index+"</option>";
			}else{
				html += "<option value="+index+">"+index+"</option>";
			}
			
		}
		$("#page").html(html);
	}
	page();
</script>
				</html> <script type="text/javascript">
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
			</li>
		</ul>
		<div class="clear"></div>
		<
		<!--底部-->
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
	</div>
</body>
</html>
