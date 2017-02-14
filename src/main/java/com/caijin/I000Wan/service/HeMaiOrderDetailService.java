package com.caijin.I000Wan.service;

import java.util.List;

import com.caijin.I000Wan.common.service.CommonService;
import com.caijin.I000Wan.entity.HeMaiOrderDetail;
import com.caijin.I000Wan.entity.Order;

public interface HeMaiOrderDetailService extends CommonService<HeMaiOrderDetail,String>{
	List<HeMaiOrderDetail> findAllHemaiOrderDetails(Integer pageNum, int size);
	Integer findHemaiOrderDetailsSize();
	  HeMaiOrderDetail findOrderHemaiDetailByOrderId(Order order);
}
