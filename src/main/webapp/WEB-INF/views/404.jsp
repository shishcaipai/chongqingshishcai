<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>404</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
<body style="margin: 0; padding: 0; background-color: #f5f5f5;">
	<div id="center-div" style="height: 100%; width: 600px; text-align: center;">  
        <table style="height: 100%; width: 600px; text-align: center;" >  
            <tr>  
                <td>  
                
                    <p
						style="line-height: 12px; color: #666666; font-family: Tahoma, '宋体'; font-size: 12px; text-align: center;">  
                       sorry! 服务器找不到相应资源了，请<a href="javascript:history.go(-1);">返回</a>  重试。!!!  
                    </p>  
                  
                </td>  
            </tr>  
        </table>  
    </div>  
</body>  
  </body>

</html>
