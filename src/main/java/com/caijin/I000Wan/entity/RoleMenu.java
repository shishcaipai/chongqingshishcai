package com.caijin.I000Wan.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.caijin.I000Wan.common.entity.BaseEntity;

@Entity
@Table(name = "sys_role_menu")
public class RoleMenu extends BaseEntity {
	private Role role;
	private Menu menu;

	
	
	@ManyToOne
	@JoinColumn(name = "menu_id")
	public Menu getMenu() {
		return menu;
	}
	@ManyToOne
	@JoinColumn(name = "role_id")
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

}
