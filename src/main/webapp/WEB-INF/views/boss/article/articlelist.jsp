<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>公告列表</title>
<!-- 引入Jquery -->
<script type="text/javascript" src="<%=basePath%>/static/js/jquery.js"
	charset="utf-8"></script>
<script src="<%=basePath%>static/js/commonUtil.js"
	type="text/javascript"></script>
<%@ include file="../../common/easyUiInclude.jsp"%>

<script type="text/javascript">
	$(function() {
		$('#mydatagrid').datagrid({
			title : '公告列表信息',
			iconCls : 'icon-ok',
			pageSize : 10,//默认选择的分页是每页5行数据
			pageList : [ 5, 10, 15, 20 ],//可以选择的分页集合
			nowrap : true,//设置为true，当数据长度超出列宽时将会自动截取
			striped : true,//设置为true将交替显示行背景。
			collapsible : true,//显示可折叠按钮
			toolbar:"#tb",//在添加 增添、删除、修改操作的按钮要用到这个
			url:'<%=basePath%>boss/article/list',//url调用Action方法
			loadMsg : '数据装载中......',
			singleSelect : true,//为true时只能选择单行
			fitColumns : true,//允许表格自动缩放，以适应父容器
			//sortName : 'xh',//当数据表格初始化时以哪一列来排序
			//sortOrder : 'desc',//定义排序顺序，可以是'asc'或者'desc'（正序或者倒序）。
			remoteSort : false,
			frozenColumns : [ [ {
				field : 'ck',
				checkbox : true
			} ] ],
			pagination : true,//分页
			rownumbers : true,//行数
			columns : [ [ {
				field : 'title',
				title : '标题',
				width : 90,
				align : 'center'
			}, {
				field : 'type',
				title : '类型',
				width : 90,
				align : 'center',
				formatter : function(value, row, index) {
					var type = row.type;
					if (type == 0) {
						return '公告';
					} else {
						return '推荐';
					}
				}
			}, {
				field : 'author',
				title : '作者',
				width : 90,
				align : 'center'
			}, {
				field : 'source',
				title : '来源',
				width : 90,
				align : 'center'
			}, {
				field : 'createDate',
				title : '发布时间',
				width : 90,
				align : 'center',
				formatter : function(value, row, index) {
					var time = row.createDate;
					if (time != '') {
						return formatTime(time);
					}
				}
			} ] ]
		});

	});
</script>

</head>
<body>
	<!-- 工具栏 -->
	<div id="tb" style="height: auto">
		<!-- <form id="queryForm">
			<table>
				<tr>
					<td>标题：</td>
					<td><input id="search_title" /></td>
				</tr>
			</table>
		</form> -->
		<div>
			<!-- <a href="javascript:searchApply()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">查询</a> --> <a
				href="javascript:newArticle()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">新建</a> <a
				href="javascript:deleRecord()" class="easyui-linkbutton"
				iconCls="icon-cancel" plain="true">删除</a>
		</div>
	</div>
	<div>
		<table id="mydatagrid"></table>
	</div>

	<script type="text/javascript">
		function searchApply() {
			var article = {};
			article["title"] = $("#search_title").val().trim();
			//把查询条件封装到实体对象中进行条件查询
			$('#mydatagrid').datagrid('load', tradeOrder);
		}

		function deleRecord() {
			var selectedRows=$("#mydatagrid").datagrid('getSelections');
			if(selectedRows.length!=1){
				$.messager.alert('系统提示','请选择一条要编辑的数据！');
				return;
			}
			var row = selectedRows[0];
			$.ajax({
				url : '<%=basePath%>/boss/article/deleRecord',
				type : 'post',
				data : {
					id : row.id
				},
				dataType : 'json',
				success : function(result) {
					if(result.sucess){
						alert("操作成功");
					}else{
						alert("操作失败");
					}
					$('#mydatagrid').datagrid("reload");
				}
			});
		}
		function newArticle() {
			document.location.href='<%=basePath%>boss/article/newArdiclet';
		}
	</script>
</body>
</html>
