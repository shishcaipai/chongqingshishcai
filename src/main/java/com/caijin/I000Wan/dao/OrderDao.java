package com.caijin.I000Wan.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.entity.Order;
/**
 * 订单Dao
 * @author Jeff
 *
 */
public interface OrderDao extends OrderCustomDao,CommonDao<Order,String>{

	/**
	 * 获取我的充值记录
	 * @param userId
	 * @return
	 */
	@Query("select o from Order o where o.memberUser.id=?1 and o.orderType=1 order by o.createDate desc ")
	public List<Order> getMyRechargeList(String userId);
	
	@Query("select o from Order o where o.orderId = ?1 ")
	Order findOrderByOrderId(String orderId);
	
	@Query("select o from Order o where o.orderId = ?1 and o.payStatus = ?2 ")
	Order findOrder(String orderId,Integer payStatus);
	
}
