package com.caijin.I000Wan.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.entity.Article;
import com.caijin.I000Wan.entity.Menu;

/**
 * 菜单Dao
 * @author jeff
 * @since 2014-06-17
 */
public interface MenuDao extends CommonDao<Menu,String>{
	@Query(value="select * from sys_menu m " +
			" inner join sys_role_menu d on d.`menu_id`=m.`id` " +
			" where d.role_id=?1;",nativeQuery=true)
	List<Menu> findByRoleId(String roleId);
//	@Query(value="select *  from SYS_MENU  d  where  d.type = ?1;",nativeQuery=true)
	@Query("select o from Menu o where o.type = ?1 ")
	List<Menu> findAllbyType(int type);

}
