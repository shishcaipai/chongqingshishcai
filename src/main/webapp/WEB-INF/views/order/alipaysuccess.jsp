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
<title>购买成功</title>
</head>
 
<body>
       <br /><jsp:include page="../header.jsp"></jsp:include>
	   <jsp:include page="../banner.jsp"></jsp:include>
<!--main-->
<div class="main fn_clear user">
	<div class="wrap">
        <div class="order_page">
        	<div class="oreder_title"><em>恭喜购买成功</em></div>
            <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                	<td class="td1">恭喜购买成功</td>
                    <td>
                    	<div class="tdback">
                        	<a href="">查看订单记录</a><a href="">返回下单页面</a>
                        </div>
                        
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

</body>
</html>

