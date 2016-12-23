package com.caijin.I000Wan.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.service.impl.CommonServiceImpl;
import com.caijin.I000Wan.dao.MemberUserDao;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.service.MemberUserService;
import com.caijin.I000Wan.util.PageModel;
import com.caijin.I000Wan.util.Result;

@Component
@Transactional
public class MemberUserServiceImpl extends CommonServiceImpl<MemberUser,String> implements MemberUserService{

	@Autowired
	private MemberUserDao memberUserDao;
	
	@Autowired
	public void setMemberUserDao(MemberUserDao memberUserDao) {
		super.setCommonDao(memberUserDao);
	}

	public MemberUser findByUserName(String userName){
		return memberUserDao.findByUserName(userName);
	}
	
	public List<Map> findMemberList(String userName,String realName,String mobile,String startDate,String endDate){
	    return 	memberUserDao.findMemberList(userName, realName, mobile, startDate, endDate);
	}

	@Override
	public Result getMemberUserAll(PageModel pageModel,String userName,String realName,String mobile,String startDate,String endDate) {
		Result<Map> result = new Result<Map>();
		List<Map> list =  memberUserDao.getMemberUserAll(pageModel,userName, realName, mobile, startDate, endDate);
		int total =  memberUserDao.getMemberUserAllCount(pageModel,userName, realName, mobile, startDate, endDate);
		result.setRows(list);
		result.setTotal(total);
		return result;
	}
	
}
