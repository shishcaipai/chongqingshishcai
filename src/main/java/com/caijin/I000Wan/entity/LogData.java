package com.caijin.I000Wan.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.caijin.I000Wan.common.entity.BaseEntity;

@Entity
@Table(name = "log_data")
public class LogData extends BaseEntity {
	private MemberUser memberUser;
	private String ip;

	@ManyToOne
	@JoinColumn(name = "member_id")
	public MemberUser getMemberUser() {
		return memberUser;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public void setMemberUser(MemberUser memberUser) {
		this.memberUser = memberUser;
	}
	
}
