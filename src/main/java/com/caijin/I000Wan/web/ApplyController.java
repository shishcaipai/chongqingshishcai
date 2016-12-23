package com.caijin.I000Wan.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caijin.I000Wan.entity.ApplyRecord;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.enu.Bank;
import com.caijin.I000Wan.service.ApplyRecordService;

/**
 * 提款申请Action
 * @author Jeff
 * @since 2014-07-26
 */
@Controller
@RequestMapping("/money")
public class ApplyController {
	
	@Autowired
	private ApplyRecordService applyRecordService;
	
    /**
     * 跳转到提款记录列表
     * @param request
     * @return
     */
	@RequestMapping("/applyrecord/list")
	public String applyRecordList(HttpServletRequest request,Model model){
		MemberUser mu=(MemberUser)request.getSession().getAttribute(MemberUser.FRONT_MEMBER_LOGIN_SESSION);

		String startDate=request.getParameter("startDate");
		String endDate=request.getParameter("endDate");
		
		List<ApplyRecord> recordList=new ArrayList<ApplyRecord>();
		if(StringUtils.isEmpty(startDate) && StringUtils.isEmpty(endDate)){
			recordList=applyRecordService.getRecentOneWeekApplyRecordList(mu.getId());
		}
		model.addAttribute("recordList", recordList);
		return "user/applyRecordList";
	}
	
	/**
	 * 跳转到用户提款申请页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/apply")
	public String toMoneyApply(HttpServletRequest request,Model model){
		MemberUser mu=(MemberUser)request.getSession().getAttribute(MemberUser.FRONT_MEMBER_LOGIN_SESSION);
		List<Bank> bankList=new ArrayList<Bank>();
		for(Bank bank:Bank.values()){
			bankList.add(bank);
		}
		model.addAttribute("memberUser", mu);
		model.addAttribute("bankList", bankList);
		return "user/moneyApply";
	}

	/**
	 * 用户申请提款
	 * @param request
	 * @return
	 */
	@RequestMapping("/apply/save")
	@ResponseBody
	public Map applyMoneySave(HttpServletRequest request){
		MemberUser mu=(MemberUser)request.getSession().getAttribute(MemberUser.FRONT_MEMBER_LOGIN_SESSION);
		
		String bamkCardNo=request.getParameter("bamkCardNo");
		String applyMoneyStr=request.getParameter("applyMoney");
		String bankCode=request.getParameter("bankCode");
		String idCardNo=request.getParameter("idCardNo");
		String applyName=request.getParameter("applyName");
		
		Map<String ,Object> map=new HashMap<String,Object>();
		map.put("sucess", false);
		
		Bank bank=null;
		
		try{
			bank=Bank.valueOf(bankCode);
			if(mu != null){
				if(mu.getAvailableScore() < new Integer(applyMoneyStr)){
					map.put("msg", "你没有这么多的可用余额！");
				}else{
					ApplyRecord applyRecord=new ApplyRecord();
					applyRecord.setBankNo(bamkCardNo);
					applyRecord.setApplyMoney(new Integer(applyMoneyStr));
					applyRecord.setCreateDate(new Date());
					applyRecord.setBank(bank);
					applyRecord.setBankName(bank == null ? "" : bank.getName());
					applyRecord.setApplyName(applyName);
					applyRecord.setAuditStatus(ApplyRecord.UN_AUDIT);//未审核
					applyRecord.setIdCardNo(idCardNo);
					applyRecord.setMemberUser(mu);
					
					applyRecordService.save(applyRecord);
					
					map.put("sucess", true);
					map.put("msg", "提款申请成功！");
				}
			}else{
				map.put("msg", "请先登录！");
			}
			
		}catch(Exception e){
			e.printStackTrace();
			map.put("msg", "提款申请失败，请检查你的资料信息！");
		}
		
		return map;
		
	}
	
}
