package com.caijin.I000Wan.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.service.impl.CommonServiceImpl;
import com.caijin.I000Wan.dao.OrderDao;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.service.OrderService;

@Component
@Transactional
public class OrderServiceImpl extends CommonServiceImpl<Order,String> implements OrderService{

	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	public void setOrderDao(OrderDao orderDao) {
		super.setCommonDao(orderDao);
	}
	
	
	/**
	 * 获取我的充值记录
	 * @param userId
	 * @return
	 */
	public List<Order> getMyRechargeList(String userId){
		return orderDao.getMyRechargeList(userId);
	}
	
	public List<Map> findOrderListByCondition(String userName,String realName,String telephone,
			String orderType,String orderStatus,String payStatus,
			String startDate,String endDate){
		return orderDao.findOrderListByCondition(userName,realName,telephone,
				orderType,orderStatus,payStatus,startDate,endDate);
	}
	
	public Order findOrderByOrderId(String orderId){
		return orderDao.findOrderByOrderId(orderId);
	}
	
	public Order findOrder(String orderId,Integer payStatus){
		return orderDao.findOrder(orderId,payStatus);
	}
	
}
