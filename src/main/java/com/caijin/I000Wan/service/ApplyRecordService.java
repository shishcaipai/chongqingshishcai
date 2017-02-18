package com.caijin.I000Wan.service;

import java.util.List;
import java.util.Map;

import com.caijin.I000Wan.common.service.CommonService;
import com.caijin.I000Wan.entity.ApplyRecord;
import com.caijin.I000Wan.util.PageModel;
import com.caijin.I000Wan.util.Result;

public interface ApplyRecordService extends CommonService<ApplyRecord,String>{

	/**
	 * 取某个人最近一周的的提款记录信息
	 * @param userId
	 * @return
	 */
	List<ApplyRecord> getRecentOneWeekApplyRecordList(String userId);
	
	/**
	 * 取某个人某段时间内的提款记录信息
	 * @param userId
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	List<ApplyRecord> getApplyRecordList(String userId,String startDate,String endDate);
	
	Result findApplyRecordListByCondition(PageModel pageModel,String realName,String idCardNo,
			String userName,String auditStatus,
			String applystartDate,String applyendDate,String startDate,String endDate);

	void clear();

	
}
