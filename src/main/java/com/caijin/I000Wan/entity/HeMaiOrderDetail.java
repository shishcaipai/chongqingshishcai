package com.caijin.I000Wan.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.caijin.I000Wan.common.entity.BaseEntity;

@Entity
@Table(name = "hemai_order_detail")
public class HeMaiOrderDetail extends BaseEntity {
	private static final long serialVersionUID = 7485168642747519619L;
	public static final int TYPE_EFFECTIVE_UN = 0;
	public static final int TYPE_EFFECTIVE_SUCCESS = 1;
	public static final int TYPE_EFFECTIVE_FAIL = 2;
	private Order order;

	private String hemaiId;
	// 分成份数
	private int fensum=0;
	// 保底份数
	private int minimumGuaranteeSum=0;
	// 发起认购份数
	private int subGuaranteeSum=0;
	// 发起人
	private MemberUser memberUser;
	// 是否生效
	private int status;

	// 发起人购买金额
	private float floatManay;
	
	private int type;// 1 方案公开 2 跟单后公开 3 完全保密
	// 描述
	private String desc;
	
	@Transient
	private int otherBuyNum;
	@Column(length = 100)
	public float getFloatManay() {
		return floatManay;
	}
	public void setFloatManay(float floatManay) {
		this.floatManay = floatManay;
	}
	@ManyToOne
	@JoinColumn(name = "order_id")
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	@Column(length = 10)
	public int getFensum() {
		return fensum;
	}
	public void setFensum(int fensum) {
		this.fensum = fensum;
	}
	@Column(length = 10)
	public int getMinimumGuaranteeSum() {
		return minimumGuaranteeSum;
	}
	public void setMinimumGuaranteeSum(int minimumGuaranteeSum) {
		this.minimumGuaranteeSum = minimumGuaranteeSum;
	}
	@Column(length = 10)
	public int getSubGuaranteeSum() {
		return subGuaranteeSum;
	}
	public void setSubGuaranteeSum(int subGuaranteeSum) {
		this.subGuaranteeSum = subGuaranteeSum;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Column(length = 10)
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	@Column(name="descption", length = 256)
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	@Column(name="hemai_id",length=36)
	public String getHemaiId() {
		return hemaiId;
	}
	public void setHemaiId(String hemaiId) {
		this.hemaiId = hemaiId;
	}
	public Integer getOtherBuyNum() {
		return otherBuyNum;
	}
	public void setOtherBuyNum(Integer otherBuyNum) {
		this.otherBuyNum = otherBuyNum;
	}
	
	

}
