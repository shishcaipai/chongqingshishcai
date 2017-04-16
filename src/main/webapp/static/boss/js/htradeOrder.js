$(function() {
	$('#mydatagrid').datagrid({
		title : '订单列表信息',
		iconCls : 'icon-ok',
		pageSize : 10,//默认选择的分页是每页5行数据
		pageList : [ 5, 10, 15, 20 ],//可以选择的分页集合
		nowrap : true,//设置为true，当数据长度超出列宽时将会自动截取
		striped : true,//设置为true将交替显示行背景。
		collapsible : true,//显示可折叠按钮
		toolbar:"#tb",//在添加 增添、删除、修改操作的按钮要用到这个
		url:'../../boss/order/hajax_list',//url调用Action方法
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
//		onClickCell:function(rowIndex, field, value){
//			if('auto_prizes' == field) {
//				updateOrderAutoPrizes(rowIndex);
//			}
//		},
		columns:[[
	              {field:'name',title:'玩法',width:90,align:'center'},  
		            {field:'order_no',title:'订单ID',width:90,align:'center'},
		            {field:'total_money',title:'订单金额',width:90,align:'center'},
		            {field:'order_type',title:'订单类型',width:90,align:'center',
		            	formatter:function (value){
		            		  if(value == 1){
		            		    return '充值订单';
		            		  }else if(value == 2){
		            		    return '彩票订单';
		            		  }else if(value == 3){
		            		    return '合买发起方案';
		            		  }else if(value == 4){
		            		    return '合买订单';
		            		  }else if(value == 5){
		            		    return '网站返款';
		            		  }else if(value == 6){
		            		    return '提现订单';
		            		  }else if(value == 7){
		            		    return '冻结返回';
		            		  }
		            		  
		            	}
		            },
					{field:'order_status',title:'订单状态',width:90,align:'center',
		            	formatter:function (value){
		            		  if(value == 1){
		            		    return '下单成功';
		            		  }else {
		            		    return '下单失败';
		            		  }
		            	}
		            },
					{field:'pay_status',title:'支付状态',width:90,align:'center',
		            	formatter:function (value){
		            		  if(value == 0){
		            		    return '未支付';
		            		  }else if(value == 1){
		            		    return '支付成功';
		            		  }else if(value == 2){
		            		    return '支付失败';
		            		  }else{
		            		    return '支付超时';
		            		  }
		            	}
		            },
		            {field:'wprize_status',title:'是否中奖',width:90,align:'center',
		            	formatter:function (value){
		            		  if(value == 0){
		            		    return '未中奖';
		            		  }else if(value == 1){
		            		    return '追号中奖';
		            		  }else if(value == 2){
		            		    return '中奖';
		            		  }
		            	}
		            },
					{field:'user_name',title:'下单人账号',width:90,align:'center'},
					{field:'real_name',title:'下单人名称',width:90,align:'center'},
					{field:'telephone',title:'电话',width:90,align:'center'},
					{field:'create_date',title:'订单时间',width:140,align:'center',
						formatter: function(value,row,index){
							var time = row.create_date;
							if(time !=""){
								return formatTime(time);
							}
					}},
					{field:'auto_prizes',title:'自动发奖',width:90,align:'center',
		            	formatter: function(value,row,index){
		            		var result = '';
		            		if(true == value) {
		            			result = '是';
		            		} else {
		            			result = '否';
		            		}
		            	     return '<a style="color:blue" href="javascript:updateOrderAutoPrizes(' + index +')">'+result+'</a>';
		            }},
		            
//          		  if(value == 0){
//          		    return '否';
//          		  }else if(value == 1){
//          		    return '是';
//          		  }
		      ]]
	});	
});


