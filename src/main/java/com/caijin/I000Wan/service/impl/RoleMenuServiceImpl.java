package com.caijin.I000Wan.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.service.impl.CommonServiceImpl;
import com.caijin.I000Wan.dao.MenuDao;
import com.caijin.I000Wan.dao.RoleMenuDao;
import com.caijin.I000Wan.entity.Menu;
import com.caijin.I000Wan.entity.Role;
import com.caijin.I000Wan.entity.RoleMenu;
import com.caijin.I000Wan.service.MenuService;
import com.caijin.I000Wan.service.RoleMenuService;

@Component
@Transactional
public class RoleMenuServiceImpl extends CommonServiceImpl<RoleMenu, String>
		implements RoleMenuService {
	@Autowired
	private RoleMenuDao roleMenuDao;

	@Autowired
	public void setRoleMenuDao(RoleMenuDao roleMenuDao) {
		super.setCommonDao(roleMenuDao);
	}

	@Override
	public List<RoleMenu> findByRole(Role role) {
		try {
			return roleMenuDao.findByRole(role.getId());
		} catch (Exception e) {
			return new ArrayList<RoleMenu>();
		}
	}

}
