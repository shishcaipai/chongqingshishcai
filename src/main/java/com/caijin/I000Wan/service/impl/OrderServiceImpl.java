package com.caijin.I000Wan.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.service.impl.CommonServiceImpl;
import com.caijin.I000Wan.dao.OrderDao;
import com.caijin.I000Wan.dao.OrderDaoImpl;
import com.caijin.I000Wan.dao.PeriodDao;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.OrderDetail;
import com.caijin.I000Wan.service.OrderService;
import com.caijin.I000Wan.util.PageModel;
import com.caijin.I000Wan.util.Result;
import com.caijin.I000Wan.web.AgentController;

@Component
@Transactional
public class OrderServiceImpl extends CommonServiceImpl<Order, String>
		implements OrderService {
	private final Logger log = LoggerFactory.getLogger(AgentController.class);
	@Autowired
	private OrderDao orderDao;

	@Resource(name = "orderDaoImpl")
	private OrderDaoImpl orderDaoImpl;

	@Autowired
	public void setOrderDao(OrderDao orderDao) {
		super.setCommonDao(orderDao);
	}

	/**
	 * 获取我的充值记录
	 * 
	 * @param userId
	 * @return
	 */
	public List<Order> getMyRechargeList(String userId) {
		return orderDao.getMyRechargeList(userId);
	}

	public Result findOrderListByCondition(PageModel pageModel,
			String userName, String realName, String telephone,
			String orderType, String orderStatus, String payStatus,
			String startDate, String endDate) {
		return orderDao.findOrderListByCondition(pageModel, userName, realName,
				telephone, orderType, orderStatus, payStatus, startDate,
				endDate);
	}

	/**
	 * 中奖且未发奖的订单订单列
	 * 
	 * @param pageModel
	 * @param userName
	 * @param realName
	 * @param telephone
	 * @param orderType
	 * @param orderStatus
	 * @param payStatus
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Result findzjOrderListByCondition(PageModel pageModel,
			String userName, String startDate, String endDate) {
		return orderDao.findzjOrderListByCondition(pageModel, userName,
				startDate, endDate);
	}

	public Order findOrderByOrderId(String orderId) {
		return orderDao.findOrderByOrderId(orderId);
	}

	public Order findOrder(String orderId, Integer payStatus) {
		return orderDao.findOrder(orderId, payStatus);
	}

	@Override
	public List<Order> findAllOrders(Integer pageNum, int size, MemberUser user) {
		return orderDao.findAllOrders(pageNum, size, user.getId());
	}

	@Override
	public Integer findOrderSize() {
		return orderDao.findOrderSize();
	}

	/**
	 * 根据期号查询到所有订单
	 */
	@Override
	public List<Order> findbyQIhao(String qihao) {
		return orderDao.findbyQIhao(qihao);
	}

	@Override
	public List<Order> findbyWinning() {
		return orderDao.findbyWinning();
	}

	@Override
	public Integer findOrderSize(String id) {
		return orderDao.findOrderSize(id);
	}

	@Override
	public List<Order> findAllOrders(int pageNum, int pageSize, String id) {
		return orderDao.findAllOrders(pageNum, pageSize, id);
	}

	@Override
	public Integer findOrderZhongjiaoSize(String id) {
		return orderDao.findOrderZhongjiaoSize(id);
	}

	@Override
	public List<Order> findAllOrdersZhongjiao(int i, int pageSize, String id) {
		return orderDao.findAllOrdersZhongjiao(i, pageSize, id);
	}

	@Override
	public int findOrderTouZhuSize(String id) {
		return orderDao.findOrderTouZhuSize(id);
	}

	@Override
	public List<Order> findAllOrderTouZhu(int i, int pageSize, String id) {
		return orderDao.findAllOrderTouZhu(i, pageSize, id);
	}

	@Override
	public Integer findOrderHeiMaiSize(String id) {
		return orderDao.findOrderHeMaiSize(id);
	}

	@Override
	public List<Order> findAllOrderHeiMai(int i, int pageSize, String id) {
		return orderDao.findAllOrderHeMai(i, pageSize, id);
	}

	@Override
	public List<Order> findOrderByStatus(int waitOrder) {
		return orderDao.findOrderByStatus(waitOrder);
	}

	@Override
	public float getTodayMoney(String memberUserID) {
		try {
			return orderDao.sumOrderByTodayOrderType(memberUserID);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public float getPlatformAllMoney(String memberUserID) {
		try {
			return orderDao.getPlatformAllMoney(memberUserID);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public float getAllTradingAllPredUser(String id) {
		try {
			return orderDao.getAllTradingAllPredUser(id);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public float getTodayTradingAllPredUser(String id) {
		try {
			return orderDao.getTodayAllTradingAllPredUser(id);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public List<Map> findMemberByAgentUserId(int i, int pageSize, String id) {
		return orderDaoImpl.findMemberByAgentUserId(i, pageSize, id);
	}

	@Override
	public int findCountMemberByAgentUserId(String id) {
		return orderDao.findCountMemberByAgentUserId(id);
	}

	@Override
	public List<Map> findMemberStaticIncomeByAgentUserId(int i, int pageSize,
			String id) {
		return orderDaoImpl
				.findMemberStaticIncomeByAgentUserId(i, pageSize, id);
	}

	@Override
	public float getTodayBuyMomey(String id) {
		try {
			return orderDao.getTodayBuyMomey(id);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public float getTodayZhongjiaoMomey(String id) {
		try {
			return orderDao.getTodayZhongjiaoMomey(id);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public void clear() {
		orderDaoImpl.clear();

	}

	@Override
	public List<Order> findOrderByTypeAndOtherId(int hemaiImpBuyOrder, String id) {
		return orderDao.findOrderByTypeAndOtherId(hemaiImpBuyOrder, id);
	}

	@Override
	public void updateByOrderNo(String orderNo, int orderSucess) {
		orderDaoImpl.updateByOrderNo(orderNo, orderSucess);
		orderDaoImpl.clear();
	}

	public Order findOrderByTypeAndOrderId(int orderType, String orderNo) {
		return orderDao.findOrderByTypeAndOrderId(orderType, orderNo);
	}

	// 代理人下充值总数
		@Override
		public float getAgnetCzMoney(MemberUser user) {
			try {
				return orderDao.getAgnetCzMoney(user.getId());
			} catch (Exception e) {
				e.printStackTrace();
			}

			return 0;
		}
		// 代理人下活动金额总数
		@Override
		public float getAgnetZsMoney(MemberUser user) {
			try {
				return orderDao.getAgnetZsMoney(user.getId());
			} catch (Exception e) {
				e.printStackTrace();
			}
			return 0;
		}

	@Override
	public float getAgnettkzMoney(MemberUser user) {
		try {
			return orderDao.getAgnettkzMoney(user.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public float getAgnetCurrentMoney(MemberUser user) {
		try {
			return orderDao.getAgnetCurrentMoney(user.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

//	@Override
//	public float getAgnetylMoney(MemberUser user) {
//		try {
//			return orderDao.getAgnetylMoney(user.getId());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return 0;
//	}

}
