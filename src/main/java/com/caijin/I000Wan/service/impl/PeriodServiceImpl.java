package com.caijin.I000Wan.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.service.impl.CommonServiceImpl;
import com.caijin.I000Wan.dao.OrderCustomDao;
import com.caijin.I000Wan.dao.OrderDao;
import com.caijin.I000Wan.dao.OrderDaoImpl;
import com.caijin.I000Wan.dao.PeriodDao;
import com.caijin.I000Wan.entity.Period;
import com.caijin.I000Wan.service.PeriodService;

@Component
@Transactional
public class PeriodServiceImpl extends CommonServiceImpl<Period, String>
		implements PeriodService {

	@Autowired
	private PeriodDao periodDao;
	@Resource(name = "orderDaoImpl")
	private OrderDaoImpl orderDaoImpl;

	@Autowired
	public void setPeriodDao(PeriodDao periodDao) {
		super.setCommonDao(periodDao);
	}

	/**
	 * 根据彩票编码查询当前期数
	 * 
	 * @param lotteryCode
	 * @return
	 */
	public Period findByCurrentPeriod(String lotteryCode) {
		return periodDao.findByCurrentPeriod(lotteryCode);
	}

	/**
	 * 根据彩票编码查找历史的前N期期数数据
	 * 
	 * @param lotteryCode
	 * @param n
	 * @return
	 */
	public List<Period> findByTopNhistory(String lotteryCode, int n) {
		return periodDao.findByTopNhistory(lotteryCode, n);
	}

	/**
	 * 根据彩票编码查找预售的前N期期数数据
	 * 
	 * @param lotteryCode
	 * @param n
	 * @return
	 */
	public List<Period> findByTopNnew(String lotteryCode, int n) {
		return periodDao.findByTopNnew(lotteryCode, n);
	}

	public Period findPeriodById(Integer id) {
		return periodDao.findPeriodById(id);
	}

	@Override
	public List<Period> findPeriodByOId(String oid) {
		return periodDao.findPeriodByOId(oid);
	}

	@Override
	public List<Period> findbyQIhao(String expect) {
		return periodDao.findbyQIhao(expect);
	}

	@Override
	public boolean updatePeriodbyQIhaoAndOrderNo(String expect, String orderNo,
			int i, float money) {
		Period period = periodDao.findPeriodbyQIhaoAndOrderNo(expect, orderNo);
		period.setMoney(money * period.getBeisu());
		period.setWinning(i);
		save(period);
		return true;
	}

	@Override
	public int getPeriodUNStatusByOId(String orderId) {
		try {
			return periodDao.getPeriodUNStatusByOId(orderId);
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public float getMoneyPeriodByOId(String orderNo) {
		try {
			return periodDao.getMoneyPeriodByOId(orderNo);
		} catch (Exception e) {
			return 0;
		}

	}

	@Override
	public List<Map> findUserTotalAmountList(String date) {

		return orderDaoImpl.findUserTotalAmountList(date);
	}

	@Override
	public List<Period> findOrderByStatus(int waitOrder) {
		return periodDao.findOrderByStatus(waitOrder);
	}

	@Override
	public int updatePeriodStatusByOId(String orderNo, int status,
			String lotteryCode) {
		return periodDao.updatePeriodStatusByOId(orderNo, status, lotteryCode);
	}

	@Override
	public int updatePeriodStatusByOIdAndPrase(String orderNo, int status,
			String lotteryCode, String parse) {
		return periodDao.updatePeriodStatusByOIdAndParse(orderNo, status,
				lotteryCode, parse);
	}

	@Override
	public List<Period> findbyQIhao(String shangQinhao, Integer statusBefore) {
		return periodDao.findbyQIhao(shangQinhao,statusBefore);
	}

	@Override
	public List<Period> findPeriodByOIdAndStatus(String orderNo,
			Integer winningCurrent) {
		return periodDao.findPeriodByOIdAndStatus(orderNo,winningCurrent);
	}

}
