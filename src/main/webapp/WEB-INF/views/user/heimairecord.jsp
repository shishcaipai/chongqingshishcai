<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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
<link href="<%=basePath%>static/new/css/page.css" type="text/css" rel="stylesheet"/>
<link href="<%=basePath%>static/css/jqueryui.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>static/css/style.css" type="text/css"
	rel="stylesheet" />
<script type="text/javascript" src="<%=basePath%>static/js/WdatePicker.js"></script>
<title>个人中心</title>
</head>

<body>
<jsp:include page="../header2.jsp"></jsp:include>
	<div class="header clearfix">
		<jsp:include page="../header3.jsp"></jsp:include>
	<!--main-->
	<div id="account">
		<div class="account_left">
			<jsp:include page="memberLeftMenu.jsp"></jsp:include>
		</div>
		<div class="account_right">
			
<div class="p_yd01">

	<div class="p_daohang">
		<ul>
			<li style="float:left;"><b>投注记录</b></li>
			<li style="float:right;">
			<!-- <form action="betRecord">
				认购时间：
				<input name="createTimeDTO" value="" style="width: 100px" class="Wdate" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'})" />
				-
				<input name="endTimeStr" value="" style="width: 100px" class="Wdate" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'})" />
				<input type="submit" value="查询" style="cursor: pointer;" />
			</form> -->
			</li>
		</ul>
	</div>

	<div class="p_nr">

<TABLE cellSpacing=0 cellPadding=0 border="0" border=0 class="page_tzjl">
  <TBODY>
			<tr class="page_tzjl01">
				<td width="20%" align="center" valign="middle">订单号</td>
				<td width="12%" align="center" valign="middle">彩种</td>
				<td width="12%" align="center" valign="middle">发起人</td>
				<td width="8%" align="center" valign="middle">认购份数</td>
				<td width="8%" align="center" valign="middle">认购金额</td>
				<td width="15%" align="center" valign="middle">认购时间</td>
				<TD width="5%" align="center" valign="middle">是否中奖</TD>
				<TD width="14%" align="center" valign="middle">奖金</TD>
				<TD width="10%" align="center" valign="middle">详情</TD>
			  </tr>
     <c:forEach var="order" items="${requestScope.list }">
								<tr class="page_tzjl01">
									<td width="20%" align="center" valign="middle">${order.orderNo }</td>
									<td width="12%" align="center" valign="middle">重庆时时彩</td>
									<td width="12%" align="center" valign="middle">${order.username }</td>
									<td width="8%" align="center" valign="middle">${order.fensum }</td>
									<td width="8%" align="center" valign="middle">${order.fenmoney }</td>
									<td width="15%" align="center" valign="middle">${order.createDate }</td>
									<td width="5%" align="center" valign="middle">${order.zhongjiao }</td>
									<td width="14%" align="center" valign="middle">${order.money }</td>
									<td width="10%" align="center" valign="middle"><a href="<%=basePath%>user/orderdetail?orderId=${order.orderNo }">查看</a></td>
								</tr>
							</c:forEach>
  
<TR>
<td colSpan=10>
  <table class="hm_page" border="0" cellpadding="0" cellspacing="0" width="100%" style=" height:36px;">
  <tbody>
  <tr>
   <td align="center" class="page" id="show_page_div">页次:<b><font
														color="red">${requestScope.pageNum}</font></b> /
													${requestScope.page} &nbsp;&nbsp;共有:${requestScope.size} 条记录 <a
													href="<%=basePath%>hemai_record?type=0&pageNum=1">首页</a>
													&nbsp;&nbsp;&nbsp;&nbsp; <a
													href="<%=basePath%>hemai_record?type=0&pageNum=${requestScope.pageNum == 1 ? 1 : requestScope.pageNum - 1}">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
													<a
													href="<%=basePath%>hemai_record?type=0&pageNum=${requestScope.pageNum == requestScope.page ? requestScope.pageNum : requestScope.pageNum + 1}">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
													<a
													href="<%=basePath%>hemai_record?type=0&pageNum=${requestScope.page}">尾页</a>
													&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;跳转:
													 <select
													name="pageNum"
													onchange='javascript:change(this.options[this.options.selectedIndex].value)'
													id="page">
														<option value="1" selected>1</option>
												</select> &nbsp;&nbsp;
												</td>
  </tr>
  </tbody></table>
  
</td></TR> 


</TBODY></TABLE>
	</div>
			
			<%-- <div class="userbox">

				<div class="modelu">
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
							<c:forEach var="order" items="${requestScope.orderDetails }">
								<tr>
									<td>${order.order.name }</td>
									<td>sss</td>
									<td>${order.order.memberUser.userName }</td>
									<td>${order.order.totalMoney }</td>
									<td>sss</td>
									<td>${order.order.orderStatus }</td>
									<td>${order.order.orderTime }</td>
									<td><a href="#">删除</a><a href="#">查看</a></td>
								</tr>
							</c:forEach>
							
							<TR>
								<td colSpan=10>
									<table class="hm_page" border="0" cellpadding="0" cellspacing="0"
										width="100%" style="height: 36px;">
										<tbody>
											<tr>
												<td align="center" class="page" id="show_page_div">页次:<b><font
														color="red">${requestScope.pageNum}</font></b> /
													${requestScope.page} &nbsp;&nbsp;共有:${requestScope.size} 条记录 <a
													href="<%=basePath%>betting_record?type=0&pageNum=1">首页</a>
													&nbsp;&nbsp;&nbsp;&nbsp; <a
													href="<%=basePath%>betting_record?type=0&pageNum=${requestScope.pageNum == 1 ? 1 : requestScope.pageNum - 1}">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
													<a
													href="<%=basePath%>betting_record?type=0&pageNum=${requestScope.pageNum == requestScope.page ? requestScope.pageNum : requestScope.pageNum + 1}">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
													<a
													href="<%=basePath%>betting_record?type=0&pageNum=${requestScope.page}">尾页</a>
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
						</table>
					</div>
				</div>
			</div> --%>
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
	function change(index) {
		var type = $("#type").val();
		window.location.href = "<%=basePath%>hemai_record?type=" + type + "&pageNum=" + index;
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
</body>
</html>
