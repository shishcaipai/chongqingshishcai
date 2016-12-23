package com.caijin.I000Wan.service;

import java.util.List;

import com.caijin.I000Wan.common.service.CommonService;
import com.caijin.I000Wan.dto.LotteryConfirmInfoDTO;
import com.caijin.I000Wan.entity.FootballMatch;

public interface FootballMatchService  extends CommonService<FootballMatch,String>{
	
	List<FootballMatch> findByTypeCode(String typeCode);
	
	/**
	 * 根据彩票类型和期数Id查找该类型该期下的比赛信息列表
	 * @param lotteryCode
	 * @param periodId
	 * @return
	 */
	List<FootballMatch> findPeriodMatch(String lotteryCode,String periodId);
	
	/**
	 * 根据彩票类型和lotteryPeriod查找该类型该期下的比赛信息列表
	 * @param lotteryCode
	 * @param lotteryPeriod
	 * @return
	 */
	List<FootballMatch> findPeriodMatchByPeriod(String lotteryCode,String lotteryPeriod);
	
	List<LotteryConfirmInfoDTO> getLotteryConfirmInfo(String lotteryCode,String lotteryPeriod,String[] caiNumber);
	
	/**
	 * 根据彩票类型和BetDate查找该类型该期下的比赛信息列表
	 * @param lotteryCode
	 * @return
	 */
	List<FootballMatch> findMatchByBetDateAndType(String lotteryCode);
	
	FootballMatch findFootballMatchById(Integer footBallMatchId);

}
