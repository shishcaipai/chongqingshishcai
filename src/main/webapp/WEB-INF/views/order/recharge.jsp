<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=basePath%>static/css/jqueryui.css" type="text/css" rel="stylesheet" />
<link href="<%=basePath%>static/css/style.css" type="text/css" rel="stylesheet" />
<title>我要充值</title>
</head>
 
<body>
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../banner.jsp"></jsp:include>
 
<!--main-->
<div class="main fn_clear user">
	<div class="wrap">
        
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
 
 <script type="text/javascript">
 
   function doRechargeOrder(){
        var totalMoney=$("#totalMoney").val();
        var r = /^[0-9]*[1-9][0-9]*$/　　//正整
        
        if(totalMoney == ""){
          alert("请输入充值金额!");
          return false;
        }else if(r.test(totalMoney) == false){
          alert("请输入正确的金额!");
          return false;
        }else{
          	$.ajax({  
		        type : "post",  
		        url : "${pageContext.request.contextPath}/order/recharge/ajax_save",  
		        dataType:"json",  
		        data:{
		           "totalMoney":totalMoney
		        },
		        success : function(data) {
		          
		           if(data.sucess){
		            	window.location.href="${pageContext.request.contextPath}/order/alipay?tradeNo=123&subject=123&totalMoney="+totalMoney;
		           }else{
		                alert("下注失败！");
		           }
		          
		        }  
		    });
        }
    
   }
   
 </script>
 
</body>
</html>

