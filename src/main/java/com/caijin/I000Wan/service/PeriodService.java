package com.caijin.I000Wan.service;

import java.util.List;
import java.util.Map;

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

	List<Period> findbyQIhao(String expect);

	boolean updatePeriodbyQIhaoAndOrderNo(String expect, String orderNo, int i,
			float money);

	float getMoneyPeriodByOId(String orderNo);

	 List<Map> findUserTotalAmountList(String date);

	List<Period> findOrderByStatus(int waitOrder);

	int getPeriodUNStatusByOId(String orderId);

	int updatePeriodStatusByOId(String orderNo, int status, String lotteryCode);
	int updatePeriodStatusByOIdAndPrase(String orderNo, int status, String lotteryCode,String prase);

	List<Period> findbyQIhao(String shangQinhao, Integer statusBefore);

	List<Period> findPeriodByOIdAndStatus(String orderNo, Integer winningCurrent);
}
