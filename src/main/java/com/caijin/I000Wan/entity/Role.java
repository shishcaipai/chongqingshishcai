package com.caijin.I000Wan.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.caijin.I000Wan.common.entity.BaseEntity;
@Entity
@Table(name = "sys_role")
public class Role extends BaseEntity {
private String roleName;
private String descption;
@Column(name = "rolename",length=50)
public String getRoleName() {
	return roleName;
}
public void setRoleName(String roleName) {
	this.roleName = roleName;
}
@Column(name = "descption",length=250)
public String getDescption() {
	return descption;
}
public void setDescption(String descption) {
	this.descption = descption;
}


}
