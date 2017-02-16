package com.caijin.I000Wan.service;

import java.util.List;

import com.caijin.I000Wan.common.service.CommonService;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.OrderDetail;

public interface OrderDetailService extends CommonService<OrderDetail,String>{
	List<OrderDetail> findOrderDetailByOrderId(Order orderId);
	List<OrderDetail> findOrderDetailByOrderId(String orderNo);
	List<OrderDetail> findAllOrderDetails(Integer pageNum, int size, String id);
	Integer findOrderDetailsSize(String id);

	List<OrderDetail> findbyQIhao(String expect);
//	int updateCaiNUmByID(String num, String id);


}
