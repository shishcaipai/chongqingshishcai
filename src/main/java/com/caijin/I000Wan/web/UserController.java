package com.caijin.I000Wan.web;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.caijin.I000Wan.entity.LotteryPeriod;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.OrderDetail;
import com.caijin.I000Wan.entity.Period;
import com.caijin.I000Wan.enu.Bank;
import com.caijin.I000Wan.interceptor.CommonInterceptor;
import com.caijin.I000Wan.service.HeMaiOrderDetailService;
import com.caijin.I000Wan.service.HeMaiOrderService;
import com.caijin.I000Wan.service.LetteryPeriodService;
import com.caijin.I000Wan.service.MemberUserService;
import com.caijin.I000Wan.service.OrderDetailService;
import com.caijin.I000Wan.service.OrderService;
import com.caijin.I000Wan.service.PeriodService;
import com.caijin.I000Wan.util.DateUtils;
import com.caijin.I000Wan.util.EmailUtils;
import com.caijin.I000Wan.util.GenerateLinkUtils;
import com.caijin.I000Wan.util.Md5Util;
import com.caijin.I000Wan.util.RandomValidateCode;
import com.caijin.I000Wan.util.StaticDefine;
import com.caijin.I000Wan.util.WFPublic;

/**
 * 用户Action
 * 
 * @since 2014-07-14
 */
@Controller
public class UserController {
	private final Logger log = LoggerFactory.getLogger(UserController.class);
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
	@Autowired
	private HeMaiOrderDetailService heMaiOrderDetailService;

	@Autowired
	private LetteryPeriodService letteryPeriodService;

