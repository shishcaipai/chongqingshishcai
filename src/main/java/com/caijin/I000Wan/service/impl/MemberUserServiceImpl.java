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
public class MemberUserServiceImpl extends
		CommonServiceImpl<MemberUser, String> implements MemberUserService {

	@Autowired
	private MemberUserDao memberUserDao;

	@Autowired
	public void setMemberUserDao(MemberUserDao memberUserDao) {
		super.setCommonDao(memberUserDao);
	}

	public MemberUser findByUserName(String userName) {
		try {
			return memberUserDao.findByUserName(userName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new MemberUser();
	}

	public List<Map> findMemberList(String userName, String realName,
			String mobile, String startDate, String endDate) {
		return memberUserDao.findMemberList(userName, realName, mobile,
				startDate, endDate);
	}

	@Override
	public Result getMemberUserAll(PageModel pageModel, String userName,
			String realName, String mobile, String startDate, String endDate) {
		return memberUserDao.getMemberUserAll(pageModel, userName, realName,
				mobile, startDate, endDate);
	}

	@Override
	public MemberUser findByRegeisterID(String registerID) {
		return memberUserDao.findByRegeisterID(registerID);
	}

	@Override
	public List<MemberUser> findMemberByAgentUserId(int i, int pageSize,
			String id) {
		return memberUserDao.findMemberByAgentUserId(i, pageSize, id);
	}

	@Override
	public Integer findCountMemberByAgentUserId(String id) {
		return memberUserDao.findCountMemberByAgentUserId(id);
	}

	@Override
	public Integer getAllPredUser(String id) {
		return memberUserDao.findCountMemberByAgentUserId(id);
	}

	@Override
	public Integer getAllTodayPredUser(String id) {
		return memberUserDao.getAllTodayPredUserCount(id);
	}

	@Override
	public Integer getAllTodayActivePredUser(String id) {
		return memberUserDao.getAllTodayActivePredUserCount(id);
	}

	@Override
	public Integer getAllActivePredUser(String id) {
		return memberUserDao.getAllActivePredUserCount(id);
	}

	@Override
	public void clear() {
		memberUserDao.clear();

	}

	@Override
	public MemberUser findByPreId(String predId) {
		try {
			return memberUserDao.findByRegeisterID(predId);
		} catch (Exception e) {

		}
		return null;
	}

}
