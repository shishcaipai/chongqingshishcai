package com.caijin.I000Wan.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.entity.HeMaiOrderDetail;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.OrderDetail;

public interface HeMaiOrderDetailDao extends CommonDao<HeMaiOrderDetail,String>{

	@Query("select o from HeMaiOrderDetail o where o.order = ?1 ")
    OrderDetail findOrderHemaiDetailByOrderId(Order order);
}
