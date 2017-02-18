package com.caijin.I000Wan.dao;

import java.util.List;
import java.util.Map;

import com.caijin.I000Wan.util.PageModel;
import com.caijin.I000Wan.util.Result;

public interface ApplyRecordCustomDao {

	Result findApplyRecordListByCondition(PageModel pageMode,String realName,String idCardNo,
			String userName,String auditStatus,
			String applystartDate,String applyendDate,String startDate,String endDate);
	
	public void clear();
}
