package com.caijin.I000Wan.dao;

import java.util.List;
import java.util.Map;

import com.caijin.I000Wan.util.PageModel;
import com.caijin.I000Wan.util.Result;

public interface LogDataCustomDao {

	Result findApplyRecordListByCondition(PageModel pageMode,
			String userName,String startDate,String endDate);
	
}
