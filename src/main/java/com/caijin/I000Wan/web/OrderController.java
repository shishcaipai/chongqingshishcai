package com.caijin.I000Wan.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.OrderDetail;
import com.caijin.I000Wan.entity.Period;
import com.caijin.I000Wan.service.HeMaiOrderDetailService;
import com.caijin.I000Wan.service.HeMaiOrderService;
import com.caijin.I000Wan.service.MemberUserService;
import com.caijin.I000Wan.service.OrderDetailService;
import com.caijin.I000Wan.service.OrderService;
import com.caijin.I000Wan.service.PeriodService;
import com.caijin.I000Wan.service.UserService;
import com.caijin.I000Wan.util.DateUtils;
import com.caijin.I000Wan.util.GenerateOrderNoUtil;

/**
 * 订单控制层
 * 
 * @author Jeff
 * @since 2014-07-21
 */
@Controller
public class OrderController {
	private final Logger log = LoggerFactory.getLogger(OrderController.class);
	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderDetailService orderDetailService;

	@Autowired
	private PeriodService periodService;

	@Autowired
	private MemberUserService memberUserService;

	@Autowired
	private HeMaiOrderDetailService heMaiOrderDetailService;

	@Autowired
	private HeMaiOrderService heMaiService;

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
		return "user/recharge";
	}

	/**
	 * 跳转到支付页面
	 * 
	 * @return
	 */
	@RequestMapping("/sscorder/alipay")
	public String toAlipay(HttpServletRequest request, Model model) {
		String tradeNo = request.getParameter("orderId");
		String subject = request.getParameter("subject");
		String totalMoney = request.getParameter("totalMoney");

		MemberUser memberUser = (MemberUser) request.getSession().getAttribute(
				MemberUser.FRONT_MEMBER_LOGIN_SESSION);
		try {
			memberUser = memberUserService.find(memberUser.getId());
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "用户超时");
			return "redirect:/user/login";
		}
		if (memberUser == null) {
			model.addAttribute("msg", "用户超时");
			return "redirect:/user/login";
		}
		try {
			if (memberUser.getAvailableScore() > Integer.valueOf(totalMoney)) {
				memberUser.setAvailableScore(memberUser.getAvailableScore()
						- Integer.valueOf(totalMoney));

				Order order = orderService.findOrderByOrderId(tradeNo);
				if (order == null) {
					model.addAttribute("msg", "用户超时");
					return "redirect:/user/login";
				}
				if (order.PAY_STATUS_SUCESS == order.getPayStatus()) {
					model.addAttribute("msg", "请不要重复支付");
					return "order/alipaysuccess";
				}
				order.setPayStatus(Order.PAY_STATUS_SUCESS);
				order.setOrderStatus(Order.ORDER_SUCESS);
				memberUserService.update(memberUser);
				orderService.update(order);
				if (order.getIsZhuiHao() == 0) {
					int i = periodService.updatePeriodStatusByOId(
							order.getOrderNo(), Period.STATUS_CURRENT,
							Period.SHISHI_CAI_CHONGQING);
				} else {
					int i = periodService.updatePeriodStatusByOId(
							order.getOrderNo(), Period.STATUS_BEFORE,
							Period.SHISHI_CAI_CHONGQING);
				}
				model.addAttribute("code", 1);
				model.addAttribute("msg", "支付成功");
				return "order/alipaysuccess";
			} else {
				model.addAttribute("code", 2);
				model.addAttribute("msg", "用户余额不足,请充值");
				return "order/alipaysuccess";
			}
		} catch (Exception e) {

		}
		model.addAttribute("code", 2);
		model.addAttribute("msg", "订单出错，请重新下单");
		return "order/alipaysuccess";
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
				float totalMoney = 0;
				String totalMoneyStr = (String) request
						.getParameter("totalMoney");

				totalMoney = new Integer(totalMoneyStr);

				String orderId = GenerateOrderNoUtil.getOrderNumber();

				Order order = new Order();
				order.setOrderNo(orderId);
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

				// OrderDetail orderDetail = new OrderDetail();
				// orderDetail.setCreateDate(new Date());
				// orderDetail.setOrder(order);
				// orderDetail.setUpdateDate(new Date());
				//
				// orderDetailService.save(orderDetail);
				request.getSession().setAttribute("tradeOrder", order);

				map.put("orderId", order.getId());
				map.put("sucess", true);
				map.put("msg", "充值成功!");
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
				memberUser = memberUserService.find(memberUser.getId());
				float totalMoney = 0;
				// 投注名称
				String name = (String) request.getParameter("playname");
				name = new String(name.getBytes("ISO-8859-1"), "utf-8");
				// name = URLDecoder.decode(name);
				log.info("彩票名称::::" + name);
				log.info("彩票名称::::"
						+ new String(name.getBytes("ISO-8859-1"), "utf-8"));
				log.info("彩票名称::::" + new String(name.getBytes(), "GBK"));
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
				// 追号是否停
				String IsZhuihao = (String) request.getParameter("IsZhuihao");
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
					model.put("code", 4);
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
						period.setLotteryCode("cqssc");
						period.setLotteryPeriod(phase);
						period.setCreateDate(new Date());
						period.setOrderId(orderId);
						period.setBeisu(1);
						period.setStatus(Period.STATUS_AFTER);
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
							period.setLotteryCode("cqssc");
							period.setLotteryPeriod(parsh[i]);
							period.setCreateDate(new Date());
							period.setOrderId(orderId);
							period.setBeisu(Integer.valueOf(beisus[i]));
							period.setStatus(Period.STATUS_AFTER);
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
					order.setOrderNo(orderId);
					order.setCreateDate(new Date());
					order.setMemberUser(memberUser);
					order.setName(name);
					order.setLotteryType(Period.SHISHI_CAI_CHONGQING);
					order.setOrderStatus(Order.WAIT_ORDER);
					order.setOrderTime(new Date());
					order.setOrderType(Order.PROXY_BUY_ORDER);
					order.setPayStatus(Order.PAY_STATUS_NO);
					order.setPeriod(periods);
					order.setTotalMoney(totalMoney);
					order.setUpdateDate(new Date());
					order.setLotteryCount(lotteryCount);
					order.setIsCut(Integer.valueOf(ZjCut));
					order.setIsZhuiHao(Integer.valueOf(IsZhuihao));
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

}
