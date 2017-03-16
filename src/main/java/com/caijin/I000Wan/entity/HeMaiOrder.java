package com.caijin.I000Wan.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.caijin.I000Wan.common.entity.BaseEntity;

@Entity
@Table(name = "hemai_order")
public class HeMaiOrder extends BaseEntity{
	// 已认购购份数
	private Integer subGuaranteeSum;
	// 购买人
	private MemberUser memberUser;
	// 购买金额
	private Float floatManay;
     //是否生效
	private int status=0;
	private String orderNo;
	private HeMaiOrderDetail orderDetail;
	@Column(length = 10)
	public Integer getSubGuaranteeSum() {
		return subGuaranteeSum;
	}

	public void setSubGuaranteeSum(Integer subGuaranteeSum) {
		this.subGuaranteeSum = subGuaranteeSum;
	}
	@Column(name = "order_no", length = 32)
	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	@ManyToOne
	@JoinColumn(name = "member_id")
	public MemberUser getMemberUser() {
		return memberUser;
	}

	public void setMemberUser(MemberUser memberUser) {
		this.memberUser = memberUser;
	}
	@Column(length = 10)
	public Float getFloatManay() {
		return floatManay;
	}

	public void setFloatManay(Float floatManay) {
		this.floatManay = floatManay;
	}
	@Column(length = 10)
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	@ManyToOne
	@JoinColumn(name = "hemai_id")
	public HeMaiOrderDetail getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(HeMaiOrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}

}
