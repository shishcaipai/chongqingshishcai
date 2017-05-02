package com.caijin.I000Wan.task;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.caijin.I000Wan.entity.HeMaiOrder;
import com.caijin.I000Wan.entity.HeMaiOrderDetail;
import com.caijin.I000Wan.entity.LotteryPeriod;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.Period;
import com.caijin.I000Wan.service.HeMaiOrderDetailService;
import com.caijin.I000Wan.service.HeMaiOrderService;
import com.caijin.I000Wan.service.LetteryPeriodService;
import com.caijin.I000Wan.service.MemberUserService;
import com.caijin.I000Wan.service.OrderDetailService;
import com.caijin.I000Wan.service.OrderService;
import com.caijin.I000Wan.service.PeriodService;
import com.caijin.I000Wan.util.DateUtils;
import com.caijin.I000Wan.util.OrderUtils;
import com.caijin.I000Wan.web.AgentController;

@Lazy(false)
@Component("taskOrderJob")
public class OrderTimerTask {
	private final Logger log = LoggerFactory.getLogger(OrderTimerTask.class);
	@Autowired
	private LetteryPeriodService periodService;

	@Autowired
	private OrderService orderService;
	@Autowired
	private PeriodService pdService;

	@Autowired
	private OrderDetailService orderDetailService;
	@Autowired
	private HeMaiOrderDetailService heMaiOrderDetailService;
	@Autowired
	private HeMaiOrderService heMaiOrderService;
	@Autowired
	private MemberUserService memberUserservice;

