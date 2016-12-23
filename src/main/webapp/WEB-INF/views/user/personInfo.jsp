<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=basePath %>static/css/jqueryui.css" type="text/css" rel="stylesheet" />
<link href="<%=basePath %>static/css/style.css" type="text/css" rel="stylesheet" />
<script src="<%=basePath %>static/js/commonUtil.js" type="text/javascript"></script>
<title>1000万不是梦想！</title>
</head>

<body>
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../banner.jsp"></jsp:include>
<!--main-->
<div class="main fn_clear user">
	<div class="wrap">
        <jsp:include page="memberLeftMenu.jsp"></jsp:include>
        
        <div class="userbox">
            
            <div class="modelu">
            	<div class="title"><em>个人信息</em></div>
            	<input id="userName" type="hidden" value="${sessionScope.memberUser.userName}"/>
                <div class="mdbox">
                    <div id="personInfoEdit" class="serbox serbox2">
                    	<table cellpadding="6" cellspacing="6" class="tb2">
                        	<tr>
                            	<td align="right">用户名：</td>
                                <td>${memberUser.userName}</td>
                            </tr>
                            <tr>
                            	<td align="right">注册时间：</td>
                                <td>${memberUser.createDate}</td>
                            </tr>
                            <tr>
                            	<td align="right">手机号：</td>
                                <td><input id="telephone" name="telephone" type="text" class="inp3" value="${memberUser.telephone}"/></td>
                            </tr>
                            <tr>
                            	<td align="right">邮箱：</td>
                                <td>
                                	<c:choose>
                                		<c:when test="${not empty memberUser.userName}">${memberUser.userName}</c:when>
                                		<c:otherwise><a href="<%=basePath%>user/emialInfo">绑定个人邮箱</a></c:otherwise>
                                	</c:choose>
                                </td>
                            </tr>
                            <tr>
                            	<td align="right">性别：</td>
                                <td>
                                	<select id="sex">
                                		<option value="男" <c:if test="${memberUser.sex eq '男'}">selected=\"true\"</c:if>>男</option>
                                		<option value="女" <c:if test="${memberUser.sex eq '女'}">selected=\"true\"</c:if>>女</option>
                                		<option value="保密" <c:if test="${memberUser.sex eq '保密'}">selected=\"true\"</c:if>>保密</option>
                                	</select>
                                </td>
                            </tr>
                            <tr>
                            	<td align="right">生日：</td>
                                <td><input id="birthday" type="text" class="datepicker inp3" value="${memberUser.birthday}"/></td>
                            </tr>
                            <tr>
                            	<td align="right">所在地：</td>
                                <td><select id="provinceId" onchange="getCityList()">
                                	   <option>省/直辖市</option>
                                       <c:forEach items="${requestScope.provinceList}" var="province_var">
			                       	      <option value="${province_var.className}" <c:if test="${province_var.className eq memberUser.state}">selected=\"true\"</c:if>>
			                       	      	${province_var.className}
			                       	      </option>
			                       	   </c:forEach>
                                	</select>
                                	<select id="cityId">
                                	 	<c:if test="${not empty memberUser.city}">
                                	 		<option value="${memberUser.city}">${memberUser.city}</option> 
                                	 	</c:if>
                                	</select>
                                </td>
                            </tr>
                            <tr>
                            	<td align="right">联系地址：</td>
                                <td><input id="address" name="address" type="text" class="inp3" value="${memberUser.address}"/></td>
                            </tr>
                            <tr>
                            	<td align="right"></td>
                                <td><input id="memberInfoId" type="image" src="<%=basePath %>static/images/bc.png" onclick="userInfoSubmit()"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                
                <div class="alarm fn_clear">
                    <h4>实名认证</h4>
                    <c:choose>
                         <c:when test="${not empty memberUser.realName}"><p>恭喜您，已经完成实名信息填写</p></c:when>
                         <c:otherwise><p>您还没有填写实名信息，实名信息是购彩的必备信息，建议您 <a href="<%=basePath%>user/realNameInfo">立即填写</a></p></c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        
    </div>
</div>
<!--main end -->
<jsp:include page="../footer.jsp"></jsp:include>


<div class="opacity">
	<div class="dialog">
    	<div class="diatitle"><em>提示</em></div>
        <div class="diabox">
        	提示信息
        </div>
    </div>
</div>

<script type="text/javascript" src="<%=basePath %>static/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>static/js/jqueryui.js"></script>
<script type="text/javascript" src="<%=basePath %>static/js/slides.js"></script>
<script type="text/javascript" src="<%=basePath %>static/js/effects.js"></script>
<script type="text/javascript">
	    function userInfoSubmit(){
	    
	    	if($("#telephone").val()==''){
		    	 custom_alert("手机号不能为空","提示");
				 return false;;	
			}
	    	if(!checkPhone($("#telephone").val())){
		    	 custom_alert("手机号格式不正确","提示");
				 return false;;	
			}
	    	if($("#birthday").val()==''){
				 custom_alert("生日不能为空","提示");
				 return false;;
			}
			if($("#provinceId").val()==''
				||$("#provinceId").val()=='省/直辖市'){
		    	 custom_alert("所在省份不能为空","提示");
				 return false;;	
			}
			if($("#cityId").val()==''
				||$("#cityId").val()=='选择市'){
		    	 custom_alert("所在城市不能为空","提示");
				 return false;;	
			}
		    if($("#address").val()==''){
		    	 custom_alert("联系地址不能为空","提示");
				 return false;;	
			}
	    
	    	var memberUser={};
	    	memberUser["userName"]=$("#userName").val();
			memberUser["sex"]=$("#sex").val();
			memberUser["birthday"]=$("#birthday").val();
			memberUser["state"]= $("#provinceId").val();
			memberUser["city"]= $("#cityId").val();
			memberUser["address"]= $("#address").val();
			memberUser["telephone"]= $("#telephone").val();

			//保存
			$.ajax({
				url : '<%=basePath %>user/savePersonInfo',
				data:memberUser,
				type:'post',
				dataType:'text',
				success : function(result) {
					custom_alert(result,'提示');
				}    
			}); 
		}
		
	function getCityList(){
		var provinceName = $("#provinceId").val();
		$.ajax( {  
	        type : 'post',  
	        data : 'provinceName='+ provinceName,
	        url : '<%=basePath %>user/getCityList',  
	        dataType:'json',  
	        success : function(data) { 
	         	$("#cityId").empty();
	            for(var i=0;i<data.length;i++){    
	            	var option = $("<option>").val(data[i].className).text(data[i].className);
      				$("#cityId").append(option);
	            }
	        }  
   	 	});  
   	}
   	
	$(document).ready(function(){
		$("#personInfoMenu").addClass("hover");
	});
</script>
</body>
</html>

