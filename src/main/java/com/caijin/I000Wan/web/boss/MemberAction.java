package com.caijin.I000Wan.web.boss;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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

import com.caijin.I000Wan.entity.ChongZhiRecord;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.User;
import com.caijin.I000Wan.service.ChongZhiRecordService;
import com.caijin.I000Wan.service.LogDataService;
import com.caijin.I000Wan.service.MemberUserService;
import com.caijin.I000Wan.service.OrderService;
import com.caijin.I000Wan.service.UserService;
import com.caijin.I000Wan.util.DataGridModel;
import com.caijin.I000Wan.util.GenerateOrderNoUtil;
import com.caijin.I000Wan.util.Md5Util;
import com.caijin.I000Wan.util.OrderUtils;
import com.caijin.I000Wan.util.PageModel;
import com.caijin.I000Wan.util.Result;

@Controller
@RequestMapping("/boss")
public class MemberAction {
	private final Logger log = LoggerFactory.getLogger(OrderAction.class);
	@Autowired
	private MemberUserService memberUserService;
	@Autowired
	private ChongZhiRecordService chongZhiRecordService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private LogDataService logDataService;

	@Autowired
	private UserService userService;
	
	
	@RequestMapping("/member/list")
	public String memberList() {

		return "/boss/member/memberList";
	}

	@RequestMapping("/member/chongzhi")
	public String memberListchongzhi() {

		return "/boss/member/memberListchongzhi";
	}
	@RequestMapping("/member/logDatalist")
	public String logDataList() {

		return "/boss/member/logDataList";
	}

	@RequestMapping(value = "/member/logdata_list_page", produces = { "application/json;charset=utf-8" })
	@ResponseBody
	public Result<Map> findLogDataList(DataGridModel dgm,
			HttpServletRequest request, PageModel pageModel) {
		String userName = request.getParameter("userName");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");

		pageModel = new PageModel(dgm.getPage(), dgm.getRows(), null);
		Result<Map> result = null;
		result = logDataService.getLogDataMemberUserAll(pageModel, userName, startDate, endDate);
		return result;
	}
	
	@RequestMapping("/member/ajax_list")
	@ResponseBody
	public List<Map> findMemberUserList(HttpServletRequest request) {
		String userName = request.getParameter("userName");
		String realName = request.getParameter("realName");
		String mobile = request.getParameter("telephone");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");

		List<Map> userList = memberUserService.findMemberList(userName,
				realName, mobile, startDate, endDate);

		return userList;
	}

	@RequestMapping(value = "/member/ajax_list_page", method = RequestMethod.POST, produces = { "application/json;charset=utf-8" })
	@ResponseBody
	public Result<Map> findMemberUserList2(DataGridModel dgm,
			HttpServletRequest request, PageModel pageModel) {
		String userName = request.getParameter("userName");
		String realName = request.getParameter("realName");
		String mobile = request.getParameter("telephone");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");

		pageModel = new PageModel(dgm.getPage(), dgm.getRows(), null);
		Result<Map> result = null;
		result = memberUserService.getMemberUserAll(pageModel, userName,
				realName, mobile, startDate, endDate);
		return result;
	}