	/**
	 * 注册 先查找是否为推广链接
	 * 
	 * @return
	 */
	@RequestMapping("/user/register")
	public String register(Model model, HttpServletRequest req) {
		log.info("==============register================"
				+ req.getAttribute("regeisterID"));
		if (req.getAttribute("regeisterID") != null) {
			String registerID = (String) req.getAttribute("regeisterID");
			try {
				MemberUser user = userService.findByRegeisterID(registerID);
				if (user == null) {
					return "404";
				} else {
					model.addAttribute("parentId", user.getId());
					return "user/register";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return "user/register";
	}

	/**
	 * 注册提交
	 * 
	 * @return
	 */
	@RequestMapping(value = "/user/doregister", method = RequestMethod.POST)
	@ResponseBody
	public String doRegister(Model model, HttpServletRequest req) {
		Map<String, Object> map = new HashMap<String, Object>();
		String resultMsg;
		// 推荐人对像
		String userName = req.getParameter("username");
		String pwd = req.getParameter("password");
		String email = req.getParameter("email");
		String sex = req.getParameter("sex");
		String qq = req.getParameter("qq");
		String mobile = req.getParameter("mobile");
		String parentId = req.getParameter("parentId");
		String realName = req.getParameter("realName");
		String withdrawPassword = req.getParameter("withdrawPassword");
		String userType = req.getParameter("userType");
		try {
			MemberUser member = userService.findByUserName(userName);// 得到要激活的帐户
			if (member != null) {
				resultMsg = "2";
				return resultMsg;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			// 保存加密后的密码
			pwd = Md5Util.generatePassword(pwd);

			MemberUser mu = new MemberUser();
			mu.setUserName(userName);
			mu.setCreateDate(new Date());
			mu.setUpdateDate(new Date());
			mu.setPwd(pwd);
			mu.setSex(sex);
			mu.setRealName(realName);
			mu.setCommendMemberId(parentId);
			mu.setMoneyPwd(Md5Util.generatePassword(withdrawPassword));
			mu.setType(Integer.valueOf(userType));
			mu.setTelephone(mobile);
			mu.setEmail(email);
			mu.setQq(qq);
			mu.setTotalScore(0);
			mu.setAvailableScore(0);
			log.info(mu.getCommendMemberId()
					+ "==============tuijian================"
					+ req.getParameter("parentId"));
			userService.save(mu);
			req.getSession().setAttribute(
					MemberUser.FRONT_MEMBER_LOGIN_SESSION, mu);
			resultMsg = "1";
			return resultMsg;
		} catch (Exception e) {
			e.printStackTrace();
			return "3";
		}
	}

	// /**
	// * 跳转到注册成功页面
	// *
	// * @return
	// */
	// @RequestMapping("/user/registersucess")
	// public String registerSucess() {
	//
	// return "user/registerSucess";
	// }

	/**
	 * 跳到登录
	 * 
	 * @return
	 */
	@RequestMapping("/user/login")
	public String login() {

		return "user/login";
	}

	/**
	 * 登录
	 * 
	 * @return
	 */
	@RequestMapping(value = "/user/dologin", method = RequestMethod.POST)
	public String doLogin(Model model, HttpServletRequest req) {
		boolean result = false;
		String msg = "";// 返回提示语
		MemberUser mu = null;

		String userName = req.getParameter("userName");
		if (userName != null) {
			try {
				userName = new String(userName.getBytes("ISO-8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

		String pwd = req.getParameter("pwd");
		String randomCode = req.getParameter("randomCode");
		if (req.getSession() == null
				|| req.getSession().getAttribute(
						RandomValidateCode.RANDOMCODEKEY) == null) {
			model.addAttribute("result", result);
			model.addAttribute("msg", "session已过期");
			return "user/login";
		}
		String realRandomCode = (String) req.getSession().getAttribute(
				RandomValidateCode.RANDOMCODEKEY);

		if (randomCode.toUpperCase().equals(realRandomCode.toUpperCase())) {
			mu = userService.findByUserName(userName);
			if (mu != null) {
				if (Md5Util.validatePassword(mu.getPwd(), pwd)) {
					mu.setRandomCode(realRandomCode);
					result = true;
				} else {
					msg = "密码错误!";
				}
			} else {
				msg = "不存在该用户!";
			}
		} else {
			msg = "你输入的验证码不正确!";
		}
		if (result) {
			req.getSession().setAttribute("memberUser", mu);
			return "redirect:/index";
		} else {
			model.addAttribute("result", result);
			model.addAttribute("msg", msg);
			return "user/login";
		}
	}

	/**
	 * 登出
	 * 
	 * @return
	 */
	@RequestMapping("/user/loginout")
	public String loginOut(HttpServletRequest request) {

		HttpSession session = request.getSession();
		if (session != null) {
			session.removeAttribute("memberUser");
		}
		return "redirect:/user/login";
	}

	/**
	 * 跳转到用户中心
	 * 
	 * @return
	 */
	@RequestMapping("/user/memberCenter")
	public String memberCenter(HttpServletRequest request, Model model) {
		MemberUser user = (MemberUser) request.getSession().getAttribute(
				"memberUser");
		if (user == null) {
			return "redirect:/user/login";
		}
		Integer pageNum = Integer
				.valueOf(request.getParameter("pageNum") == null ? "1"
						: request.getParameter("pageNum"));
		Integer size = orderService.findOrderSize(user.getId());
		Integer pageSize = size % StaticDefine.PAGE_SIZE == 0 ? size
				/ StaticDefine.PAGE_SIZE : size / StaticDefine.PAGE_SIZE + 1;
		List<Order> orderDetails = orderService.findAllOrders((pageNum - 1)
				* StaticDefine.PAGE_SIZE, StaticDefine.PAGE_SIZE, user.getId());
		model.addAttribute("orders", orderDetails);
		model.addAttribute("size", size);
		model.addAttribute("oMomey",
				orderService.getTodayBuyMomey(user.getId()));
		model.addAttribute("reMomey",
				orderService.getTodayZhongjiaoMomey(user.getId()));
		model.addAttribute("page", pageSize);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("memberUser", user);
		return "user/memberCenter";
	}

	/**
	 * 账号激活
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/user/activateAccount")
	public ModelAndView activateAccount(HttpServletRequest request,
			HttpServletResponse response) {
		String userName = request.getParameter("userName");
		MemberUser member = userService.findByUserName(userName);// 得到要激活的帐户
		// 校验验证码是否和注册时发送的一致，以此设置是否激活该帐户
		member.setActivated(GenerateLinkUtils.verifyCheckcode(member, request));
		userService.update(member);

		sessionReload(request, member);
		Map model = new HashMap();
		model.put("memberUser", member);
		return new ModelAndView("user/securityCenter", model);
	}

	/**
	 * 个人中心
	 * 
	 * @return
	 */
	@RequestMapping("/user/personInfo")
	public ModelAndView userCenter(HttpServletRequest request) {
		MemberUser user = (MemberUser) request.getSession().getAttribute(
				"memberUser");
		if (user == null) {
			return new ModelAndView("redirect:/user/login");
		}
		// 封装ModelAndView
		Map model = new HashMap();
		model.put("memberUser", user);
		return new ModelAndView("user/personInfo", model);
	}

	/**
	 * 个人信息提交
	 * 
	 * @return
	 */
	@RequestMapping(value = "/user/savePersonInfo", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String saveMemberUser(MemberUser memberUser,
			HttpServletRequest request, HttpServletResponse response) {
		String message = "保存操作出错";
		MemberUser member = userService
				.findByUserName(memberUser.getUserName());
		try {
			member.setTelephone(memberUser.getTelephone());
			member.setSex(memberUser.getSex());
			member.setBirthday(memberUser.getBirthday());
			member.setState(memberUser.getState());
			member.setCity(memberUser.getCity());
			member.setAddress(memberUser.getAddress());
			member.setIdentityCard(memberUser.getIdentityCard());
			member.setEmail(memberUser.getEmail());
			member.setUpdateDate(new Date());// 最后修改人
			member.setRealName(memberUser.getRealName());
			userService.update(member);
			sessionReload(request, member);
			message = "保存成功";
		} catch (Exception e) {
			message = "保存操作出错:" + e.getMessage();
		}
		return message;
	}

	/**
	 * 真实姓名、身份证号码提交
	 * 
	 * @return
	 */
	@RequestMapping(value = "/user/saveRealNameInfo", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String saveRealNameInfo(MemberUser memberUser,
			HttpServletRequest request, HttpServletResponse response) {
		String message = "保存操作出错";
		MemberUser member = userService
				.findByUserName(memberUser.getUserName());
		try {
			member.setRealName(memberUser.getRealName());
			member.setIdentityCard(memberUser.getIdentityCard());
			member.setUpdateDate(new Date());// 最后修改人
			userService.update(member);
			sessionReload(request, member);
			message = "保存成功";
		} catch (Exception e) {
			message = "保存操作出错:" + e.getMessage();
		}
		return message;
	}

	/**
	 * 支付宝账号提交
	 * 
	 * @return
	 */
	@RequestMapping(value = "/user/saveBankInfo", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String saveBankInfo(MemberUser memberUser,
			HttpServletRequest request, HttpServletResponse response) {
		String message = "支付宝账号保存出错";
		MemberUser member = userService
				.findByUserName(memberUser.getUserName());
		try {
			if (!Md5Util.validatePassword(member.getPwd(), memberUser.getPwd())) {
				message = "网站登录密码不正确，请重新输入";
			} else {
				member.setBankName(Bank.ZFB.name());
				member.setBankCode(memberUser.getBankCode());
				member.setUpdateDate(new Date());// 最后修改人
				userService.update(member);
				sessionReload(request, member);
				message = "支付宝账号保存成功";
			}
		} catch (Exception e) {
			message = "支付宝账号保存出错:" + e.getMessage();
		}
		return message;
	}

	/**
	 * 跳转邮箱绑定
	 * 
	 * @return
	 */
	@RequestMapping("/user/emailInfo")
	public String emialInfo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session == null) {
			return "redirect:/user/login";
		}

		MemberUser user = (MemberUser) session.getAttribute("memberUser");
		Map model = new HashMap();
		model.put("memberUser", user);
		return "user/emailInfo";
	}

	/**
	 * 跳转银行卡绑定页面
	 * 
	 * @return
	 */
	@RequestMapping("/user/bankInfo")
	public String bankInfo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session == null) {
			return "redirect:/user/login";
		}
		MemberUser member = (MemberUser) session.getAttribute("memberUser");
		// 取保存后的新数据
		Map model = new HashMap();
		model.put("memberUser", member);
		return "user/bankInfo";
	}

	/**
	 * 跳转实名认证
	 * 
	 * @return
	 */
	@RequestMapping("/user/realNameInfo")
	public String realNameInfo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session == null) {
			return "redirect:/user/login";
		}
		MemberUser member = (MemberUser) session.getAttribute("memberUser");
		// 取保存后的新数据
		Map model = new HashMap();
		model.put("memberUser", member);
		return "user/realNameInfo";
	}

	/**
	 * 跳转修改密码页面
	 * 
	 * @return
	 */
	@RequestMapping("/user/resetPasswordInfo")
	public String resetPasswordInfo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session == null) {
			return "redirect:/user/login";
		}
		MemberUser member = (MemberUser) session.getAttribute("memberUser");
		// 取保存后的新数据
		Map model = new HashMap();
		model.put("memberUser", member);
		return "user/resetPasswordInfo";
	}

	/**
	 * 跳转修改密码页面
	 * 
	 * @return
	 */
	@RequestMapping("/user/resetapplyPasswordInfo")
	public String resetApplyPasswordInfo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session == null) {
			return "redirect:/user/login";
		}
		MemberUser member = (MemberUser) session.getAttribute("memberUser");
		// 取保存后的新数据
		Map model = new HashMap();
		model.put("memberUser", member);
		return "user/reapplyrecordpasswordInfo";
	}

	/**
	 * 跳转安全中心页面
	 * 
	 * @return
	 */
	@RequestMapping("/user/securityCenter")
	public String securityCenter(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session == null) {
			return "redirect:/user/login";
		}
		MemberUser member = (MemberUser) session.getAttribute("memberUser");
		// 取保存后的新数据
		Map model = new HashMap();
		model.put("memberUser", member);
		return "user/securityCenter";
	}

