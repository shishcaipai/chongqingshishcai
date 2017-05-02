package com.caijin.I000Wan.dao;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.dao.CustomBaseSqlDaoImpl;
import com.caijin.I000Wan.entity.HeMaiOrderDetail;
import com.caijin.I000Wan.util.PageModel;
import com.caijin.I000Wan.util.Result;
import com.caijin.I000Wan.web.AgentController;

@Repository("orderDaoImpl")
public class OrderDaoImpl extends CustomBaseSqlDaoImpl implements
		OrderCustomDao {
	private final Logger log = LoggerFactory.getLogger(AgentController.class);

	public List<Map> findOrderListByCondition(String userName, String realName,
			String telephone, String orderType, String orderStatus,
			String payStatus, String startDate, String endDate) {
		String sql = "select torder.order_no,torder.name,torder.order_type,torder.total_money,"
				+ "torder.order_status,torder.pay_status,torder.create_date,"
				+ "mu.user_name,mu.real_name,mu.address,mu.telephone, torder.wprize_status, torder.auto_prizes "
				+ "from trade_order torder,member_user mu where 1=1 and torder.member_id=mu.id ";

		if (userName != null && !userName.equals("")) {
			sql += "and mu.user_name like '%" + userName + "%' ";
		}

		if (realName != null && !realName.equals("")) {
			sql += "and mu.real_name like '%" + realName + "%' ";
		}

		if (telephone != null && !telephone.equals("")) {
			sql += "and mu.telephone like '%" + telephone + "%' ";
		}

		if (orderType != null && !orderType.equals("")) {
			sql += "and torder.order_type = " + orderType + " ";
		}

		if (orderStatus != null && !orderStatus.equals("")) {
			sql += "and torder.order_status = " + orderStatus + " ";
		}

		if (payStatus != null && !payStatus.equals("")) {
			sql += "and torder.pay_status = " + payStatus + " ";
		}

		if (startDate != null && !startDate.equals("")) {
			sql += "and torder.order_time >= '" + startDate + "' ";
		}

		if (endDate != null && !endDate.equals("")) {
			sql += "and torder.order_time <= '" + endDate + "' ";
		}

		sql += " order by torder.order_time desc ";

		return this.querySqlObjects(sql);
	}

	@Override
	public List<Map> findUserTotalAmountList(String startDate) {
		String sql = "select sum(o.current_wp_money) as money,mu.user_name from member_user mu left join trade_order o on mu.id=o.member_id "
				+ "where (o.wprize_status = 1 or o.wprize_status = 2) and (o.order_type=2 or o.order_type=4) ";

		if (startDate != null && !startDate.equals("")) {
			sql += "and o.order_time >= '" + startDate + "' ";
		}

		sql += "group by mu.user_name order by sum(o.current_wp_money) desc limit 0,10 ";

		return this.querySqlObjects(sql);
	}

	public List<Map> findMemberByAgentUserId(int i, int pageSize, String id) {
		String sql = "select mu.id as id, uu.money,uu.pmoney,mu.user_name as username,mu.real_name as realname,mu.telephone as telephone,mu.create_date as createdate,mu.email as email from member_user mu  left join (select sum(td.total_money) as money,sum(td.current_wp_money) as pmoney,td.member_id from trade_order td  where td.order_status=1 group by td.member_id) as uu on uu.member_id=mu.id  where   mu.commend_member_id = '"
				+ id + "'   order by mu.create_date desc; ";
		log.info(sql);
		return this.querySqlObjects(sql);
	}

	public List<Map> findMemberStaticIncomeByAgentUserId(int i, int pageSize,
			String id) {
		String sql = "select atb.applyMoney, uu.money,uu.pmoney, score.actionScore,score.available, mu.id as id,mu.user_name as username,mu.type as type,mu.available_score as totalavailabeScore,mu.create_date as createdate,mu.action_score as totalactionScore from member_user mu  left join (select sum(td.total_money) as money,sum(td.current_wp_money) as pmoney,td.member_id from trade_order td  where td.order_status=1 group by td.member_id) as uu on uu.member_id=mu.id "
				+ "left join (select sum(dd.action_score) as actionScore,sum(dd.available_score) as available,dd.member_id from chongzhi_record dd  group by dd.member_id) as score on score.member_id=mu.id  left join (select sum(map.apply_money) as applyMoney,map.member_id from apply_record map  where map.audit_status=1 group by map.member_id) as atb on atb.member_id=mu.id  where   mu.commend_member_id = '"
				+ id + "'    order by mu.create_date desc;";
		log.info(sql);
		return this.querySqlObjects(sql);
	}

	@Transactional
	@Override
	public void clear() {
		EntityManager em = this.emf.createEntityManager();

		try {
			Session session = em.unwrap(Session.class);
			session.getTransaction().begin();
			session.clear();
			em.flush();
			session.getTransaction().commit();
			;
			emf.getCache().evictAll();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}
	}

	public String getSql(String userName, String realName, String telephone,
			String orderType, String orderStatus, String payStatus,
			String startDate, String endDate) {
		String sql = "select torder.order_no,torder.name,torder.order_type,torder.total_money,"
				+ "torder.order_status,torder.pay_status,torder.create_date,"
				+ "mu.user_name,mu.real_name,mu.address,mu.telephone, torder.wprize_status, torder.auto_prizes "
				+ "from trade_order torder,member_user mu where 1=1 and torder.member_id=mu.id ";

		if (userName != null && !userName.equals("")) {
			sql += "and mu.user_name like '%" + userName + "%' ";
		}

		if (realName != null && !realName.equals("")) {
			sql += "and mu.real_name like '%" + realName + "%' ";
		}

		if (telephone != null && !telephone.equals("")) {
			sql += "and mu.telephone like '%" + telephone + "%' ";
		}

		if (orderType != null && !orderType.equals("")) {
			sql += "and torder.order_type = " + orderType + " ";
		}

		if (orderStatus != null && !orderStatus.equals("")) {
			sql += "and torder.order_status = " + orderStatus + " ";
		}

		if (payStatus != null && !payStatus.equals("")) {
			sql += "and torder.pay_status = " + payStatus + " ";
		}

		if (startDate != null && !startDate.equals("")) {
			sql += "and torder.order_time >= '" + startDate + "' ";
		}

		if (endDate != null && !endDate.equals("")) {
			sql += "and torder.order_time <= '" + endDate + "' ";
		}

		sql += " order by torder.create_date desc ";
		return sql;
	}

	public String getzjSql(String userName, String startDate, String endDate) {
		String sql = "select torder.order_no,torder.name,torder.order_type,torder.total_money,torder.cash_back_status,"
				+ "torder.order_status,torder.pay_status,torder.create_date,"
				+ "mu.user_name,mu.real_name,mu.address,mu.telephone, torder.wprize_status, torder.auto_prizes "
				+ "from trade_order torder,member_user mu where (torder.wprize_status=1 or torder.wprize_status=2 ) and torder.member_id=mu.id ";

		if (userName != null && !userName.equals("")) {
			sql += "and mu.user_name like '%" + userName + "%' ";
		}

		// if (orderType != null && !orderType.equals("")) {
		sql += "and (torder.order_type = 2 or torder.order_type = 3)";
		// }

		if (startDate != null && !startDate.equals("")) {
			sql += "and torder.order_time >= '" + startDate + "' ";
		}

		if (endDate != null && !endDate.equals("")) {
			sql += "and torder.order_time <= '" + endDate + "' ";
		}

		sql += " order by torder.create_date desc ";
		return sql;
	}

	@Override
	public Result findOrderListByCondition(PageModel pageModel,
			String userName, String realName, String telephone,
			String orderType, String orderStatus, String payStatus,
			String startDate, String endDate) {
		Result result = new Result<List<Map>>();
		result.setTotal(getCount(getSql(userName, realName, telephone,
				orderType, orderStatus, payStatus, startDate, endDate)));
		result.setRows(this.querySqlObjects(
				getSql(userName, realName, telephone, orderType, orderStatus,
						payStatus, startDate, endDate), pageModel.getPage(),
				pageModel.getRows()));
		return result;
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
	@Override
	public Result findzjOrderListByCondition(PageModel pageModel,
			String userName, String startDate, String endDate) {
		Result result = new Result<List<Map>>();
		log.error("sql::" + getzjSql(userName, startDate, endDate));
		result.setTotal(getCount(getzjSql(userName, startDate, endDate)));
		result.setRows(this.querySqlObjects(
				getzjSql(userName, startDate, endDate), pageModel.getPage(),
				pageModel.getRows()));
		return result;
	}

	public void updateByOrderNo(String orderNo, int orderSucess) {
		String sql = "update trade_order set order_status=" + orderSucess
				+ " where order_no='" + orderNo + "' or other_id='" + orderNo
				+ "'";
		// String sql2 =
		// "update trade_order set order_status="+orderSucess+" where other_id='"
		// + orderNo + "'";
		this.exceSql(sql);
		// this.exceSql(sql2);

	}

}
