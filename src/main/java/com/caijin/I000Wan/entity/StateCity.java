package com.caijin.I000Wan.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 省市区实体
 * @author vivian 
 * @since 2014-07-19 10:00
 */
@Entity
@Table(name = "state_city")
public class StateCity {
	private Integer id;
	private String classParentName;//父级Name
	private Integer classParentId;//父级ID
	private Integer classType;//类型
	private String className;//名称
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id", nullable = true)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name="class_parent_name",length=128)
	public String getClassParentName() {
		return classParentName;
	}
	public void setClassParentName(String classParentName) {
		this.classParentName = classParentName;
	}
	@Column(name="class_parent_id")
	public Integer getClassParentId() {
		return classParentId;
	}
	public void setClassParentId(Integer classParentId) {
		this.classParentId = classParentId;
	}
	
	@Column(name="class_type")
	public Integer getClassType() {
		return classType;
	}
	public void setClassType(Integer classType) {
		this.classType = classType;
	}
	
	@Column(name="className",length=128)
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	
}
