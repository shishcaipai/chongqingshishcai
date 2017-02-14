package com.caijin.I000Wan.service;

import java.util.List;

import com.caijin.I000Wan.common.service.CommonService;
import com.caijin.I000Wan.entity.HeMaiOrder;
import com.caijin.I000Wan.entity.HeMaiOrderDetail;
import com.caijin.I000Wan.entity.Order;

public interface HeMaiOrderService extends CommonService<HeMaiOrder,String>{
	
	List<HeMaiOrder> findOrderHemaiByOrderId(HeMaiOrderDetail order);
	
	List<HeMaiOrder> findAllHemaiOrders();
	int  getHemaiOrderFenNum(HeMaiOrderDetail order);

	List<HeMaiOrder> findAllOrderZuiHao(int i, int pageSize, String id);

	Integer findOrderZuiHaoSize(String id);



}
