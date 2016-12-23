package com.caijin.I000Wan.dao;

import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.entity.User;

public interface UserDao extends SystemUserDao,CommonDao<User,String>{

	@Query("select o from User o where o.username=?1 ")
	User findUserByName(String userName);
	
}
