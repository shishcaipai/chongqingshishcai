package com.caijin.I000Wan.dao;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.dao.CustomBaseSqlDaoImpl;
import com.caijin.I000Wan.web.OrderController;

public class PeriodDaoImpl extends CustomBaseSqlDaoImpl implements
		PeriodCustomDao {
	private final Logger log = LoggerFactory.getLogger(PeriodDaoImpl.class);

	@Override
	public int updatePeriodStatusByOId(String orderNo, int status,
			String lotteryCode) {

		String sql = "UPDATE lottery_period SET status=" + status
				+ "  where orderid='" + orderNo + "'  and lottery_code= '"+lotteryCode+"'";
		log.info("执行更新投注期内容:" + sql);
		int  i=exceSql(sql);
		log.info("执行更新投注期内容:" + i);
		return i;
	}

	@Override
	public int updatePeriodStatusByOIdAndParse(String orderNo, int status,
			String lotteryCode, String parse) {
		String sql = "UPDATE lottery_period SET status=" + status
				+ "  where orderid='" + orderNo + "'  and lottery_period='"
				+ parse + "' and lottery_code= '"+lotteryCode+"'";
		log.info("根据期号-----执行更新投注期内容:" + sql);
		int  i=exceSql(sql);
		log.info("根据期号-----执行更新投注期内容:" + i);
		return i;
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

}
