package com.caijin.I000Wan.service;

import java.util.List;
import java.util.Map;

import com.caijin.I000Wan.common.service.CommonService;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.entity.Order;

public interface OrderService extends CommonService<Order, String> {

	/**
	 * 获取我的充值记录
	 * 
	 * @param userId
	 * @return
	 */
	List<Order> getMyRechargeList(String userId);

	List<Map> findOrderListByCondition(String userName, String realName,
			String telephone, String orderType, String orderStatus,
			String payStatus, String startDate, String endDate);

	Order findOrderByOrderId(String orderId);

	Order findOrder(String orderId, Integer payStatus);

	/**
	 * 投注记录
	 * 
	 * @param pageNum
	 * @param size
	 * @return
	 */
	List<Order> findAllOrders(Integer pageNum, int size, MemberUser user);

	Integer findOrderSize();

	List<Order> findbyQIhao(String qihao);

	List<Order> findbyWinning();

	Integer findOrderSize(String id);

	List<Order> findAllOrders(int pageNum, int pageSize, String id);

	Integer findOrderZhongjiaoSize(String id);

	List<Order> findAllOrdersZhongjiao(int i, int pageSize, String id);

	int findOrderTouZhuSize(String id);

	List<Order> findAllOrderTouZhu(int i, int pageSize, String id);

	Integer findOrderHeiMaiSize(String id);

	List<Order> findAllOrderHeiMai(int i, int pageSize, String id);

	List<Order> findOrderByStatus(int waitOrder);

	/**
	 * 当日金额
	 * 
	 * @return
	 */
	float getTodayMoney(String memberUserID);

	/**
	 * 平台总返金额
	 * 
	 * @return
	 */
	float getPlatformAllMoney(String memberUserID);

	//计算代理人下的所有交易金额
	float getAllTradingAllPredUser(String id);

	float getTodayTradingAllPredUser(String id);

	List<Map> findMemberByAgentUserId(
			int i, int pageSize, String id);

	int findCountMemberByAgentUserId(String id);

	List<Map> findMemberStaticIncomeByAgentUserId(int i, int pageSize, String id);

	float getTodayBuyMomey(String id);

	float getTodayZhongjiaoMomey(String id);

//	void updateOrderByOrderNo(String orderNo, String status);

}
