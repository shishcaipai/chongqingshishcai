package com.caijin.I000Wan.web.boss;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caijin.I000Wan.service.ApplyRecordService;

@Controller
@RequestMapping("/boss")
public class ApplyRecordAction {

	@Autowired
	private ApplyRecordService applyRecordService;
	
	@RequestMapping("/applyrecord/list")
	public String applyRecordList(){
		
		return "/boss/applyrecordList";
	}
	
	@RequestMapping("/applyrecord/ajax_list")
	@ResponseBody
	public List<Map> findApplyRecordList(HttpServletRequest request){
		
		String realName = request.getParameter("realName");
		String idCardNo = request.getParameter("idCardNo");
		String userName = request.getParameter("userName");
		String auditStatus = request.getParameter("auditStatus");
		String applystartDate = request.getParameter("applystartDate");
		String applyendDate = request.getParameter("applyendDate");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		List<Map> recordList = applyRecordService.findApplyRecordListByCondition(realName,idCardNo,
				userName,auditStatus,applystartDate,applyendDate,startDate,endDate);
		return recordList;
	}
	
}
