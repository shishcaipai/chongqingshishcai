package com.caijin.I000Wan.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.caijin.I000Wan.dto.JinZuChuanConfirmDTO;
import com.caijin.I000Wan.dto.JqsConfirmDTO;
import com.caijin.I000Wan.dto.LotteryConfirmInfoDTO;
import com.caijin.I000Wan.entity.FootballMatch;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.OrderDetail;
import com.caijin.I000Wan.entity.Period;
import com.caijin.I000Wan.service.FootballMatchService;
import com.caijin.I000Wan.service.MemberUserService;
import com.caijin.I000Wan.service.OrderDetailService;
import com.caijin.I000Wan.service.OrderService;
import com.caijin.I000Wan.service.PeriodService;
import com.caijin.I000Wan.util.DateUtils;
import com.caijin.I000Wan.util.GenerateOrderNoUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 订单控制层
 * 
 * @author Jeff
 * @since 2014-07-21
 */
@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderDetailService orderDetailService;

	@Autowired
	private PeriodService periodService;

	@Autowired
	private FootballMatchService footballMatchService;

	@Autowired
	private MemberUserService memberUserService;

	/**
	 * 跳转到充值页面
	 * 
	 * @return
	 */
	@RequestMapping("/recharge")
	public String toRecharge(HttpServletRequest request) {
		MemberUser memberUser = (MemberUser) request.getSession().getAttribute(
				MemberUser.FRONT_MEMBER_LOGIN_SESSION);
		if (memberUser == null) {
			return "redirect:/user/login";
		}
		return "order/recharge";
	}

	/**
	 * 跳转到支付宝页面
	 * 
	 * @return
	 */
	@RequestMapping("/sscorder/alipay")
	public String toAlipay(HttpServletRequest request) {
		String tradeNo = request.getParameter("orderId");
		String subject = request.getParameter("subject");
		String totalMoney = request.getParameter("totalMoney");
		System.out.println("---tradeNo--"+tradeNo+"---totalMoney--"+totalMoney);

		String seller_email = "2088511221216065";// 卖家支付宝账号
		MemberUser memberUser = (MemberUser) request.getSession().getAttribute(
				MemberUser.FRONT_MEMBER_LOGIN_SESSION);
		if (memberUser == null) {

			return "redirect:/user/login";
		}
		System.out.println("---memberUser.getTotalScore()--"+memberUser.getTotalScore()+"--- memberUser.getAvailableScore()--"+ memberUser.getAvailableScore());
		if ( memberUser.getAvailableScore() > Integer
				.valueOf(totalMoney)) {
			memberUser.setAvailableScore(memberUser.getAvailableScore()
					- Integer.valueOf(totalMoney));
			
			Order order = orderService.findOrderByOrderId(tradeNo);
			if (order == null) {
				return "redirect:/user/login";
			}
			order.setPayStatus(Order.PAY_STATUS_SUCESS);
			memberUserService.update(memberUser);
			orderService.update(order);
			return "order/alipaysuccess";
		} else {
			return "order/alipay";
		}

	}

	/**
	 * 支付宝服务器异步通知页面
	 * 
	 * @return
	 */
	@RequestMapping("/alipay/notify")
	public String alipayNotify() {

		return "order/notify_url";
	}

	/**
	 * 支付宝页面跳转同步通知页面
	 * 
	 * @return
	 */
	@RequestMapping("/alipay/return")
	public String alipayReturn() {

		return "order/return_url";
	}

	/**
	 * 充值
	 */
	@RequestMapping("/order/recharge/ajax_save")
	@ResponseBody
	public Map doRechargeOrder(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sucess", false);// 默认为失败

		MemberUser memberUser = (MemberUser) request.getSession().getAttribute(
				MemberUser.FRONT_MEMBER_LOGIN_SESSION);
		try {
			if (memberUser != null) {
				Integer totalMoney = 0;
				String totalMoneyStr = (String) request
						.getParameter("totalMoney");

				totalMoney = new Integer(totalMoneyStr);

				String orderId = GenerateOrderNoUtil.getOrderNumber();

				Order order = new Order();
				order.setOrderId(orderId);
				order.setCreateDate(new Date());
				order.setMemberUser(memberUser);
				order.setName("订单充值");
				order.setOrderStatus(Order.ORDER_SUCESS);
				order.setOrderTime(new Date());
				order.setOrderType(Order.RECHARGE_ORDER);
				order.setPayStatus(Order.PAY_STATUS_NO);
				order.setTotalMoney(totalMoney);
				order.setUpdateDate(new Date());

				orderService.save(order);

				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setCreateDate(new Date());
				orderDetail.setOrder(order);
				orderDetail.setUpdateDate(new Date());

				orderDetailService.save(orderDetail);

				request.getSession().setAttribute("tradeOrder", order);

				map.put("orderId", order.getId());
				map.put("sucess", true);
				map.put("msg", "下注成功!");
			} else {
				map.put("sucess", false);
				map.put("msg", "未登录!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("sucess", false);
			map.put("msg", "充值失败!");
		}
		return map;
	}

	/**
	 * 我的充值记录
	 * 
	 * @return
	 */
	@RequestMapping("/myrecharge/list")
	public String myRechargeList(HttpServletRequest request, Model model) {
		MemberUser memberUser = (MemberUser) request.getSession().getAttribute(
				MemberUser.FRONT_MEMBER_LOGIN_SESSION);
		List<Order> myRechargeList = new ArrayList<Order>();
		myRechargeList = orderService.getMyRechargeList(memberUser.getId());
		model.addAttribute("myRechargeList", myRechargeList);
		return "user/rechargeRecordList";
	}

	/**
	 * 时时彩购买方法
	 * 
	 * @return
	 */
	@RequestMapping("/order/ajax_save")
	public ModelAndView sfcOrderSave(HttpServletRequest request) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sucess", false);// 默认为失败

		MemberUser memberUser = (MemberUser) request.getSession().getAttribute(
				MemberUser.FRONT_MEMBER_LOGIN_SESSION);
		try {
			if (memberUser != null) {
				memberUser=memberUserService.find(memberUser.getId());
				Integer totalMoney = 0;
				// 投注名称
				String name = (String) request.getParameter("playname");

				name = URLDecoder.decode(name);
				// 投注期号
				String phase = (String) request.getParameter("phase");
				// 当前期数
				String expectnum = (String) request.getParameter("expectnum");
				// 投注倍数.投注期数list
				String beishulistsuc = (String) request
						.getParameter("beishulistsuc");
				// 投注总金额
				String totalMoneyStr = (String) request
						.getParameter("totalMoney");
				// 投注彩票代码
				String lotteryCode = (String) request.getParameter("codes");
				// 投注注数
				String lotteryCountStr = (String) request
						.getParameter("zhushunum");
				// 追号是否停
				String ZjCut = (String) request.getParameter("ZjCut");
				// 投注彩票类型代码
				Integer lotteryCount = 1;
				if (expectnum != null && !expectnum.equals("")) {
					lotteryCount = Integer.parseInt(expectnum);
				}
				String orderId = GenerateOrderNoUtil.getOrderNumber();
				if (Integer.valueOf(phase.substring(8, 11)) < Integer
						.valueOf(DateUtils.getCurrentChongQingShiShicai()
								.substring(8, 11))
						|| Integer.valueOf(phase.substring(0, 8)) > Integer
								.valueOf(DateUtils
										.getCurrentChongQingShiShicai()
										.substring(0, 8))) {

					Map<String, Object> model = new HashMap<String, Object>();
					model.put("current",
							DateUtils.getCurrentChongQingShiShicai());
					model.put("leftsecond", DateUtils.getLeftMisecond());
					model.put("left", DateUtils
							.getLeftChongQingShiShicai(DateUtils
									.getCurrentChongQingShiShicai()));
					model.put("sucess", false);
					model.put("code", 2);
					System.out.println("投注失败：：："
							+ DateUtils.getCurrentChongQingShiShicai());
					model.put("msg", "已过下注时间!");
					return new ModelAndView("redirect:/cqssc/cqsscview", model);
				} else {
					List<Period> periods = new ArrayList<Period>();
					StringBuffer bufferperiods = new StringBuffer();
					Period period;
					if (null == beishulistsuc || beishulistsuc.equals("")) {
						period = new Period();
						period.setStatus(Period.STATUS_CURRENT);
						period.setLotteryCode("cqssc");
						period.setLotteryPeriod(phase);
						period.setCreateDate(new Date());
						period.setOrderId(orderId);
						period.setBeisu(1);
						periodService.save(period);
						periods.add(period);
						bufferperiods.append("<br>" + phase + "<br>1");
					} else {
						String[] sts = beishulistsuc.split("\\|");
						String[] parsh = sts[0].split(",");
						String[] beisus = sts[1].split(",");
						System.out.println("beishulistsuc：：：" + beishulistsuc);
						System.out.println("beishulistsuc：：：" + beishulistsuc);
						for (int i = 0; i < parsh.length; i++) {
							System.out.println("parsh：：：" + parsh[i]);
							System.out.println("beisus：：：" + beisus[i]);
							period = new Period();
							period.setStatus(Period.STATUS_CURRENT);
							period.setLotteryCode("cqssc");
							period.setLotteryPeriod(parsh[i]);
							period.setCreateDate(new Date());
							period.setOrderId(orderId);
							period.setBeisu(Integer.valueOf(beisus[i]));
							periodService.save(period);
							periods.add(period);
							bufferperiods.append("<br>" + parsh[i] + "|"
									+ beisus[i]);
						}
					}

					if (totalMoneyStr != null && !"".equals(totalMoneyStr)) {
						totalMoney = Integer.parseInt(totalMoneyStr);
					}

					Order order = new Order();
					order.setOrderId(orderId);
					order.setOrderNo(orderId);
					order.setCreateDate(new Date());
					order.setMemberUser(memberUser);
					order.setName(name);
					order.setOrderStatus(Order.HEMAI_BUY_ORDER);
					order.setOrderTime(new Date());
					order.setOrderType(Order.PROXY_BUY_ORDER);
					order.setPayStatus(Order.PAY_STATUS_NO);
					order.setPeriod(periods);
					order.setTotalMoney(totalMoney);
					order.setUpdateDate(new Date());
					order.setLotteryCount(lotteryCount);
					order.setIsCut(Integer.valueOf(ZjCut));
					orderService.save(order);
					String[] lotteryCodes = lotteryCode.split("\\$");
					OrderDetail orderDetail;
					StringBuffer buffer = new StringBuffer();
					for (int i = 0; i < lotteryCodes.length; i++) {
						orderDetail = new OrderDetail();
						orderDetail.setBuyCaiNumber(lotteryCodes[i]);
						buffer.append(lotteryCodes[i] + "<br>");
						orderDetail.setCreateDate(new Date());
						orderDetail.setOrder(order);
						orderDetail.setUpdateDate(new Date());

						orderDetailService.save(orderDetail);
					}

					Map<String, Object> model = new HashMap<String, Object>();
					model.put("totalMoneyStr", totalMoneyStr);
					model.put("lotteryCountStr", lotteryCountStr);
					model.put("orderId", order.getOrderNo());
					model.put("name", name);
					System.out.println("name::" + name + "----------"
							+ bufferperiods.toString());
					if (Integer.valueOf(ZjCut) == 1)
						model.put("ZJCut", "是");
					else
						model.put("ZJCut", "否");

					model.put("lotteryCodes", buffer.toString());
					model.put("periods", bufferperiods.toString());
					return new ModelAndView("order/jczqOrderConfirm", model);
				}
			} else {
				Map<String, Object> model = new HashMap<String, Object>();
				model.put("current", DateUtils.getCurrentChongQingShiShicai());
				model.put("leftsecond", DateUtils.getLeftMisecond());
				model.put("left", DateUtils.getLeftChongQingShiShicai(DateUtils
						.getCurrentChongQingShiShicai()));
				model.put("sucess", false);
				model.put("code", -1);
				model.put("msg", "未登录!");
				return new ModelAndView("redirect:/user/login", model);

			}
		} catch (Exception e) {
			e.printStackTrace();
			Map<String, Object> model = new HashMap<String, Object>();
			model.put("current", DateUtils.getCurrentChongQingShiShicai());
			model.put("leftsecond", DateUtils.getLeftMisecond());
			model.put("left", DateUtils.getLeftChongQingShiShicai(DateUtils
					.getCurrentChongQingShiShicai()));
			model.put("sucess", false);
			model.put("code", -1);
			model.put("msg", "服务器异常请退出重新下注");
			HttpSession session = request.getSession();
			if (session != null) {
				session.removeAttribute("memberUser");
			}
			return new ModelAndView("redirect:/user/login", model);
		}

	}

	/**
	 * 跳转到时时彩订单确认页面
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/order/orderconfirm")
	public String toJczqOrderConfirm(HttpServletRequest request, Model model) {
		String orderId = (String) request.getParameter("orderId");
		Order order = orderService.findOrderByOrderId(orderId);

		String totalMoneyStr = order.getTotalMoney() + "";
		String lotteryCountStr = order.getLotteryCount() + "";// 倍数
		StringBuffer bf = new StringBuffer();
		List<OrderDetail> detail = orderDetailService
				.findOrderDetailByOrderId(order);
		for (OrderDetail od : detail) {
			bf.append(od.getBuyCaiNumber());
			bf.append("$");
		}
		List<Period> periods = periodService.findPeriodByOId(orderId);
		StringBuffer bperiods = new StringBuffer();
		for (Period period : periods) {
			bperiods.append(period.getLotteryPeriod());
			bperiods.append("|");
			bperiods.append(period.getBeisu());
			bperiods.append(",");
		}
		model.addAttribute("totalMoneyStr", totalMoneyStr);
		model.addAttribute("lotteryCountStr", lotteryCountStr);
		model.addAttribute("selectNumber", bf.toString());
		model.addAttribute("spfbl", bperiods.toString());

		return "order/jczqOrderConfirm";
	}

	/**
	 * 跳转到竞彩足球进球数订单确认页面
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/order/jczq/jqs/orderconfirm")
	public String toJczqJqsOrderConfirm(HttpServletRequest request, Model model) {
		String totalMoneyStr = (String) request.getParameter("totalMoney");
		String lotteryCountStr = (String) request.getParameter("lotteryCount");// 倍数
		String lotteryInfoListStr = (String) request
				.getParameter("lotteryInfoList");

		String[] selectedLotteryInfoArray = null;

		List<JqsConfirmDTO> jqsConfirmList = new ArrayList<JqsConfirmDTO>();

		if (lotteryInfoListStr != null && !"".equals(lotteryInfoListStr)) {
			lotteryInfoListStr = lotteryInfoListStr.substring(0,
					lotteryInfoListStr.length() - 1);
			selectedLotteryInfoArray = lotteryInfoListStr.split(";");
			if (selectedLotteryInfoArray != null
					&& selectedLotteryInfoArray.length > 0) {
				String[] lotteryInfoArray = null;
				for (int i = 0; i < selectedLotteryInfoArray.length; i++) {

					JqsConfirmDTO jqsConfirmDTO = new JqsConfirmDTO();
					lotteryInfoArray = selectedLotteryInfoArray[i].split("_");
					jqsConfirmDTO.setLotteryNo(lotteryInfoArray[0]);
					jqsConfirmDTO.setLotteryDateStr(lotteryInfoArray[3]);
					jqsConfirmDTO.setPeilv(lotteryInfoArray[2]);
					jqsConfirmDTO.setGameNumber(lotteryInfoArray[4]);
					String footballMatchId = lotteryInfoArray[1];
					FootballMatch footBallMatch = footballMatchService
							.findFootballMatchById(Integer
									.parseInt(footballMatchId));
					;
					jqsConfirmDTO.setAwayTeam(footBallMatch == null ? ""
							: footBallMatch.getAwaysxName());
					jqsConfirmDTO.setHomeTeam(footBallMatch == null ? ""
							: footBallMatch.getHomesxName());

					jqsConfirmList.add(jqsConfirmDTO);
				}

			}
		}

		model.addAttribute("totalMoneyStr", totalMoneyStr);
		model.addAttribute("lotteryCountStr", lotteryCountStr);
		model.addAttribute("lotteryInfoListStr", lotteryInfoListStr);
		model.addAttribute("jqsConfirmList", jqsConfirmList);

		return "order/jczqJqsOrderConfirm";
	}

	/**
	 * 跳转到竞彩足球半全场订单确认页面
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/order/jczq/bqc/orderconfirm")
	public String toJczqbqcOrderConfirm(HttpServletRequest request, Model model) {
		String totalMoneyStr = (String) request.getParameter("totalMoney");
		String lotteryCountStr = (String) request.getParameter("lotteryCount");// 倍数
		String lotteryInfoListStr = (String) request
				.getParameter("lotteryInfoList");
		String chuanArrayStr = (String) request.getParameter("chuanArray");

		String[] selectedLotteryInfoArray = null;

		List<JqsConfirmDTO> jqsConfirmList = new ArrayList<JqsConfirmDTO>();

		if (!StringUtils.isBlank(lotteryInfoListStr)) {
			lotteryInfoListStr = lotteryInfoListStr.substring(0,
					lotteryInfoListStr.length() - 1);
			selectedLotteryInfoArray = lotteryInfoListStr.split(";");
			if (selectedLotteryInfoArray != null
					&& selectedLotteryInfoArray.length > 0) {
				String[] lotteryInfoArray = null;
				for (int i = 0; i < selectedLotteryInfoArray.length; i++) {

					JqsConfirmDTO jqsConfirmDTO = new JqsConfirmDTO();
					lotteryInfoArray = selectedLotteryInfoArray[i].split("_");
					jqsConfirmDTO.setLotteryNo(lotteryInfoArray[0]);
					jqsConfirmDTO.setLotteryDateStr(lotteryInfoArray[3]);
					jqsConfirmDTO.setPeilv(lotteryInfoArray[2]);
					jqsConfirmDTO.setGameNumber(lotteryInfoArray[4]);
					String footballMatchId = lotteryInfoArray[1];
					FootballMatch footBallMatch = footballMatchService
							.findFootballMatchById(Integer
									.parseInt(footballMatchId));
					;
					jqsConfirmDTO.setAwayTeam(footBallMatch == null ? ""
							: footBallMatch.getAwaysxName());
					jqsConfirmDTO.setHomeTeam(footBallMatch == null ? ""
							: footBallMatch.getHomesxName());

					jqsConfirmList.add(jqsConfirmDTO);
				}

			}
		}

		String[] selectedChuanArray = null;
		List<JinZuChuanConfirmDTO> chuanConfirmList = new ArrayList<JinZuChuanConfirmDTO>();
		if (!StringUtils.isBlank(chuanArrayStr)) {
			chuanArrayStr = chuanArrayStr.substring(0,
					chuanArrayStr.length() - 1);
			selectedChuanArray = chuanArrayStr.split(";");
			for (String chuan : selectedChuanArray) {
				JinZuChuanConfirmDTO chuanConfirmDTO = new JinZuChuanConfirmDTO();
				chuanConfirmDTO.setBuyNumber(lotteryCountStr);
				chuanConfirmDTO.setChuanType(chuan);
				chuanConfirmList.add(chuanConfirmDTO);
			}
		}

		model.addAttribute("totalMoneyStr", totalMoneyStr);
		model.addAttribute("lotteryCountStr", lotteryCountStr);
		model.addAttribute("lotteryInfoListStr", lotteryInfoListStr);
		model.addAttribute("jqsConfirmList", jqsConfirmList);
		model.addAttribute("chuanConfirmList", chuanConfirmList);

		return "order/jczqBqcOrderConfirm";
	}

	/**
	 * 竞彩足球半全场购买
	 * 
	 * @return
	 */
	@RequestMapping("/order/jczq_bqc/ajax_save")
	@ResponseBody
	public Map jczqBqcOrderSave(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sucess", false);// 默认为失败

		MemberUser memberUser = (MemberUser) request.getSession().getAttribute(
				MemberUser.FRONT_MEMBER_LOGIN_SESSION);
		try {
			if (memberUser != null) {

				String name = (String) request.getParameter("name");
				String totalMoneyStr = (String) request
						.getParameter("totalMoney");
				String lotteryCountStr = (String) request
						.getParameter("lotteryCount");
				String lotteryInfoListStr = (String) request
						.getParameter("lotteryInfoListStr");
				String chuanConfirmListStr = (String) request
						.getParameter("chuanConfirmListStr");

				Integer totalMoney = 0;
				Integer lotteryCount = 1;// 倍数
				String lotteryType = "2串1";

				if (!StringUtils.isBlank(chuanConfirmListStr)) {
					lotteryType = chuanConfirmListStr;
				}

				if (!StringUtils.isBlank(lotteryCountStr)) {
					lotteryCount = Integer.parseInt(lotteryCountStr);
				}

				if (!StringUtils.isBlank(totalMoneyStr)) {
					totalMoney = Integer.parseInt(totalMoneyStr);
				}
				String[] selectedLotteryInfoArray = null;

				if (!StringUtils.isBlank(lotteryInfoListStr)) {
					lotteryInfoListStr = lotteryInfoListStr.substring(0,
							lotteryInfoListStr.length() - 1);
					selectedLotteryInfoArray = lotteryInfoListStr.split(";");

					String orderId = GenerateOrderNoUtil.getOrderNumber();

					name = "竞彩足球-半全场-" + totalMoneyStr + "元";

					Order order = new Order();
					order.setOrderId(orderId);
					order.setCreateDate(new Date());
					order.setMemberUser(memberUser);
					order.setName(name);
					order.setOrderStatus(Order.ORDER_SUCESS);
					order.setOrderTime(new Date());
					order.setOrderType(Order.PROXY_BUY_ORDER);
					order.setPayStatus(Order.PAY_STATUS_NO);
					order.setTotalMoney(totalMoney);
					order.setUpdateDate(new Date());
					order.setLotteryCount(lotteryCount);
					order.setLotteryType(lotteryType);

					orderService.save(order);

					for (int i = 0; i < selectedLotteryInfoArray.length; i++) {
						String[] lotteryArray = selectedLotteryInfoArray[i]
								.split("_");
						OrderDetail orderDetail = new OrderDetail();
						orderDetail.setBuyCaiNumber(lotteryArray[0]);
						orderDetail.setCreateDate(new Date());
						orderDetail.setOrder(order);
						orderDetail.setUpdateDate(new Date());

						orderDetailService.save(orderDetail);
					}

					request.getSession().setAttribute("tradeOrder", order);

					map.put("sucess", true);
					map.put("msg", "下注成功!");
				} else {
					map.put("sucess", false);
					map.put("msg", "选择参数错误，下注失败!");
				}
			} else {
				map.put("sucess", false);
				map.put("msg", "未登录!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("sucess", false);
			map.put("msg", "下注失败!");
		}
		return map;
	}

	/**
	 * 支付成功以后调用
	 */
	public void updateOrderPayStatus(String orderId) {
		Order order = orderService.findOrderByOrderId(orderId);
		if (order.getPayStatus() != Order.PAY_STATUS_SUCESS) {
			// 如果是充值操作则完成积分充值逻辑
			if (order.getOrderType() == Order.RECHARGE_ORDER) {
				MemberUser mu = order.getMemberUser();
				mu.setAvailableScore(mu.getAvailableScore()
						+ order.getTotalMoney());
				mu.setTotalScore(mu.getTotalScore() + order.getTotalMoney());
				memberUserService.update(mu);
			}

			// 更改订单支付状态
			order.setPayStatus(Order.PAY_STATUS_SUCESS);
			order.setUpdateDate(new Date());
			orderService.update(order);
		}
	}

}