	/**
	 * 修改
	 * 
	 * @param memberUser
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/member/updateMemberUser", method = RequestMethod.POST)
	public void updateBasItemInfo(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String msg = "";
		try {
			if (request.getParameter("userName") != null) {
				MemberUser user = memberUserService.findByUserName(request
						.getParameter("userName"));
				if(user!=null){
				user.setUpdateDate(new Date());
				user.setRealName(request.getParameter("realName"));
				user.setTelephone(request.getParameter("telephone"));
				user.setZfbCode(request.getParameter("zfbCode"));
				String activated = request.getParameter("activated");
				if ("0".equals(activated)) {
					user.setActivated(false);
				} else {
					user.setActivated(true);
				}
				try {
					user.setType(Integer.valueOf(request.getParameter("type")));
				} catch (Exception e) {
					user.setType(0);
				}
				memberUserService.update(user);
				memberUserService.clear();
			}
			msg = "修改成功";
			}else{
				msg = "修改失败";
			}
		} catch (Exception e) {
			msg = "修改失败";
		}
		renderText(response, msg);
	}

	/**
	 * 修改网站密码
	 * 
	 * @param memberUser
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/member/resetPwdMemberUser", method = RequestMethod.POST)
	public void resetPwdMemberUser(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String msg = "";
		try {
			if (request.getParameter("id") != null) {
				MemberUser user = memberUserService.find(request
						.getParameter("id"));
				user.setUpdateDate(new Date());
				user.setPwd(Md5Util.generatePassword("111111"));
				memberUserService.update(user);
				memberUserService.clear();
			}
			msg = "重置网站密码成功";
		} catch (Exception e) {
			msg = "重置网站密码失败";
		}
		renderText(response, msg);
	}

	/**
	 * 修改提款密码
	 * 
	 * @param memberUser
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/member/resetApplyPwdMemberUser", method = RequestMethod.POST)
	public void resetApplyPwdMemberUser(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String msg = "";
		try {
			if (request.getParameter("id") != null) {
				MemberUser user = memberUserService.find(request
						.getParameter("id"));
				user.setUpdateDate(new Date());
				user.setMoneyPwd(Md5Util.generatePassword("888888"));
				memberUserService.update(user);
				memberUserService.clear();
			}
			msg = "重置提款密码成功";
		} catch (Exception e) {
			msg = "重置提款密码失败";
		}
		renderText(response, msg);
	}

	/**
	 * 新增
	 * 
	 * @param memberUser
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/member/chongzhi", method = RequestMethod.POST)
	public void saveChongzhiItemInfo(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String msg = "";
		User sysUser = (User) request.getSession().getAttribute("sysUSer");
		log.info("----sysUser-----" + sysUser);
		if (sysUser != null) {
			try {
				sysUser = userService.find(sysUser.getId());
				log.info("----sysUser- id----" + sysUser);
				try {
					if (request.getParameter("userName") != null) {
						MemberUser user = memberUserService
								.findByUserName(request
										.getParameter("userName"));
						log.info("----user- id----" + user);
						user.setUpdateDate(new Date());
						Integer actionScore = 0;
						Integer availableScore = 0;
						try {
							actionScore = Integer.valueOf(request
									.getParameter("actionScore"));
						} catch (Exception e) {
							e.printStackTrace();
						}
						try {
							availableScore = Integer.valueOf(request
									.getParameter("availableScore"));
						} catch (Exception e) {
							e.printStackTrace();
						}
						user.setActionScore(user.getActionScore() + actionScore);
						user.setAvailableScore(user.getAvailableScore()
								+ availableScore);
						// user.setTotalScore(user.getActionScore() +
						// user.getAvailableScore());
						user.setCreateDate(new Date());
						user.setUpdateDate(new Date());
						memberUserService.update(user);
						memberUserService.clear();
						log.info("----user- 2222---" + actionScore);
						ChongZhiRecord record = new ChongZhiRecord();
						record.setUser(sysUser);
						record.setMemberUser(user);
						record.setCreateDate(new Date());
						record.setUpdateDate(new Date());
						record.setAvailableScore(availableScore);
						record.setActionScore(actionScore);
						chongZhiRecordService.save(record);
						log.info("----record- 2222---" + record);
						// 保存一条充值订单记录
						Order order = new Order();
						order.setOrderNo(GenerateOrderNoUtil.getOrderNumber());
						order.setName("充值订单");
						order.setCreateDate(new Date());
						order.setOrderType(Order.RECHARGE_ORDER);
						order.setTotalMoney(availableScore);
						order.setOtherId(record.getId());
						order.setMemberUser(user);
						order.setOrderStatus(Order.ORDER_SUCESS);
						orderService.save(order);
						log.info("----order- 2222---" + order);
					}
					msg = "修改成功";
				} catch (Exception e) {
					e.printStackTrace();
					msg = "修改失败";
					if (e instanceof org.hibernate.TransientPropertyValueException
							|| e instanceof org.hibernate.TransientPropertyValueException
							|| e instanceof org.springframework.dao.InvalidDataAccessApiUsageException) {
						msg = "您可能长时间未登陆，已失效请重新登陆";
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				msg = "您可能长时间未登陆，已失效请重新登陆";
			}
		} else {
			msg = "您可能长时间未登陆，已失效请重新登陆";
		}
		renderText(response, msg);
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
