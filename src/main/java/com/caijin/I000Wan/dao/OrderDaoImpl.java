package com.caijin.I000Wan.dao;

import java.util.List;
import java.util.Map;

import com.caijin.I000Wan.common.dao.CustomBaseSqlDaoImpl;

public class OrderDaoImpl extends CustomBaseSqlDaoImpl implements OrderCustomDao{

	public List<Map> findOrderListByCondition(String userName,String realName,String telephone,
			String orderType,String orderStatus,String payStatus,
			String startDate,String endDate){
		String sql="select torder.order_id,torder.name,torder.order_type,torder.total_money," +
				"torder.order_status,torder.pay_status,torder.create_date," +
				"mu.user_name,mu.real_name,mu.address,mu.telephone " +
				"from trade_order torder,member_user mu where 1=1 and torder.member_id=mu.id ";
		
		if(userName != null && !userName.equals("")){
			sql+="and mu.user_name like '%"+userName+"%' ";
		}
		
		if(realName != null && !realName.equals("")){
			sql+="and mu.real_name like '%"+realName+"%' ";
		}
		
		if(telephone != null && !telephone.equals("")){
			sql+="and mu.telephone like '%"+telephone+"%' ";
		}
		
		if(orderType != null && !orderType.equals("")){
			sql+="and torder.order_type = "+orderType+" ";
		}
		
		if(orderStatus != null && !orderStatus.equals("")){
			sql+="and torder.order_status = "+orderStatus+" ";
		}
		
		if(payStatus != null && !payStatus.equals("")){
			sql+="and torder.pay_status = "+payStatus+" ";
		}
		
		if(startDate != null && !startDate.equals("")){
			sql+="and torder.order_time >= '"+startDate+"' ";
		}
		
		if(endDate != null && !endDate.equals("")){
			sql+="and torder.order_time <= '"+endDate+"' ";
		}
		
		sql+=" order by torder.order_time desc ";
		
		return this.querySqlObjects(sql);
	}
}
