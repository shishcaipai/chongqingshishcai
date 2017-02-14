package com.caijin.I000Wan.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.caijin.I000Wan.common.dao.CustomBaseSqlDaoImpl;
@Repository("orderDaoImpl")
public class OrderDaoImpl extends CustomBaseSqlDaoImpl implements
		OrderCustomDao {

	public List<Map> findOrderListByCondition(String userName, String realName,
			String telephone, String orderType, String orderStatus,
			String payStatus, String startDate, String endDate) {
		String sql = "select torder.order_id,torder.name,torder.order_type,torder.total_money,"
				+ "torder.order_status,torder.pay_status,torder.create_date,"
				+ "mu.user_name,mu.real_name,mu.address,mu.telephone "
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
		String sql = "select sum(t.money) as money,mu.user_name from member_user mu inner join trade_order o on mu.id=o.member_id inner join lottery_period t on o.order_id = t.orderid where t.winning = 1  ";

		if (startDate != null && !startDate.equals("")) {
			sql += "and o.order_time >= '" + startDate + "' ";
		}

		sql += "group by mu.user_name order by sum(t.money) desc ";

		return this.querySqlObjects(sql);
	}

	public void updateOrderByQihao(String orderId,String qihao) {
     String  sql="update trade_order set order_status=2 where order_id='"+orderId+"'";
     this.exceSql(sql);
    		 
	}

//	public List<Map> findHeiMaiDetail(int pageNum, int pageSize, String memberid) {
//		String sql = "select sum(t.money) as money  from hemai_order mu inner join trade_order o on mu.order_on=o.order_id inner join lottery_period t on o.order_id = t.orderid where mu.member_id =?1  ";
//		sql += "group by mu.order_on order by mu.create_date desc limit ?1,?2";
//		return this.querySqlObjects(sql);
//	}
//
//	public int findHeiMaiDetailCount(String memberid) {
//		return 0;
//	}

}
