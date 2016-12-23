package com.caijin.I000Wan.common.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class BaseEntity extends IdEntity implements Serializable {
	
	private static final long serialVersionUID = 1024354665982751553L;
	
	/**
	 * “创建日期”属性名称
	 */
	public static final String CREATE_DATE_PROPERTY_NAME = "createDate";
	/**
	 * “修改日期”属性名称
	 */
	public static final String UPDATE_DATE_PROPERTY_NAME = "updateDate";
	
	/**
	 * 创建日期
	 */
	protected Date createDate;
	/**
	 * 修改日期
	 */
	protected Date updateDate;
	
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	@Override
	public boolean equals(Object object) {
		if (object == null) {
			return false;
		}
		if (object instanceof BaseEntity) {
			BaseEntity baseEntity = (BaseEntity) object;
			if (this.getId() == null || baseEntity.getId() == null) {
				return false;
			} else {
				return (this.getId().equals(baseEntity.getId()));
			}
		}
		return false;
	}
	
	@Override
	public int hashCode() {
		return id == null ? System.identityHashCode(this) : (this.getClass().getName() + this.getId()).hashCode();
	}
	
}
