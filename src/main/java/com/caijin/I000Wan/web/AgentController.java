package com.caijin.I000Wan.web;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.service.HeMaiOrderService;
import com.caijin.I000Wan.service.MemberUserService;
import com.caijin.I000Wan.service.OrderDetailService;
import com.caijin.I000Wan.service.OrderService;
import com.caijin.I000Wan.service.PeriodService;
import com.caijin.I000Wan.util.Md5Util;
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
		return "agent/agentMemberCenter";
	}

	@RequestMapping(value = "/agent/agentMemberConsumption")
	public String dailiMemberConsumption(HttpServletRequest request, Model model) {
		return "agent/agentMemberConsumption";
	}

	@RequestMapping(value = "/agent/agentMemberManager")
	public String agentMemberManager(HttpServletRequest request, Model model) {
		return "agent/agentMemberManager";
	}

	@RequestMapping(value = "/agent/agentMembeSpred")
	public String agentMembeSpred(HttpServletRequest request, Model model) {
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
				predId = Md5Util.generatePassword(currentUser.getUserName());
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
		return "agent/agentMemberMonthBalance";
	}

	@RequestMapping(value = "/agent/agentMembeIncomeStatic")
	public String agentMembeincomestatic(HttpServletRequest request, Model model) {
		return "user/agentMemberincomestatic";
	}
}
