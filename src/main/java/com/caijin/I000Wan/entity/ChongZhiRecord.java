package com.caijin.I000Wan.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.caijin.I000Wan.common.entity.BaseEntity;

/**
 * 充值实体记录
 * 
 * @author jiangneng
 * 
 */
@Entity
@Table(name = "chongzhi_record")
public class ChongZhiRecord extends BaseEntity {
	private User user;//操作者
	private float availableScore = 0;// 可用金额
	private float actionScore = 0;// 活动金额
	private MemberUser  memberUser;//充值对像
	@ManyToOne
	@JoinColumn(name = "member_id")
	public MemberUser getMemberUser() {
		return memberUser;
	}
	public void setMemberUser(MemberUser memberUser) {
		this.memberUser = memberUser;
	}
	@ManyToOne
	@JoinColumn(name = "user_id")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Column(name = "available_score")
	public float getAvailableScore() {
		return availableScore;
	}
	public void setAvailableScore(float availableScore) {
		this.availableScore = availableScore;
	}
	@Column(name = "action_score")
	public float getActionScore() {
		return actionScore;
	}
	public void setActionScore(float actionScore) {
		this.actionScore = actionScore;
	}

}
