package com.caijin.I000Wan.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.caijin.I000Wan.entity.BetDate;
import com.caijin.I000Wan.entity.FootballMatch;
import com.caijin.I000Wan.entity.Period;
import com.caijin.I000Wan.service.BetDateService;
import com.caijin.I000Wan.service.FootballMatchService;
import com.caijin.I000Wan.service.PeriodService;

/**
 *Index Controller
 * @author jeff
 * 2014-06-16
 */
@Controller
public class IndexController {
	
	@Autowired
	private FootballMatchService footballMatchService;
	
	@Autowired
	private PeriodService periodService;
	
	@Autowired
	private BetDateService betDateService;
  
	/**
	 * 跳转到首页
	 * @return
	 */
	@RequestMapping(value="/index")
	public ModelAndView index(){
		Period currentPeriod=periodService.findByCurrentPeriod(Period.FOOTBALL_SFC);
		List<FootballMatch> footBallMatchList=footballMatchService.findPeriodMatchByPeriod(Period.FOOTBALL_SFC, currentPeriod==null?"":currentPeriod.getLotteryPeriod());
		Map<String, List> model = new HashMap<String, List>();  
		model.put("sfcMatchList", footBallMatchList);
		return new ModelAndView("index/index",model);
	}
	/**
	 * 跳转到首页
	 * @return
	 */
	@RequestMapping(value="/")
	public ModelAndView indexs(){
		Period currentPeriod=periodService.findByCurrentPeriod(Period.FOOTBALL_SFC);
		List<FootballMatch> footBallMatchList=footballMatchService.findPeriodMatchByPeriod(Period.FOOTBALL_SFC, currentPeriod==null?"":currentPeriod.getLotteryPeriod());
		Map<String, List> model = new HashMap<String, List>();  
		model.put("sfcMatchList", footBallMatchList);
		return new ModelAndView("index/index",model);
	}
	/**
	 * 跳转到竞彩足球胜平负页面
	 * @return
	 */
	@RequestMapping(value="/jzspf")
	public ModelAndView jingZuSpf(){
		List<BetDate> betDateList = betDateService.findCurrentBetDate();
		List<FootballMatch> footBallMatchList=footballMatchService.findMatchByBetDateAndType(FootballMatch.FOOTBALL_JCZQ_SFP_CODE);
		Map<String, List> model = new HashMap<String, List>();  
		model.put("spfMatchList", footBallMatchList);
		model.put("betDateList", betDateList);
		return new ModelAndView("caipiao/jz_spf_rq",model);
	}
	
	/**
	 * 跳转到胜负彩
	 * @return
	 */
	@RequestMapping(value="/sfc",produces = {"text/html;charset=UTF-8"})
	public ModelAndView sfc(){
		//查找当前期期数信息
		Period currentPeriod=periodService.findByCurrentPeriod(Period.FOOTBALL_SFC);
		//查找历史期期数信息
		List<Period> historyList=periodService.findByTopNhistory(Period.FOOTBALL_SFC, 5);
		//查找预售期期数信息
		List<Period> newList=periodService.findByTopNnew(Period.FOOTBALL_SFC, 2);
		
		//查找当前期比赛信息
//		List<FootballMatch> footBallMatchList=footballMatchService.findPeriodMatch(Period.FOOTBALL_SFC, currentPeriod==null?"":currentPeriod.getId());
		
		//封装ModelAndView
		Map model = new HashMap();  
		model.put("currentPeriod", currentPeriod);
		model.put("historyList", historyList);
		model.put("newList", newList);
//		model.put("footBallMatchList", footBallMatchList);
		return new ModelAndView("caipiao/sfc",model);
	}
	
	/**
	 * 跳转到4场进球
	 * @return
	 */
	@RequestMapping(value="/4cjq")
	public ModelAndView fourcjq(){
		//查找当前期期数信息
		Period currentPeriod=periodService.findByCurrentPeriod(Period.FOOTBALL_FOURJQ);
		//查找历史期期数信息
		List<Period> historyList=periodService.findByTopNhistory(Period.FOOTBALL_FOURJQ, 5);
		//查找预售期期数信息
		List<Period> newList=periodService.findByTopNnew(Period.FOOTBALL_FOURJQ, 2);
		
		//查找当前期比赛信息
//		List<FootballMatch> footBallMatchList=footballMatchService.findPeriodMatch(Period.FOOTBALL_FOURJQ, currentPeriod==null?"":currentPeriod.getId());
		
		//封装ModelAndView
		Map model = new HashMap();  
		model.put("currentPeriod", currentPeriod);
		model.put("historyList", historyList);
		model.put("newList", newList);
//		model.put("footBallMatchList", footBallMatchList);
		return new ModelAndView("caipiao/4cjq",model);
	}
	
	/**
	 * 跳转到任选9场
	 * @return
	 */
	@RequestMapping(value="/rx9c")
	public ModelAndView rx9c(){
		//查找当前期期数信息
		Period currentPeriod=periodService.findByCurrentPeriod(Period.FOOTBALL_RX9);
		//查找历史期期数信息
		List<Period> historyList=periodService.findByTopNhistory(Period.FOOTBALL_RX9, 5);
		//查找预售期期数信息
		List<Period> newList=periodService.findByTopNnew(Period.FOOTBALL_RX9, 2);
		
		//查找当前期比赛信息
//		List<FootballMatch> footBallMatchList=footballMatchService.findPeriodMatch(Period.FOOTBALL_RX9, currentPeriod==null?"":currentPeriod.getId());
		
		//封装ModelAndView
		Map model = new HashMap();  
		model.put("currentPeriod", currentPeriod);
		model.put("historyList", historyList);
		model.put("newList", newList);
//		model.put("footBallMatchList", footBallMatchList);
		return new ModelAndView("caipiao/rx9",model);
	}
	
	/**
	 * 六场半全场
	 * @return
	 */
	@RequestMapping(value="/6cbqc")
	public ModelAndView sixcbqc(){
		//查找当前期期数信息
		Period currentPeriod=periodService.findByCurrentPeriod(Period.FOOTBALL_SIXCB);
		//查找历史期期数信息
		List<Period> historyList=periodService.findByTopNhistory(Period.FOOTBALL_SIXCB, 5);
		//查找预售期期数信息
		List<Period> newList=periodService.findByTopNnew(Period.FOOTBALL_SIXCB, 2);
		
		//查找当前期比赛信息
//		List<FootballMatch> footBallMatchList=footballMatchService.findPeriodMatch(Period.FOOTBALL_SIXCB, currentPeriod==null?"":currentPeriod.getId());
		
		//封装ModelAndView
		Map model = new HashMap();  
		model.put("currentPeriod", currentPeriod);
		model.put("historyList", historyList);
		model.put("newList", newList);
//		model.put("footBallMatchList", footBallMatchList);
		return new ModelAndView("caipiao/6cbqc",model);
	}
	
	/**
	 * 根据彩票类型编码和彩票期数Id查找比赛信息列表
	 * @param lotteryCode
	 * @param period
	 * @return
	 */
	@RequestMapping(value = "/{lotteryCode}/{period}",method = RequestMethod.GET)
	public @ResponseBody List<FootballMatch> getFootballMatch(@PathVariable("lotteryCode") String lotteryCode,@PathVariable("period")String  period){
		List<FootballMatch> footBallMatchList=footballMatchService.findPeriodMatchByPeriod(lotteryCode,period);
		return footBallMatchList;
	}
	
}
