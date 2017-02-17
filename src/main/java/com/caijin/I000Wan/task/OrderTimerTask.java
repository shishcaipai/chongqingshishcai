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
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.Period;
import com.caijin.I000Wan.service.HeMaiOrderDetailService;
import com.caijin.I000Wan.service.HeMaiOrderService;
import com.caijin.I000Wan.service.LetteryPeriodService;
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

	@Scheduled(cron = "0 0/5 *  * * ? ")
	public void job1() {
		String qinhao = DateUtils.getShangQiChongQingShiShicai();
		log.info("订单过期通知任务进行中。。。" + qinhao);
		List<Order> orders = orderService.findOrderByStatus(Order.WAIT_ORDER);
		log.info("订单过期通知任务进行中。。。" +( orders==null?null:orders.size()));
		for (Order order : orders) {
			List<Period> periods = pdService
					.findPeriodByOId(order.getOrderNo());
			boolean bo = OrderUtils.getCurrentDate(
					DateUtils.getCurrentChongQingShiShicai(), periods);
			log.info("订单过期通知任务进行中。。。有过期订单"+order.getOrderNo()+"-------"+bo);
			if (!bo) {
				if (order.getOrderType() == Order.HEMAI_BUY_ORDER) {
					HeMaiOrderDetail detail = heMaiOrderDetailService
							.findOrderHemaiDetailByOrderId(order);
					int leftNum = heMaiOrderService.getHemaiOrderFenNum(detail);
					if(detail!=null){
					if (detail.getMinimumGuaranteeSum() >= leftNum) {

						HeMaiOrder hemaiOrder = new HeMaiOrder();
						hemaiOrder.setCreateDate(new Date());
						hemaiOrder.setMemberUser(detail.getMemberUser());
						hemaiOrder.setOrderNo(detail.getOrder().getOrderNo());
						float a = Float.valueOf(detail.getOrder()
								.getTotalMoney())
								/ Float.valueOf(detail.getFensum());
						hemaiOrder.setFloatManay(a * Float.valueOf(leftNum));
						hemaiOrder.setSubGuaranteeSum(Integer.valueOf(leftNum));
						hemaiOrder.setOrderDetail(detail);
						heMaiOrderService.save(hemaiOrder);

						detail.setEffective(HeMaiOrderDetail.TYPE_EFFECTIVE_SUCCESS);
						heMaiOrderDetailService.update(detail);
						order.setOrderStatus(Order.ORDER_SUCESS);
						order.setPayStatus(Order.PAY_STATUS_SUCESS);
						orderService.update(order);
						log.info("订单过期通知任务进行中。。。成功" +order.getOrderNo());
					} else {
						order.setOrderStatus(Order.ORDER_FAILUE);
						order.setPayStatus(Order.PAY_STATUS_OFFTIME);
						orderService.update(order);
					}
					}else{
//						orderService.delete(order);
					}
				} else {
					order.setOrderStatus(Order.ORDER_FAILUE);
					order.setPayStatus(Order.PAY_STATUS_OFFTIME);
					orderService.update(order);
					log.info("订单过期通知任务进行中。。。失败" +order.getOrderNo());
				}
			}
		}
	}
}