	/**
	 * 下单任务 还需计算追号投注
	 */
	@Scheduled(cron = "0 0/1 *  * * ? ")
	public synchronized void job1() {
		synchronized (OrderTimerTask.class) {

			String shangQinhao = DateUtils
					.getLeftShangyiqiChongQingShiShicai(DateUtils
							.getCurrentChongQingShiShicai());
			log.info("执行该投注记录。。。" + shangQinhao);
			List<Period> periodList = pdService.findbyQIhao(shangQinhao,
					Period.STATUS_BEFORE);
			for (Period period : periodList) {
				Order order = orderService.findOrderByOrderId(period
						.getOrderId());
				if (order != null
						&& (order.getOrderType() == Order.HEMAI_BUY_ORDER || order
								.getOrderType() == Order.PROXY_BUY_ORDER)
						&& order.getIsZhuiHao() == 1 && order.getIsCut() == 1) {
					List<Period> p = pdService.findPeriodByOIdAndStatus(
							order.getOrderNo(), Period.WINNING_CURRENT);
					if (p != null && !p.isEmpty()) {
						// 待定
						period.setStatus(Period.STATUS_AFTER);
					} else {
						period.setStatus(Period.STATUS_CURRENT);
					}
				} else {
					period.setStatus(Period.STATUS_CURRENT);
				}
				pdService.update(period);
			}

			log.info("订单过期通知任务进行中。。。" + shangQinhao);
			List<Order> orders = orderService
					.findOrderByStatus(Order.WAIT_ORDER);

			for (Order order : orders) {
				List<Period> periods = pdService.findPeriodByOId(order
						.getOrderNo());
				boolean bo = OrderUtils.getCurrentDate(
						DateUtils.getCurrentChongQingShiShicai(), periods);
				log.info(order.getPayStatus() + "订单过期通知任务进行中。。。有过期订单"
						+ order.getOrderNo() + "-------" + bo);
				if (!bo) {
					if (order.getOrderType() == Order.HEMAI_BUY_ORDER) {
						HeMaiOrderDetail detail = heMaiOrderDetailService
								.findOrderHemaiDetailByOrderId(order);
						int leftNum = heMaiOrderService
								.getHemaiOrderFenNum(detail);
						log.info(leftNum + "订单过期通知任务进行中。leftNum。。有过期订单"
								+ order.getOrderNo() + "-------"
								+ detail.getFensum());
						leftNum = detail.getFensum() - leftNum;
						log.info(leftNum + "订单过期通知任务进行中。leftNum。。有过期订单"
								+ order.getOrderNo() + "-------");
						if (leftNum <= 0) {
							detail.setStatus(HeMaiOrderDetail.TYPE_EFFECTIVE_SUCCESS);
							heMaiOrderDetailService.update(detail);
							if (order.getIsZhuiHao() == 0) {
								pdService.updatePeriodStatusByOId(
										order.getOrderNo(),
										Period.STATUS_CURRENT,
										Period.SHISHI_CAI_CHONGQING);
							} else {
								pdService.updatePeriodStatusByOId(
										order.getOrderNo(),
										Period.STATUS_BEFORE,
										Period.SHISHI_CAI_CHONGQING);
							}
							orderService.updateByOrderNo(order.getOrderNo(),
									Order.ORDER_SUCESS);
							order.setOrderStatus(Order.ORDER_SUCESS);
							order.setPayStatus(Order.PAY_STATUS_SUCESS);
							orderService.update(order);
							continue;
						}
						log.info(detail + "订单过期通知任务进行中。detail。。有过期订单"
								+ order.getOrderNo() + "-------");
						if (detail != null) {
							log.info(detail.getMinimumGuaranteeSum()
									+ "订单过期通知任务进行中。detail.getMinimumGuaranteeSum()。。有过期订单"
									+ order.getOrderNo() + "-------");
							if (detail.getMinimumGuaranteeSum() >= leftNum
									&& leftNum > 0) {

								HeMaiOrder hemaiOrder = new HeMaiOrder();
								hemaiOrder.setCreateDate(new Date());
								hemaiOrder
										.setMemberUser(detail.getMemberUser());
								hemaiOrder.setOrderNo(detail.getOrder()
										.getOrderNo());
								float a = Float.valueOf(detail.getOrder()
										.getTotalMoney())
										/ Float.valueOf(detail.getFensum());
								hemaiOrder.setFloatManay(a
										* Float.valueOf(leftNum));
								hemaiOrder.setSubGuaranteeSum(leftNum);
								hemaiOrder.setOrderDetail(detail);
								detail.setStatus(HeMaiOrderDetail.TYPE_EFFECTIVE_SUCCESS);
								heMaiOrderDetailService.update(detail);
								order.setOrderStatus(Order.ORDER_SUCESS);
								order.setPayStatus(Order.PAY_STATUS_SUCESS);
								if (leftNum > 0) {
									int te = heMaiOrderService
											.getHemaiOrderFenNum(detail);
									if (detail.getFensum() - te <= 0) {
										continue;
									}
									log.info("订单过期通知任务进行中。。。保存订单::"
											+ hemaiOrder.getOrderNo()
											+ "----fensum"
											+ hemaiOrder.getSubGuaranteeSum());
									heMaiOrderService.save(hemaiOrder);
									Order newOrder = new Order();
									newOrder.setOrderNo(hemaiOrder.getId());
									newOrder.setOtherId(hemaiOrder.getOrderNo());
									newOrder.setMemberUser(order
											.getMemberUser());
									newOrder.setOrderType(Order.HEMAI_IMP_BUY_ORDER);
									newOrder.setOrderStatus(Order.WAIT_ORDER);
									newOrder.setPayStatus(Order.PAY_STATUS_SUCESS);
									newOrder.setLotteryType(Period.SHISHI_CAI_CHONGQING);
									newOrder.setCreateDate(new Date());
									newOrder.setOrderTime(new Date());
									newOrder.setName("合买跟单");
									newOrder.setTotalMoney(a
											* Float.valueOf(leftNum));
									float money = a * Float.valueOf(leftNum);
									if (hemaiOrder.getMemberUser()
											.getActionScore() > money) {
										hemaiOrder.setActionManay(money);
										hemaiOrder
												.getMemberUser()
												.setActionScore(
														hemaiOrder
																.getMemberUser()
																.getActionScore()
																- money);
									} else if (hemaiOrder.getMemberUser()
											.getActionScore() > 0
											&& hemaiOrder.getMemberUser()
													.getActionScore() < money) {
										float actionScore = hemaiOrder
												.getMemberUser()
												.getActionScore();
										hemaiOrder.setActionManay(money);
										hemaiOrder.getMemberUser()
												.setActionScore(0);
										hemaiOrder
												.getMemberUser()
												.setAvailableScore(
														hemaiOrder
																.getMemberUser()
																.getAvailableScore()
																- (money - actionScore));
									} else {
										hemaiOrder
												.getMemberUser()
												.setAvailableScore(
														hemaiOrder
																.getMemberUser()
																.getAvailableScore()
																- money);
									}
									memberUserservice.update(hemaiOrder
											.getMemberUser());
									orderService.save(newOrder);
								}
								if (order.getIsZhuiHao() == 0) {
									pdService.updatePeriodStatusByOId(
											order.getOrderNo(),
											Period.STATUS_CURRENT,
											Period.SHISHI_CAI_CHONGQING);
								} else {
									pdService.updatePeriodStatusByOId(
											order.getOrderNo(),
											Period.STATUS_BEFORE,
											Period.SHISHI_CAI_CHONGQING);
								}
								orderService.updateByOrderNo(
										order.getOrderNo(), Order.ORDER_SUCESS);
								orderService.update(order);
								log.info("订单过期通知任务进行中。。。成功"
										+ order.getOrderNo());
							} else {
								order.setOrderStatus(Order.ORDER_FAILUE);
								order.setPayStatus(Order.PAY_STATUS_OFFTIME);

								orderService.update(order);
								List<HeMaiOrder> hemaiOrder = heMaiOrderService
										.findOrderHemaiByOrderId(detail);
								if (hemaiOrder != null)
									for (HeMaiOrder heOrder : hemaiOrder) {
										heOrder.setStatus(HeMaiOrderDetail.TYPE_EFFECTIVE_FAIL);
										log.info("订单过期通知任务进行中。 失败是否执行。。订单出错:::"
												+ heOrder.getStatus());
										heMaiOrderService.update(heOrder);
										if (heOrder.getActionManay() > 0) {
											if (heOrder.getFloatManay() > heOrder
													.getActionManay()) {
												heOrder.getMemberUser()
														.setActionScore(
																heOrder.getMemberUser()
																		.getActionScore()
																		+ heOrder
																				.getActionManay());

												heOrder.getMemberUser()
														.setAvailableScore(
																heOrder.getMemberUser()
																		.getAvailableScore()
																		+ (heOrder
																				.getFloatManay() - heOrder
																				.getActionManay()));
											} else if (heOrder.getFloatManay() == heOrder
													.getActionManay()) {
												heOrder.getMemberUser()
														.setActionScore(
																heOrder.getMemberUser()
																		.getActionScore()
																		+ heOrder
																				.getFloatManay());
											}

										} else {
											heOrder.getMemberUser()
													.setAvailableScore(
															heOrder.getMemberUser()
																	.getAvailableScore()
																	+ heOrder
																			.getFloatManay());
										}

										Order ors = orderService
												.findOrderByTypeAndOrderId(
														Order.HEMAI_IMP_BUY_ORDER,
														heOrder.getId());
										ors.setOrderStatus(Order.ORDER_FAILUE);
										ors.setPayStatus(Order.PAY_STATUS_FANXIAN);
										Order od = new Order();
										od.setContent("合买方案,超时，退回金额");
										od.setOrderType(Order.DJ_ORDER);
										od.setOrderStatus(Order.ORDER_SUCESS);
										od.setOrderNo(System
												.currentTimeMillis() + "");
										od.setOtherId(order.getOrderNo());
										od.setTotalMoney(ors.getTotalMoney());
										od.setName("合买方案超时撤单");
										od.setMemberUser(heOrder
												.getMemberUser());
										memberUserservice.update(heOrder
												.getMemberUser());
										orderService.update(od);
										log.info("订单过期通知任务进行中。 更新"
												+ heOrder.getId());
										orderService.update(ors);

									}
								detail.setStatus(HeMaiOrderDetail.TYPE_EFFECTIVE_FAIL);
								heMaiOrderDetailService.update(detail);
							}
						} else {
						}
					} else {
						order.setOrderStatus(Order.ORDER_FAILUE);
						order.setPayStatus(Order.PAY_STATUS_OFFTIME);
						orderService.update(order);
						log.info("订单过期通知任务进行中。。。失败" + order.getOrderNo());
					}
				}
			}
		}
	}
}
