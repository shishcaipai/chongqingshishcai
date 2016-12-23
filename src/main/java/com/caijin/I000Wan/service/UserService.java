package com.caijin.I000Wan.service;

import java.util.List;
import java.util.Map;

import com.caijin.I000Wan.common.service.CommonService;
import com.caijin.I000Wan.entity.User;

public interface UserService extends CommonService<User,String>{

	User findUserByName(String userName);
	
	List<Map> findUserList(String userName,String realName,String startDate,String endDate);
	
}
