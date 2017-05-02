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

	@Query("select o from Order o where o.orderNo = ?1 ")
	Order findOrderByOrderId(String orderId);

	@Query("select o from Order o where o.orderNo = ?1 and o.payStatus = ?2 ")
	Order findOrder(String orderId, Integer payStatus);
	
	@Query("select o from Order o where o.wprizeStatus = ?1 and ( o.orderType=2 or o.orderType=3)")
	List<Order> findOrderbyWprizeStatus(Integer wprizeStatus);

	@Query(value = "select o.* from trade_order o where o.member_id = ?3   order by o.create_date desc limit ?1,?2 ", nativeQuery = true)
	List<Order> findAllOrders(Integer pageNum, int size, String id);

	@Query(value = "select count(o.id) from trade_order o  where o.member_id = ?1  ", nativeQuery = true)
	int findOrderSize(String id);

	//查看所有消费情况
	@Query(value = "select o.* from trade_order o where o.member_id = ?3 and  o.order_type!=3  and o.order_type!=7  order by o.create_date desc limit ?1,?2 ", nativeQuery = true)
	List<Order> findAllOrderssByTypeNO3and7(Integer pageNum, int size, String id);
	//查看所有消费情况
	@Query(value = "select count(o.id) from trade_order o  where o.member_id = ?1 and  o.order_type!=3  and o.order_type!=7 ", nativeQuery = true)
	int findOrderSizeByTypeNO3and7(String id);
	
	@Query("select count(o) from Order o")
	int findOrderSize();

	@Query(value = "select o.* from trade_order o left join lottery_period t on o.order_no = t.orderid where t.lottery_period = ?1 order by o.create_date desc ", nativeQuery = true)
	public List<Order> findbyQIhao(String qihao);

	@Query(value = "select  o.* from trade_order o  where (o.wprize_status=2 or o.wprize_status=1) and (o.order_type=2 or o.order_type=4)  order by o.create_date desc limit 0,10 ", nativeQuery = true)
	public List<Order> findbyWinning();

	@Query(value = "select count(o.id) from trade_order o where (o.order_type=2 or o.order_type=4 or o.order_type=3) and   (o.wprize_status=2 or o.wprize_status=1) and o.member_id = ?1 ", nativeQuery = true)
	public int findOrderZhongjiaoSize(String id);

	@Query(value = "select o.* from trade_order o where (o.order_type=2 or o.order_type=4 or o.order_type=3) and   (o.wprize_status=2 or o.wprize_status=1) and o.member_id = ?3 order by o.create_date desc limit ?1,?2 ", nativeQuery = true)
	public List<Order> findAllOrdersZhongjiao(int i, int pageSize, String id);

	@Query(value = "select count(o.id) from trade_order o  where (o.order_type=2  or o.order_type=3)  and o.member_id = ?1 ", nativeQuery = true)
	public int findOrderTouZhuSize(String id);

	@Query(value = "select o.* from trade_order o  where (o.order_type=2  or o.order_type=3) and o.order_status=1 and o.member_id = ?3 order by o.create_date desc limit ?1,?2  ", nativeQuery = true)
	public List<Order> findAllOrderTouZhu(int i, int pageSize, String id);

	@Query(value = "select count(o.id) from trade_order o  where o.order_type=3  and o.member_id = ?1 ", nativeQuery = true)
	public int findOrderHeMaiSize(String id);

	@Query(value = "select o.* from trade_order o  where  o.order_type=3  and o.member_id = ?3 order by o.create_date limit ?1,?2  ", nativeQuery = true)
	public List<Order> findAllOrderHeMai(int i, int pageSize, String id);

	@Query(value = "select o.* from trade_order o where o.order_status=?1 and (o.order_type=2 or o.order_type=3 ) order by o.create_date desc ", nativeQuery = true)
	public List<Order> findOrderByStatus(int waitOrder);

	/**
	 * 计算当前用户返奖
	 * 
	 * @param memberUserID
	 * @return
	 */
	@Query(value = "select  sum(o.current_wp_money)  from trade_order o where o.order_status=1 and o.order_type=5 and o.member_id=?1  and TO_DAYS(o.create_date) = TO_DAYS(NOW()) ", nativeQuery = true)
	public float sumOrderByTodayOrderType(String memberUserID);

	@Query(value = "select  sum(o.current_wp_money) from trade_order o where o.order_status=1 and o.order_type=5 and o.member_id=?1 ", nativeQuery = true)
	public float getPlatformAllMoney(String memberUserID);

	/**
	 * 取得代理人下所有交易量
	 * 
	 * @param id
	 * @return
	 */
	@Query(value = "select  sum(o.total_money) from trade_order o left join member_user m on  o.member_id=m.id where o.pay_status=1 and (o.order_type=4 or o.order_type=2) and m.commend_member_id=?1 ", nativeQuery = true)
	public float getAllTradingAllPredUser(String id);

	/**
	 * 取得代理人下所有交易量
	 * 
	 * @param id
	 * @return
	 */
	@Query(value = "select  sum(o.total_money) from trade_order o left join member_user m on  o.member_id=m.id where o.pay_status=1 and (o.order_type=4 or o.order_type=2) and m.commend_member_id=?1  and TO_DAYS(o.create_date) = TO_DAYS(NOW()) ", nativeQuery = true)
	public float getTodayAllTradingAllPredUser(String id);

	@Query(value = "select count(mu.id) from member_user mu  where mu.commend_member_id =?1 ", nativeQuery = true)
	public int findCountMemberByAgentUserId(String id);

	@Query(value = "select sum(mu.total_money) from trade_order mu  where mu.pay_status=1 and  mu.member_id =?1 and TO_DAYS(mu.create_date) = TO_DAYS(NOW()) ", nativeQuery = true)
	public float getTodayBuyMomey(String id);

	@Query(value = "select sum(mu.current_wp_money) from trade_order mu  where mu.member_id =?1 and TO_DAYS(mu.create_date) = TO_DAYS(NOW()) ", nativeQuery = true)
	public float getTodayZhongjiaoMomey(String id);

	@Query("select o from Order o where o.orderType=?1 and o.otherId=?2 order by o.createDate desc ")
	public List<Order> findOrderByTypeAndOtherId(int hemaiImpBuyOrder, String id);

	@Query("select o from Order o where o.orderType=?1 and o.orderNo=?2 order by o.createDate desc ")
	public Order findOrderByTypeAndOrderId(int orderType, String orderNo);

	// 代理人下充值总数
	@Query(value = "select  sum(o.available_score) from chongzhi_record o left join member_user m on  o.member_id=m.id where m.commend_member_id=?1  ", nativeQuery = true)
	public float getAgnetCzMoney(String id);

	// 代理人下活动奖金额总数
	@Query(value = "select  sum(o.action_score) from chongzhi_record o left join member_user m on  o.member_id=m.id where m.commend_member_id=?1  ", nativeQuery = true)
	public float getAgnetZsMoney(String id);
	// 代理人下提现金额总数
	@Query(value = "select  sum(o.apply_money) from apply_record o left join member_user m on  o.member_id=m.id where m.commend_member_id=?1 and o.audit_status=1 ", nativeQuery = true)
	public float getAgnettkzMoney(String id);
	//当前代理下所有可用金额
	@Query(value = "select  sum(m.available_score) from  member_user m  where m.commend_member_id=?1  ", nativeQuery = true)
	public float getAgnetCurrentMoney(String id);
	//当前代理下可用赠送金额
	@Query(value = "select  sum(m.action_score) from  member_user m  where m.commend_member_id=?1  ", nativeQuery = true)
	public float getAgnetActionCurrentMoney(String id);
}
