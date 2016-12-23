package com.caijin.I000Wan.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.caijin.I000Wan.common.service.impl.CommonServiceImpl;
import com.caijin.I000Wan.dao.UserDao;
import com.caijin.I000Wan.entity.User;
import com.caijin.I000Wan.service.UserService;

@Service
public class UserServiceImpl extends CommonServiceImpl<User,String>  implements UserService{

	@Autowired
	private UserDao userDao;
	
	@Autowired
	public void setUserDao(UserDao userDao) {
		super.setCommonDao(userDao);
	}
	
	public User findUserByName(String userName){
		return userDao.findUserByName(userName);
	}
	
	public List<Map> findUserList(String userName,String realName,String startDate,String endDate){
		return userDao.findUserList(userName,realName,startDate,endDate);
	}
	

}
