package com.caijin.I000Wan.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.entity.Period;

/**
 * 彩票期数Dao
 * @author jeff
 * @since 2014-06-20 22:00
 */
public interface PeriodDao extends CommonDao<Period,String>{

	/**
	 * 根据彩票编码查询当前期数
	 * @param lotteryCode
	 * @return
	 */
	@Query("select p from Period p where p.lotteryCode= ?1 and p.status=1 ")
	Period findByCurrentPeriod(String lotteryCode);
	
	/**
	 * 根据彩票编码查找历史的前N期期数数据
	 * @param lotteryCode
	 * @param n
	 * @return
	 */
	@Query(value="select p.* from Period p where p.lottery_code=?1 and p.status=0 order by p.lottery_period desc limit 0,?2 ",nativeQuery=true)
	List<Period> findByTopNhistory(String lotteryCode,int n);
	
	/**
	 * 根据彩票编码查找预售的前N期期数数据
	 * @param lotteryCode
	 * @param n
	 * @return
	 */
	@Query(value="select p.* from Period p where p.lottery_code=?1 and p.status=2 order by p.lottery_period asc limit 0,?2 ",nativeQuery=true)
	List<Period> findByTopNnew(String lotteryCode,int n);
	@Query("select p from Period p where p.id = ?1 ")
	Period findPeriodById(Integer id);
	
	@Query("select p from Period p where p.orderId = ?1 ")
	List<Period> findPeriodByOId(String oid);
}
