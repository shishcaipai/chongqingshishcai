package com.caijin.I000Wan.service.impl;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.service.impl.CommonServiceImpl;
import com.caijin.I000Wan.dao.MenuDao;
import com.caijin.I000Wan.dao.RoleUserDao;
import com.caijin.I000Wan.entity.Article;
import com.caijin.I000Wan.entity.Menu;
import com.caijin.I000Wan.entity.RoleUser;
import com.caijin.I000Wan.service.MenuService;
import com.caijin.I000Wan.service.RoleUserService;
@Component
@Transactional
public class RoleUserServiceImpl extends CommonServiceImpl<RoleUser,String> implements RoleUserService {
	@Autowired
	private RoleUserDao roleUserDao;


}
