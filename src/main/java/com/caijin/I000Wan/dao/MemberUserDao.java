package com.caijin.I000Wan.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.entity.MemberUser;

public interface MemberUserDao extends MemberUserCustomDao,CommonDao<MemberUser,String>{

	@Query(value="select u.* from member_user u where u.user_name=?1 ",nativeQuery=true)
	MemberUser findByUserName(String userName);
	
	@Query(value="select u.* from member_user u where u.id=?1 ",nativeQuery=true)
	MemberUser findUserById(String id);
	@Query(value="select u.* from member_user u where u.pred_id=?1 ",nativeQuery=true)
	MemberUser findByRegeisterID(String registerID);
	@Query(value="select u.* from member_user u where u.commend_member_id=?3 order by u.create_date desc limit ?1,?2 ",nativeQuery=true)
	List<MemberUser> findMemberByAgentUserId(int i, int pageSize, String id);
	@Query(value="select count(u.id) from member_user u where u.commend_member_id=?1  ",nativeQuery=true)
	int findCountMemberByAgentUserId(String id);
	@Query(value="select count(u.id) from member_user u where u.commend_member_id=?1  and TO_DAYS(u.create_date) = TO_DAYS(NOW()) ",nativeQuery=true)
	int getAllTodayPredUserCount(String id);
	@Query(value="select count(u.id) from member_user u left join trade_order o on o.member_id=u.id where u.commend_member_id=?1 and (o.order_type=2 or o.order_type=3  ) and TO_DAYS(o.create_date) = TO_DAYS(NOW()) ",nativeQuery=true)
	int getAllTodayActivePredUserCount(String id);
	@Query(value="select count(u.id) from member_user u left join trade_order o on o.member_id=u.id where u.commend_member_id=?1 and (o.order_type=2 or o.order_type=3  ) ",nativeQuery=true)
	int getAllActivePredUserCount(String id);
}
