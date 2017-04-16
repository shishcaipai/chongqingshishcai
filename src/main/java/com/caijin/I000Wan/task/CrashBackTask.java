//package com.caijin.I000Wan.task;
//
//import java.util.ArrayList;
//import java.util.LinkedList;
//import java.util.List;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Lazy;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Component;
//
//import com.caijin.I000Wan.entity.Order;
//import com.caijin.I000Wan.service.HeMaiOrderDetailService;
//import com.caijin.I000Wan.service.HeMaiOrderService;
//import com.caijin.I000Wan.service.LetteryPeriodService;
//import com.caijin.I000Wan.service.OrderDetailService;
//import com.caijin.I000Wan.service.OrderService;
//import com.caijin.I000Wan.service.PeriodService;
//
//@Lazy(true)
//@Component("crashBackTask")
//public class CrashBackTask {
//	public static LinkedList<Order> list = new LinkedList<Order>();
//	private final Logger log = LoggerFactory.getLogger(CrashBackTask.class);
//	@Autowired
//	private LetteryPeriodService periodService;
//
//	@Autowired
//	private OrderService orderService;
//	@Autowired
//	private PeriodService pdService;
//
//	@Autowired
//	private OrderDetailService orderDetailService;
//	@Autowired
//	private HeMaiOrderDetailService heMaiOrderDetailService;
//	@Autowired
//	private HeMaiOrderService heMaiOrderService;
//
//	@Scheduled(cron = "0 0 12 * * ?")
//	public void job1() {
//
//	}
//}
