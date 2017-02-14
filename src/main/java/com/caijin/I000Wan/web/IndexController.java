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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.Period;
import com.caijin.I000Wan.service.OrderService;
import com.caijin.I000Wan.service.PeriodService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 *Index Controller
 * @author jeff
 * 2014-06-16
 */
@Controller
public class IndexController {
	
	
	@Autowired
	private PeriodService periodService;
	
	@Autowired
	private  OrderService orderService;
  
	/**
	 * 跳转到首页
	 * @return
	 */
	@RequestMapping(value="/index")
	public ModelAndView index(){
		List<Map> map = periodService.findUserTotalAmountList(null);
		Map<String, List> model = new HashMap<String, List>(); 
		model.put("map", map);
		return new ModelAndView("index/index",model);
	}
	/**
	 * 跳转到首页
	 * @return
	 */
	@RequestMapping(value="/")
	public ModelAndView indexs(){
		List<Map> map = periodService.findUserTotalAmountList(null);
		Map<String, List> model = new HashMap<String, List>();  
		model.put("map", map);
		return new ModelAndView("index/index",model);
	}
	/**
	 * @return
	 */
	@RequestMapping(value="/wfjx")
	public ModelAndView jingZuSpf(HttpServletRequest request){
		String type=request.getParameter("type");
		if("cqcss".equals(type)){
			return new ModelAndView("caipiao/cqcsswfjx");
		}else{
		return new ModelAndView("caipiao/wfjx");
		}
	}
	
	@RequestMapping(value = "/theWinningList")
	public void theWinningList(HttpServletRequest request,HttpServletResponse response) {
		
		String date=request.getParameter("date");
		List<Map> order = periodService.findUserTotalAmountList(date);
		System.out.println("theWinningList:::"+order.size());

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
	
	
}
