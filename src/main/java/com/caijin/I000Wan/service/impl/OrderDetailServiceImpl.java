package com.caijin.I000Wan.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.service.impl.CommonServiceImpl;
import com.caijin.I000Wan.dao.OrderDaoImpl;
import com.caijin.I000Wan.dao.OrderDetailDao;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.OrderDetail;
import com.caijin.I000Wan.service.OrderDetailService;

@Component
@Transactional
public class OrderDetailServiceImpl extends CommonServiceImpl<OrderDetail,String> implements OrderDetailService{

	@Autowired
	private OrderDetailDao orderDetailDao;
	
	@Resource(name = "orderDaoImpl")
	private OrderDaoImpl orderDaoImpl;
	@Autowired
	public void setOrderDetailDao(OrderDetailDao orderDetailDao) {
		super.setCommonDao(orderDetailDao);
	}

	@Override
	public List<OrderDetail> findOrderDetailByOrderId(Order orderId) {
			return orderDetailDao.findOrderDetailByOrderId(orderId);
	}

	@Override
	public List<OrderDetail> findAllOrderDetails(Integer pageNum, int size, String id) {
		return orderDetailDao.findAllOrderDetails(pageNum, size, id);
	}

	@Override
	public Integer findOrderDetailsSize(String id) {
		return orderDetailDao.findOrderDetailsSize(id);
	}

	@Override
	public List<OrderDetail> findbyQIhao(String expect) {
		return orderDetailDao.findbyQIhao(expect);
	}

	@Override
	public List<OrderDetail> findOrderDetailByOrderId(String orderNo) {
		return orderDetailDao.findOrderDetailByOrderId(orderNo);
	}

//	@Override
//	public int updateCaiNUmByID(String num, String id) {
//		return orderDaoImpl.updateCaiNUmByID(num,id);
//	}
	
	
}
