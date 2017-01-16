package com.caijin.I000Wan.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.caijin.I000Wan.common.entity.BaseEntity;

@Entity
@Table(name = "SYS_USER_MENU")
public class UserMenu extends BaseEntity {
	private MemberUser user;
	private Menu menu;

	@ManyToOne
	@JoinColumn(name = "member_id")
	public MemberUser getUser() {
		return user;
	}

	public void setUser(MemberUser user) {
		this.user = user;
	}

	@ManyToOne
	@JoinColumn(name = "menu_id")
	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

}
