<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>用户管理</title>
<!-- 引入Jquery -->
<script type="text/javascript" src="<%=basePath%>/static/js/jquery.js"
	charset="utf-8"></script>
<script src="<%=basePath%>static/js/commonUtil.js"
	type="text/javascript"></script>
<%@ include file="../../common/easyUiInclude.jsp"%>

<script type="text/javascript">

$(function() {
	$('#mydatagrid').datagrid({
		title : '用户列表信息',
		iconCls : 'icon-ok',
		pageSize : 10,//默认选择的分页是每页5行数据
		pageList : [ 5, 10, 15, 20 ],//可以选择的分页集合
		nowrap : true,//设置为true，当数据长度超出列宽时将会自动截取
		striped : true,//设置为true将交替显示行背景。
		collapsible : true,//显示可折叠按钮
		toolbar:"#tb",//在添加 增添、删除、修改操作的按钮要用到这个
		url:'<%=basePath%>boss/role/userrolelist',//url调用Action方法
		loadMsg : '数据装载中......',
		singleSelect:true,//为true时只能选择单行
		fitColumns:true,//允许表格自动缩放，以适应父容器
		//sortName : 'xh',//当数据表格初始化时以哪一列来排序
		//sortOrder : 'desc',//定义排序顺序，可以是'asc'或者'desc'（正序或者倒序）。
		remoteSort : false,
			 frozenColumns : [ [ {
			field : 'ck',
			checkbox : true
		} ] ], 
		pagination : true,//分页
		rownumbers : true,//行数
		columns:[[ 
		             {
			 				field : 'id',
			 				title : '标识',
			 				width : 90,
			 				align : 'center'
			 			},        
			              {
				field : 'username',
				title : '用户名',
				width : 90,
				align : 'center'
			}, {
				field : 'role',
				title : '角色名',
				width : 90,
				align : 'center',
					formatter : function(value, row, index) {
						if(row.role!=null){
						var name = row.role.roleName;
						if (name != '') {
							return name;
						}
						}
						return '';
					}
			}, {
				field : 'createDate',
				title : '创建时间',
				width : 100,
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
		<form id="queryForm">
			<table>
				<tr>
					<td>用户名：</td>
					<td><input id="search_userName" /></td>
				</tr>
			</table>
		</form>
		<div>
			<a href="javascript:searchSysUser()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">查询</a> <a
				href="javascript:updateUserDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">分配角色</a>
		</div>
	</div>
	<table id="mydatagrid"></table>
	<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 280px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<form id="fm" method="post" novalidate accept-charset="utf-8"
			onsubmit="document.charset='utf-8'">
			<div class="fitem">
				 <input id="userid" name="userid"
					class="easyui-textbox" readonly  type=hidden>
			</div>
			<div class="fitem">
				<label>用户名:</label> <input id="userName" name="userName"
					class="easyui-textbox" readonly>
			</div>
			<div class="fitem">
				<label>角&nbsp;&nbsp;色:</label> <select id="roleid" name="roleid">
					<option value="-1">请选择角色</option>
					<c:forEach items="${requestScope.roles}" var="roles">
						<option value="${roles.id}">${roles.roleName}</option>
					</c:forEach>
				</select>
			</div>

		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="saveUser()" style="width: 90px">确定</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')"
			style="width: 90px">取消</a>
	</div>

	<script type="text/javascript">
		function updateUserDialog() {
			var selectedRows = $("#mydatagrid").datagrid(
					'getSelections');
			if (selectedRows.length != 1) {
				$.messager.alert('系统提示', '请选择一条要编辑的数据！');
				return;
			}
			var row = selectedRows[0];
			$("#userName").val(row.username);
			$("#userid").val(row.id);
			$("#dlg").dialog("open").dialog("setTitle", "分配角色");
			$("#mydatagrid").form("load", row);
		}
		function saveUser(){
		    var id = $("#userid").val();
		    var role = $("#role").val();
		 var   url = '<%=basePath%>boss/role/ajax_user_role_save';
			if (id != "" && role != "") {
				$('#fm').form('submit', {
					url : url,
					onSubmit : function() {
						return $(this).form('validate');
					},
					success : function(result) {
						var result = eval('(' + result + ')');
						if (result.sucess) {
							$('#dlg').dialog('close'); // close the dialog
							$('#mydatagrid').datagrid('reload'); // reload the user data
						} else {
							$.messager.show({
								title : '提醒',
								msg : "新增失败"
							});
						}
					}
				});
			}

		}
		function searchSysUser() {
			var tradeOrder = {};
			tradeOrder["realName"] = $("#search_realName").val().trim();
			tradeOrder["userName"] = $("#search_userName").val().trim();
			//=======================================
			tradeOrder["startDate"] = $("#checkStartTime").datebox('getValue');
			tradeOrder["endDate"] = $("#checkEndTime").datebox('getValue');

			//把查询条件封装到实体对象中进行条件查询
			$('#mydatagrid').datagrid('load', tradeOrder);
		}
	</script>

</body>
</html>