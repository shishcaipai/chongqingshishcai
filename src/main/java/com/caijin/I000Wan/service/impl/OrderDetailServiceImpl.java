package com.caijin.I000Wan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.service.impl.CommonServiceImpl;
import com.caijin.I000Wan.dao.OrderDetailDao;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.OrderDetail;
import com.caijin.I000Wan.service.OrderDetailService;

@Component
@Transactional
public class OrderDetailServiceImpl extends CommonServiceImpl<OrderDetail,String> implements OrderDetailService{

	@Autowired
	private OrderDetailDao orderDetailDao;
	
	@Autowired
	public void setOrderDetailDao(OrderDetailDao orderDetailDao) {
		super.setCommonDao(orderDetailDao);
	}

	@Override
	public List<OrderDetail> findOrderDetailByOrderId(Order orderId) {
			return orderDetailDao.findOrderDetailByOrderId(orderId);
	}
	
	
}
