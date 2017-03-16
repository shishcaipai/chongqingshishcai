package com.caijin.I000Wan.dao;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.dao.CustomBaseSqlDaoImpl;
import com.caijin.I000Wan.util.PageModel;
import com.caijin.I000Wan.util.Result;

public class ApplyRecordDaoImpl extends CustomBaseSqlDaoImpl implements
		ApplyRecordCustomDao {

	public Result findApplyRecordListByCondition(PageModel pageModel,
			String realName, String idCardNo, String userName,
			String auditStatus, String applystartDate, String applyendDate,
			String startDate, String endDate) {
		Result result = new Result();
		result.setTotal(getCount(getSql(realName, idCardNo, userName,
				auditStatus, applystartDate, applyendDate, startDate, endDate)));
		result.setRows(this.querySqlObjects(
				getSql(realName, idCardNo, userName, auditStatus,
						applystartDate, applyendDate, startDate, endDate),
				pageModel.getPage(), pageModel.getRows()));
		return result;
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
			session.getTransaction().commit();;
			emf.getCache().evictAll();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			 em.close();
		}
	}

	public String getSql(String realName, String idCardNo, String userName,
			String auditStatus, String applystartDate, String applyendDate,
			String startDate, String endDate) {
		String sql = " select r.id, u.user_name,r.apply_name,r.id_card_no,r.apply_money,"
				+ " r.create_date,r.bank_name,r.audit_status,r.auditor,r.audit_time"
				+ " from apply_record r"
				+ " inner join member_user u on u.id=r.member_id where 1=1 ";

		if (realName != null && !"".equals(realName)) {
			sql += "and r.apply_name like '%" + realName + "%' ";
		}

		if (idCardNo != null && !"".equals(idCardNo)) {
			sql += "and r.id_card_no like '%" + idCardNo + "%' ";
		}
		if (userName != null && !"".equals(userName)) {
			sql += "and u.user_name like '%" + userName + "%' ";
		}

		if (auditStatus != null && !"".equals(auditStatus)) {
			sql += "and r.audit_status = " + auditStatus + " ";
		}

		if (applystartDate != null && !"".equals(applystartDate)) {
			sql += "and r.create_date >= '" + applystartDate + "' ";
		}

		if (applyendDate != null && !"".equals(applyendDate)) {
			sql += "and r.create_date <= '" + applyendDate + "' ";
		}

		if (startDate != null && !"".equals(startDate)) {
			sql += "and r.audit_time >= '" + startDate + "' ";
		}

		if (endDate != null && !"".equals(endDate)) {
			sql += "and r.audit_time <= '" + endDate + "' ";
		}

		sql += " order by r.create_date desc ";
		return sql;
	}
}
