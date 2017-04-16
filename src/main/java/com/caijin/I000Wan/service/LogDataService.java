package com.caijin.I000Wan.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.service.CommonService;
import com.caijin.I000Wan.entity.Article;
import com.caijin.I000Wan.entity.LogData;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.entity.Menu;
import com.caijin.I000Wan.entity.Role;
import com.caijin.I000Wan.util.PageModel;
import com.caijin.I000Wan.util.Result;

public interface LogDataService extends CommonService<LogData,String>{
	
	List<LogData> findAll();
	
	List<LogData> findByUserId(MemberUser  userId);

	Result<Map> getLogDataMemberUserAll(PageModel pageModel, String userName,
			String startDate, String endDate);
}
