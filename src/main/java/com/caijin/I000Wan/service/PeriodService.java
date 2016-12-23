package com.caijin.I000Wan.service;

import java.util.List;

import com.caijin.I000Wan.common.service.CommonService;
import com.caijin.I000Wan.entity.Period;

public interface PeriodService extends CommonService<Period,String>{

	/**
	 * 根据彩票编码查询当前期数
	 * @param lotteryCode
	 * @return
	 */
	Period findByCurrentPeriod(String lotteryCode);
	
	/**
	 * 根据彩票编码查找历史的前N期期数数据
	 * @param lotteryCode
	 * @param n
	 * @return
	 */
	List<Period> findByTopNhistory(String lotteryCode,int n);
	
	/**
	 * 根据彩票编码查找预售的前N期期数数据
	 * @param lotteryCode
	 * @param n
	 * @return
	 */
	List<Period> findByTopNnew(String lotteryCode,int n);
	
	Period findPeriodById(Integer id);
	List<Period> findPeriodByOId(String oid);
}
