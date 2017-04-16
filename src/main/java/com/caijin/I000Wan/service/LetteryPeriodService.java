package com.caijin.I000Wan.service;

import java.util.List;

import com.caijin.I000Wan.common.service.CommonService;
import com.caijin.I000Wan.entity.LotteryPeriod;
import com.caijin.I000Wan.util.PageModel;
import com.caijin.I000Wan.util.Result;

public interface LetteryPeriodService extends CommonService<LotteryPeriod,String>{

	/**
	 * 根据彩票编码查询当前期数
	 * @param lotteryCode
	 * @return
	 */
	LotteryPeriod findByCurrentPeriod(String lotteryCode);
	
	
	/**
	 * 根据彩票编码查询当前期数
	 * @param lotteryCode
	 * @return
	 */
	LotteryPeriod findByPeriod(String lotteryCode,String periodNumber);
	
	/**
	 * 根据彩票编码查找历史的前N期期数数据
	 * @param lotteryCode
	 * @param n
	 * @return
	 */
	List<LotteryPeriod> findByTopNhistory(String lotteryCode,int n);

	LotteryPeriod findByTopPeriod();


	
}
