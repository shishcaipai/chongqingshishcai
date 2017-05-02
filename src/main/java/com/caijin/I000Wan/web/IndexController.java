package com.caijin.I000Wan.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.caijin.I000Wan.entity.Article;
import com.caijin.I000Wan.entity.HeMaiOrderDetail;
import com.caijin.I000Wan.entity.LotteryPeriod;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.Period;
import com.caijin.I000Wan.service.ArticleService;
import com.caijin.I000Wan.service.HeMaiOrderDetailService;
import com.caijin.I000Wan.service.HeMaiOrderService;
import com.caijin.I000Wan.service.LetteryPeriodService;
import com.caijin.I000Wan.service.OrderService;
import com.caijin.I000Wan.service.PeriodService;
import com.caijin.I000Wan.util.StaticDefine;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Index Controller
 * 
 */
@Controller
public class IndexController {

	@Autowired
	private PeriodService periodService;

	@Autowired
	private OrderService orderService;
	@Autowired
	private ArticleService articleService;

	@Autowired
	private LetteryPeriodService letteryPeriodService;

	@Autowired
	private HeMaiOrderDetailService heMaiOrderDetailService;

	@Autowired
	private HeMaiOrderService heMaiService;

	/**
	 * 跳转到首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/index")
	public ModelAndView index(HttpServletRequest request, Model model) {
		List<Map> map = periodService.findUserTotalAmountList(null);
		List<HeMaiOrderDetail> heMaiOrders = heMaiOrderDetailService
				.findAllHemaiOrderDetails(0 * StaticDefine.PAGE_SIZE,
						StaticDefine.PAGE_SIZE);
		if (null != heMaiOrders) {
			for (int i = 0; i < heMaiOrders.size(); i++) {
				int leftNum = heMaiService.getHemaiOrderFenNum(heMaiOrders
						.get(i));
				Integer buyNum = heMaiOrders.get(i).getFensum() - leftNum;
				heMaiOrders.get(i).setOtherBuyNum(buyNum);
			}
		}
		model.addAttribute("heMaiOrderDetails", heMaiOrders);

		model.addAttribute("notice", articleService.findByType(Article.NOTICE));
		model.addAttribute("zixian",
				articleService.findByType(Article.CAIPIAOZIXUN));
		model.addAttribute("zixian2",
				articleService.findByType(Article.CAIPIAOZIXUN));
		model.addAttribute("frist", true);
		model.addAttribute("map", map);
		return new ModelAndView("index/index2");
	}

	/**
	 * 跳转到首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/")
	public ModelAndView indexs(HttpServletRequest request, Model model) {
		List<Map> map = periodService.findUserTotalAmountList(null);
		List<HeMaiOrderDetail> heMaiOrders = heMaiOrderDetailService
				.findAllHemaiOrderDetails(0 * StaticDefine.PAGE_SIZE,
						StaticDefine.PAGE_SIZE);
		if (null != heMaiOrders) {
			for (int i = 0; i < heMaiOrders.size(); i++) {
				int leftNum = heMaiService.getHemaiOrderFenNum(heMaiOrders
						.get(i));
				Integer buyNum = heMaiOrders.get(i).getFensum() - leftNum;
				heMaiOrders.get(i).setOtherBuyNum(buyNum);
			}
		}
		model.addAttribute("heMaiOrderDetails", heMaiOrders);

		model.addAttribute("notice", articleService.findByType(Article.NOTICE));
		model.addAttribute("zixian",
				articleService.findByType(Article.CAIPIAOZIXUN));
		model.addAttribute("zixian2",
				articleService.findByType(Article.CAIPIAOZIXUN));
		model.addAttribute("frist", true);
		model.addAttribute("map", map);
		return new ModelAndView("index/index2");
	}

	/**
	 * @return
	 */
	@RequestMapping(value = "/wfjx")
	public ModelAndView jingZuSpf(HttpServletRequest request) {
		String type = request.getParameter("type");
		if ("cqcss".equals(type)) {
			return new ModelAndView("caipiao/cqcsswfjx");
		} else {
			return new ModelAndView("caipiao/wfjx");
		}
	}

	@RequestMapping(value = "/theWinningList")
	public void theWinningList(HttpServletRequest request,
			HttpServletResponse response) {

		String date = request.getParameter("date");
		List<Map> order = periodService.findUserTotalAmountList(date);
		System.out.println("theWinningList:::" + order.size());

		ObjectMapper mapper = new ObjectMapper(); // 转换器

		// 测试01：对象--json
		String json = "";
		try {
			json = mapper.writeValueAsString(order);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // 将对
		try {
			// 设置页面不缓存
			response.setContentType("application/json");
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = null;
			out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 网站公告
	 * 
	 * @return
	 */
	@RequestMapping(value = "/articles")
	public ModelAndView articles(HttpServletRequest request, Model model) {
		model.addAttribute("zixian",
				articleService.findByType(Article.CAIPIAOZIXUN));
		return new ModelAndView("article/zilist");
	}

	/**
	 * 网站公告
	 * 
	 * @return
	 */
	@RequestMapping(value = "/notices")
	public ModelAndView notices(HttpServletRequest request, Model model) {
		model.addAttribute("notice", articleService.findByType(Article.NOTICE));
		return new ModelAndView("article/noticeslist");
	}
	/**
	 * 合买大厅
	 * 
	 * @return
	 */
	@RequestMapping(value = "/lobby")
	public ModelAndView lobby(HttpServletRequest request) {
		return new ModelAndView("index/hemaidating");
	}
	/**
	 * 走势
	 * 
	 * @return
	 */
	@RequestMapping(value = "/zaoshi")
	public ModelAndView zaoshi(HttpServletRequest request) {
		return new ModelAndView("caipiao/zaoshidating");
	}
	
     private void getAvailableScoreCurrent(){
    	 
     }
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value = "/getHistory")
	@ResponseBody
	public LotteryPeriod getHistory(HttpServletRequest request, Model model) {
		if (request.getParameter("lotteryTypeId").equals(
				Period.SHISHI_CAI_CHONGQING)) {
			List<Map> map = periodService.findUserTotalAmountList(null);
			try {
				List<LotteryPeriod> list = letteryPeriodService
						.findByTopNhistory(Period.SHISHI_CAI_CHONGQING, 1);
				model.addAttribute("cqss", list.get(0));
				return list.get(0);
			} catch (Exception e) {

			}
		} else if (request.getParameter("lotteryTypeId").equals(
				Period.SHISHI_CAI_GUANGDONG11XUAN5)) {
			try {
				List<LotteryPeriod> list = letteryPeriodService
						.findByTopNhistory(Period.SHISHI_CAI_GUANGDONG11XUAN5,
								1);
				return list.get(0);
			} catch (Exception e) {

			}
		} else if (request.getParameter("lotteryTypeId").equals(
				Period.SHISHI_CAI_JIANGXI)) {
			try {
				List<LotteryPeriod> list = letteryPeriodService
						.findByTopNhistory(Period.SHISHI_CAI_JIANGXI, 1);
				return list.get(0);
			} catch (Exception e) {

			}
		} else {
			try {
				List<LotteryPeriod> list = letteryPeriodService
						.findByTopNhistory(Period.SHISHI_CAI_SHANDONG, 1);
				return list.get(0);
			} catch (Exception e) {

			}
		}
		return null;
	}
}
