package com.caijin.I000Wan.task;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.jsoup.nodes.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import cn.edu.hfut.dmic.webcollector.model.CrawlDatum;
import cn.edu.hfut.dmic.webcollector.model.Links;
import cn.edu.hfut.dmic.webcollector.model.Page;
import cn.edu.hfut.dmic.webcollector.crawler.BreadthCrawler;

import com.caijin.I000Wan.entity.LotteryPeriod;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.OrderDetail;
import com.caijin.I000Wan.entity.Period;
import com.caijin.I000Wan.response.ChongQingReturnBean;
import com.caijin.I000Wan.response.ChongQingReturnData;
import com.caijin.I000Wan.service.LetteryPeriodService;
import com.caijin.I000Wan.service.OrderDetailService;
import com.caijin.I000Wan.service.OrderService;
import com.caijin.I000Wan.service.PeriodService;
import com.caijin.I000Wan.util.BonusUtil;
import com.caijin.I000Wan.util.DateUtils;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Lazy(false)
@Component("taskJob")
public class TimerTask {
	private final Logger log = LoggerFactory.getLogger(OrderTimerTask.class);
	private static String url = "http://f.apiplus.cn/cqssc-10.json?t="
			+ System.currentTimeMillis();
	public final static int MAX_MONEY = 200;

	@Autowired
	private LetteryPeriodService periodService;

	@Autowired
	private OrderService orderService;
	@Autowired
	private PeriodService pdService;

	@Autowired
	private OrderDetailService orderDetailService;

