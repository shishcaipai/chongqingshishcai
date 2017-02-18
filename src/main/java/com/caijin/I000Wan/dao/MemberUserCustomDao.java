package com.caijin.I000Wan.dao;

import java.util.List;
import java.util.Map;

import com.caijin.I000Wan.util.PageModel;
import com.caijin.I000Wan.util.Result;

public interface MemberUserCustomDao {
	public void clear();

	List<Map> findMemberList(String userName,String realName,String mobile,String startDate,String endDate);
	
	Result getMemberUserAll(PageModel pageModel,String userName,String realName,String mobile,String startDate,String endDate);
	
	int getMemberUserAllCount(PageModel pageModel,String userName,String realName,String mobile,String startDate,String endDate);
}
