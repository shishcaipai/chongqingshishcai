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

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.caijin.I000Wan.entity.BetDate;
import com.caijin.I000Wan.entity.FootballMatch;
import com.caijin.I000Wan.response.ChongQingReturnBean;
import com.caijin.I000Wan.response.ChongQingReturnData;
import com.caijin.I000Wan.util.DateUtils;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping(value = "/cqssc")
public class ChongQingShiShicaiController {
	private static String url = "http://f.apiplus.cn/cqssc-10.json?t="
			+ System.currentTimeMillis();
	private static ChongQingReturnData currentData;
	private static ChongQingReturnBean currentBean;
	private static boolean init = false;
	private static long lastTime;

	/**
	 * 数据接口来自 http://f.apiplus.cn/cqssc-10.json 跳转到重庆时时彩购买页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/cqsscview")
	public ModelAndView jingZuJqs() {
		if (currentBean == null && !init) {
			new Thread(new Runnable() {

				@Override
				public void run() {
					getShiShiCaipiaohistory();
				}
			}).start();
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("current", DateUtils.getCurrentChongQingShiShicai());
		model.put("leftsecond", DateUtils.getLeftMisecond());
		model.put("left", DateUtils.getLeftChongQingShiShicai(DateUtils.getCurrentChongQingShiShicai()));
		return new ModelAndView("caipiao/cqssc", model);
	}

	private ChongQingReturnBean getShiShiCaipiaohistory() {
		URL urls;
		StringBuffer buffer = new StringBuffer();
		HttpURLConnection conn = null;
		ChongQingReturnBean bean = null;
		try {
			urls = new URL(url);
			conn = (HttpURLConnection) urls.openConnection();
			conn.setConnectTimeout(5000); // 设置连接超时为5秒
			conn.setRequestMethod("GET"); // 设定请求方式
			conn.connect(); // 建立到远程对象的实际连接
			// 返回打开连接读取的输入流
			BufferedReader bufferedReader = new BufferedReader(
					new InputStreamReader(conn.getInputStream()));
			// 判断是否正常响应数据
			if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
				System.out.println("网络错误异常！!!!");
			} else {

				String str;
				while ((str = bufferedReader.readLine()) != null) {
					buffer.append(str);
				}
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.disconnect(); // 中断连接
			}
		}
		lastTime = System.currentTimeMillis();
		if (buffer.toString() != null && !"".equals(buffer.toString())) {
			ObjectMapper mapper = new ObjectMapper();
			try {
				bean = mapper.readValue(buffer.toString(),
						ChongQingReturnBean.class);
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(buffer.toString());
		}
		currentBean = bean;
		return bean;
	}

	/**
	 * 数据接口来自 http://f.apiplus.cn/cqssc-10.json json接口
	 * 
	 * @return
	 */
	@RequestMapping(value = "/shishicaihistroy")
	public void shishicaihistory(HttpServletResponse response) {
		ChongQingReturnBean bean;
		if (currentBean != null
				&& System.currentTimeMillis() - lastTime < 3* 1000) {
			 bean = currentBean;
		} else {
			 bean = getShiShiCaipiaohistory();
		}
		Map<String, Object> model = new HashMap<String, Object>();
		if (bean == null) {
			bean = new ChongQingReturnBean();
		} else {

		}
		currentData = new ChongQingReturnData();
		currentData.expect = DateUtils.getCurrentChongQingShiShicai();
		currentData.opentime = "" + DateUtils.getLeftMisecond();
		currentData.opentimestamp = System.currentTimeMillis() / 1000;
		model.put("chongqingReturn", bean.data);
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

	@RequestMapping(value = "/shishicai")
	public void shishicaikai(HttpServletResponse response) {
		ChongQingReturnData currentData = new ChongQingReturnData();
		currentData.expect = DateUtils.getCurrentChongQingShiShicai();
		currentData.opentime = "" + DateUtils.getLeftMisecond();
		System.out.println("left:" + currentData.opentime);
		currentData.opentimestamp = System.currentTimeMillis() / 1000;
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("current", currentData);
		model.put("left", DateUtils.getLeftChongQingShiShicai(currentData.expect));
		System.out.println("currentDate:" + currentData.expect+"::"+DateUtils.getLeftChongQingShiShicai(currentData.expect));

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
