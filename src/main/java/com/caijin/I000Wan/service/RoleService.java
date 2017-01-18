package com.caijin.I000Wan.service;

import java.util.List;

import com.caijin.I000Wan.common.service.CommonService;
import com.caijin.I000Wan.entity.Article;
import com.caijin.I000Wan.entity.Role;

public interface RoleService extends CommonService<Role,String>{

	List<Role> findByType(Integer type);

	List<Role> findAll();
}
