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
<link href="http://www.ib18.cn/res/css/page_left.css" rel="stylesheet"
	type="text/css" />
<link href="http://www.ib18.cn/res/css/head.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>static/css/jqueryui.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>static/css/style.css" type="text/css"
	rel="stylesheet" />
<LINK href="http://www.ib18.cn/res/css/head.css" type=text/css
	rel=stylesheet>
<link href="http://www.ib18.cn/res/css/page.css" type="text/css"
	rel="stylesheet">
<link href="http://www.80cb.cn/res/css/common.css" type="text/css"
	rel="stylesheet">
<link href="http://www.80cb.cn/res/css/cps.css" type="text/css"
	rel="stylesheet">
<title>成员消费</title>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="account">
		<div class="account_left">
			<jsp:include page="dailimemberLeftMenu.jsp"></jsp:include>
		</div>
		<div class="account_right">
			<div class="user_right">
				<div class="p_yd01">
					<div class="p_daohang">
						<h2>会员消费列表</h2>
						<table cellspacing="0" cellpadding="0" border="0">
							<tbody>
								<tr>
									<td height="28">会员</td>
									<td align="left"><select id="agentID" name="SelAgentID">

											<option value="4656">518168</option>

											<option value="4658">cxju8881</option>

											<option value="4790">17786282835</option>

									</select></td>
									<td align="center">&nbsp;&nbsp;<input class="cps_ny_a3"
										name="btnSeach" type="button" value="搜索" id="btnSearch" /></td>
								</tr>
							</tbody>
						</table>

					</div>
					<div class="p_nr">

						<div style="height: 500px; overflow-y: auto;">
							<table width="100%" cellspacing="0" cellpadding="0" border="0"
								id="DataList" class="ylf_tg_bg">
								<thead>
									<tr>
										<th width="10%">序号</th>
										<th width="20%">会员</th>
										<th width="20%">注册时间</th>
										<th width="20%">消费总额</th>
										<th width="20%">返利总额</th>
										<th width="10%">查看</th>
									</tr>
								</thead>
								<tbody>


									<tr>
										<td style="text-align: center;">1</td>
										<td>518168</td>
										<td>2016-12-19 14:29:40</td>
										<td>0.0</td>
										<td>10000.0</td>
										<td><a href="incomeDetail2?userId=4656&single=1">查看</a>
										</td>
									</tr>


									<tr>
										<td style="text-align: center;">2</td>
										<td>cxju8881</td>
										<td>2016-12-21 11:46:51</td>
										<td>1020.0</td>
										<td>100000.0</td>
										<td><a href="incomeDetail2?userId=4658&single=1">查看</a>
										</td>
									</tr>


									<tr>
										<td style="text-align: center;">3</td>
										<td>17786282835</td>
										<td>2017-01-13 18:46:02</td>
										<td>17904.0</td>
										<td>0.0</td>
										<td><a href="incomeDetail2?userId=4790&single=1">查看</a>
										</td>
									</tr>

								</tbody>
								<TR>
									<td colSpan=10>
										<table class="hm_page" border="0" cellpadding="0" cellspacing="0" width="100%" style=" height:36px;">
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
  </tr>
  </tbody></table>
									</td>
								</TR>
							</table>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!--main end -->
<script type="text/javascript">
	function change(index) {
		var type = $("#type").val();
		window.location.href = "<%=basePath%>betting_record?type=" + type + "&pageNum=" + index;
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
	<jsp:include page="../footer.jsp"></jsp:include>
	<div class="opacity">
		<div class="dialog">
			<div class="diatitle">
				<em>提示</em>
			</div>
			<div class="diabox">提示信息</div>
		</div>
	</div>
</body>
</html>
