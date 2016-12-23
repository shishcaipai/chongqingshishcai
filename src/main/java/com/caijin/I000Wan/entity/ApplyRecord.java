package com.caijin.I000Wan.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.caijin.I000Wan.common.entity.BaseEntity;
import com.caijin.I000Wan.enu.Bank;

/**
 * 提款实体
 * @author Administrator
 *
 */
@Entity
@Table(name="apply_record")
public class ApplyRecord extends BaseEntity{

	private static final long serialVersionUID = -1508799697461386872L;
	
	public final static Integer AUDIT_SUCESS=0;//审核通过
	
	public final static Integer AUDIT_FAILUE=1;//审核失败
	
	public final static Integer UN_AUDIT=2;//未审核
	
	private Bank bank;//申请银行
	
	private String bankName;//为了查询方便的 冗余字段
	
	private String bankNo;//银行账户
	
	private String applyName;//提款人姓名
	
	private String idCardNo;//身份证号码
	
	private MemberUser memberUser;//提款申请人
	
	private Integer applyMoney;//提款金额
	
	private Integer auditStatus;//审批状态
	
	private String auditor;//审核人
	
	private Date auditTime;//审核时间

	@Column(name="bank")
	@Enumerated(EnumType.ORDINAL)
	public Bank getBank() {
		return bank;
	}

	public void setBank(Bank bank) {
		this.bank = bank;
	}
	
    @Column(name="bank_name",length=100)
	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	@Column(name="bank_no",length=32)
	public String getBankNo() {
		return bankNo;
	}

	public void setBankNo(String bankNo) {
		this.bankNo = bankNo;
	}

	@Column(name="apply_name",length=100)
	public String getApplyName() {
		return applyName;
	}

	public void setApplyName(String applyName) {
		this.applyName = applyName;
	}

	@Column(name="id_card_no",length=32)
	public String getIdCardNo() {
		return idCardNo;
	}

	public void setIdCardNo(String idCardNo) {
		this.idCardNo = idCardNo;
	}

	@ManyToOne
	@JoinColumn(name="member_id")
	public MemberUser getMemberUser() {
		return memberUser;
	}

	public void setMemberUser(MemberUser memberUser) {
		this.memberUser = memberUser;
	}

	@Column(name="apply_money")
	public Integer getApplyMoney() {
		return applyMoney;
	}

	public void setApplyMoney(Integer applyMoney) {
		this.applyMoney = applyMoney;
	}

	@Column(name="audit_status")
	public Integer getAuditStatus() {
		return auditStatus;
	}

	public void setAuditStatus(Integer auditStatus) {
		this.auditStatus = auditStatus;
	}

	@Column(name="auditor",length=50)
	public String getAuditor() {
		return auditor;
	}

	public void setAuditor(String auditor) {
		this.auditor = auditor;
	}

	@Column(name="audit_time")
	public Date getAuditTime() {
		return auditTime;
	}

	public void setAuditTime(Date auditTime) {
		this.auditTime = auditTime;
	}
	
	
	

}