	/**
	 * 中奖任务计算
	 */
	// @Scheduled(cron = "0 0/5 *  * * ? ")
	// public void job1() {
	// Map<String, Order> map = new HashMap<String, Order>();// 存当前订单号
	// log.info("计算中奖任务启动。。。");
	// ChongQingReturnBean bean = getShiShiCaipiaohistory();
	// if (bean != null) {
	// List<ChongQingReturnData> list = bean.getData();
	// LotteryPeriod letteryPeriod;
	// for (ChongQingReturnData data : list) {
	// try {
	// letteryPeriod = periodService.findByPeriod(
	// Period.SHISHI_CAI_CHONGQING,
	// data.getExpect());
	// if (letteryPeriod != null) {
	// continue;
	// }
	// } catch (Exception e) {
	//
	// }
	// letteryPeriod = new LotteryPeriod();
	// letteryPeriod.setLotteryCode(bean.getCode());
	// letteryPeriod.setLotteryPeriod(data.getOpencode());
	// letteryPeriod.setOpentime(data.getOpentime());
	// letteryPeriod.setOpentimestamp(data.getOpentimestamp());
	// letteryPeriod.setPeriodNumber(data.getExpect());
	// letteryPeriod.setStatus(1);
	// periodService.save(letteryPeriod);
	// List<OrderDetail> orderList = orderDetailService
	// .findbyQIhao(data.getExpect());
	// if (orderList != null)
	// for (OrderDetail order : orderList) {
	// String caiNumber = order.getBuyCaiNumber();
	// // 计算得到中奖金额
	// float money = BonusUtil.getLotteryHondleBonus(
	// BonusUtil.getBonusNumber(data.getOpencode()),
	// caiNumber);
	// if (money > 0) {
	// pdService.updatePeriodbyQIhaoAndOrderNo(
	// data.getExpect(), order.getOrderNo(), 1,
	// money);
	// } else {
	// pdService.updatePeriodbyQIhaoAndOrderNo(
	// data.getExpect(), order.getOrderNo(), 2,
	// money);
	// }
	// map.put(order.getOrder().getOrderNo(), order.getOrder());
	// }
	// }
	// Iterator<String> keys = map.keySet().iterator();
	// String orderId;
	// Order order;
	// while (keys.hasNext()) {
	// orderId = keys.next();
	// float money = pdService.getMoneyPeriodByOId(orderId);
	// if (pdService.getPeriodUNStatusByOId(orderId) == 0) {
	// order = map.get(orderId);
	// if (money > 0) {
	// order.setWprizeStatus(Order.WPRIS_STATUS_ALL);
	// } else {
	// order.setWprizeStatus(Order.WPRIS_STATUS_WI);
	// }
	// order.setCurrentWPMoney(order.getCurrentWPMoney() + money);
	// orderService.update(order);
	// } else {
	// order = map.get(orderId);
	// if (money > 0) {
	// order.setWprizeStatus(Order.WPRIS_STATUS_PORTION);
	// } else {
	// order.setWprizeStatus(Order.WPRIS_STATUS_PWI);
	// }
	// order.setCurrentWPMoney(order.getCurrentWPMoney() + money);
	// orderService.update(order);
	// }
	// }
	// }
	// }

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
		return bean;
	}

	/*
	 * 中奖任务计算
	 */
	@Scheduled(cron = "0 0/3 *  * * ? ")
	public void job() {
		getWebScan();
	}

	public void getWebScan() {
		log.info("读取网站信息。。。");
		NewsCrawler crawler = new NewsCrawler("crawl", true);
		crawler.setThreads(5);
		crawler.setTopN(10);
		try {
			crawler.start(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Crawling news from hfut news
	 * 
	 * @author hu
	 */
	public class NewsCrawler extends BreadthCrawler {

		/**
		 * @param crawlPath
		 *            crawlPath is the path of the directory which maintains
		 *            information of this crawler
		 * @param autoParse
		 *            if autoParse is true,BreadthCrawler will auto extract
		 *            links which match regex rules from pag
		 */
		public NewsCrawler(String crawlPath, boolean autoParse) {
			super(crawlPath, autoParse);
			/* start page */
			this.addSeed("http://caipiao.163.com/award/cqssc/");

			/* fetch url like http://news.hfut.edu.cn/show-xxxxxxhtml */
			this.addRegex("http://caipiao.163.com/award/cqssc/");
			/* do not fetch jpg|png|gif */
			this.addRegex("-.*\\.(jpg|png|gif).*");
			/* do not fetch url contains # */
			this.addRegex("-.*#.*");
		}

		@Override
		public void visit(Page page, Links nextLinks) {
			String url = page.getUrl();
			Map<String, Order> map = new HashMap<String, Order>();// 存当前订单号
			/* if page is news page */
			if (Pattern.matches("http://caipiao.163.com/award/cqssc/", url)) {
				/* we use jsoup to parse page */
				Document doc = page.getDoc();
				List<ChongQingReturnData> list = new ArrayList<ChongQingReturnData>();
				ChongQingReturnData data;
				for (int i = 0; i < doc.select("td[class=start]").size(); i++) {
					data = new ChongQingReturnData();
					String title = doc.select("td[class=start]").get(i)
							.attr("data-win-number");
					String content = doc.select("td[class=start]").get(i)
							.attr("data-period");
					String num = doc.select("td[class=start]").get(i).text();
					if (null != title && !"".equals(title.trim())) {
						System.out
								.println("title:\n" + title.replace(" ", ","));
						data.setOpencode(title.replace(" ", ","));
						if (content.length() == 9) {
							content = "20" + content;
						}
						data.setExpect(content);
						System.out.println("content:\n" + content);
						data.setOpentimestamp(System.currentTimeMillis());
						data.setOpentime(DateUtils.getLeftEndDate(content));

						// list.add(data);
						LotteryPeriod letteryPeriod;
						try {
							letteryPeriod = periodService.findByPeriod(
									Period.SHISHI_CAI_CHONGQING,
									data.getExpect());
							if (letteryPeriod != null) {
								continue;
							}
						} catch (Exception e) {

						}
						letteryPeriod = new LotteryPeriod();
						letteryPeriod
								.setLotteryCode(Period.SHISHI_CAI_CHONGQING);
						letteryPeriod.setLotteryPeriod(data.getOpencode());
						letteryPeriod.setOpentime(data.getOpentime());
						letteryPeriod.setOpentimestamp(data.getOpentimestamp());
						letteryPeriod.setPeriodNumber(data.getExpect());
						letteryPeriod.setStatus(1);

						periodService.save(letteryPeriod);
						List<OrderDetail> orderList = orderDetailService
								.findbyQIhao(data.getExpect());
						if (orderList != null)
							for (OrderDetail order : orderList) {
								String caiNumber = order.getBuyCaiNumber();
								// 计算得到中奖金额
								float money = BonusUtil.getLotteryHondleBonus(
										BonusUtil.getBonusNumber(data
												.getOpencode()), caiNumber);
								if (money > 0) {
									pdService.updatePeriodbyQIhaoAndOrderNo(
											data.getExpect(),
											order.getOrderNo(), 1, money);
								} else {
									pdService.updatePeriodbyQIhaoAndOrderNo(
											data.getExpect(),
											order.getOrderNo(), 2, money);
								}
								map.put(order.getOrder().getOrderNo(),
										order.getOrder());
							}

					}
				}
			}
			Iterator<String> keys = map.keySet().iterator();
			String orderId;
			Order order;
			while (keys.hasNext()) {
				orderId = keys.next();
				float money = pdService.getMoneyPeriodByOId(orderId);
				if (pdService.getPeriodUNStatusByOId(orderId) == 0) {
					order = map.get(orderId);
					if (money > 0) {
						order.setWprizeStatus(Order.WPRIS_STATUS_ALL);
					} else {
						order.setWprizeStatus(Order.WPRIS_STATUS_WI);
					}
					order.setCurrentWPMoney(order.getCurrentWPMoney() + money);
					orderService.update(order);
				} else {
					order = map.get(orderId);
					if (money > 0) {
						order.setWprizeStatus(Order.WPRIS_STATUS_PORTION);
					} else {
						order.setWprizeStatus(Order.WPRIS_STATUS_PWI);
					}
					order.setCurrentWPMoney(order.getCurrentWPMoney() + money);
					orderService.update(order);
				}
			}
		}

	}

}
