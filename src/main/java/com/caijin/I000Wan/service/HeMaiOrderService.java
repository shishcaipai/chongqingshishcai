package com.caijin.I000Wan.service;

import java.util.List;

import com.caijin.I000Wan.common.service.CommonService;
import com.caijin.I000Wan.entity.HeMaiOrder;

public interface HeMaiOrderService extends CommonService<HeMaiOrder,String>{
	
	List<HeMaiOrder> findAllHemaiOrders();

}
