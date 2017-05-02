package com.caijin.I000Wan.web.boss;

import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caijin.I000Wan.entity.HeMaiOrder;
import com.caijin.I000Wan.entity.HeMaiOrderDetail;
import com.caijin.I000Wan.entity.LotteryPeriod;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.OrderDetail;
import com.caijin.I000Wan.entity.Period;
import com.caijin.I000Wan.service.HeMaiOrderDetailService;
import com.caijin.I000Wan.service.HeMaiOrderService;
import com.caijin.I000Wan.service.LetteryPeriodService;
import com.caijin.I000Wan.service.MemberUserService;
import com.caijin.I000Wan.service.OrderDetailService;
import com.caijin.I000Wan.service.OrderService;
import com.caijin.I000Wan.service.PeriodService;
import com.caijin.I000Wan.util.BonusUtil;
import com.caijin.I000Wan.util.ConstantUtil;
import com.caijin.I000Wan.util.DataGridModel;
import com.caijin.I000Wan.util.GenerateOrderNoUtil;
import com.caijin.I000Wan.util.Mum;
import com.caijin.I000Wan.util.OrderUtils;
import com.caijin.I000Wan.util.PageModel;
import com.caijin.I000Wan.util.Result;
import com.caijin.I000Wan.util.StaticDefine;
import com.caijin.I000Wan.web.OrderController;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/boss")
public class OrderAction {
	private final Logger log = LoggerFactory.getLogger(OrderAction.class);
	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderDetailService orderDetailService;

	@Autowired
	private PeriodService periodlService;

	@Autowired
	private LetteryPeriodService letteryperiodlService;

	@Autowired
	private MemberUserService memberUserService;

	@Autowired
	private HeMaiOrderDetailService heMaiOrderDetailService;
	@Autowired
	private HeMaiOrderService heMaiOrderService;

	public static Map<String, Order> currertOrder = new HashMap<String, Order>();

	@RequestMapping("/order/hlist")
	public String orderHeiList() {

		return "boss/order/hlist";
	}

	@RequestMapping("/order/hajax_list")
	@ResponseBody
	public Result findHeiOrderList(DataGridModel dgm,
			HttpServletRequest request, PageModel pageModel) {
		String userName = request.getParameter("userName");
		String realName = request.getParameter("realName");
		String telephone = request.getParameter("telephone");
		String orderType = Order.HEMAI_BUY_ORDER + "";
		String orderStatus = request.getParameter("orderStatus");
		String payStatus = request.getParameter("payStatus");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		pageModel = new PageModel(dgm.getPage(), dgm.getRows(), null);
		Result result = orderService.findOrderListByCondition(pageModel,
				userName, realName, telephone, orderType, orderStatus,
				payStatus, startDate, endDate);
		for (int i = 0; i < result.getRows().size(); i++) {
			Map<String, Object> map = (Map<String, Object>) result.getRows()
					.get(i);
			if (map.containsKey("order_no")) {
				List<OrderDetail> list = orderDetailService
						.findOrderDetailByOrderId((String) map.get("order_no"));
				if (list != null && !list.isEmpty()) {
					map.put("number", list.get(0).getBuyCaiNumber());
				}
				List<Period> lists = periodlService
						.findPeriodByOId((String) map.get("order_no"));
				if (lists != null && !lists.isEmpty()) {
					map.put("prash", lists.get(0).getLotteryPeriod());
				}
			}
		}
		return result;
	}

	@RequestMapping("/order/list")
	public String orderAllList() {

		return "boss/order/list";
	}

	@RequestMapping("/order/ajax_list")
	@ResponseBody
	public Result findAllOrderList(DataGridModel dgm,
			HttpServletRequest request, PageModel pageModel) {
		String userName = request.getParameter("userName");
		String realName = request.getParameter("realName");
		String telephone = request.getParameter("telephone");
		String orderType = request.getParameter("orderType");
		String orderStatus = request.getParameter("orderStatus");
		String payStatus = request.getParameter("payStatus");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		pageModel = new PageModel(dgm.getPage(), dgm.getRows(), null);
		Result result = orderService.findOrderListByCondition(pageModel,
				userName, realName, telephone, orderType, orderStatus,
				payStatus, startDate, endDate);
		for (int i = 0; i < result.getRows().size(); i++) {
			Map<String, Object> map = (Map<String, Object>) result.getRows()
					.get(i);
			if (map.containsKey("order_no")) {
				List<OrderDetail> list = orderDetailService
						.findOrderDetailByOrderId((String) map.get("order_no"));
				if (list != null && !list.isEmpty()) {
					map.put("number", list.get(0).getBuyCaiNumber());
				}
				List<Period> lists = periodlService
						.findPeriodByOId((String) map.get("order_no"));
				if (lists != null && !lists.isEmpty()) {
					map.put("prash", lists.get(0).getLotteryPeriod());
				}
			}
		}
		return result;
	}

