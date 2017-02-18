<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta charset="utf-8" />
<title>编辑</title>
<style>
form {
	margin: 0;
}

textarea {
	display: block;
}
</style>
<script type="text/javascript"	src="<%=basePath%>/static/js/jquery.js" charset="utf-8"></script>
<script src="<%=basePath%>static/boss/article/js/ckeditor.js"></script>
	<script src="<%=basePath%>static/boss/article/js/sample.js"></script>
	<link rel="stylesheet" href="<%=basePath%>static/boss/article/css/samples.css">
	<link rel="stylesheet" href="<%=basePath%>static/boss/article/toolbarconfigurator/lib/codemirror/neo.css">
<script>
	function  article(){
		var  article={};
		article["title"]=$("#title").val();
		article["anthor"]=$("#anthor").val();
		article["type"]=$("#type").val();
		article["content"]=$("#editor").text();
		article["source"]=$("#source").val();
		//保存
		$.ajax({
			url : '<%=basePath%>boss/article/ajax_save',
			data:article,
			type:'post',
			dataType:'json',
			success : function(result) {
				if(result.sucess){
					alert("保存成功")
					document.location.href='<%=basePath%>boss/article/ardicleList';
				}else{
					alert("保存失败")
				}
			}    
		});
		
	}
	
</script>
</head>
<body>
	
	
		<table>
			<tr>
				<td>标题：</td>
				<td><input type="text" id="title" name="title"  value=""/></td>
			</tr>
		<tr>
				<td>作者：</td>
				<td><input type="text" id="anthor" name="anthor"  value=""/></td>
			</tr>
			<tr>
				<td>来源：</td>
				<td><input type="text" id="source" name="source"  value=""/></td>
			</tr>
			<tr>
				<td>类型：</td>
			<td><select  id="type" name="type">
			<option value ="0">公告</option>
			<option value ="1">推荐</option>
			</select></td> 
			</tr>
		<tr>
		<td></td>
			<td  style="text-align:center;margin:100px auto;solid #000;width:960px;" >
			<div id="editor" >
					<h1>Hello world!</h1>
					<p>I'm an instance of <a href="http://ckeditor.com">CKEditor</a>.</p>
				</div></td>
		</tr>
		<tr>
		<td></td>
			<td><input type="submit" name="submit"  onclick="javascript:article()" value="提交"/></td>
		</tr>
		</table>
<script>
	initSample();
</script>
</body>
</html>
