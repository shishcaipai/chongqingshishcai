//package com.caijin.I000Wan.task;
//
//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.InputStreamReader;
//import java.net.HttpURLConnection;
//import java.net.MalformedURLException;
//import java.net.URL;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Lazy;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Component;
//
//import com.caijin.I000Wan.entity.LotteryPeriod;
//import com.caijin.I000Wan.entity.Order;
//import com.caijin.I000Wan.entity.OrderDetail;
//import com.caijin.I000Wan.entity.Period;
//import com.caijin.I000Wan.response.ChongQingReturnBean;
//import com.caijin.I000Wan.response.ChongQingReturnData;
//import com.caijin.I000Wan.service.LetteryPeriodService;
//import com.caijin.I000Wan.service.OrderDetailService;
//import com.caijin.I000Wan.service.OrderService;
//import com.caijin.I000Wan.service.PeriodService;
//import com.caijin.I000Wan.util.BonusUtil;
//import com.fasterxml.jackson.core.JsonParseException;
//import com.fasterxml.jackson.databind.JsonMappingException;
//import com.fasterxml.jackson.databind.ObjectMapper;
//
//@Lazy(false)
//@Component("JXSSC")
//public class JiangXiShiShiCaiTask {
//	private static String url = "http://t.apiplus.cn/newly.do?code=jx11x5&format=json";
//
//	@Autowired
//	private LetteryPeriodService periodService;
//
//	@Autowired
//	private OrderService orderService;
//	@Autowired
//	private PeriodService pdService;
//	
//	@Autowired
//	private OrderDetailService orderDetailService;
//
//	@Scheduled(cron = "0 0/10 *  * * ? ")
//	public void job1() {
//		System.out.println("任务进行中。。。");
//		ChongQingReturnBean bean = getShiShiCaipiaohistory();
//		if(bean!=null){
//		List<ChongQingReturnData> list = bean.getData();
//		LotteryPeriod letteryPeriod;
//		for (ChongQingReturnData data : list) {
//			letteryPeriod = new LotteryPeriod();
//			letteryPeriod.setLotteryCode(bean.getCode());
//			letteryPeriod.setLotteryPeriod(data.getOpencode());
//			letteryPeriod.setOpentime(data.getOpentime());
//			letteryPeriod.setOpentimestamp(data.getOpentimestamp());
//			letteryPeriod.setPeriodNumber(data.getExpect());
//			letteryPeriod.setStatus(1);
//			periodService.save(letteryPeriod);
//			
//		}
//		}
//	}
//
//	private ChongQingReturnBean getShiShiCaipiaohistory() {
//		URL urls;
//		StringBuffer buffer = new StringBuffer();
//		HttpURLConnection conn = null;
//		ChongQingReturnBean bean = null;
//		try {
//			urls = new URL(url);
//			conn = (HttpURLConnection) urls.openConnection();
//			conn.setConnectTimeout(5000); // 设置连接超时为5秒
//			conn.setRequestMethod("GET"); // 设定请求方式
//			conn.connect(); // 建立到远程对象的实际连接
//			// 返回打开连接读取的输入流
//			BufferedReader bufferedReader = new BufferedReader(
//					new InputStreamReader(conn.getInputStream()));
//			// 判断是否正常响应数据
//			if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
//				System.out.println("网络错误异常！!!!");
//			} else {
//
//				String str;
//				while ((str = bufferedReader.readLine()) != null) {
//					buffer.append(str);
//				}
//			}
//		} catch (MalformedURLException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			if (conn != null) {
//				conn.disconnect(); // 中断连接
//			}
//		}
//		if (buffer.toString() != null && !"".equals(buffer.toString())) {
//			ObjectMapper mapper = new ObjectMapper();
//			try {
//				bean = mapper.readValue(buffer.toString(),
//						ChongQingReturnBean.class);
//			} catch (JsonParseException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (JsonMappingException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			System.out.println(buffer.toString());
//		}
//		return bean;
//	}
//}
