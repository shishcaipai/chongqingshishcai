package com.caijin.I000Wan.service;

import java.util.List;

import com.caijin.I000Wan.common.service.CommonService;
import com.caijin.I000Wan.entity.LotteryPeriod;

public interface LetteryPeriodService extends CommonService<LotteryPeriod,String>{

	/**
	 * 根据彩票编码查询当前期数
	 * @param lotteryCode
	 * @return
	 */
	LotteryPeriod findByCurrentPeriod(String lotteryCode);
	
	/**
	 * 根据彩票编码查找历史的前N期期数数据
	 * @param lotteryCode
	 * @param n
	 * @return
	 */
	List<LotteryPeriod> findByTopNhistory(String lotteryCode,int n);

	LotteryPeriod findByTopPeriod();
	
//	/**
//	 * 根据彩票编码查找预售的前N期期数数据
//	 * @param lotteryCode
//	 * @param n
//	 * @return
//	 */
//	List<LotteryPeriod> findByTopNnew(String lotteryCode,int n);
//	
//	LotteryPeriod findPeriodById(Integer id);
}
