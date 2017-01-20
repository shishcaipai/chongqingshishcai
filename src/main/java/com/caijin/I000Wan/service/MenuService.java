package com.caijin.I000Wan.service;

import java.util.List;

import com.caijin.I000Wan.common.service.CommonService;
import com.caijin.I000Wan.entity.Article;
import com.caijin.I000Wan.entity.Menu;
import com.caijin.I000Wan.entity.Role;

public interface MenuService extends CommonService<Menu,String>{

	List<Menu> findAll();
	
	List<Menu> findAllbyType(int type);
	List<Menu> findByRoleId(String  roleId);
}
