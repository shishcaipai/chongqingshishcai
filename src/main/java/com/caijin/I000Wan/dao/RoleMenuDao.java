package com.caijin.I000Wan.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.entity.Article;
import com.caijin.I000Wan.entity.RoleMenu;

/**
 * roleMenuDao
 * @author jeff
 * @since 2014-06-17
 */
public interface RoleMenuDao extends CommonDao<RoleMenu,String>{
	@Query(value="select * from SYS_ROLE_MENU p where p.role_id=?1",nativeQuery=true)
	List<RoleMenu> findByRole(String id);

//	@Query("select a from Article a where a.type =?1 order by a.createDate desc ")
//	List<Article> findByType(Integer type);
}
