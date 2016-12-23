package com.caijin.I000Wan.service;

import java.util.List;
import java.util.Map;

import com.caijin.I000Wan.common.service.CommonService;
import com.caijin.I000Wan.entity.Order;

public interface OrderService extends CommonService<Order,String>{

	/**
	 * 获取我的充值记录
	 * @param userId
	 * @return
	 */
	List<Order> getMyRechargeList(String userId);
	
	List<Map> findOrderListByCondition(String userName,String realName,String telephone,
			String orderType,String orderStatus,String payStatus,
			String startDate,String endDate);
	
	Order findOrderByOrderId(String orderId);
	
	Order findOrder(String orderId,Integer payStatus);
}
