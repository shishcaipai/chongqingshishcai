package com.caijin.I000Wan.dao;

import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.entity.MemberUser;

public interface MemberUserDao extends MemberUserCustomDao,CommonDao<MemberUser,String>{

	@Query(value="select u.* from member_user u where u.user_name=?1 ",nativeQuery=true)
	MemberUser findByUserName(String userName);
	
	@Query(value="select u.* from member_user u where u.member_user_id=?1 ",nativeQuery=true)
	MemberUser findUserById(Integer id);

}
