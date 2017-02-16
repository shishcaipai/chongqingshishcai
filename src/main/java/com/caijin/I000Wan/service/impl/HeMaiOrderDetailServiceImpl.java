package com.caijin.I000Wan.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.service.impl.CommonServiceImpl;
import com.caijin.I000Wan.dao.HeMaiOrderDetailDao;
import com.caijin.I000Wan.dao.OrderDaoImpl;
import com.caijin.I000Wan.entity.HeMaiOrderDetail;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.service.HeMaiOrderDetailService;

@Component
@Transactional
public class HeMaiOrderDetailServiceImpl extends CommonServiceImpl<HeMaiOrderDetail,String> implements HeMaiOrderDetailService {
	@Autowired
	private HeMaiOrderDetailDao heMaiOrderDetailDao;
	
	@Resource(name = "orderDaoImpl")
	private OrderDaoImpl orderDaoImpl;
	
	@Autowired
	public void setHeMaiOrderDetailDao(HeMaiOrderDetailDao heMaiOrderDao) {
		super.setCommonDao(heMaiOrderDao);
	}
	@Override
	public  HeMaiOrderDetail findOrderHemaiDetailByOrderId(Order order){
		 return heMaiOrderDetailDao.findOrderHemaiDetailByOrderId(order);
	 }

	@Override
	public List<HeMaiOrderDetail> findAllHemaiOrderDetails(Integer pageNum, int size) {
		return heMaiOrderDetailDao.findAllHemaiOrderDetails(pageNum, size);
	}

	@Override
	public Integer findHemaiOrderDetailsSize() {
		return heMaiOrderDetailDao.findHemaiOrderDetailsSize();
	}
}
