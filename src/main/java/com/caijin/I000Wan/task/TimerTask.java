package com.caijin.I000Wan.task;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
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

import com.caijin.I000Wan.entity.HeMaiOrder;
import com.caijin.I000Wan.entity.HeMaiOrderDetail;
import com.caijin.I000Wan.entity.LotteryPeriod;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.OrderDetail;
import com.caijin.I000Wan.entity.Period;
import com.caijin.I000Wan.response.ChongQingReturnBean;
import com.caijin.I000Wan.response.ChongQingReturnData;
import com.caijin.I000Wan.service.HeMaiOrderDetailService;
import com.caijin.I000Wan.service.HeMaiOrderService;
import com.caijin.I000Wan.service.LetteryPeriodService;
import com.caijin.I000Wan.service.MemberUserService;
import com.caijin.I000Wan.service.OrderDetailService;
import com.caijin.I000Wan.service.OrderService;
import com.caijin.I000Wan.service.PeriodService;
import com.caijin.I000Wan.util.BonusUtil;
import com.caijin.I000Wan.util.DateUtils;
import com.caijin.I000Wan.util.GenerateOrderNoUtil;
import com.caijin.I000Wan.util.Mum;
import com.caijin.I000Wan.web.boss.OrderAction;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Lazy(false)
@Component("taskJob")
public class TimerTask {
	private final Logger log = LoggerFactory.getLogger(OrderTimerTask.class);
	private static String url = "http://f.apiplus.cn/cqssc-10.json?t="
			+ System.currentTimeMillis();
	public static String wanyi="http://caipiao.163.com/award";
	public static String chongqingUrl="http://caipiao.163.com/award/cqssc/";
	public static String jiangxiUrl="http://caipiao.163.com/award/jx11xuan5/";
	public static String  gangdongUrl="http://caipiao.163.com/award/gd11xuan5/";
	public final static int MAX_MONEY = 200;

	@Autowired
	private LetteryPeriodService periodService;

	@Autowired
	private OrderService orderService;
	@Autowired
	private PeriodService pdService;

	@Autowired
	private OrderDetailService orderDetailService;

	@Autowired
	private MemberUserService memberUserService;

	@Autowired
	private HeMaiOrderDetailService heMaiOrderDetailService;
	@Autowired
	private HeMaiOrderService heMaiOrderService;

	@Autowired
	private PeriodService periodlService;

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
	 * 读取网站中奖结果
	 */
	@Scheduled(cron = "0 0/2 *  * * ? ")
	public void job() {
		getWebScan();
	}

	public void getWebScan() {
		log.info("读取网站信息。。。");
		NewsCrawler crawler = new NewsCrawler(wanyi, true);
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
			//时时彩
			/* start page */
			this.addSeed(chongqingUrl);
            this.addSeed(jiangxiUrl);
			/* fetch url like http://news.hfut.edu.cn/show-xxxxxxhtml */
            this.addSeed(gangdongUrl);
			/* fetch url like http://news.hfut.edu.cn/show-xxxxxxhtml */
			this.addRegex(gangdongUrl);
			this.addRegex(chongqingUrl);
			this.addRegex(jiangxiUrl);
//			//江西11选5
//			this.addSeed(jiangxiUrl);
//
//			/* fetch url like http://news.hfut.edu.cn/show-xxxxxxhtml */
//			this.addRegex(jiangxiUrl);
			/* do not fetch jpg|png|gif */
			this.addRegex("-.*\\.(jpg|png|gif).*");
			/* do not fetch url contains # */
			this.addRegex("-.*#.*");
		}

