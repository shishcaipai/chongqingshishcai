package com.caijin.I000Wan.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.entity.HeMaiOrderDetail;
import com.caijin.I000Wan.entity.Order;

public interface HeMaiOrderDetailDao extends CommonDao<HeMaiOrderDetail,String>{

	@Query("select o from HeMaiOrderDetail o where o.order = ?1 ")
	HeMaiOrderDetail findOrderHemaiDetailByOrderId(Order order);
	
	@Query(value="select o.* from hemai_order_detail o limit ?1,?2 ",nativeQuery=true)
	List<HeMaiOrderDetail> findAllHemaiOrderDetails(Integer pageNum, int size);
	
	@Query("select count(o) from HeMaiOrderDetail o")
	int findHemaiOrderDetailsSize();
}
