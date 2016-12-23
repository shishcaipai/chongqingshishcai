package com.caijin.I000Wan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.service.impl.CommonServiceImpl;
import com.caijin.I000Wan.dao.OrderDao;
import com.caijin.I000Wan.dao.PeriodDao;
import com.caijin.I000Wan.entity.Period;
import com.caijin.I000Wan.service.PeriodService;

@Component
@Transactional
public class PeriodServiceImpl extends CommonServiceImpl<Period,String>  implements PeriodService{
	
	@Autowired
	private PeriodDao periodDao;
	@Autowired
	public void setPeriodDao(PeriodDao periodDao) {
		super.setCommonDao(periodDao);
	}
	
	/**
	 * 根据彩票编码查询当前期数
	 * @param lotteryCode
	 * @return
	 */
	public Period findByCurrentPeriod(String lotteryCode){
		return periodDao.findByCurrentPeriod(lotteryCode);
	}
	
	/**
	 * 根据彩票编码查找历史的前N期期数数据
	 * @param lotteryCode
	 * @param n
	 * @return
	 */
	public List<Period> findByTopNhistory(String lotteryCode,int n){
		return periodDao.findByTopNhistory(lotteryCode, n);
	}
	
	/**
	 * 根据彩票编码查找预售的前N期期数数据
	 * @param lotteryCode
	 * @param n
	 * @return
	 */
	public List<Period> findByTopNnew(String lotteryCode,int n){
		return periodDao.findByTopNnew(lotteryCode, n);
	}
	
	public Period findPeriodById(Integer id){
		return periodDao.findPeriodById(id);
	}

	@Override
	public List<Period> findPeriodByOId(String oid) {
		// TODO Auto-generated method stub
		return periodDao.findPeriodByOId(oid);
	}
}
