	$(function() {
		$('#memberUserDataGrid').datagrid({
			title : '会员列表信息',
			iconCls : 'icon-ok',
			pageSize : 10,//默认选择的分页是每页5行数据
			pageList : [ 5, 10, 15, 20 ],//可以选择的分页集合
			nowrap : true,//设置为true，当数据长度超出列宽时将会自动截取
			striped : true,//设置为true将交替显示行背景。
			collapsible : true,//显示可折叠按钮
			toolbar:"#tb",//在添加 增添、删除、修改操作的按钮要用到这个
			url:'../../boss/member/ajax_list_page',//url调用Action方法
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
			              {field:'user_name',title:'用户名',width:90,align:'center'},  
				            {field:'real_name',title:'真实名',width:90,align:'center'},
							{field:'telephone',title:'手机号码',width:90,align:'center'},
							{field:'identity_card',title:'身份证',width:90,align:'center'},
							{field:'bank_code',title:'支付宝账号',width:90,align:'center'},
							{field:'total_score',title:'总金额',width:90,align:'center'},
							{field:'available_score',title:'可取金额',width:100,align:'center'},
							{field:'action_score',title:'赠送金额',width:100,align:'center'},
							{field:'frozen_score',title:'冻结金额',width:100,align:'center'},
							{field:'create_date',title:'创建时间',width:100,align:'center',
								formatter: function(value,row,index){
									var time = row.create_date;
									if(time !=""){
										return formatTime(time);
									}
							}},
				      ]]
		});	
		
	});

	function searchMemberUser(){
		
		var memberUser = {};
		memberUser["userName"]=$("#search_userName").val();
		memberUser["realName"]=$("#search_realName").val();
		memberUser["telephone"]=$("#search_telephone").val();
		//=======================================
		memberUser["startDate"]=$("#checkStartTime").datebox('getValue');
		memberUser["endDate"]=$("#checkEndTime").datebox('getValue');
		
		//把查询条件封装到实体对象中进行条件查询
		$('#memberUserDataGrid').datagrid('load',memberUser);	
	}

	function clearSearchForm(){
		$('#queryForm').form('clear');
		searchMemberUser();
	}
	
	function closeMemberUserDialog(){
		$('#dlg').window('close');
		$('#memberUserForm').form('clear');
	}
	
	
	
	
	