package com.caijin.I000Wan.dao;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.entity.Order;
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
	@Query(value="select p.* from lottery_period p where p.lottery_code=?1 and p.status=0 order by p.lottery_period desc limit 0,?2 ",nativeQuery=true)
	List<Period> findByTopNhistory(String lotteryCode,int n);
	
	/**
	 * 根据彩票编码查找预售的前N期期数数据
	 * @param lotteryCode
	 * @param n
	 * @return
	 */
	@Query(value="select p.* from lottery_period p where p.lottery_code=?1 and p.status=0 order by p.lottery_period asc limit 0,?2 ",nativeQuery=true)
	List<Period> findByTopNnew(String lotteryCode,int n);
	@Query("select p from Period p where p.id = ?1 ")
	Period findPeriodById(Integer id);
	
	@Query("select p from Period p where p.orderId = ?1 ")
	List<Period> findPeriodByOId(String oid);
	@Query("select p from Period p where p.lotteryPeriod = ?1 ")
	public List<Period> findbyQIhao(String qihao);
	@Query("select p from Period p  where p.lotteryPeriod = ?1 and p.orderId=?2 ")
	Period findPeriodbyQIhaoAndOrderNo(String expect, String orderNo );
	@Query("select sum(p.money) from Period p  where p.orderId=?1 ")
	float getMoneyPeriodByOId(String orderNo);
	@Query("select p from Period p  where p.winning=0 and p.lotteryPeriod<=?1")
	List<Period> getUNPeriod(String qihao);
	@Query(value = "select t.* from lottery_period t  inner join trade_order o on o.order_on = t.orderid where o.order_status = ?1 and (o.order_type=2 or o.order_type=3) order by o.create_date desc ", nativeQuery = true)
	List<Period> findOrderByStatus(int waitOrder);
	/**
	 * 还没有开奖的期号
	 * @param orderId
	 * @return
	 */
	@Query("select count(p.id) from Period p  where p.orderId=?1  and  p.status=1 ")
	int getPeriodUNStatusByOId(String orderId);
}
