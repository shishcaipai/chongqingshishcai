package com.caijin.I000Wan.dao;

import java.util.List;
import java.util.Map;

import com.caijin.I000Wan.util.PageModel;

public interface MemberUserCustomDao {

	List<Map> findMemberList(String userName,String realName,String mobile,String startDate,String endDate);
	
	List<Map> getMemberUserAll(PageModel pageModel,String userName,String realName,String mobile,String startDate,String endDate);
	
	int getMemberUserAllCount(PageModel pageModel,String userName,String realName,String mobile,String startDate,String endDate);
}
