package com.caijin.I000Wan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.service.impl.CommonServiceImpl;
import com.caijin.I000Wan.dao.RoleDao;
import com.caijin.I000Wan.entity.Role;
import com.caijin.I000Wan.service.RoleService;
@Component
@Transactional
public class RoleServiceImpl extends CommonServiceImpl<Role,String> implements RoleService {
	@Autowired
	private RoleDao roleDao;
	
	@Autowired
	public void setRoleDao(RoleDao roleDao) {
		super.setCommonDao(roleDao);
	}

	@Override
	public List<Role> findByType(Integer type) {
		return null;
	}

	@Override
	public List<Role> findAll() {
		return roleDao.findAll();
	}

}
