package com.caijin.I000Wan.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.OrderDetail;
/**
 * 订单详情数据访问层
 * @author Jeff
 *
 */
public interface OrderDetailDao extends CommonDao<OrderDetail,String>{
	@Query("select o from OrderDetail o where o.order = ?1 ")
	List<OrderDetail> findOrderDetailByOrderId(Order order);

}
