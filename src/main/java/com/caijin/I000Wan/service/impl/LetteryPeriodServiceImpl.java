package com.caijin.I000Wan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.service.impl.CommonServiceImpl;
import com.caijin.I000Wan.dao.LotteryPeriodDao;
import com.caijin.I000Wan.entity.LotteryPeriod;
import com.caijin.I000Wan.service.LetteryPeriodService;

@Component
@Transactional
public class LetteryPeriodServiceImpl extends CommonServiceImpl<LotteryPeriod,String>  implements LetteryPeriodService{
	
	@Autowired
	private LotteryPeriodDao lotteryPeriodDao;
	@Autowired
	public void setLotteryPeriodDao(LotteryPeriodDao periodDao) {
		super.setCommonDao(periodDao);
	}
	
	/**
	 * 根据彩票编码查询当前期数
	 * @param lotteryCode
	 * @return
	 */
	public LotteryPeriod findByCurrentPeriod(String lotteryCode){
		return lotteryPeriodDao.findByCurrentPeriod(lotteryCode);
	}
	
	/**
	 * 根据彩票编码查找历史的前N期期数数据
	 * @param lotteryCode
	 * @param n
	 * @return
	 */
	public List<LotteryPeriod> findByTopNhistory(String lotteryCode,int n){
		return lotteryPeriodDao.findByTopNhistory(lotteryCode, n);
	}

	@Override
	public LotteryPeriod findByTopPeriod() {
		return lotteryPeriodDao.findByTopPeriod();
	}
	

}
