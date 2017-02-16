package com.caijin.I000Wan.web;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.caijin.I000Wan.entity.LotteryPeriod;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.Period;
import com.caijin.I000Wan.response.ChongQingReturnBean;
import com.caijin.I000Wan.response.ChongQingReturnData;
import com.caijin.I000Wan.service.ApplyRecordService;
import com.caijin.I000Wan.service.LetteryPeriodService;
import com.caijin.I000Wan.service.OrderDetailService;
import com.caijin.I000Wan.service.OrderService;
import com.caijin.I000Wan.service.PeriodService;
import com.caijin.I000Wan.util.DateUtils;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping(value = "/gdsyxw")
public class GuangDongShiYiXuanWuController {
	private static String url = "http://f.apiplus.cn/cqssc-10.json?t="
			+ System.currentTimeMillis();

	private static ChongQingReturnData currentData;
	private static ChongQingReturnBean currentBean;
	@Autowired
	private LetteryPeriodService letteryPeriodService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private PeriodService periodService;

	/**
	 * 数据接口来自 http://f.apiplus.cn/cqssc-10.json 跳转到广东十一选五购买页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/gdsyxwview")
	public ModelAndView jingZuJqs() {

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("current", DateUtils.getCurrentGuangDongShiYiYun());
		model.put("leftsecond", DateUtils.getGuangDongShiYiXuanWuLeftMisecond());
		model.put("left", DateUtils.getLeftGuangDongShiYiXuanWu(DateUtils
				.getCurrentGuangDongShiYiYun()));
		return new ModelAndView("caipiao/gdsyxw", model);
	}
	
	@RequestMapping(value = "/gdsyxwhistroy")
	public void gdsyxwhistory(HttpServletResponse response) {
		// ChongQingReturnBean bean;
		// if (currentBean != null
		// && System.currentTimeMillis() - lastTime < 3* 1000) {
		// bean = currentBean;
		// } else {
		// bean = getShiShiCaipiaohistory();
		// }
		List<LotteryPeriod> list = letteryPeriodService.findByTopNhistory(
				Period.SHISHI_CAI_GUANGDONG11XUAN5, 5);
		Map<String, Object> model = new HashMap<String, Object>();
		currentData = new ChongQingReturnData();
		currentData.expect = DateUtils.getCurrentGuangDongShiYiYun();
		currentData.opentime = "" + DateUtils.getGuangDongShiYiXuanWuLeftMisecond();
		currentData.opentimestamp = System.currentTimeMillis() / 1000;
		model.put("gdsyxwReturn", list);
		model.put("current", currentData);
		System.out.println("currentDate:" + currentData.expect);

		ObjectMapper mapper = new ObjectMapper(); // 转换器

		// 测试01：对象--json
		String json = "";
		try {
			json = mapper.writeValueAsString(model);
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