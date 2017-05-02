package com.caijin.I000Wan.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caijin.I000Wan.entity.ApplyRecord;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.enu.Bank;
import com.caijin.I000Wan.service.ApplyRecordService;
import com.caijin.I000Wan.service.MemberUserService;
import com.caijin.I000Wan.util.Md5Util;

/**
 * 提款申请Action
 * 
 * @author Jeff
 * @since 2014-07-26
 */
@Controller
@RequestMapping("/money")
public class ApplyController {
	private final Logger log = LoggerFactory.getLogger(ApplyController.class);
	@Autowired
	private ApplyRecordService applyRecordService;
	@Autowired
	private MemberUserService memberUserService;

	/**
	 * 跳转到提款记录列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/applyrecord/list")
	public String applyRecordList(HttpServletRequest request, Model model) {
		MemberUser mu = (MemberUser) request.getSession().getAttribute(
				MemberUser.FRONT_MEMBER_LOGIN_SESSION);

		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");

		List<ApplyRecord> recordList = new ArrayList<ApplyRecord>();
		if (StringUtils.isEmpty(startDate) && StringUtils.isEmpty(endDate)) {
			recordList = applyRecordService.getRecentOneWeekApplyRecordList(mu
					.getId());
		}
		model.addAttribute("recordList", recordList);
		return "user/applyRecordList";
	}

	/**
	 * 跳转到用户提款申请页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/apply")
	public String toMoneyApply(HttpServletRequest request, Model model) {
		MemberUser mu = (MemberUser) request.getSession().getAttribute(
				MemberUser.FRONT_MEMBER_LOGIN_SESSION);
		try {
			MemberUser user = memberUserService.find(mu.getId());
			mu = user;
			request.getSession().setAttribute(
					MemberUser.FRONT_MEMBER_LOGIN_SESSION, mu);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/user/login";
		}
		List<Bank> bankList = new ArrayList<Bank>();
		for (Bank bank : Bank.values()) {
			bankList.add(bank);
		}
		model.addAttribute("memberUser", mu);
		model.addAttribute("bankList", bankList);
		return "user/moneyApply";
	}

	/**
	 * 用户申请提款
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/apply/save")
	@ResponseBody
	public Map applyMoneySave(HttpServletRequest request) {
		MemberUser mu = (MemberUser) request.getSession().getAttribute(
				MemberUser.FRONT_MEMBER_LOGIN_SESSION);

		String cardTypes = request.getParameter("cardType");
		String applyMoneyStr = request.getParameter("applyMoney");
		String withdrawPassword = request.getParameter("withdrawPassword");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sucess", false);

		int cardType = 0;
		Bank bank;
		  String bamkCardNo;
		  String idCardNo;
	        String applyName;
	        String bankName;
		try {
			cardType = Integer.valueOf(cardTypes);
			if (cardType == 1){
				bank=Bank.ZFB;
				bamkCardNo=mu.getZfbCode();
				bankName=Bank.ZFB.getName();
			}else{
				bank=Bank.CCB;
				bamkCardNo=mu.getBankCode();
				bankName=mu.getBankName();
			}
			if(bamkCardNo!=null&&!bamkCardNo.equals("")){
			applyName=mu.getRealName();
			idCardNo=mu.getIdentityCard();
      
				if (mu != null) {
					try {
						MemberUser user = memberUserService.find(mu.getId());
						mu = user;
						request.getSession().setAttribute(
								MemberUser.FRONT_MEMBER_LOGIN_SESSION, mu);
					} catch (Exception e) {
						e.printStackTrace();
						map.put("msg", "提款申请失败，用户信息已失效请重新登陆！");
						return map;
					}
					log.info("可用余额:" + mu.getAvailableScore());
					log.info("密码:" + Md5Util.generatePassword(withdrawPassword));
					log.info("密码:" + mu.getMoneyPwd());
					if (withdrawPassword != null
							&& Md5Util.generatePassword(withdrawPassword)
									.equals(mu.getMoneyPwd())) {
						if (mu.getAvailableScore() < Float.valueOf(applyMoneyStr)) {
							map.put("msg", "可用余额不足！");
						} else {
							ApplyRecord applyRecord = new ApplyRecord();
							applyRecord.setBankNo(bamkCardNo);
							applyRecord
									.setApplyMoney(Float.valueOf(applyMoneyStr));
							applyRecord.setCreateDate(new Date());
							applyRecord.setBank(bank);
							applyRecord.setBankName(bankName);
							applyRecord.setApplyName(applyName);
							applyRecord.setAuditStatus(ApplyRecord.UN_AUDIT);// 未审核
							applyRecord.setIdCardNo(idCardNo);
							applyRecord.setMemberUser(mu);

							mu.setAvailableScore(mu.getAvailableScore()
									- Float.valueOf(applyMoneyStr));
							mu.setFrozenScore(mu.getFrozenScore()
									+ Float.valueOf(applyMoneyStr));
							memberUserService.update(mu);

							applyRecordService.save(applyRecord);

							map.put("sucess", true);
							map.put("msg", "提款申请成功！");
						}

					} else {
						map.put("msg", "提款申请失败，提款密码验证错误！");
					}
				} else {
					map.put("msg", "提款申请失败，用户信息已失效请重新登陆！");
				}
			}else{
				map.put("msg", "提款申请失败，请先绑定银行或支付宝信息！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "提款申请失败，请重新登陆并检查你的资料信息！");
		}

		return map;

	}
}
