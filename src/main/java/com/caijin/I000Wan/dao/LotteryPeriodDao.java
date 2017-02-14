package com.caijin.I000Wan.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.entity.LotteryPeriod;

/**
 * 彩票期数Dao
 */
public interface LotteryPeriodDao extends CommonDao<LotteryPeriod,String>{

	/**
	 * 根据彩票编码查询当前期数
	 * @param lotteryCode
	 * @return
	 */
	@Query("select p from LotteryPeriod p where p.periodNumber= ?1")
	LotteryPeriod findByCurrentPeriod(String periodNumber);
	
	/**
	 * 根据彩票编码查找历史的前N期期数数据
	 * @param lotteryCode
	 * @param n
	 * @return
	 */
	@Query(value="select p.* from history_period p where p.lotterycode=?1 and p.status=1 order by p.opentimestamp desc limit 0,?2 ",nativeQuery=true)
	List<LotteryPeriod> findByTopNhistory(String lotteryCode,int n);
	@Query(value="select p.* from history_period p order by p.opentimestamp desc limit 0,1 ",nativeQuery=true)
	LotteryPeriod findByTopPeriod();
	
	
}
