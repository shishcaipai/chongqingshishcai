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
<title>盈收统计</title>
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
		<ul>
			<li style="float:left;"><b>盈收统计</b></li>
			<li style="float:right;">
			<form action="my_income">
				<input type="hidden" name="from" value="input" />
				<input type="hidden" name="selectType" value="" />
				交易时间：
				<input name="startDate" value="2017-02-01" style="width: 100px" class="Wdate" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'})" />
				-
				<input name="endDate" value="2017-02-13" style="width: 100px" class="Wdate" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'})" />
				<input type="submit" value="统计" style="cursor: pointer;" />
				<input type="submit" value="明细" style="cursor: pointer;" onclick="selectTypeMx()" />
			</form>
			</li>
		</ul>
	</div>
	
	<div class="p_nr">
	<!--明细-->
	
	
	<table class="zhmx" border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td>
			
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="zhmx_nr01">
				  <tr>					
					<td width="100" align="center" valign="middle">用户名</td>
					<td width="100" align="center" valign="middle">用户类型</td>
					<td width="100" align="center" valign="middle">上级</td>
					<td width="100" align="center" valign="middle">充值金额</td>
					<td width="100" align="center" valign="middle">赠送金额</td>
					<td width="100" align="center" valign="middle">提款金额</td>
					<td width="100" align="center" valign="middle">当前余额</td>
					<td width="100" align="center" valign="middle">盈利金额</td>
				  </tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="page_tzjl02">
                  
			      <tr>
					<td width="100" align="center" valign="middle">
					17786282835
					</td>
					<td width="100" align="center" valign="middle">
					普通用户
					</td>
					<td width="100" align="center" valign="middle">
					518168
					</td>
					<td width="100" align="center" valign="middle">
						-
					</td>
					<td width="100" align="center" valign="middle">
						-
					</td>
					<td width="100" align="center" valign="middle">
						-
					</td>
					<td width="100" align="center" valign="middle">
						
							-
						
						
					</td>
					<td width="100" align="center" valign="middle">
						
							-
						
						
						
					</td>
				  </tr>
                  
			      <tr>
					<td width="100" align="center" valign="middle">
					cxju8881
					</td>
					<td width="100" align="center" valign="middle">
					普通用户
					</td>
					<td width="100" align="center" valign="middle">
					518168
					</td>
					<td width="100" align="center" valign="middle">
						-
					</td>
					<td width="100" align="center" valign="middle">
						-
					</td>
					<td width="100" align="center" valign="middle">
						-
					</td>
					<td width="100" align="center" valign="middle">
						
						
							4
						
					</td>
					<td width="100" align="center" valign="middle">
						
						
						
							<b style="color: #fff;background: #f8b551;">-4</b>
						
					</td>
				  </tr>
                  
				</table>
			
			
			</td>
		  </tr>
			<TR>
				<td colSpan=10>
					<table class="hm_page" border="0" cellpadding="0" cellspacing="0" width="100%" style=" height:36px;font-weight: bold;">
						<tbody>
						<tr>
							<td align="center">
								充值总额：<span style="color: red">0</span>元
							</td>
							<td align="center">
								赠送总额：<span style="color: red">0</span>元
							</td>
							<td align="center">
								提款总额：<span style="color: red">0</span>元
							</td>
							<td align="center">
								总余额：<span style="color: red">4</span>元
							</td>
							<td align="center">
								盈收总计：<span style="color: red">-4</span>元
							</td>
						</tr>
						</tbody>
					</table>
				</td>
			</TR>
		</table>
	
	<!--账户明细-->
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