	@RequestMapping("/order/order_detail")
	@ResponseBody
	public Map getOrderDetail(HttpServletRequest request,
			HttpServletResponse response) {
		String orderNo = request.getParameter("orderNo");
		List<OrderDetail> details = new ArrayList<OrderDetail>();
		List<Period> periods = new ArrayList<Period>();
		ObjectMapper mapper = new ObjectMapper(); // 转换器
		try {
			details = orderDetailService.findOrderDetailByOrderId(orderNo);
			periods = periodlService.findPeriodByOId(orderNo);
		} catch (Exception e) {
			e.printStackTrace();
			details = new ArrayList<OrderDetail>();
		}
		Map<String, List> map = new HashMap<String, List>();
		map.put("detail", details);
		map.put("period", periods);
		return map;
	}

	/**
	 * 更改订单
	 * 
	 * @param memberUser
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/order/updateNum", method = RequestMethod.POST)
	public void updateOderDetailNum(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String json = request.getParameter("orders");
		String orderNo = request.getParameter("orderNo");
		log.info("----------" + json);
		String msg = "";
		int i = 0;
		int length = 0;
		try {
			Order order = orderService.findOrderByOrderId(orderNo);

			if (order.getOrderStatus() == Order.ORDER_SUCESS
					&& order.getPayStatus() == Order.PAY_STATUS_SUCESS
					&& !(order.getWprizeStatus() == Order.WPRIS_STATUS_ALL || order
							.getWprizeStatus() == Order.WPRIS_STATUS_PORTION)) {
				order.setAutoPrizes(false);
				order.setAutoDrawn(false);
				orderService.update(order);
				if (json != null && !json.equals("")) {
					ObjectMapper mapper = new ObjectMapper();
					List<Mum> lendReco = mapper.readValue(json,
							new TypeReference<List<Mum>>() {
							});
					length = lendReco.size();
					for (Mum mum : lendReco) {
						OrderDetail detail = orderDetailService.find(mum
								.getId());
						detail.setBuyCaiNumber(mum.getNum());
						orderDetailService.update(detail);
						i++;
					}
					// 重新执行计算中奖流程
					List<OrderDetail> orderDetails = orderDetailService
							.findOrderDetailByOrderId(order);
					List<Period> periods = periodlService.findPeriodByOId(order
							.getOrderNo());
					LotteryPeriod letteryPeriod;
					float currentMoney = 0;
					// 计算中奖过程
					for (Period period : periods) {
						letteryPeriod = letteryperiodlService.findByPeriod(
								period.getLotteryCode(),
								period.getLotteryPeriod());

						if (letteryPeriod != null) {
							for (OrderDetail detail : orderDetails) {
								float money = BonusUtil.getLotteryHondleBonus(
										BonusUtil.getBonusNumber(letteryPeriod
												.getLotteryPeriod()), detail
												.getBuyCaiNumber());
								money = money * period.getBeisu();
								if (money > 0) {
									period.setMoney(money);
									period.setWinning(Period.WINNING_CURRENT);
									periodlService.update(period);
									currentMoney = currentMoney + money;
								} else {
									period.setWinning(Period.winning_AFTER);
									periodlService.update(period);
								}

							}

						}
						// }
					}
					if (periodlService.getPeriodUNStatusByOId(order
							.getOrderNo()) == 0) {
						if (currentMoney > 0) {
							order.setWprizeStatus(Order.WPRIS_STATUS_ALL);
						} else {
							if (order.getWprizeStatus() == Order.WPRISE_STATUS_NO)
								order.setWprizeStatus(Order.WPRIS_STATUS_WI);
						}
						order.setCurrentWPMoney(currentMoney);
						orderService.update(order);
					} else {
						if (currentMoney > 0) {
							order.setWprizeStatus(Order.WPRIS_STATUS_PORTION);
						} else {
							// 不处理当前状态 还有期数未计算
						}
						order.setCurrentWPMoney(currentMoney);
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
							heMaiOrder.setCurrentWPMoney((order
									.getCurrentWPMoney() / heiMaiDetail
									.getFensum())
									* heMaiOrder.getSubGuaranteeSum());
							heMaiOrderService.update(heMaiOrder);
							or = orderService.findOrderByOrderId(heMaiOrder
									.getId());
							if (or != null) {
								or.setCurrentWPMoney(heMaiOrder
										.getCurrentWPMoney());
								or.setWprizeStatus(order.getWprizeStatus());
								orderService.update(or);
							}

						}
					}
					order = orderService.findOrderByOrderId(order.getId());
					// 发奖
					if (order.isAutoPrizes()) {
						if (!currertOrder.containsKey(orderNo)) {
							currertOrder.put(orderNo, order);
						if (order.getOrderType() == Order.PROXY_BUY_ORDER) {
							// 如果没有发过奖，则把所有统计中奖金额全部发放
							if (order.getCashBackStatus() == Order.CASHBACKSTATUS_NO) {
								currentMoney = order.getCurrentWPMoney();
							}
							if (currentMoney > 0) {
								Order newOrder = new Order();
								newOrder.setOrderType(Order.AWARD_ORDER);
								newOrder.setOrderNo(GenerateOrderNoUtil
										.getOrderNumber());
								MemberUser memberUser = order.getMemberUser();
								memberUser.setAvailableScore(currentMoney
										+ memberUser.getAvailableScore());
								newOrder.setOrderStatus(Order.ORDER_SUCESS);
								newOrder.setCreateDate(new Date());
								newOrder.setUpdateDate(new Date());
								newOrder.setOtherId(order.getOrderNo());
								newOrder.setMemberUser(memberUser);
								newOrder.setTotalMoney(currentMoney);
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
									MemberUser memberUser = heMaiOrder
											.getMemberUser();
									memberUser.setAvailableScore(funMoney
											+ memberUser.getAvailableScore());
									newOrder.setOrderStatus(Order.ORDER_SUCESS);
									newOrder.setCreateDate(new Date());
									newOrder.setUpdateDate(new Date());
									newOrder.setTotalMoney(funMoney);
									newOrder.setOtherId(order.getOrderNo());
									newOrder.setMemberUser(memberUser);
									orderService.save(newOrder);
									memberUserService.update(memberUser);
									or = orderService
											.findOrderByOrderId(heMaiOrder
													.getId());
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
						currertOrder.remove(orderNo);
					}else{
						msg = "修改成功，但有其他任务在处理发奖，不再处理发奖"; 
				 }

					 }

				}
				if (length == i) {
					msg = "修改成功";
				} else if (i == 0) {
					msg = "修改成功";
				} else if (i < length) {
					msg = "修改部分成功";
				}
				orderService.update(order);
				orderService.clear();
				memberUserService.clear();
				log.info(i + "----------" + length);
			} else {
				msg = "无效订单或订单已发奖，不允许修改状态";
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "修改失败";
		}
		renderText(response, msg);
	}

	/**
	 * 修改开奖方式
	 * 
	 * @param memberUser
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/order/updateAutoPrizes", method = RequestMethod.POST)
	public void updateOderAutoPrizes(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String auto = request.getParameter("autoPrizes");
		String orderNo = request.getParameter("orderNo");
		String type = request.getParameter("type");

		boolean autoPrizes = Boolean.valueOf(auto);
		String msg = "";
		if (type != null && type.equals("2")) {
			if (ConstantUtil.AUTO_PRIZES) {
				msg = "1";
			} else {
				msg = "0";
			}
			renderText(response, msg);
			return;
		} else if (type != null && type.equals("3")) {
			if ("1".equals(auto)) {
				autoPrizes = true;
			} else {
				autoPrizes = false;
			}
			ConstantUtil.AUTO_DRAWN = autoPrizes;
			ConstantUtil.AUTO_PRIZES = autoPrizes;
			renderText(response, "修改成功");
			return;
		}
		try {
			Order order = orderService.findOrderByOrderId(orderNo);
			if (order.getCashBackStatus() == order.CASHBACKSTATUS_PORTION) {
				msg = "已经部分发过奖了，不允许修改成自动发奖";
			} else {
				order.setAutoPrizes(!autoPrizes);
				order.setAutoDrawn(!autoPrizes);
				orderService.update(order);
				orderService.clear();
				msg = "修改成功";
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "修改失败";
		}
		renderText(response, msg);
	}

	@RequestMapping("/order/zjlist")
	public String orderzjList() {

		return "boss/zj/list";
	}

	/**
	 * 执行手动发奖流程
	 * 
	 * @param memberUser
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/order/manualAwards", method = RequestMethod.POST)
	public void manualAwards(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String orderNo = request.getParameter("orderNo");
		String msg = "";
		if (!currertOrder.containsKey(orderNo)) {
			try {
				Order order = orderService.findOrderByOrderId(orderNo);
				currertOrder.put("orderNo", order);
				if (order.getWprizeStatus() == Order.WPRIS_STATUS_ALL
						|| order.getWprizeStatus() == Order.WPRIS_STATUS_PORTION) {
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
							letteryPeriod = letteryperiodlService.findByPeriod(
									period.getLotteryCode(),
									period.getLotteryPeriod());

							if (letteryPeriod != null) {
								for (OrderDetail detail : orderDetails) {
									float money = BonusUtil
											.getLotteryHondleBonus(
													BonusUtil
															.getBonusNumber(letteryPeriod
																	.getLotteryPeriod()),
													detail.getBuyCaiNumber());
									if (money > 0) {
										money = money * period.getBeisu();
										period.setMoney(money);
										period.setWinning(Period.WINNING_CURRENT);
										periodlService.update(period);
										currentMoney = currentMoney + money;
									} else {
										period.setMoney(money
												* period.getBeisu());
										period.setWinning(Period.winning_AFTER);
										periodlService.update(period);
									}

								}

							}
						}
					}
					if (periodlService.getPeriodUNStatusByOId(order
							.getOrderNo()) == 0) {
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
							heMaiOrder.setCurrentWPMoney((order
									.getCurrentWPMoney() / heiMaiDetail
									.getFensum())
									* heMaiOrder.getSubGuaranteeSum());
							heMaiOrderService.update(heMaiOrder);
							or = orderService.findOrderByOrderId(heMaiOrder
									.getId());
							if (or != null) {
								or.setCurrentWPMoney(heMaiOrder
										.getCurrentWPMoney());
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
							newOrder.setOrderNo(GenerateOrderNoUtil
									.getOrderNumber());
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
								MemberUser memberUser = heMaiOrder
										.getMemberUser();
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
								or = orderService.findOrderByOrderId(heMaiOrder
										.getId());
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
					// }

				}
				memberUserService.clear();
				msg = "发奖成功";
			} catch (Exception e) {
				e.printStackTrace();
				msg = "发奖失败";
			}
			currertOrder.remove(orderNo);
		} else {
			msg = "订单正在计算中，请不要重复提交发奖";
		}
		renderText(response, msg);
	}

	/**
	 * 开奖结果列表
	 */
	@RequestMapping("/order/kainanglist")
	public String orderkjList() {

		return "boss/zj/lotterylist";
	}

