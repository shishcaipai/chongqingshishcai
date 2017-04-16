package com.caijin.I000Wan.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.entity.Article;
import com.caijin.I000Wan.entity.LogData;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.entity.RoleUser;

/**
 * 登陆日志
 * @author jeff
 * @since 2014-06-17
 */
public interface LogDataDao extends CommonDao<LogData,String>,LogDataCustomDao{
	@Query("select a from LogData a where a.memberUser =?1 order by a.createDate desc ")
	List<LogData> findByUserId(MemberUser userId);


}
