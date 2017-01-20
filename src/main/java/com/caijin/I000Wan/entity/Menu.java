package com.caijin.I000Wan.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.caijin.I000Wan.common.entity.BaseEntity;

@Entity
@Table(name = "SYS_MENU")
public class Menu extends BaseEntity {
	public final static int  MENU_ONE=1;
	public final static int  MENU_SECOND=2;
	private String menu;
	private String menuPath;
	private  int type;
	private String pid;
	private List<Menu>  list=new ArrayList<Menu>();
	@Transient
	public List<Menu> getList() {
		return list;
	}

	public void add(Menu menu) {
		this.list.add(menu);
	}

	@Column(name = "menu", length = 50)
	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	 @Column(name = "menuPath",length=250)
	public String getMenuPath() {
		return menuPath;
	}

	public void setMenuPath(String menuPath) {
		this.menuPath = menuPath;
	}
	@Column(name = "type", length = 10)
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	@Column(name = "p_id", length = 64)
	public String getPid() {
		return pid;
	}
	
	public void setPid(String pid) {
		this.pid = pid;
	}

}
