<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>会员管理</title>
<!-- 引入Jquery -->
<script type="text/javascript"	src="<%=basePath%>/static/js/jquery-1.7.2.min.js" charset="utf-8"></script>
<script src="<%=basePath%>static/js/commonUtil.js" type="text/javascript"></script>
<script src="<%=basePath%>static/boss/js/chongzhimemberUser.js" type="text/javascript"></script>
<%@ include file="../../common/easyUiInclude.jsp"%>
<script type="text/javascript">
/**
 * 弹出充值页面
 * @param str
 * @returns
 */
function chongZhiDialog(){
	var selectedRows=$("#memberUserDataGrid").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert('系统提示','请选择一条要编辑的数据！');
		return;
	}
	var row=selectedRows[0];
	$("#dlg").dialog("open").dialog("setTitle","会员充值信息");
	$("#memberUserForm").form("load",row);
	$("#update").show();
	$("#add").hide();
}
/**
 * 修改信息提交
 */
function saveUsermenberChongzhiDialog(){
	if($("#userName").val().trim()==''){
		$.messager.show({ title : '提示', msg :'请输入用户名！'});  
		return;
	}
	var memberUser = {};
	memberUser["userName"]=$("#userName").val();
	memberUser["availableScore"]=$("#availableScore").val();
	memberUser["actionScore"]=$("#actionScore").val();
	//保存
	$.ajax({
		url : '../../boss/member/chongzhi',
		data:memberUser,
		type:'post',
		dataType:'text',
		success : function(result) {
			$.messager.show({ title : '提示', msg : result });
			closeMemberUserDialog();
			clearSearchForm();
			$('#memberUserDataGrid').datagrid("reload");
		}    
	});
}
</script>
</head>

<body>
<!-- 工具栏 -->
<div id="tb" style="height:auto">
    <form id="queryForm">
	<table>
		<tr>
			<td>用户名：</td>
			<td><input id="search_userName" /></td>
			<td>真实名：</td>
			<td> 
			<td><input id="search_realName" /></td>
			<td>手机号： </td>
			<td><input id="search_telephone" /></td>
		</tr>
		<tr>
			 <td>创建时间：</td>
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
		<a href="javascript:searchMemberUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
		<a href="javascript:chongZhiDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">充值</a>
	</div>
</div>

<div id="dlg" class="easyui-window" data-options="modal:true,iconCls:'icon-save',closed:'true'">  
	<form method="post" id="memberUserForm" name="memberUserForm">
	<input type="hidden" id="id" name="id" />
	<table>
		<tr>
			<td>用户名：</td>
			<td><input  type="text" name="user_name" id="userName" readonly="readonly"/></td>
		</tr>
		<tr>	
			<td>真实名：</td>
			<td><input  type="text" id="realName" name="real_name" readonly="readonly"/></td>
			<td>身份证号码：</td>
			<td><input type="text" id="identityCard" name="identity_card" readonly="readonly"/></td>
		</tr>
			<td>手机号：</td>
			<td><input type="text" id="telephone" name="telephone" readonly="readonly"/></td>
			<td>充值金额</td>
			<td><input type="text" id=availableScore name="availableScore"/></td>
			<td>赠送金额</td>
			<td><input type="text" id="actionScore" name="actionScore"/></td>
		<tr>
			<td colspan="4" align="right">
		   	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" id="update" onClick="saveUsermenberChongzhiDialog()">保存</a>&nbsp;&nbsp;
	       	<a href="javascript:closeMemberUserDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
	     	</td>
		</tr>
		<tr>
		</tr>
	</table>
	</form>
</div>

	<table id="memberUserDataGrid" ></table>
   
</body>
</html>