		@Override
		public void visit(Page page, Links nextLinks) {
			String url = page.getUrl();
			/* if page is news page */
			if (Pattern.matches(chongqingUrl, url)) {
				chongqianshishcai(page, nextLinks);
			}else if(Pattern.matches(jiangxiUrl, url)){
				//江西11选5
				try{
				jixishishicai(page, nextLinks);
				}catch(Exception e){
					e.printStackTrace();
				}
			}else if(Pattern.matches(gangdongUrl, url)){
				//东11选5
				try{
					gongdongshishicai(page, nextLinks);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		public  void gongdongshishicai(Page page, Links nextLinks){
			/* we use jsoup to parse page */
			Document doc = page.getDoc();
			List<ChongQingReturnData> list = new ArrayList<ChongQingReturnData>();
			ChongQingReturnData data;
			for (int i = 0; i < doc.select("td[class=start]").size(); i++) {
				data = new ChongQingReturnData();
				String title = doc.select("td[class=start]").get(i)
						.attr("data-award");
				String content = doc.select("td[class=start]").get(i)
						.attr("data-period");
				if (null != title && !"".equals(title.trim())) {
					System.out
							.println("title:\n" + title.replace(" ", ",")+"::::"+content);
					data.setOpencode(title.replace(" ", ","));
//					if (content.length() == 8) {
//						content = "20" + content;
//					}
					data.setExpect(content);
					data.setOpentimestamp(System.currentTimeMillis());
					data.setOpentime(DateUtils.getguandongLeftEndDate(content));

					// list.add(data);
					LotteryPeriod letteryPeriod;
					try {
						letteryPeriod = periodService.findByPeriod(
								Period.SHISHI_CAI_GUANGDONG11XUAN5,
								data.getExpect());
						if (letteryPeriod != null) {
							continue;
						}
					} catch (Exception e) {

					}
					letteryPeriod = new LotteryPeriod();
					letteryPeriod
							.setLotteryCode(Period.SHISHI_CAI_GUANGDONG11XUAN5);
					letteryPeriod.setLotteryPeriod(data.getOpencode());
					letteryPeriod.setOpentime(data.getOpentime());
					letteryPeriod.setOpentimestamp(data.getOpentimestamp());
					letteryPeriod.setPeriodNumber(data.getExpect());
					letteryPeriod.setStatus(1);

					periodService.save(letteryPeriod);

				}
			}
		
		
		}
		public  void jixishishicai(Page page, Links nextLinks){
			/* we use jsoup to parse page */
			Document doc = page.getDoc();
			List<ChongQingReturnData> list = new ArrayList<ChongQingReturnData>();
			ChongQingReturnData data;
			for (int i = 0; i < doc.select("td[class=start]").size(); i++) {
				data = new ChongQingReturnData();
				String title = doc.select("td[class=start]").get(i)
						.attr("data-award");
				String content = doc.select("td[class=start]").get(i)
						.attr("data-period");
				if (null != title && !"".equals(title.trim())) {
					System.out
							.println("title:\n" + title.replace(" ", ",")+"::::"+content);
					data.setOpencode(title.replace(" ", ","));
//					if (content.length() == 8) {
//						content = "20" + content;
//					}
					data.setExpect(content);
					data.setOpentimestamp(System.currentTimeMillis());
					data.setOpentime(DateUtils.getjiangxiLeftEndDate(content));

					// list.add(data);
					LotteryPeriod letteryPeriod;
					try {
						letteryPeriod = periodService.findByPeriod(
								Period.SHISHI_CAI_JIANGXI,
								data.getExpect());
						if (letteryPeriod != null) {
							continue;
						}
					} catch (Exception e) {

					}
					letteryPeriod = new LotteryPeriod();
					letteryPeriod
							.setLotteryCode(Period.SHISHI_CAI_JIANGXI);
					letteryPeriod.setLotteryPeriod(data.getOpencode());
					letteryPeriod.setOpentime(data.getOpentime());
					letteryPeriod.setOpentimestamp(data.getOpentimestamp());
					letteryPeriod.setPeriodNumber(data.getExpect());
					letteryPeriod.setStatus(1);

					periodService.save(letteryPeriod);

				}
			}
		
		
		}
		public void  chongqianshishcai(Page page, Links nextLinks){
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

				}
			}
		
		}
	}

