<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>购买确认</title>
</head>
 
<body>
       <br /><jsp:include page="../header.jsp"></jsp:include>
	   <jsp:include page="../banner.jsp"></jsp:include>
<!--main-->
<div class="main fn_clear user">
	<div class="wrap">
        <div class="order_page">
        	<div class="oreder_title"><em>胜负彩第${currentPeriod.lotteryPeriod }期方案确认投注内容	</em></div>
            <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                	<td class="td1">投注内容</td>
                    <td>
                    	<div class="tdback">
                        	<table cellpadding="0" cellspacing="0" border="0" width="100%">
                            	<tr>
                                	<th>场次</th>
                                    <th>对阵</th>
                                    <th>选号</th>
                                </tr>
                                
                                <c:forEach items="${requestScope.confirmInfoList }" var="footballMatch" varStatus="vs">
                                <tr>
                                	<td>${vs.index+1 }</td>
                                    <td>${footballMatch.homesxName } VS ${footballMatch.awaysxName }</td>
                                    <td>${footballMatch.buyNumber }</td>
                                </tr>
                               </c:forEach>
                            </table>
                        </div>
                        
                    </td>
                </tr>
                
                <tr>
                	<td class="td1">方案信息</td>
                    <td>
                        <p>方案注数<i class="red">${lotteryCount }注</i>，倍数<i class="red">1</i>倍，总金额<i class="red">￥${totalMoney }</i>。</p>
                    </td>
                </tr>
                
                <tr>
                	<td class="td1">我要认购</td>
                    <td>
                        <p class="f12 fn_clear" style="line-height:30px; margin-bottom:5px;">
                        <a href="javascript:void(0)" style="float:left;" onclick="toBuy()"><img src="<%=basePath%>static/images/ljgm.png" /></a>
                        <a href="javascript:history.go(-1)">返回修改</a></p>
                        </td>
                </tr>
                
            </table>
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
   function toBuy(){
        var name="${name}";
        var totalMoney="${totalMoney}";
        var lotteryCode="${lotteryCode}";
        var lotteryCount="${lotteryCount}";
        var buyCaiNumber="${buyCaiNumber}";
        
        $.ajax({  
		        type : "post",  
		        url : "${pageContext.request.contextPath}/order/sfc/ajax_save",  
		        dataType:"json",  
		        data:{
		           "name":name,
		           "totalMoney":totalMoney,
		           "lotteryCode":lotteryCode,
		           "lotteryCount":lotteryCount,
		           "buyCaiNumber":buyCaiNumber
		        },
		        success : function(data) {
		           if(data.sucess){
		                var orderId=data.orderId;
		            	window.location.href="${pageContext.request.contextPath}/order/alipay?name="+name+"&totalMoney="+totalMoney+"&orderId="+orderId;
		           }else{
		                alert("下注失败！");
		           }
		        }  
		    });
    }
</script>
</body>
</html>

