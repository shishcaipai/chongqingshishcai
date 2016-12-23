package com.caijin.I000Wan.service;

import java.util.List;
import java.util.Map;

import com.caijin.I000Wan.common.service.CommonService;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.util.PageModel;
import com.caijin.I000Wan.util.Result;

public interface MemberUserService extends CommonService<MemberUser,String>{
		
	MemberUser findByUserName(String userName);
	
	List<Map> findMemberList(String userName,String realName,String mobile,String startDate,String endDate);
	
	Result getMemberUserAll(PageModel pageModel,String userName,String realName,String mobile,String startDate,String endDate);
}
