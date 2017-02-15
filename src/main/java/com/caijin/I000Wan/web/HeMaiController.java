package com.caijin.I000Wan.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.caijin.I000Wan.entity.HeMaiOrder;
import com.caijin.I000Wan.entity.HeMaiOrderDetail;
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
import com.caijin.I000Wan.util.DateUtils;
import com.caijin.I000Wan.util.GenerateOrderNoUtil;
import com.caijin.I000Wan.util.OrderUtils;
import com.caijin.I000Wan.util.StaticDefine;

@Controller
@RequestMapping(value = "/hemai")
public class HeMaiController {
	private final Logger log = LoggerFactory.getLogger(HeMaiController.class);
	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderDetailService orderDetailService;

	@Autowired
	private PeriodService periodService;
	@Autowired
	private HeMaiOrderDetailService heMaiOrderDetailService;

	@Autowired
	private HeMaiOrderService heMaiService;

	@Autowired
	private MemberUserService memberUserService;

	@RequestMapping(value = "/hemaiview")
	public String hemaiview(HttpServletRequest request, Model model) {
		Integer pageNum = Integer
				.valueOf(request.getParameter("pageNum") == null ? "1"
						: request.getParameter("pageNum"));
		Integer size = heMaiOrderDetailService.findHemaiOrderDetailsSize();
		Integer pageSize = size % StaticDefine.PAGE_SIZE == 0 ? size
				/ StaticDefine.PAGE_SIZE : size / StaticDefine.PAGE_SIZE + 1;
		List<HeMaiOrderDetail> heMaiOrders = heMaiOrderDetailService
				.findAllHemaiOrderDetails((pageNum - 1)
						* StaticDefine.PAGE_SIZE, StaticDefine.PAGE_SIZE);
		if (null != heMaiOrders) {
			for (int i = 0; i < heMaiOrders.size(); i++) {
				int leftNum = heMaiService.getHemaiOrderFenNum(heMaiOrders
						.get(i));
				Integer buyNum = heMaiOrders.get(i).getSubGuaranteeSum()
						- leftNum;
				heMaiOrders.get(i).setOtherBuyNum(buyNum);
			}
		}
		model.addAttribute("heMaiOrderDetails", heMaiOrders);
		model.addAttribute("size", size);
		model.addAttribute("page", pageSize);
		model.addAttribute("pageNum", pageNum);
		return "caipiao/hemailist";
	}

