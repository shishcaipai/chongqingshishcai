<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>提款申请管理</title>
<!-- 引入Jquery -->
<script type="text/javascript"	src="<%=basePath%>/static/js/jquery.js" charset="utf-8"></script>
<script src="<%=basePath%>static/js/commonUtil.js" type="text/javascript"></script>
<%@ include file="../common/easyUiInclude.jsp"%>

<script type="text/javascript">
	$(function() {
		$('#mydatagrid').datagrid({
			title : '提款申请列表信息',
			iconCls : 'icon-ok',
			pageSize : 10,//默认选择的分页是每页5行数据
			pageList : [ 5, 10, 15, 20 ],//可以选择的分页集合
			nowrap : true,//设置为true，当数据长度超出列宽时将会自动截取
			striped : true,//设置为true将交替显示行背景。
			collapsible : true,//显示可折叠按钮
			toolbar:"#tb",//在添加 增添、删除、修改操作的按钮要用到这个
			url:'<%=basePath%>boss/applyrecord/ajax_list',//url调用Action方法
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
		              {field:'user_name',title:'提款人账号',width:90,align:'center'},  
			            {field:'apply_name',title:'提款人姓名',width:90,align:'center'},
			            {field:'id_card_no',title:'身份证号码',width:90,align:'center'},
			            {field:'apply_money',title:'提款金额',width:90,align:'center'},
			            {field:'create_date',title:'申请时间',width:90,align:'center',
				            formatter: function(value,row,index){
											var time = row.create_date;
											if(time !=''){
												return formatTime(time);
											}
							         	}
			            },
			            {field:'bank_name',title:'申请银行',width:90,align:'center'},
			            {field:'audit_status',title:'审核状态',width:90,align:'center',
			            	formatter:function (value){
										  if(value == 1){
										    return '审核不通过';
										  }else if(value == 0){
										    return '审核通过';
										  }else{
										    return '未审核';
										  }
									}
						},
						{field:'auditor',title:'审核人',width:85,align:'center'},
						{field:'audit_time',title:'审核时间',width:100,align:'center',
							formatter: function(value,row,index){
											var time = row.audit_time;
											if(time !=''){
												return formatTime(time);
											}
										}
						}
			      ]]
		});	
		
	});
	
</script>	

</head>
<body>
<!-- 工具栏 -->
<div id="tb" style="height:auto">
    <form id="queryForm">
	<table>
		<tr>
			<td>提款人姓名：</td>
			<td><input id="search_realName" /></td>
			<td>身份证号码：</td>
			<td><input id="search_idCardNo" /></td>
		</tr>
		<tr>
			<td>提款人账号：</td>
			<td><input id="search_userName" /></td>
			<td>审核状态： </td>
			<td>
				<select id="search_auditStatus" style=" width: 150px;">
					<option value="">请选择</option>
					<option value="2">未审核</option>
					<option value="0">审核通过</option>
					<option value="1">审核不通过</option>
				</select>
			</td>
		</tr>
		<tr>
			 <td>申请时间：</td>
			 <td>
              	<input name="applyStartTime" id="applyStartTime" class="easyui-datebox" style="width:150px">
             </td>
             <td align="right">到:</td>
             <td colspan="3">
               	<input name="applyEndTime" id="applyEndTime" class="easyui-datebox" style="width:150px">
             </td>
		</tr>
		<tr>
			 <td>审核时间：</td>
			 <td>
              	<input name="checkStartTime" id="checkStartTime" class="easyui-datebox" style="width:150px">
             </td>
             <td align="right">到:</td>
             <td colspan="3">
               	<input name="checkEndTime" id="checkEndTime" class="easyui-datebox" style="width:150px">
             </td>
		</tr>
	</table>  
	</form>
	<div>
		<a href="javascript:searchApply()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
		<a href="javascript:updateOrderDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		<a href="javascript:deleteOrder()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		<a href="javascript:clearSearchForm()" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">清空</a>
	</div>
</div>
	<div>
	<table id="mydatagrid" ></table>
   </div>
   
<script type="text/javascript">
	function searchApply(){
		var tradeOrder = {};
		tradeOrder["realName"]=$("#search_realName").val().trim();
		tradeOrder["idCardNo"]=$("#search_idCardNo").val().trim();
		tradeOrder["userName"]=$("#search_userName").val().trim();
		tradeOrder["auditStatus"]=$("#search_auditStatus").val().trim();
		//=======================================
		tradeOrder["applystartDate"]=$("#applyStartTime").datebox('getValue');
		tradeOrder["applyendDate"]=$("#applyEndTime").datebox('getValue');
		tradeOrder["startDate"]=$("#checkStartTime").datebox('getValue');
		tradeOrder["endDate"]=$("#checkEndTime").datebox('getValue');
		
		//把查询条件封装到实体对象中进行条件查询
		$('#mydatagrid').datagrid('load',tradeOrder);	
	}
	
	function clearSearchForm(){
		$("#search_realName").val("");
		$("#search_idCardNo").val('');
		$("#search_userName").val('');
		$("#search_auditStatus").val('');
		
		$("#applyStartTime").val("");
		$("#applyEndTime").val("");
		
		$("#checkStartTime").val("");
		$("#checkEndTime").val("");
		searchApply();
	}
</script>
</body>
</html>
