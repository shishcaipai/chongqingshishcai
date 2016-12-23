package com.caijin.I000Wan.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.entity.FootballMatch;

/**
 * 赛事信息Dao
 * @author jeff
 * @since 2014-06-17
 */
public interface FootballMatchDao extends CommonDao<FootballMatch, String>{

	/**
	 * 根据编码查找所有属于该编码的比赛信息
	 * @param typeCode
	 * @return
	 */
	List<FootballMatch> findByTypeCode(String typeCode);
	
	/**
	 * 根据彩票类型和期数Id查找该类型该期下的比赛信息列表
	 * @param lotteryCode
	 * @param periodId
	 * @return
	 */
	@Query(value="select f.* from football_match f,lottery_period p where f.lottery_period_id=p.id and p.lottery_code= ?1 and p.id= ?2 order by f.pdate asc ",nativeQuery=true)
	List<FootballMatch> findPeriodMatch(String lotteryCode,String periodId);
	
	/**
	 * 根据彩票类型和lotteryPeriod查找该类型该期下的比赛信息列表
	 * @param lotteryCode
	 * @param lotteryPeriod
	 * @return
	 */
	@Query(value="select f.* from football_match f,lottery_period p where f.lottery_period_id=p.id and p.lottery_code= ?1 and p.lottery_period= ?2 order by f.pdate asc ",nativeQuery=true)
	List<FootballMatch> findPeriodMatchByPeriod(String lotteryCode,String lotteryPeriod);
	
	/**
	 * 根据彩票类型和pdate查找该类型该期下的比赛信息列表
	 * @param lotteryCode
	 * @param pdate
	 * @return
	 */
	@Query(value="select * from football_match m " +
				" inner join bet_date d on d.`pdate`=m.`pdate` " +
				" where (str_to_date(m.`end_time`,'%H:%i') > curtime() or str_to_date(m.`pdate`,'%Y-%m-%d')>curdate()) " +
				" and d.`status`=1 and m.`type_code`= ?1 order by m.`pdate` asc,m.`game_num` asc;",nativeQuery=true)
	List<FootballMatch> findMatchByBetDateAndType(String lotteryCode);
	
	FootballMatch findByFootballMatchId(Integer footBallMatchId);

}