	/*
	 * 读取网站中奖结果
	 */
	@Scheduled(cron = "0 0/5 *  * * ? ")
	public void jobzj() {
		List<Order> list = orderService
				.findOrderByWprizeStatus(Order.WPRISE_STATUS_NO);
		for (Order order : list) {
			if (order.isAutoDrawn() && order.isAutoPrizes()) {
				if (order.getOrderStatus() == Order.ORDER_SUCESS
						&& order.getPayStatus() == Order.PAY_STATUS_SUCESS) {
					if (!OrderAction.currertOrder.containsKey(order
							.getOrderNo())) {
						OrderAction.currertOrder.put(order.getOrderNo(), order);
						orderWprise(order);
						OrderAction.currertOrder.remove(order.getOrderNo());
					}
				}
			}
		}

		List<Order> lists = orderService
				.findOrderByWprizeStatus(Order.WPRIS_STATUS_PORTION);
		for (Order order : lists) {
			if (order.isAutoDrawn() && order.isAutoPrizes()) {
				if (order.getOrderStatus() == Order.ORDER_SUCESS
						&& order.getPayStatus() == Order.PAY_STATUS_SUCESS) {
					if (!OrderAction.currertOrder.containsKey(order
							.getOrderNo())) {
						OrderAction.currertOrder.put(order.getOrderNo(), order);
						orderWprise(order);
						OrderAction.currertOrder.remove(order.getOrderNo());
					}
				}
			}
		}

	}

