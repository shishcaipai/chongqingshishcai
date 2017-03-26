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
<link href="<%=basePath%>static/new/css/page_left.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>static/new/css/head.css" rel="stylesheet"
	type="text/css" />
<title>好运来</title>
</head>

<body>
<jsp:include page="../header2.jsp"></jsp:include>
	<div class="header clearfix">
		<jsp:include page="../header3.jsp"></jsp:include>
<!--main-->
<<div id="account">
		<div class="account_left">
			<jsp:include page="memberLeftMenu.jsp"></jsp:include>
		</div>
		<div class="account_right">
        <div class="userbox">
            
            <div class="modelu">
            	<div class="title"><em>我要充值</em></div>
                
                <div class="tabt">
                	<a href="#" class="hover">支付宝</a><!-- <a href="#">网上支付</a><a href="#">优惠码兑换</a> -->
                </div>
                
                <div class="mdbox">
                	<div class="serbox serbox2">
                    	<table cellpadding="6" cellspacing="6" class="tb2">
                        	<tr>
                            	<td>请输入您充值的金额：</td>
                                <td><input type="text" id="totalMoney" class="inp3" /> 元</td>
                            </tr>
                            <tr>
                            	<td></td>
                                <td><div class="czm"><input type="radio" checked="checked" readonly="readonly" /><img src="<%=basePath%>static/images/ab_1.jpg" /></div></td>
                            </tr>
                            <tr>
                            	<td></td>
                                <td><input type="image" onclick="doRechargeOrder()" src="<%=basePath%>static/images/cz2.png" /></td>
                            </tr>
                            
                        </table>
                    </div>
                </div>
                
                <div class="alarm fn_clear">
                    <h4>使用支付宝方式充值请注意以下提示信息：</h4>
                    <p>1、您必须注册成为支付宝的用户，并保持支付宝账户有足够的现金（可以通过网银充值、拉卡啦线下刷卡等方式实现）；</p>
                    <p>2、如果你没有支付宝账户，支付宝目前提供各大银行的网上支付功能；</p>
                    <p>3、使用支付宝充值，无任何手续费；</p>
                    <p>4、客服电话:0571-88156688。</p>
                </div>
                
            </div>
        </div> 
</div>
</div>
</div>
<!--main end -->


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