function searchOrder(){
	var tradeOrder = {};
	tradeOrder["userName"]=$("#search_userName").val().trim();
	tradeOrder["realName"]=$("#search_realName").val().trim();
	tradeOrder["telephone"]=$("#search_telephone").val().trim();
	tradeOrder["orderType"]=$("#search_orderType").val().trim();
	tradeOrder["orderStatus"]=$("#search_orderStatus").val().trim();
	tradeOrder["payStatus"]=$("#search_payStatus").val().trim();
	//=======================================
	tradeOrder["startDate"]=$("#checkStartTime").datebox('getValue');
	tradeOrder["endDate"]=$("#checkEndTime").datebox('getValue');
	
	//把查询条件封装到实体对象中进行条件查询
	$('#mydatagrid').datagrid('load',tradeOrder);	
}

function clearSearchForm(){
	$("#search_userName").val("");
	$("#search_realName").val('');
	$("#search_telephone").val('');
	$("#search_orderType").val('');
	$("#search_orderStatus").val('');
	$("#search_payStatus").val('');
	$("#checkStartTime").val("");
	$("#checkEndTime").val("");
	searchOrder();
}

function closeOrderUserDialog(){
	$('#dlg').window('close');
	$('#orderForm').form('clear');
}

/**
 * 弹出修改页面
 * @param str
 * @returns
 */
function updateOrderUserDialog(){
	var selectedRows=$("#mydatagrid").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert('系统提示','请选择一条要编辑的数据！');
		return;
	}
	var row=selectedRows[0];
	$("#dlg").dialog("open").dialog("setTitle","订单信息");
	$("#orderForm").form("load",row);
	$.ajax({
		url:'../../boss/order/order_detail',//url调用Action方法
		data: { orderNo: $("#order_no").val()} ,
		dataType:'json',
		success : function(result) {
			var obj = result; 
			 var html="<table>";
			   for(var i=0;i<obj.period.length;i++){  
			       html+="<tr><td colspan='6' align='right'>投注期号：</td><td colspan='40' align='left'><input type='text' readonly='readonly'  value='"+obj.period[i].lotteryPeriod+"'  /></td></tr>";
			   } 
			   
				   for(var i=0;i<obj.detail.length;i++){  
				       html+="<tr><td colspan='6' align='right'>投注内容：</td><td colspan='40' align='left'><input type='text' id='num' name='num' value='"+obj.detail[i].buyCaiNumber+"'  title='"+obj.detail[i].id+"' /></td></tr>";
				   } 
				   html+="</table>";
				   $("#order_phrase").html(html) 
			$("#update").show();
		}    
	});
	$("#update").show();
}

/**
 * 修改信息提交
 */
function updateOrder(){
	var  obj=$("input[name='num']");
	var orders =  new Array(); 
	for(var i=0;i<obj.length;i++){
		var order = {};
		order["num"]=obj.val();
		order["id"]=obj.attr("title");
		
		orders[i]=order;
	}
	var  senOrder={};
	senOrder["orders"]=JSON.stringify(orders);
	senOrder["orderNo"]=$("#order_no").val();
//	senOrder["wprizeStatus"]=$("#wprize_status").val();
	//保存
	$.ajax({
		url : '../../boss/order/updateNum',
		data:senOrder,
		type:'post',
		dataType:'text',
		success : function(result) {
			$.messager.show({ title : '提示', msg : result });
			closeOrderUserDialog();
			clearSearchForm();
			$('#mydatagrid').datagrid("reload");
		}    
	});
}

/**
 * 修改信息提交
 */
function updateOrderAutoPrizes(rowIndex){
	$('#mydatagrid').datagrid('selectRow',rowIndex);  //指定行选中
    var currentRow =$("#mydatagrid").datagrid("getSelected");
    var  senOrder={};
	senOrder["orderNo"]=currentRow.order_no;
	senOrder["autoPrizes"]=currentRow.auto_prizes;
	if(currentRow.order_type==2||currentRow.order_type==3){
	//保存
	$.ajax({
		url : '../../boss/order/updateAutoPrizes',
		data:senOrder,
		type:'post',
		dataType:'text',
		success : function(result) {
			$.messager.show({ title : '提示', msg : result });
			$('#mydatagrid').datagrid("reload");
		}    
	});
	}else{
		$.messager.show({ title : '提示', msg : '只有合买方案，与彩票订单才充许修改' });
	}
	
}