	private void orderWprise(Order order) {
		try {
			List<OrderDetail> orderDetails = orderDetailService
					.findOrderDetailByOrderId(order);
			List<Period> periods = periodlService.findPeriodByOId(order
					.getOrderNo());
			LotteryPeriod letteryPeriod;
			float currentMoney = 0;
			// 计算中奖过程
			for (Period period : periods) {
				if (period.getStatus() == Period.STATUS_CURRENT
						&& period.getWinning() == Period.winning_BEFORE) {
					letteryPeriod = periodService.findByPeriod(
							period.getLotteryCode(), period.getLotteryPeriod());

					if (letteryPeriod != null) {
						for (OrderDetail detail : orderDetails) {
							float money = BonusUtil.getLotteryHondleBonus(
									BonusUtil.getBonusNumber(letteryPeriod
											.getLotteryPeriod()), detail
											.getBuyCaiNumber());
							if (money > 0) {
								money = money * period.getBeisu();
								period.setMoney(money);
								period.setWinning(Period.WINNING_CURRENT);
								periodlService.update(period);
								currentMoney = currentMoney + money;
							} else {
								period.setMoney(money * period.getBeisu());
								period.setWinning(Period.winning_AFTER);
								periodlService.update(period);
							}

						}

					}
				}
			}
			if (periodlService.getPeriodUNStatusByOId(order.getOrderNo()) == 0) {
				if (currentMoney > 0) {
					order.setWprizeStatus(Order.WPRIS_STATUS_ALL);
				} else {
					if (order.getWprizeStatus() == Order.WPRISE_STATUS_NO)
						order.setWprizeStatus(Order.WPRIS_STATUS_WI);
				}
				order.setCurrentWPMoney(order.getCurrentWPMoney()
						+ currentMoney);

				orderService.update(order);
			} else {
				if (currentMoney > 0) {
					order.setWprizeStatus(Order.WPRIS_STATUS_PORTION);
				} else {
					// 不处理当前状态 还有期数未计算
				}
				order.setCurrentWPMoney(order.getCurrentWPMoney()
						+ currentMoney);
				orderService.update(order);
			}
			// 如果是合买方案就计算子订单中奖金额
			Order or;
			if (order.getOrderType() == Order.HEMAI_BUY_ORDER) {
				HeMaiOrderDetail heiMaiDetail = heMaiOrderDetailService
						.findOrderHemaiDetailByOrderId(order);
				List<HeMaiOrder> heMaiOrders = heMaiOrderService
						.findOrderHemaiByOrderId(heiMaiDetail);
				for (HeMaiOrder heMaiOrder : heMaiOrders) {
					heMaiOrder
							.setCurrentWPMoney((order.getCurrentWPMoney() / heiMaiDetail
									.getFensum())
									* heMaiOrder.getSubGuaranteeSum());
					heMaiOrderService.update(heMaiOrder);
					or = orderService.findOrderByOrderId(heMaiOrder.getId());
					if (or != null) {
						or.setCurrentWPMoney(heMaiOrder.getCurrentWPMoney());
						or.setWprizeStatus(order.getWprizeStatus());
						orderService.update(or);
					}

				}
			}
			// 发奖
			// if (currentMoney > 0) {
			if (order.getOrderType() == Order.PROXY_BUY_ORDER) {
				// 如果没有发过奖，则把所有统计中奖金额全部发放
				if (order.getCashBackStatus() == Order.CASHBACKSTATUS_NO) {
					currentMoney = order.getCurrentWPMoney();
				}

				if (currentMoney > 0) {
					Order newOrder = new Order();
					newOrder.setOrderType(Order.AWARD_ORDER);
					newOrder.setOrderNo(GenerateOrderNoUtil.getOrderNumber());
					MemberUser memberUser = order.getMemberUser();
					memberUser.setAvailableScore(currentMoney
							+ memberUser.getAvailableScore());
					newOrder.setOrderStatus(Order.ORDER_SUCESS);
					newOrder.setTotalMoney(currentMoney);
					newOrder.setCreateDate(new Date());
					newOrder.setUpdateDate(new Date());
					newOrder.setOtherId(order.getOrderNo());
					newOrder.setMemberUser(memberUser);
					orderService.save(newOrder);
					memberUserService.update(memberUser);
					if (order.getWprizeStatus() == Order.WPRIS_STATUS_ALL) {
						order.setCashBackStatus(Order.CASHBACKSTATUS_ALL);
					} else {
						order.setCashBackStatus(Order.CASHBACKSTATUS_PORTION);
					}
					orderService.update(order);
				}
			} else if (order.getOrderType() == Order.HEMAI_BUY_ORDER) {

				// 如果没有发过奖，则把所有统计中奖金额全部发放
				if (order.getCashBackStatus() == Order.CASHBACKSTATUS_NO) {
					currentMoney = order.getCurrentWPMoney();
				}
				if (currentMoney > 0) {
					HeMaiOrderDetail heiMaiDetail = heMaiOrderDetailService
							.findOrderHemaiDetailByOrderId(order);
					List<HeMaiOrder> heMaiOrders = heMaiOrderService
							.findOrderHemaiByOrderId(heiMaiDetail);
					for (HeMaiOrder heMaiOrder : heMaiOrders) {
						float funMoney = currentMoney
								* heMaiOrder.getSubGuaranteeSum()
								/ heiMaiDetail.getFensum();
						Order newOrder = new Order();
						newOrder.setOrderType(Order.AWARD_ORDER);
						newOrder.setOrderNo(GenerateOrderNoUtil
								.getOrderNumber());
						MemberUser memberUser = heMaiOrder.getMemberUser();
						memberUser.setAvailableScore(funMoney
								+ memberUser.getAvailableScore());
						newOrder.setOrderStatus(Order.ORDER_SUCESS);
						newOrder.setCreateDate(new Date());
						newOrder.setTotalMoney(funMoney);
						newOrder.setUpdateDate(new Date());
						newOrder.setOtherId(order.getOrderNo());
						newOrder.setMemberUser(memberUser);
						orderService.save(newOrder);
						memberUserService.update(memberUser);
						or = orderService
								.findOrderByOrderId(heMaiOrder.getId());
						if (or != null) {
							if (order.getWprizeStatus() == Order.WPRIS_STATUS_ALL) {
								or.setCashBackStatus(Order.CASHBACKSTATUS_ALL);
							} else {
								or.setCashBackStatus(Order.CASHBACKSTATUS_PORTION);
							}
							orderService.update(or);
						}
					}
					if (order.getWprizeStatus() == Order.WPRIS_STATUS_ALL) {
						order.setCashBackStatus(Order.CASHBACKSTATUS_ALL);
					} else {
						order.setCashBackStatus(Order.CASHBACKSTATUS_PORTION);
					}
					orderService.update(order);
				}
			}

			memberUserService.clear();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
