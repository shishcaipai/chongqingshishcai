package com.caijin.I000Wan.web;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
import com.caijin.I000Wan.util.StaticDefine;

@Controller
@RequestMapping(value = "/hemai")
public class HeMaiController {

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
	public String hemaiview(HttpServletRequest request,Model model) {
		Integer pageNum = Integer.valueOf(request.getParameter("pageNum") == null ? "1" : request.getParameter("pageNum"));
		Integer size = heMaiOrderDetailService.findHemaiOrderDetailsSize();
		Integer pageSize = size%StaticDefine.PAGE_SIZE == 0 ? size/StaticDefine.PAGE_SIZE : size/StaticDefine.PAGE_SIZE + 1;
		List<HeMaiOrderDetail> heMaiOrders = heMaiOrderDetailService.findAllHemaiOrderDetails((pageNum - 1) * StaticDefine.PAGE_SIZE, StaticDefine.PAGE_SIZE);
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
				// String lotteryTypeId = (String) request
				// .getParameter("lotteryTypeId");
				// // 投注彩票代码
				// String lotteryType = (String) request
				// .getParameter("lotteryType");
				Integer lotteryCount = 1;
				System.out.println("name:" + name + "::phase:" + phase
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
					order.setCreateDate(new Date());
					order.setMemberUser(memberUser);
					order.setName(name);
					order.setOrderStatus(Order.ORDER_SUCESS);
					order.setOrderTime(new Date());
					order.setOrderType(Order.PROXY_BUY_ORDER);
					order.setPayStatus(Order.PAY_STATUS_NO);
					order.setPeriod(periods);
					order.setTotalMoney(totalMoney);
					order.setUpdateDate(new Date());
					order.setLotteryCount(lotteryCount);
					order.setIsCut(Integer.valueOf(ZjCut));
					orderService.save(order);
					String[] lotteryCodes = lotteryCode.split("$");
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
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView("caipiao/hemai", model);
	}

	@RequestMapping(value = "/placeorder")
	public ModelAndView placeAorde(HttpServletRequest request) {
		Map<String, Object> model = new HashMap<String, Object>();
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
		//方案类型
		String type = (String) request.getParameter("isopen");
		Order order=orderService.findOrderByOrderId(orderID);
		MemberUser memberUser = (MemberUser) request.getSession().getAttribute(
				MemberUser.FRONT_MEMBER_LOGIN_SESSION);
		if (memberUser == null) {
			return new ModelAndView("redirect:/user/login", model);
		}
        HeMaiOrderDetail  heMaiOrderDetail=new HeMaiOrderDetail();
        heMaiOrderDetail.setOrder(order);
        heMaiOrderDetail.setDesc(dec);
        heMaiOrderDetail.setHemaiId(order.getOrderId());
        int i=Integer.valueOf(bdNum);
        int total=Integer.valueOf(totalNum);
        int reNums=Integer.valueOf(reNum);
         if(i>0){
        	 heMaiOrderDetail.setEffective(true); 
        	 heMaiOrderDetail.setMinimumGuaranteeSum(i);
         }
         heMaiOrderDetail.setSubGuaranteeSum(reNums);
         heMaiOrderDetail.setMemberUser(memberUser);
         heMaiOrderDetail.setFensum(total);
         heMaiOrderDetail.setFloatManay((float)((float)order.getTotalMoney()/total*reNums));
         heMaiOrderDetail.setType(Integer.valueOf(type));
         heMaiOrderDetailService.save(heMaiOrderDetail);
         if (order == null) {
				return new ModelAndView("redirect:/user/login");
			}
 		if ( memberUser.getAvailableScore() > Integer
 				.valueOf(order.getTotalMoney())) {
 			memberUser.setAvailableScore(memberUser.getAvailableScore()
 					- Integer.valueOf(order.getTotalMoney()));
// 			order.setPayStatus(Order.PAY_STATUS_SUCESS);
 			memberUserService.update(memberUser);
 			return new ModelAndView("order/alipaysuccess");
 		} 
		return new ModelAndView("order/alipaysuccess", model);
	}
}
