package com.caijin.I000Wan.service;

import java.util.List;

import com.caijin.I000Wan.common.service.CommonService;
import com.caijin.I000Wan.entity.HeMaiOrder;
import com.caijin.I000Wan.entity.HeMaiOrderDetail;

public interface HeMaiOrderService extends CommonService<HeMaiOrder,String>{
	
	List<HeMaiOrder> findOrderHemaiByOrderId(HeMaiOrderDetail order);
	
	List<HeMaiOrder> findAllHemaiOrders();

}
