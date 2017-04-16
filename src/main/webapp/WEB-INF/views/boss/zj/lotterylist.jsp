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
<title>开奖结果管理</title>
<!-- 引入Jquery -->
<script type="text/javascript" src="<%=basePath%>/static/js/jquery.js"
	charset="utf-8"></script>
<script src="<%=basePath%>static/js/commonUtil.js"
	type="text/javascript"></script>
<%@ include file="../../common/easyUiInclude.jsp"%>

<script type="text/javascript">
	$(function() {
		$('#mydatagrid').datagrid({
			title : '开奖结果列表信息',
			iconCls : 'icon-ok',
			pageSize : 10,//默认选择的分页是每页5行数据
			pageList : [ 5, 10, 15, 20 ],//可以选择的分页集合
			nowrap : true,//设置为true，当数据长度超出列宽时将会自动截取
			striped : true,//设置为true将交替显示行背景。
			collapsible : true,//显示可折叠按钮
			toolbar:"#tb",//在添加 增添、删除、修改操作的按钮要用到这个
			url:'<%=basePath%>boss/order/loresults_list',//url调用Action方法
			queryParams: { "time": new Date().getTime() },
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
				field : 'periodnumber',
				title : '期号',
				width : 90,
				align : 'center'
			}, {
				field : 'lotteryperiod',
				title : '开奖号码：',
				width : 90,
				align : 'center'
			}, {
				field : 'opentime',
				title : '开奖时间：',
				width : 90,
				align : 'center'
			},  {
				field : 'lotterycode',
				title : '彩种',
				width : 90,
				align : 'center',
				formatter : function(value) {
					if (value == "cqssc") {
						return '重庆时时彩';
					} else if (value == "gd11x5") {
						return '广东11选5';
					} else if (value == "sd11x5") {
						return '山东11选5';
					} else if (value == "jx11x5") {
						return '江西11选5';
					} else {
						return '---';
					}
				}
			}  ] ]
		});

	});
</script>

</head>
<body>
	<!-- 工具栏 -->
	<div id="tb" style="height: auto">
		<div>
			 <a
				href="javascript:updateOrderDialog()" class="easyui-linkbutton"
				iconCls="icon-cancel" plain="true">手动录入结果</a>
		</div>
	</div>
	<div>
		<table id="mydatagrid"></table>
	</div>
	<div id="dlg" class="easyui-window"
		data-options="modal:true,iconCls:'icon-save',closed:'true'">
		<form method="post" id="orderForm" name="orderForm">
			<table>
				<tr>
					<td colspan="6" align="right">期号：</td>
					<td colspan="40" align="left"><input type="text"
						name="lotteryPeriod" id="lotteryPeriod" 
						style="overflow: visible;" /></td>
				</tr>
				<tr>
					<td colspan="6" align="right">开奖号码：</td>
					<td colspan="40" align="left"><input type="text"
						name="periodNumber" id="periodNumber" 
						style="overflow: visible;" /></td>
				</tr>
				<tr>
					<td colspan="6" align="right">开奖时间：</td>
					<td colspan="40" align="left"><input type="text"
						name="opentime" id="opentime" 
						style="overflow: visible;" /></td>
				</tr>
				<tr>
					<td colspan="6" align="right">彩种：</td>
					<td colspan="40"><select type="text" id="lotteryCode"
						name="lotteryCode">
							<option value="cqssc">重庆时时彩</option>
							<option value="gd11x5">广东11选5</option>
							<option value="jx11x5">江西11选5</option>
							<option value="sd11x5">山东11选5</option>
					</select></</td>
				</tr>
				<tr>
					<td colspan="6" align="right"></td>
					<td colspan="40" align="left"><a href="javascript:void(0)"
						class="easyui-linkbutton" iconCls="icon-ok" id="update"
						onClick="updateOrder()">保存</a>&nbsp;&nbsp; <a
						href="javascript:closeOrderUserDialog()" class="easyui-linkbutton"
						iconCls="icon-cancel">关闭</a></td>
					<td></td>
				</tr>
				<tr>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
	function updateOrderDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "开奖信息");
	}
		function updateOrder() {
			var  senOrder={};
			senOrder["lotteryPeriod"]=$("#periodNumber").val();
			senOrder["lotteryCode"]=$("#lotteryCode").val();
			senOrder["periodNumber"]=$("#lotteryPeriod").val();
			senOrder["opentime"]=$("#opentime").val();
			//保存
			$.ajax({
				url : '../../boss/order/lotteryResults',
				data:senOrder,
				type:'post',
				dataType:'text',
				success : function(result) {
						$.messager.show({ title : '提示', msg : result });
					closeOrderUserDialog();
					$('#mydatagrid').datagrid("reload");
				}    
			});

		}
		function closeOrderUserDialog() {
			$('#dlg').window('close');
			$('#orderForm').form('clear');
		}
	</script>
</body>
</html>
