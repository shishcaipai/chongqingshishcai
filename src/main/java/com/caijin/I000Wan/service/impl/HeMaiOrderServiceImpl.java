package com.caijin.I000Wan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.service.impl.CommonServiceImpl;
import com.caijin.I000Wan.dao.HeMaiOrderDao;
import com.caijin.I000Wan.dao.OrderDao;
import com.caijin.I000Wan.entity.HeMaiOrder;
import com.caijin.I000Wan.entity.HeMaiOrderDetail;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.service.HeMaiOrderService;
import com.caijin.I000Wan.service.OrderService;

@Component
@Transactional
public class HeMaiOrderServiceImpl extends CommonServiceImpl<HeMaiOrder,String> implements HeMaiOrderService {
	@Autowired
	private HeMaiOrderDao heMaiOrderDao;
	
//	@Autowired
//	public void setHeMaiOrderDao(HeMaiOrderDao heMaiOrderDao) {
//		super.setCommonDao(heMaiOrderDao);
//	}
	public List<HeMaiOrder> findOrderHemaiByOrderId(HeMaiOrderDetail order){
		return heMaiOrderDao.findOrderHemaiByOrderId(order);
	}
	
	public List<HeMaiOrder> findAllHemaiOrders() {
		return heMaiOrderDao.findAllHemaiOrders();
	}
	
}
