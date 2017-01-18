package com.caijin.I000Wan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.service.impl.CommonServiceImpl;
import com.caijin.I000Wan.dao.MenuDao;
import com.caijin.I000Wan.entity.Menu;
import com.caijin.I000Wan.service.MenuService;
@Component
@Transactional
public class MenuServiceImpl extends CommonServiceImpl<Menu,String> implements MenuService {
	@Autowired
	private MenuDao menuDao;
	@Autowired
	public void setMenuDao(MenuDao menuDao) {
		super.setCommonDao(menuDao);
	}
	@Override
	public List<Menu> findAll() {
		return menuDao.findAll();
	}

	@Override
	public List<Menu> findByRoleId(String roleId) {
		return menuDao.findByRoleId( roleId) ;
	}

}