	/**
	 * 跳转手机号绑定页面
	 * 
	 * @return
	 */
	@RequestMapping("/user/telephoneInfo")
	public String telephoneInfo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session == null) {
			return "redirect:/user/login";
		}
		MemberUser member = (MemberUser) session.getAttribute("memberUser");
		// 取保存后的新数据
		Map model = new HashMap();
		model.put("memberUser", member);
		return "user/telephoneInfo";
	}

	/**
	 * 重置密码提交
	 * 
	 * @return
	 */
	@RequestMapping(value = "/user/resetPassword", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String resetPassword(MemberUser memberUser,
			HttpServletRequest request, HttpServletResponse response) {
		MemberUser user = (MemberUser) request.getSession().getAttribute(
				"memberUser");

		String password = request.getParameter("password");
		String message = "重置密码出错";
		try {
			user = userService.find(user.getId());
			if (user != null) {
				if (!Md5Util.validatePassword(user.getPwd(), password)) {
					message = "当前密码不正确，请重新输入";
				} else {
					String resetPassword = request
							.getParameter("resetPassword");
					user.setPwd(Md5Util.generatePassword(resetPassword));
					user.setUpdateDate(new Date());// 最后修改人
					userService.update(user);
					sessionReload(request, user);
					message = "重置密码成功";
				}
			} else {
				message = "登陆息已失效，请重新登陆";
			}
		} catch (Exception e) {
			message = "重置密码出错:" + e.getMessage();
		}
		return message;
	}

	/**
	 * 提款密码重置提交
	 * 
	 * @return
	 */
	@RequestMapping(value = "/user/resetApplyPassword", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String resetApplyPassword(MemberUser memberUser,
			HttpServletRequest request, HttpServletResponse response) {
		MemberUser user = (MemberUser) request.getSession().getAttribute(
				"memberUser");

		String password = request.getParameter("password");
		String message = "重置密码出错";
		try {
			user = userService.find(user.getId());
			if (user != null) {
				if (!Md5Util.validatePassword(user.getMoneyPwd(), password)) {
					message = "当前密码不正确，请重新输入";
				} else {
					String resetPassword = request
							.getParameter("resetPassword");
					user.setMoneyPwd(Md5Util.generatePassword(resetPassword));
					user.setUpdateDate(new Date());// 最后修改人
					userService.update(user);
					sessionReload(request, user);
					message = "重置密码成功";
				}
			} else {
				message = "登陆息已失效，请重新登陆";
			}
		} catch (Exception e) {
			message = "重置密码出错:" + e.getMessage();
		}
		return message;
	}

	/**
	 * 绑定手机号码
	 * 
	 * @return
	 */
	@RequestMapping(value = "/user/telephoneSave", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String telephoneSave(HttpServletRequest request) {
		String telephone = request.getParameter("telephone");
		String userName = request.getParameter("userName");
		String message = "保存手机号出错";
		try {
			MemberUser member = userService.findByUserName(userName);
			member.setTelephone(telephone);
			member.setUpdateDate(new Date());// 最后修改时间
			userService.update(member);
			sessionReload(request, member);
			message = "保存手机号成功";
		} catch (Exception e) {
			message = "保存手机号出错:" + e.getMessage();
		}

		return message;
	}

	/**
	 * 发送验证邮件
	 * 
	 * @return
	 */
	@RequestMapping(value = "/user/validateEmail", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String validateEmail(HttpServletRequest request,
			HttpServletResponse response) {
		MemberUser user = (MemberUser) request.getSession().getAttribute(
				"memberUser");
		String message = "发送验证邮件出错";
		try {
			EmailUtils.sendAccountActivateEmail(user);
			message = "发送验证邮件成功";
		} catch (Exception e) {
			message = "发送验证邮件出错:" + e.getMessage();
		}
		return message;
	}

	private void sessionReload(HttpServletRequest request, MemberUser memberUser) {
		request.getSession().removeAttribute("memberUser");
		request.getSession().setAttribute("memberUser", memberUser);
	}

	@RequestMapping(value = "/betting_record")
	public String bettingRecord(HttpServletRequest request, Model model) {
		MemberUser user = (MemberUser) request.getSession().getAttribute(
				"memberUser");
		if (user == null) {
			return "redirect:/user/login";
		}
		Integer pageNum = Integer
				.valueOf(request.getParameter("pageNum") == null ? "1"
						: request.getParameter("pageNum"));
		Integer size = orderService.findOrderTouZhuSize(user.getId());
		Integer pageSize = size % StaticDefine.PAGE_SIZE == 0 ? size
				/ StaticDefine.PAGE_SIZE : size / StaticDefine.PAGE_SIZE + 1;
		List<Order> orders = orderService.findAllOrderTouZhu((pageNum - 1)
				* StaticDefine.PAGE_SIZE, StaticDefine.PAGE_SIZE, user.getId());
		// if (orders != null)
		// for (Order order : orders) {
		// order.reTotalMoney = periodService.getMoneyPeriodByOId(order
		// .getOrderNo());
		// }

		model.addAttribute("orderDetails", orders);
		model.addAttribute("size", size);
		model.addAttribute("page", pageSize);
		model.addAttribute("pageNum", pageNum);
		return "user/bettingRecord";
	}

	@RequestMapping(value = "/orderList")
	public String orderList(HttpServletRequest request, Model model) {
		MemberUser user = (MemberUser) request.getSession().getAttribute(
				"memberUser");
		if (user == null) {
			return "redirect:/user/login";
		}
		Integer pageNum = Integer
				.valueOf(request.getParameter("pageNum") == null ? "1"
						: request.getParameter("pageNum"));
		Integer size = orderService.findOrderZhongjiaoSize(user.getId());
		Integer pageSize = size % StaticDefine.PAGE_SIZE == 0 ? size
				/ StaticDefine.PAGE_SIZE : size / StaticDefine.PAGE_SIZE + 1;
		List<Order> orderDetails = orderService.findAllOrdersZhongjiao(
				(pageNum - 1) * StaticDefine.PAGE_SIZE, StaticDefine.PAGE_SIZE,
				user.getId());

		model.addAttribute("orders",
				orderDetails == null ? new ArrayList<Order>() : orderDetails);
		model.addAttribute("size", size);
		model.addAttribute("page", pageSize);
		model.addAttribute("pageNum", pageNum);
		return "user/zhongjiao";
	}

	@RequestMapping(value = "/hemai_record")
	public String hemaiRecord(HttpServletRequest request, Model model) {
		MemberUser user = (MemberUser) request.getSession().getAttribute(
				"memberUser");
		if (user == null) {
			return "redirect:/user/login";
		}
		List<Map> list = new ArrayList<Map>();
		Integer pageNum = Integer
				.valueOf(request.getParameter("pageNum") == null ? "1"
						: request.getParameter("pageNum"));
		Integer size = heMaiOrderService.findOrderZuiHaoSize(user.getId());
		Integer pageSize = size % StaticDefine.PAGE_SIZE == 0 ? size
				/ StaticDefine.PAGE_SIZE : size / StaticDefine.PAGE_SIZE + 1;
		List<HeMaiOrder> heorders = heMaiOrderService.findAllOrderZuiHao(
				(pageNum - 1) * StaticDefine.PAGE_SIZE, StaticDefine.PAGE_SIZE,
				user.getId());
		if (heorders != null) {
			Map<String, Object> map;
			for (HeMaiOrder heorder : heorders) {
				map = new HashMap<String, Object>();
				map.put("orderNo", heorder.getOrderDetail().getOrder()
						.getOrderNo());
				map.put("username", heorder.getOrderDetail().getMemberUser()
						.getUserName());
				map.put("fensum", heorder.getSubGuaranteeSum());
				map.put("fenmoney", heorder.getFloatManay());
				map.put("createDate",
						DateUtils.stampToDate(heorder.getCreateDate()));
				float money = periodService.getMoneyPeriodByOId(heorder
						.getOrderDetail().getOrder().getOrderNo());
				if (money > 0) {
					map.put("zhongjiao", "是");
				} else {
					map.put("zhongjiao", "否");
				}
				map.put("money", money / heorder.getOrderDetail().getFensum()
						* heorder.getSubGuaranteeSum());
				list.add(map);
			}
		}
		model.addAttribute("list", list);
		model.addAttribute("size", size);
		model.addAttribute("page", pageSize);
		model.addAttribute("pageNum", pageNum);
		return "user/heimairecord";
	}

	@RequestMapping(value = "/zuihaoRecord")
	public String zuihaoRecord(HttpServletRequest request, Model model) {
		MemberUser user = (MemberUser) request.getSession().getAttribute(
				"memberUser");
		if (user == null) {
			return "redirect:/user/login";
		}
		Integer pageNum = Integer
				.valueOf(request.getParameter("pageNum") == null ? "1"
						: request.getParameter("pageNum"));
		Integer size = heMaiOrderService.findOrderZuiHaoSize(user.getId());
		Integer pageSize = size % StaticDefine.PAGE_SIZE == 0 ? size
				/ StaticDefine.PAGE_SIZE : size / StaticDefine.PAGE_SIZE + 1;
		List<HeMaiOrder> orders = heMaiOrderService.findAllOrderZuiHao(
				(pageNum - 1) * StaticDefine.PAGE_SIZE, StaticDefine.PAGE_SIZE,
				user.getId());
		model.addAttribute("orders", orders);
		model.addAttribute("size", size);
		model.addAttribute("page", pageSize);
		model.addAttribute("pageNum", pageNum);
		return "user/zuihaorecord";
	}

	@RequestMapping(value = "/dailimenu")
	public String dailimenu(HttpServletRequest request, Model model) {
		return "user/daiiimemberCenter";
	}

	@RequestMapping(value = "/dailimemberConsumption")
	public String dailiMemberConsumption(HttpServletRequest request, Model model) {
		return "user/dailiMemberConsumption";
	}

	@RequestMapping(value = "/dailimemberManager")
	public String dailiMemberManager(HttpServletRequest request, Model model) {
		return "user/dailiMemberManager";
	}

	@RequestMapping(value = "/dailimembeSpred")
	public String dailiMembeSpred(HttpServletRequest request, Model model) {
		return "user/dailiMemberspred";
	}

	@RequestMapping(value = "/dailimembeSpredLink")
	public String dailiMembeSpredLink(HttpServletRequest request, Model model) {
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
			return "user/dailiMemberspredLink";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/user/login";
		}
	}

	@RequestMapping(value = "/dailimembeIncomeDetail")
	public String dailimembeIncomeDetail(HttpServletRequest request, Model model) {
		return "user/dailiMemberincomedetail";
	}

	@RequestMapping(value = "/dailimembeMonthBaance")
	public String dailimembeMonthBaance(HttpServletRequest request, Model model) {
		return "user/dailiMemberMonthBalance";
	}

	@RequestMapping(value = "/dailimembeIncomeStatic")
	public String dailimembeincomestatic(HttpServletRequest request, Model model) {
		return "user/dailiMemberincomestatic";
	}

	/**
	 * 订单详情
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/orderdetail")
	public String orderDetail(HttpServletRequest request, Model model) {
		String orderId = (String) request.getParameter("orderId");
		Order order = orderService.findOrderByOrderId(orderId);
		if (order.getOrderType() == Order.HEMAI_BUY_ORDER
				|| order.getOrderType() == Order.PROXY_BUY_ORDER) {
			List<Period> list = periodService.findPeriodByOId(orderId);
			if (list != null) {
				model.addAttribute("pNum", list.size());
			} else {
				model.addAttribute("pNum", 0);
			}
			for (Period period : list) {
				LotteryPeriod lperiod = letteryPeriodService.findByPeriod(
						Period.SHISHI_CAI_CHONGQING, period.getLetterPharse());
				if (lperiod != null) {
					period.setLetterPharse(lperiod.getPeriodNumber());
				}
			}
			order.setPeriod(list);
			List<OrderDetail> details = orderDetailService
					.findOrderDetailByOrderId(order);
			for (OrderDetail detail : details) {
				detail.setBuyCaiNumber("["
						+ WFPublic.getpalynamebyid(detail.getBuyCaiNumber()
								.substring(1, 4))
						+ "]"
						+ detail.getBuyCaiNumber().substring(5,
								detail.getBuyCaiNumber().length()));
			}

			model.addAttribute("details", details);

		}
		if (order.getPeriod() != null && !order.getPeriod().isEmpty()) {
			if (Period.SHISHI_CAI_CHONGQING.equals(order.getPeriod().get(0)
					.getLotteryCode())) {
				model.addAttribute("caipiaotype", "重庆时时彩");
			}
			model.addAttribute("parsh", order.getPeriod().get(0)
					.getLotteryPeriod());
			model.addAttribute(
					"endDate",
					DateUtils.getLeftEndDate(order.getPeriod().get(0)
							.getLotteryPeriod()));
		}
		model.addAttribute("order", order);
		model.addAttribute("chexiao", false);
		if (order.getOrderType() == Order.HEMAI_BUY_ORDER) {
			HeMaiOrderDetail heDetail = heMaiOrderDetailService
					.findOrderHemaiDetailByOrderId(order);
			model.addAttribute("heDetail", heDetail);
			List<HeMaiOrder> list = heMaiOrderService
					.findOrderHemaiByOrderId(heDetail);
			model.addAttribute("hemaiorders", list);
			model.addAttribute("size", (list.size()));
			int leftNum = heMaiOrderService.getHemaiOrderFenNum(heDetail);
			model.addAttribute("leftNum", leftNum);
			MemberUser user = (MemberUser) request.getSession().getAttribute(
					MemberUser.FRONT_MEMBER_LOGIN_SESSION);
			if (user != null
					&& heDetail.getMemberUser().getUserName()
							.equals(user.getUserName())
					&& order.getOrderStatus() == Order.WAIT_ORDER) {
				model.addAttribute("chexiao", true);
			}
			return "user/details";
		}
		if (order.getOrderType() == Order.HEMAI_IMP_BUY_ORDER) {
			Order parentOrder = orderService.findOrderByOrderId(order
					.getOtherId());
			parentOrder.setPeriod(periodService.findPeriodByOId(order
					.getOtherId()));
			model.addAttribute("order", order);
			HeMaiOrderDetail heDetail = heMaiOrderDetailService
					.findOrderHemaiDetailByOrderId(parentOrder);
			model.addAttribute("heDetail", heDetail);
			HeMaiOrder hemaiOrder = heMaiOrderService.find(order.getOrderNo());
			model.addAttribute("hemaiorder", hemaiOrder);
			return "user/details";
		}

		return "user/orderdetail";
	}
}
