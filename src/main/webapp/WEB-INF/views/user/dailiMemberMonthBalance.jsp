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
<title>月度结算</title>
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
	<h2>月度结算表</h2>
	
		<table cellspacing="0" cellpadding="0" border="0">
			<tbody>
            <tr>
            	 
                 	<td height="28">成员</td>
					<td align="left">
                    	<select id="agentID" name="SelAgentID">
					
					<option value="4656">518168</option>
					
					</select>
                    </td>
                
                <input type="hidden" value="" id="useId"/>
				<td align="left">&nbsp;&nbsp;<input class="cps_ny_a3" name="btnSeach" type="button" value="ËÑË÷" id="btnSearch" /></td> 
			</tr>
			</tbody>
		</table>
	
	</div>
	<div class="p_nr">
<table align="center" cellspacing="0" cellpadding="0" border="0" class="ylf_tg_bg">
<tbody>
	<tr>
		<td colspan="2">
			<div style="height:500px; overflow-y:auto;">
            <table width="100%" cellspacing="1" cellpadding="0" border="0" id="DataList">
            <thead>
            	<tr>
                	<th width="20%">时间</th>
                    <th width="30%">交易量</th>
                    <th width="30%">返利总额</th>
                    <th width="20%">收入明细</th>
                </tr>
            </thead>
            <tbody>
            	
            	 <tr>
            		<td>2016-12</td>
            		<td>14916.0</td>
            		<td>0.00</td>
            		<td><a href="incomeList?userId=4656&dateStr=2016-12">明细</a></td>
            	</tr>
            	
            	 <tr>
            		<td>2017-01</td>
            		<td>176098.0</td>
            		<td>0.00</td>
            		<td><a href="incomeList?userId=4656&dateStr=2017-01">明细</a></td>
            	</tr>
            	
            	 <tr>
            		<td>2017-02</td>
            		<td>0.0</td>
            		<td>0.00</td>
            		<td><a href="incomeList?userId=4656&dateStr=2017-02">明细</a></td>
            	</tr>
            	
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
  
</td></TR> 
            </tbody>
            </table>
			</div>
		</td>
	</tr>
</tbody>
</table>
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
