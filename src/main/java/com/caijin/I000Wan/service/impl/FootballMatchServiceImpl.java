package com.caijin.I000Wan.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.service.impl.CommonServiceImpl;
import com.caijin.I000Wan.dao.FootballMatchDao;
import com.caijin.I000Wan.dto.LotteryConfirmInfoDTO;
import com.caijin.I000Wan.entity.FootballMatch;
import com.caijin.I000Wan.service.FootballMatchService;

@Component
@Transactional
public class FootballMatchServiceImpl extends CommonServiceImpl<FootballMatch,String> implements FootballMatchService{

	@Autowired
	private FootballMatchDao footballMatchDao;
	
	public List<FootballMatch> findByTypeCode(String typeCode){
		return footballMatchDao.findByTypeCode(typeCode);
	}
	
	/**
	 * 根据彩票类型和期数Id查找该类型该期下的比赛信息列表
	 * @param lotteryCode
	 * @param periodId
	 * @return
	 */
	public List<FootballMatch> findPeriodMatch(String lotteryCode,String periodId){
		return footballMatchDao.findPeriodMatch(lotteryCode, periodId);
	}
	
	/**
	 * 根据彩票类型和lotteryPeriod查找该类型该期下的比赛信息列表
	 * @param lotteryCode
	 * @param lotteryPeriod
	 * @return
	 */
	public List<FootballMatch> findPeriodMatchByPeriod(String lotteryCode,String lotteryPeriod){
		return footballMatchDao.findPeriodMatchByPeriod(lotteryCode, lotteryPeriod);
	}
	
	public List<LotteryConfirmInfoDTO> getLotteryConfirmInfo(String lotteryCode,String lotteryPeriod,String[] caiNumber){
		List<LotteryConfirmInfoDTO> confirmList = new ArrayList<LotteryConfirmInfoDTO>();
		List<FootballMatch> footBallMatchList=footballMatchDao.findPeriodMatchByPeriod(lotteryCode, lotteryPeriod);
		FootballMatch footballMatch=null;
		for(int i=0;i<footBallMatchList.size();i++){
			footballMatch = footBallMatchList.get(i);
	    	LotteryConfirmInfoDTO lotteryConfirmInfoDTO = new LotteryConfirmInfoDTO();
	    	lotteryConfirmInfoDTO.setAwaysxName(footballMatch == null ? "" :footballMatch.getAwaysxName());
	    	lotteryConfirmInfoDTO.setHomesxName(footballMatch == null ? "" :footballMatch.getHomesxName());
	    	lotteryConfirmInfoDTO.setBuyNumber(caiNumber[i]);
	    	
	    	confirmList.add(lotteryConfirmInfoDTO);
	    }
	  return confirmList;
	}
	
	/**
	 * 根据彩票类型和BetDate查找该类型该期下的比赛信息列表
	 * @param lotteryCode
	 * @return
	 */
	public List<FootballMatch> findMatchByBetDateAndType(String lotteryCode){
		return footballMatchDao.findMatchByBetDateAndType(lotteryCode);
	}
	
	public FootballMatch findFootballMatchById(Integer footBallMatchId){
		return footballMatchDao.findByFootballMatchId(footBallMatchId);
	}

}
