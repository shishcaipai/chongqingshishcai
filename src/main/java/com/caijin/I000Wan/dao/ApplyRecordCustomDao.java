package com.caijin.I000Wan.dao;

import java.util.List;
import java.util.Map;

public interface ApplyRecordCustomDao {

	List<Map> findApplyRecordListByCondition(String realName,String idCardNo,
			String userName,String auditStatus,
			String applystartDate,String applyendDate,String startDate,String endDate);
}
