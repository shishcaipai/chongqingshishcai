package com.caijin.I000Wan.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.caijin.I000Wan.entity.BetDate;
import com.caijin.I000Wan.entity.FootballMatch;
import com.caijin.I000Wan.service.BetDateService;
import com.caijin.I000Wan.service.FootballMatchService;

/**
 * 竞彩足球 Controller
 * @author pingan
 * 
 */
@Controller
public class JingZuController {

	@Autowired
	private BetDateService betDateService;
	@Autowired
	private FootballMatchService footballMatchService;
	
	/**
	 * 跳转到竞彩足球比分页面
	 * @return
	 */
	@RequestMapping(value="/jzjqs")
	public ModelAndView jingZuJqs(){
		List<BetDate> betDateList = betDateService.findCurrentBetDate();
		List<FootballMatch> footBallMatchList=footballMatchService.findMatchByBetDateAndType(FootballMatch.FOOTBALL_JCZQ_JQS_CODE);
		Map<String, List> model = new HashMap<String, List>();  
		model.put("jqsMatchList", footBallMatchList);
		model.put("betDateList", betDateList);
		return new ModelAndView("caipiao/jz_jqs",model);
	}
	
	/**
	 * 跳转到竞彩足球比分页面
	 * @return
	 */
	@RequestMapping(value="/jzbqc")
	public ModelAndView jingZuBqc(){
		List<BetDate> betDateList = betDateService.findCurrentBetDate();
		List<FootballMatch> footBallMatchList=footballMatchService.findMatchByBetDateAndType(FootballMatch.FOOTBALL_JCZQ_BQC_CODE);
		Map<String, List> model = new HashMap<String, List>();  
		model.put("bqcMatchList", footBallMatchList);
		model.put("betDateList", betDateList);
		return new ModelAndView("caipiao/jz_bqc",model);
	}
}
