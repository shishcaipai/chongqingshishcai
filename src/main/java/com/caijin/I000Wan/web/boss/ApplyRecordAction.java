package com.caijin.I000Wan.web.boss;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caijin.I000Wan.entity.ApplyRecord;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.service.ApplyRecordService;
import com.caijin.I000Wan.util.DataGridModel;
import com.caijin.I000Wan.util.PageModel;
import com.caijin.I000Wan.util.Result;
import com.caijin.I000Wan.util.StaticDefine;

@Controller
@RequestMapping("/boss")
public class ApplyRecordAction {

	@Autowired
	private ApplyRecordService applyRecordService;

	@RequestMapping("/applyrecord/list")
	public String applyRecordList() {

		return "/boss/applyrecordList";
	}

	@RequestMapping("/applyrecord/ajax_list")
	@ResponseBody
	public Result findApplyRecordList(DataGridModel dgm,
			HttpServletRequest request, PageModel pageModel) {

		String realName = request.getParameter("realName");
		String idCardNo = request.getParameter("idCardNo");
		String userName = request.getParameter("userName");
		String auditStatus = request.getParameter("auditStatus");
		String applystartDate = request.getParameter("applystartDate");
		String applyendDate = request.getParameter("applyendDate");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		applyRecordService.clear();
		Result result = applyRecordService.findApplyRecordListByCondition(
				pageModel, realName, idCardNo, userName, auditStatus,
				applystartDate, applyendDate, startDate, endDate);
		return result;
	}

	@RequestMapping("/applyrecord/ajax_stauts")
	@ResponseBody
	public String updateApplyRecordList(HttpServletRequest request) {
		try {
			String id = request.getParameter("id");
			String status = request.getParameter("status");

			ApplyRecord applyRecord = applyRecordService.find(id);
			applyRecord.setAuditStatus(Integer.valueOf(status));
			applyRecordService.update(applyRecord);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
}
