package com.caijin.I000Wan.dao;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.dao.CustomBaseSqlDaoImpl;
import com.caijin.I000Wan.util.PageModel;
import com.caijin.I000Wan.util.Result;

public class LogDataDaoImpl extends CustomBaseSqlDaoImpl implements
		LogDataCustomDao {

	public String getSql(String userName, String startDate, String endDate) {
		String sql = " select u.user_name,r.ip," + " r.create_date"
				+ " from log_data r"
				+ " inner join member_user u on u.id=r.member_id where 1=1 ";

		if (userName != null && !"".equals(userName)) {
			sql += "and u.user_name like '%" + userName + "%' ";
		}

		if (startDate != null && !"".equals(startDate)) {
			sql += "and r.create_date >= '" + startDate + "' ";
		}

		if (endDate != null && !"".equals(endDate)) {
			sql += "and r.create_date <= '" + endDate + "' ";
		}

		sql += " order by r.create_date desc ";
		return sql;
	}

	@Override
	public Result findApplyRecordListByCondition(PageModel pageMode,
			String userName, String startDate, String endDate) {
		Result result = new Result();
		result.setTotal(getCount(getSql(userName, startDate, endDate)));
		result.setRows(this.querySqlObjects(
				getSql(userName, startDate, endDate), pageMode.getPage(),
				pageMode.getRows()));
		return result;
	}
}
