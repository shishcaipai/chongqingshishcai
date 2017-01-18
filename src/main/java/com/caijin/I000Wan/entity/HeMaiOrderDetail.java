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
	private Order order;

	private String hemaiId;
	// 分成份数
	private Integer fensum;
	// 保底份数
	private Integer minimumGuaranteeSum;
	// 发起人购份数
	private Integer subGuaranteeSum;
	// 发起人
	private MemberUser memberUser;
	// 是否生效
	private boolean isEffective;

	// 发起人购买金额
	private Float floatManay;
	
	private int type;// 1 方案公开 2 跟单后公开 3 完全保密
	// 描述
	private String desc;
	
	@Transient
	private Integer otherBuyNum;
	@Column(length = 100)
	public Float getFloatManay() {
		return floatManay;
	}
	public void setFloatManay(Float floatManay) {
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
	public Integer getFensum() {
		return fensum;
	}
	public void setFensum(Integer fensum) {
		this.fensum = fensum;
	}
	@Column(length = 10)
	public Integer getMinimumGuaranteeSum() {
		return minimumGuaranteeSum;
	}
	public void setMinimumGuaranteeSum(Integer minimumGuaranteeSum) {
		this.minimumGuaranteeSum = minimumGuaranteeSum;
	}
	@Column(length = 10)
	public Integer getSubGuaranteeSum() {
		return subGuaranteeSum;
	}
	public void setSubGuaranteeSum(Integer subGuaranteeSum) {
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
	public boolean isEffective() {
		return isEffective;
	}
	public void setEffective(boolean isEffective) {
		this.isEffective = isEffective;
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
