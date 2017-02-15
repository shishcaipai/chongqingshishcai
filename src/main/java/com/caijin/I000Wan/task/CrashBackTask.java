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

@Lazy(true)
@Component("crashBackTask")
public class CrashBackTask {
	private final Logger log = LoggerFactory.getLogger(CrashBackTask.class);
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

	@Scheduled(cron = "0 0 12 * * ?")
	public void job1() {
		
	}
}