	/**
	 * 开奖结果列表
	 * 
	 * @param dgm
	 * @param request
	 * @param pageModel
	 * @return
	 */
	@RequestMapping("/order/loresults_list")
	@ResponseBody
	public Result findlotteryResults(DataGridModel dgm,
			HttpServletRequest request, PageModel pageModel) {
		pageModel = new PageModel(dgm.getPage(), dgm.getRows(), null);
		Result result = periodlService.getPeriodResults(pageModel);
		return result;
	}

	/**
	 * 录入开奖结果
	 * 
	 * @param memberUser
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/order/lotteryResults", method = RequestMethod.POST)
	public void enterlotteryResults(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String msg = "";
		String lotteryCode = request.getParameter("lotteryCode");
		String lotteryPeriod = request.getParameter("lotteryPeriod");
		String periodNumber = request.getParameter("periodNumber");
		String opentime = request.getParameter("opentime");
		LotteryPeriod lP = new LotteryPeriod();
		lP.setLotteryCode(lotteryCode);
		lP.setLotteryPeriod(lotteryPeriod);
		lP.setOpentime(opentime);
		lP.setOpentimestamp(System.currentTimeMillis());
		lP.setPeriodNumber(periodNumber);

		try {
			letteryperiodlService.save(lP);
			msg = "修改成功";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "修改失败";
		}
		renderText(response, msg);
	}

	@RequestMapping("/order/zjajax_list")
	@ResponseBody
	public Result findzjOrderList(DataGridModel dgm,
			HttpServletRequest request, PageModel pageModel) {
		String userName = request.getParameter("userName");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		pageModel = new PageModel(dgm.getPage(), dgm.getRows(), null);
		Result result = orderService.findzjOrderListByCondition(pageModel,
				userName, startDate, endDate);
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
