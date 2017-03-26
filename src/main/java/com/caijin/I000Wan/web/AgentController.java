package com.caijin.I000Wan.web;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.service.HeMaiOrderService;
import com.caijin.I000Wan.service.MemberUserService;
import com.caijin.I000Wan.service.OrderDetailService;
import com.caijin.I000Wan.service.OrderService;
import com.caijin.I000Wan.service.PeriodService;
import com.caijin.I000Wan.util.DateUtils;
import com.caijin.I000Wan.util.Md5Util;
import com.caijin.I000Wan.util.OrderUtils;
import com.caijin.I000Wan.util.StaticDefine;

@Controller
public class AgentController {

	private final Logger log = LoggerFactory.getLogger(AgentController.class);
	@Autowired
	private MemberUserService userService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderDetailService orderDetailService;
	@Autowired
	private PeriodService periodService;
	@Autowired
	private HeMaiOrderService heMaiOrderService;

	@RequestMapping(value = "/agent/agentcenter")
	public String agentMenu(HttpServletRequest request, Model model) {
		MemberUser user = (MemberUser) request.getSession().getAttribute(
				MemberUser.FRONT_MEMBER_LOGIN_SESSION);
		if (user != null&&user.getId()!=null) {
			model.addAttribute("todayIncome",
					orderService.getTodayMoney(user.getId()));
			model.addAttribute("totalIncome",
					orderService.getPlatformAllMoney(user.getId()));
			// 统计总用户分普通用户 代理商
			model.addAttribute("numTotalAllUser",
					userService.getAllPredUser(user.getId()));
			// model.addAttribute("numAgentTotalUser", 1000);
			// model.addAttribute("numTotalUser", 1000);
			// 今日新增用户 普通用户 代理商
			model.addAttribute("numTodayTotalUser",
					userService.getAllTodayPredUser(user.getId()));
			// 交易用户 普通用户 代理商客户数
			model.addAttribute("numTradingTotalUser",
					userService.getAllTodayActivePredUser(user.getId()));
			// 交易用户 普通用户 代理商客户数
			model.addAttribute("numTodayTradingTotalUser",
					userService.getAllActivePredUser(user.getId()));
			float total = orderService.getAllTradingAllPredUser(user.getId());
			// 客户交易量
			model.addAttribute("totalTradingVolume", total);
			// 今日交易量
			model.addAttribute("todayTradingVolume",
					orderService.getTodayTradingAllPredUser(user.getId()));
			int num = 0;
			try {
				num = DateUtils.daysBetween(user.getCreateDate(), new Date());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (num == 0) {
				// 客户交易量
				model.addAttribute("dailyTradingVolume", total);
			}else{
				model.addAttribute("dailyTradingVolume", total/num);	
			}
			return "agent/agentMemberCenter";
		} else {
			return "redirect:user/login";
		}
	}

	@RequestMapping(value = "/agent/agentMemberConsumption")
	public String dailiMemberConsumption(HttpServletRequest request, Model model) {
		MemberUser user = (MemberUser) request.getSession().getAttribute(
				"memberUser");
		if (user == null) {
			return "redirect:/user/login";
		}
		Integer pageNum = Integer
				.valueOf(request.getParameter("pageNum") == null ? "1"
						: request.getParameter("pageNum"));
		Integer size = orderService.findCountMemberByAgentUserId(user.getId());
		Integer pageSize = size % StaticDefine.PAGE_SIZE == 0 ? size
				/ StaticDefine.PAGE_SIZE : size / StaticDefine.PAGE_SIZE + 1;
		List<Map> memberUsers = orderService.findMemberByAgentUserId(
				(pageNum - 1) * StaticDefine.PAGE_SIZE, StaticDefine.PAGE_SIZE,
				user.getId());
		model.addAttribute("memberUsers", memberUsers);
		model.addAttribute("size", size);
		model.addAttribute("page", pageSize);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("memberUser", user);
		return "agent/agentMemberConsumption";
	}

	@RequestMapping(value = "/agent/agentMemberManager")
	public String agentMemberManager(HttpServletRequest request, Model model) {
		MemberUser user = (MemberUser) request.getSession().getAttribute(
				"memberUser");
		if (user == null) {
			return "redirect:/user/login";
		}
		Integer pageNum = Integer
				.valueOf(request.getParameter("pageNum") == null ? "1"
						: request.getParameter("pageNum"));
		Integer size = orderService.findCountMemberByAgentUserId(user.getId());
		Integer pageSize = size % StaticDefine.PAGE_SIZE == 0 ? size
				/ StaticDefine.PAGE_SIZE : size / StaticDefine.PAGE_SIZE + 1;
		List<Map> memberUsers = orderService.findMemberByAgentUserId(
				(pageNum - 1) * StaticDefine.PAGE_SIZE, StaticDefine.PAGE_SIZE,
				user.getId());
		log.info("--------用户数量-----"+memberUsers.size());
		model.addAttribute("memberUsers", memberUsers);
		model.addAttribute("size", size);
		model.addAttribute("page", pageSize);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("memberUser", user);
		return "agent/agentMemberManager";
	}

	@RequestMapping(value = "/agent/agentMembeSpred")
	public String agentMembeSpred(HttpServletRequest request, Model model) {
		MemberUser user = (MemberUser) request.getSession().getAttribute(
				"memberUser");
		if (user == null) {
			return "redirect:/user/login";
		}
		Integer pageNum = Integer
				.valueOf(request.getParameter("pageNum") == null ? "1"
						: request.getParameter("pageNum"));
		Integer size = orderService.findCountMemberByAgentUserId(user.getId());
		Integer pageSize = size % StaticDefine.PAGE_SIZE == 0 ? size
				/ StaticDefine.PAGE_SIZE : size / StaticDefine.PAGE_SIZE + 1;
		List<Map> memberUsers = orderService.findMemberByAgentUserId(
				(pageNum - 1) * StaticDefine.PAGE_SIZE, StaticDefine.PAGE_SIZE,
				user.getId());
		model.addAttribute("memberUsers", memberUsers);
		model.addAttribute("size", size);
		model.addAttribute("page", pageSize);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("memberUser", user);
		return "agent/agentMemberspred";
	}

	@RequestMapping(value = "/agent/agentMembeSpredLink")
	public String agentMembeSpredLink(HttpServletRequest request, Model model) {
		MemberUser currentUser = (MemberUser) request.getSession()
				.getAttribute("memberUser");
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + path + "/";
		try {
			String predId;
			if (null != currentUser.getPredId()
					&& !"".equals(currentUser.getPredId())) {
				predId = currentUser.getPredId();
			} else {
				predId = OrderUtils.getRandom();
				while (userService.findByPreId(predId) != null) {
					predId = OrderUtils.getRandom();
				}
				currentUser.setPredId(predId);
				userService.update(currentUser);
			}
			model.addAttribute("pathUrl", basePath + "register/" + predId
					+ ".html");
			return "agent/agentMemberspredLink";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/user/login";
		}
	}

	@RequestMapping(value = "/agent/agentMembeIncomeDetail")
	public String agentMembeIncomeDetail(HttpServletRequest request, Model model) {
		return "agent/agentMemberincomedetail";
	}

	@RequestMapping(value = "/agent/agentMembeMonthBaance")
	public String agentMembeMonthBaance(HttpServletRequest request, Model model) {
		MemberUser user = (MemberUser) request.getSession().getAttribute(
				"memberUser");
		if (user == null) {
			return "redirect:/user/login";
		}
		Integer pageNum = Integer
				.valueOf(request.getParameter("pageNum") == null ? "1"
						: request.getParameter("pageNum"));
		Integer size = orderService.findCountMemberByAgentUserId(user.getId());
		Integer pageSize = size % StaticDefine.PAGE_SIZE == 0 ? size
				/ StaticDefine.PAGE_SIZE : size / StaticDefine.PAGE_SIZE + 1;
		List<Map> memberUsers = orderService.findMemberByAgentUserId(
				(pageNum - 1) * StaticDefine.PAGE_SIZE, StaticDefine.PAGE_SIZE,
				user.getId());
		model.addAttribute("memberUsers", memberUsers);
		model.addAttribute("size", size);
		model.addAttribute("page", pageSize);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("memberUser", user);
		return "agent/agentMemberMonthBalance";
	}

	@RequestMapping(value = "/agent/agentMembeIncomeStatic")
	public String agentMembeincomestatic(HttpServletRequest request, Model model) {
		MemberUser user = (MemberUser) request.getSession().getAttribute(
				"memberUser");
		if (user == null) {
			return "redirect:/user/login";
		}
		Integer pageNum = Integer
				.valueOf(request.getParameter("pageNum") == null ? "1"
						: request.getParameter("pageNum"));
		Integer size = orderService.findCountMemberByAgentUserId(user.getId());
		Integer pageSize = size % StaticDefine.PAGE_SIZE == 0 ? size
				/ StaticDefine.PAGE_SIZE : size / StaticDefine.PAGE_SIZE + 1;
		List<Map> memberUsers = orderService.findMemberStaticIncomeByAgentUserId(
				(pageNum - 1) * StaticDefine.PAGE_SIZE, StaticDefine.PAGE_SIZE,
				user.getId());
		model.addAttribute("memberUsers", memberUsers);
		log.info("--------用户数量-----"+memberUsers.size());
		model.addAttribute("size", size);
		model.addAttribute("page", pageSize);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("memberUser", user);
		return "agent/agentMemberincomestatic";
	}
}
