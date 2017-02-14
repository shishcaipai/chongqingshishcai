package com.caijin.I000Wan.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.OrderDetail;

/**
 * 订单Dao
 * 
 * @author Jeff
 * 
 */
public interface OrderDao extends OrderCustomDao, CommonDao<Order, String> {

	/**
	 * 获取我的充值记录
	 * 
	 * @param userId
	 * @return
	 */
	@Query("select o from Order o where o.memberUser.id=?1 and o.orderType=1 order by o.createDate desc ")
	public List<Order> getMyRechargeList(String userId);

	@Query("select o from Order o where o.orderId = ?1 ")
	Order findOrderByOrderId(String orderId);

	@Query("select o from Order o where o.orderId = ?1 and o.payStatus = ?2 ")
	Order findOrder(String orderId, Integer payStatus);

	@Query(value = "select o.* from trade_order o where o.member_id = ?3   order by o.create_date desc limit ?1,?2 ", nativeQuery = true)
	List<Order> findAllOrders(Integer pageNum, int size, String id);

	@Query(value = "select count(o.id) from trade_order o  where o.member_id = ?1  ", nativeQuery = true)
	int findOrderSize(String id);

	@Query("select count(o) from Order o")
	int findOrderSize();

	@Query(value = "select o.* from trade_order o inner join lottery_period t on o.order_id = t.orderid where t.lottery_period = ?1 order by o.create_date desc ", nativeQuery = true)
	public List<Order> findbyQIhao(String qihao);

	@Query(value = "select  o.* from trade_order o left join lottery_period t on o.order_id = t.orderid where t.winning = 1 order by o.create_date desc limit 0,10 ", nativeQuery = true)
	public List<Order> findbyWinning();

	@Query(value = "select count(o.id) from trade_order o left join lottery_period t on o.order_no = t.orderid where  t.winning=1 and o.member_id = ?1 ", nativeQuery = true)
	public int findOrderZhongjiaoSize(String id);

	@Query(value = "select o.* from trade_order o left join lottery_period t on o.order_no = t.orderid where  t.winning=1 and o.member_id = ?3 order by o.create_date desc limit ?1,?2 ", nativeQuery = true)
	public List<Order> findAllOrdersZhongjiao(int i, int pageSize, String id);

	@Query(value = "select count(o.id) from trade_order o  where o.order_type=2  and o.member_id = ?1 ", nativeQuery = true)
	public int findOrderTouZhuSize(String id);

	@Query(value = "select o.* from trade_order o  where  o.order_type=2  and o.member_id = ?3 order by o.create_date desc limit ?1,?2  ", nativeQuery = true)
	public List<Order> findAllOrderTouZhu(int i, int pageSize, String id);
	
	
	@Query(value = "select count(o.id) from trade_order o  where o.order_type=3  and o.member_id = ?1 ", nativeQuery = true)
	public int findOrderHeMaiSize(String id);

	@Query(value = "select o.* from trade_order o  where  o.order_type=3  and o.member_id = ?3 order by o.create_date limit ?1,?2  ", nativeQuery = true)
	public List<Order> findAllOrderHeMai(int i, int pageSize, String id);
	@Query("select o from Order o where o.orderStatus=?1 and (o.orderType=1 or o.orderType=2 ) order by o.createDate desc ")
	public List<Order> findOrderByStatus(int waitOrder);

}