	@RequestMapping(value = "/order")
	public ModelAndView orderSure(HttpServletRequest request) {
		Map<String, Object> model = new HashMap<String, Object>();
		MemberUser memberUser = (MemberUser) request.getSession().getAttribute(
				MemberUser.FRONT_MEMBER_LOGIN_SESSION);
		if (memberUser == null) {
			return new ModelAndView("redirect:/user/login", model);
		}
		try {
			if (memberUser != null) {
				try {
					memberUser = memberUserService.find(memberUser.getId());
					if (memberUser == null) {
						return new ModelAndView("redirect:/user/login", model);
					}
				} catch (Exception e) {

					return new ModelAndView("redirect:/user/login", model);
				}
				float totalMoney = 0;
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
				Integer lotteryCount = 1;
				log.info("name:" + name + "::phase:" + phase
						+ "::expectnum:" + expectnum + "::beishulistsuc:"
						+ beishulistsuc + "::lotteryCode:" + lotteryCode
						+ "::lotteryCountStr:" + lotteryCountStr + "::ZjCut:"
						+ ZjCut + "::lotteryTypeId:" + "::lotteryType:"
						+ "::ZjCut:" + ZjCut);
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

					model.put("current",
							DateUtils.getCurrentChongQingShiShicai());
					model.put("leftsecond", DateUtils.getLeftMisecond());
					model.put("left", DateUtils
							.getLeftChongQingShiShicai(DateUtils
									.getCurrentChongQingShiShicai()));
					model.put("sucess", false);
					model.put("code", 2);
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
						for (int i = 0; i < parsh.length; i++) {
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
					order.setOrderNo(orderId);
					order.setCreateDate(new Date());
					order.setMemberUser(memberUser);
					order.setName(name);
					order.setLotteryType(Period.SHISHI_CAI_CHONGQING);
					order.setOrderStatus(Order.ORDER_UN);
					order.setOrderTime(new Date());
					order.setOrderType(Order.HEMAI_BUY_ORDER);
					order.setPayStatus(Order.PAY_STATUS_NO);
					order.setPeriod(periods);
					order.setTotalMoney(totalMoney);
					order.setUpdateDate(new Date());
					order.setLotteryCount(lotteryCount);
					order.setIsCut(Integer.valueOf(ZjCut));
					orderService.save(order);
					String[] lotteryCodes = lotteryCode.split("\\$");
					log.info(" lotteryCodes=============" + lotteryCodes.length);
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
					request.setAttribute("order", order);
					model.put("sucess", true);
					model.put("code", 1);
					return new ModelAndView("caipiao/hemai", model);
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.put("sucess", false);
		model.put("code", 3);
		model.put("msg", "下注失败，请重新下注");
		return new ModelAndView("caipiao/hemai", model);
	}

	/**
	 * 发起合买订单成功确认
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/placeorder")
	public String placeAorde(HttpServletRequest request,Model model) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String orderID = (String) request.getParameter("orderId");
		// 份成
		String totalNum = (String) request.getParameter("allnum");
		// 认购份数
		String reNum = (String) request.getParameter("buynum");
		String isbaodi = (String) request.getParameter("isbaodi");
		// 保底份数
		String bdNum = (String) request.getParameter("baodinum");
		// 描述
		String dec = (String) request.getParameter("content");
		// 方案类型
		String type = (String) request.getParameter("isopen");
		Order order = orderService.findOrderByOrderId(orderID);
		if (order == null) {
			return "redirect:/user/login";
		}
		if (order.getOrderStatus() == Order.ORDER_FAILUE) {
			model.addAttribute("msg", "已过下单时效，请重新下单");
			return "redirect:/user/login";
		}

		List<Period> periods = periodService
				.findPeriodByOId(order.getOrderNo());
		boolean bo = OrderUtils.getCurrentDate(
				DateUtils.getCurrentChongQingShiShicai(), periods);
		if (!bo) {
			String msg = "订单已过期，请重新选择";
			model.addAttribute("msg", msg);
			model.addAttribute("code", 2);
			return "order/alipaysuccess";
		}

		MemberUser memberUser = (MemberUser) request.getSession().getAttribute(
				MemberUser.FRONT_MEMBER_LOGIN_SESSION);
		if (memberUser == null) {
			String msg = "登陆信息已失效，请重新登陆";
			model.addAttribute("msg", msg);
			model.addAttribute("code", 2);
			return "redirect:/user/login";
		}
		int i = Integer.valueOf(null == bdNum ? "0" : bdNum);
		int total = Integer.valueOf(totalNum);
		int reNums = Integer.valueOf(reNum);
		float money = Float.valueOf(order.getTotalMoney()) / total
				* (total - reNums);
		if (memberUser.getAvailableScore() > money) {
			HeMaiOrderDetail heMaiOrderDetail = new HeMaiOrderDetail();
			heMaiOrderDetail.setOrder(order);
			heMaiOrderDetail.setDesc(dec);
			heMaiOrderDetail.setHemaiId(order.getOrderNo());
			if (i > 0) {
				heMaiOrderDetail
						.setEffective(HeMaiOrderDetail.TYPE_EFFECTIVE_UN);
				heMaiOrderDetail.setMinimumGuaranteeSum(i);
			}
			heMaiOrderDetail.setSubGuaranteeSum(reNums);
			heMaiOrderDetail.setMemberUser(memberUser);
			heMaiOrderDetail.setFensum(total);
			heMaiOrderDetail
					.setFloatManay(Float.valueOf(order.getTotalMoney()));
			heMaiOrderDetail.setType(Integer.valueOf(type));
			heMaiOrderDetail.setCreateDate(new Date());
			heMaiOrderDetailService.save(heMaiOrderDetail);
			if (money > 0) {
				HeMaiOrder hemaiOrder = new HeMaiOrder();
				hemaiOrder.setCreateDate(new Date());
				hemaiOrder.setMemberUser(memberUser);
				hemaiOrder.setOrderNo(heMaiOrderDetail.getOrder().getOrderNo());

				hemaiOrder.setFloatManay(money);
				hemaiOrder.setSubGuaranteeSum(total - reNums);
				if (reNums == 0) {
					hemaiOrder
							.setEffective(HeMaiOrderDetail.TYPE_EFFECTIVE_SUCCESS);
				} else {
					hemaiOrder.setEffective(HeMaiOrderDetail.TYPE_EFFECTIVE_UN);
				}
				hemaiOrder.setOrderDetail(heMaiOrderDetail);
				order.setOrderType(Order.WAIT_ORDER);
				heMaiService.save(hemaiOrder);
				Order newOrder = new Order();
				newOrder.setOtherId(hemaiOrder.getId());
				newOrder.setMemberUser(memberUser);
				newOrder.setOrderType(Order.HEMAI_IMP_BUY_ORDER);
				newOrder.setOrderStatus(Order.ORDER_SUCESS);
				newOrder.setPayStatus(Order.PAY_STATUS_SUCESS);
				newOrder.setLotteryType(Period.SHISHI_CAI_CHONGQING);
				newOrder.setCreateDate(new Date());
				newOrder.setOrderTime(new Date());
				newOrder.setName("合买订单");
				newOrder.setTotalMoney(money);
				orderService.save(newOrder);
				memberUser.setAvailableScore(memberUser.getAvailableScore()
						- money);
				if (reNums == 0) {
					order.setOrderType(Order.ORDER_SUCESS);
					order.setPayStatus(Order.PAY_STATUS_SUCESS);
				}
				orderService.update(order);
				memberUserService.update(memberUser);
				
			}
			model.addAttribute("code", 1);
			return "order/alipaysuccess";
		} else {
			String msg = "用户余额不足,请充值";
			model.addAttribute("msg", msg);
			model.addAttribute("code", 4);
			return "order/alipaysuccess";
		}
	}

	/**
	 * 合买订单
	 * 
	 * @param memberUser
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/submithemaiorder", method = RequestMethod.POST)
	@ResponseBody
	public Map saveBasItemInfo(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String msg = "";
		Map result = new HashMap();
		result.put("sucess", false);
		result.put("code", 0);
		try {
			MemberUser memberUser = (MemberUser) request.getSession()
					.getAttribute(MemberUser.FRONT_MEMBER_LOGIN_SESSION);
			if (memberUser != null) {
				String betId = (String) request.getParameter("betId");
				String subscribeAmount = (String) request
						.getParameter("subscribeAmount");
				MemberUser user = memberUserService.findByUserName(memberUser
						.getUserName());
				HeMaiOrderDetail detail = heMaiOrderDetailService.find(betId);
				Order order = orderService.findOrderByOrderId(detail.getOrder()
						.getOrderNo());
				if (order.getOrderStatus() == Order.ORDER_FAILUE) {
					msg = "订单已过期，请重新选择";
					result.put("code", 2);
					result.put("msg", msg);
					return result;
				}
				List<Period> periods = periodService.findPeriodByOId(detail
						.getOrder().getOrderNo());
				boolean bo = OrderUtils.getCurrentDate(
						DateUtils.getCurrentChongQingShiShicai(), periods);
				if (!bo) {
					msg = "订单已过期，请重新选择";
					result.put("code", 2);
					result.put("msg", msg);
					return result;
				}
				Integer buyed = (heMaiService.getHemaiOrderFenNum(detail) + Integer
						.valueOf(subscribeAmount));
				if (buyed <= (detail.getSubGuaranteeSum())) {
					float a = Float.valueOf(detail.getOrder().getTotalMoney())
							/ Float.valueOf(detail.getFensum());
					if (a * Float.valueOf(subscribeAmount) < memberUser
							.getAvailableScore()) {
						HeMaiOrder hemaiOrder = new HeMaiOrder();
						hemaiOrder.setCreateDate(new Date());
						hemaiOrder.setMemberUser(user);
						hemaiOrder.setOrderNo(detail.getOrder().getOrderNo());

						hemaiOrder.setFloatManay(a
								* Float.valueOf(subscribeAmount));
						hemaiOrder.setSubGuaranteeSum(Integer
								.valueOf(subscribeAmount));
						hemaiOrder
								.setEffective(HeMaiOrderDetail.TYPE_EFFECTIVE_UN);
						hemaiOrder.setOrderDetail(detail);
						heMaiService.save(hemaiOrder);
						float money = a * Float.valueOf(subscribeAmount);
						memberUser.setAvailableScore(memberUser
								.getAvailableScore()
								- a
								* Float.valueOf(subscribeAmount));
						memberUserService.update(memberUser);
						if (heMaiService.getHemaiOrderFenNum(detail) == (detail
								.getSubGuaranteeSum())) {
							detail.setEffective(HeMaiOrderDetail.TYPE_EFFECTIVE_SUCCESS);
							heMaiOrderDetailService.update(detail);
							order.setOrderStatus(Order.ORDER_SUCESS);
							order.setPayStatus(Order.PAY_STATUS_SUCESS);
							orderService.update(order);
							Order newOrder = new Order();
							newOrder.setOtherId(hemaiOrder.getId());
							newOrder.setMemberUser(memberUser);
							newOrder.setOrderType(Order.HEMAI_IMP_BUY_ORDER);
							newOrder.setOrderStatus(Order.ORDER_SUCESS);
							newOrder.setPayStatus(Order.PAY_STATUS_SUCESS);
							newOrder.setLotteryType(Period.SHISHI_CAI_CHONGQING);
							newOrder.setCreateDate(new Date());
							newOrder.setOrderTime(new Date());
							newOrder.setName("合买订单");
							newOrder.setTotalMoney(money);
							orderService.save(newOrder);
							// MemberUser vUser = detail.getMemberUser();
							// //扣除当时锁定的钱
							// if (detail.getFensum()
							// - detail.getSubGuaranteeSum() > 0) {
							// vUser.setActionScore(vUser.getActionScore()
							// - ((Float.valueOf(order.getTotalMoney())) / Float
							// .valueOf(detail.getFensum()))
							// * (detail.getFensum() - detail
							// .getSubGuaranteeSum()));
							// memberUserService.update(vUser);
							// }

						}
						msg = "购买成功";
						result.put("sucess", true);
						result.put("code", 1);
					} else {

						msg = "用户余额不足,请充值";
						result.put("sucess", false);
						result.put("code", 4);
					}
				} else {
					msg = "订单份数不够，请重新选择";
					result.put("sucess", false);
					result.put("code", 2);
				}

			} else {
				msg = "请先登陆";
				result.put("code", 3);
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "购买失败，请重新选择";
			result.put("code", 2);
		}
		result.put("msg", msg);
		return result;
	}

	private void renderText(HttpServletResponse response, Object result)
			throws IOException {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		out.print(result);
		out.flush();
		out.close();
	}
}
