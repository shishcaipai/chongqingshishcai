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
<link href="<%=basePath%>static/css/jqueryui.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>static/css/style.css" type="text/css"
	rel="stylesheet" />
<script src="<%=basePath%>static/js/commonUtil.js"
	type="text/javascript"></script>
<link href="<%=basePath%>static/new/css/page_left.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>static/new/css/head.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>static/new/css/page.css" type="text/css"
	rel="stylesheet" />
<script type="text/javascript"
	src="<%=basePath%>static/js/WdatePicker.js"></script>
<title>1000万不是梦想！</title>
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
						<li style="float: left;"><b>修改个人信息</b></li>
						<li style="float: right;"></li>
					</ul>
				</div>

				<div class="tc_yhzx_k">
					<input id="userName" type="hidden"
						value="${sessionScope.memberUser.userName}" />
					<TABLE class=table_u_all cellSpacing=0 cellPadding=0 border=0>
						<TBODY>
							<TR>
								<TD class="tikuan_a2">真实姓名：</TD>
								<TD class="tikuan_a3"><INPUT class="zlxg_srk" id="realname"
									value="${memberUser.realName}" /></TD>

								<TD class="tikuan_a2">性 别：</TD>
								<TD class="tikuan_a3" id="realsex"><select id="sex">
										<option value="0"
											<c:if test="${memberUser.sex eq '0'}">selected=\"true\"</c:if>>男</option>
										<option value="1"
											<c:if test="${memberUser.sex eq '1'}">selected=\"true\"</c:if>>女</option>
										<option value="2"
											<c:if test="${memberUser.sex eq '2'}">selected=\"true\"</c:if>>保密</option>
								</select>
							</TR>
							<TR>
								<TD class="tikuan_a2">出生日期：</TD>
								<TD class="tikuan_a3"><input id="birthday" type="text"
									class="Wdate inp3" value="${memberUser.birthday}"
									onClick="WdatePicker()" /></TD>

								<TD class="tikuan_a2">身份证号：</TD>
								<TD class="tikuan_a3"><INPUT class="zlxg_srk" name=cardNo
									value="${memberUser.identityCard}" id="cardNo" maxLength=18></TD>

							</TR>

							<TR>
								<TD class="tikuan_a2">手机号码：</TD>
								<TD class="tikuan_a3"><input id="telephone"
									name="telephone" type="text" class="zlxg_srk"
									value="${memberUser.telephone}" maxlength="20" />&nbsp;</TD>

								<TD class="tikuan_a2">电子邮箱：</TD>
								<TD class="tikuan_a3"><INPUT class="zlxg_srk" id="email"
									name=email id="email" value="${memberUser.email}"></TD>
							</TR>
							<%-- <TR>
							<td align="right">所在地：</td>
							<td><select id="provinceId" onchange="getCityList()">
									<option>省/直辖市</option>
									<c:forEach items="${requestScope.provinceList}"
										var="province_var">
										<option value="${province_var.className}"
											<c:if test="${province_var.className eq memberUser.state}">selected=\"true\"</c:if>>
											${province_var.className}</option>
									</c:forEach>
							</select> <select id="cityId">
									<c:if test="${not empty memberUser.city}">
										<option value="${memberUser.city}">${memberUser.city}</option>
									</c:if>
							</select></td>
							</tr> --%>
							<tr>
								<td  class="tikuan_a2" align="right">联系地址：</td>
								<td  class="tikuan_a3"><input id="address" name="address" type="text"
									class="zlxg_srk" value="${memberUser.address}"  /></td>
							</tr>
							</TR>

							<TD class="tikuan_a2">注册时间:</TD>
							<TD class="tikuan_a3">${memberUser.createDate}</TD>

						</TBODY>
					</TABLE>
						<input class="zlxg_tijiao" id="memberInfoId" type="image"
						src="<%=basePath%>static/images/bc.png" onclick="userInfoSubmit()" />

						<INPUT id=reload type=hidden value=1 name=reload>
				</div>
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

	<script type="text/javascript" src="<%=basePath%>static/js/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/jqueryui.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/slides.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/effects.js"></script>
	<script type="text/javascript">
	    function userInfoSubmit(){
	    	if($("#telephone").val()==''){
		    	 alert("手机号不能为空");
				 return false;;	
			}
	    	if(!checkPhone($("#telephone").val())){
	    		alert("手机号格式不正确");
				 return false;;	
			}
	    	if($("#birthday").val()==''){
	    		alert("生日不能为空");
				 return false;;
			}
			
		    if($("#address").val()==''){
		    	alert("联系地址不能为空");
				 return false;;	
			}
		    alert($("#realname").val());
	    	var memberUser={};
	    	memberUser["userName"]=$("#userName").val();
			memberUser["sex"]=$("#sex").val();
			memberUser["birthday"]=$("#birthday").val();
			memberUser["identityCard"]= $("#cardNo").val();
			memberUser["realName"]= $("#realname").val();
			memberUser["address"]= $("#address").val();
			memberUser["telephone"]= $("#telephone").val();
			memberUser["email"]= $("#email").val();
			//保存
			$.ajax({
				url : '<%=basePath%>user/savePersonInfo',
				data:memberUser,
				type:'post',
				dataType:'text',
				success : function(result) {
					alert(result);
				}    
			}); 
		}
		
	function getCityList(){
		var provinceName = $("#provinceId").val();
		$.ajax( {  
	        type : 'post',  
	        data : 'provinceName='+ provinceName,
	        url : '<%=basePath%>user/getCityList',
				dataType : 'json',
				success : function(data) {
					$("#cityId").empty();
					for (var i = 0; i < data.length; i++) {
						var option = $("<option>").val(data[i].className).text(
								data[i].className);
						$("#cityId").append(option);
					}
				}
			});
		}

		$(document).ready(function() {
			$("#personInfoMenu").addClass("hover");
		});
	</script>
</body>
</html>

