package com.caijin.I000Wan.service;

import java.util.List;

import com.caijin.I000Wan.common.service.CommonService;
import com.caijin.I000Wan.entity.Article;
import com.caijin.I000Wan.entity.Menu;
import com.caijin.I000Wan.entity.Role;
import com.caijin.I000Wan.entity.RoleMenu;

public interface RoleMenuService extends CommonService<RoleMenu,String>{

	List<RoleMenu> findByRole(Role role);
}
