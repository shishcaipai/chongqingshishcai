package com.caijin.I000Wan.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.entity.HeMaiOrderDetail;
import com.caijin.I000Wan.entity.HeMaiOrder;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.OrderDetail;

public interface HeMaiOrderDao extends CommonDao<HeMaiOrder, String> {
	@Query("select o from HeMaiOrder o where o.orderDetail = ?1 ")
	List<HeMaiOrder> findOrderHemaiByOrderId(HeMaiOrderDetail order);

	@Query("select o from HeMaiOrder o")
	List<HeMaiOrder> findAllHemaiOrders();
}
