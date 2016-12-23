package com.caijin.I000Wan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.service.impl.CommonServiceImpl;
import com.caijin.I000Wan.dao.HeMaiOrderDetailDao;
import com.caijin.I000Wan.entity.HeMaiOrderDetail;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.OrderDetail;
import com.caijin.I000Wan.service.HeMaiOrderDetailService;

@Component
@Transactional
public class HeMaiOrderDetailServiceImpl extends CommonServiceImpl<HeMaiOrderDetail,String> implements HeMaiOrderDetailService {
	@Autowired
	private HeMaiOrderDetailDao heMaiOrderDetailDao;
	
	@Autowired
	public void setHeMaiOrderDetailDao(HeMaiOrderDetailDao heMaiOrderDao) {
		super.setCommonDao(heMaiOrderDao);
	}
	public  OrderDetail findOrderHemaiDetailByOrderId(Order order){
		 return heMaiOrderDetailDao.findOrderHemaiDetailByOrderId(order);
	 }
}
