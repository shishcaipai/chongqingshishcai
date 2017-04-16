package com.caijin.I000Wan.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.caijin.I000Wan.common.entity.BaseEntity;

@Entity
@Table(name = "member_user")
public class MemberUser extends BaseEntity {

	private static final long serialVersionUID = -3497979616171964595L;
	public static final String FRONT_MEMBER_LOGIN_SESSION = "memberUser";
	public static final int GENERAL_TYPE = 0;
	public static final int AGENT_TYPE = 1;
	private String userName;
	private String pwd;
	private String realName;
	private Integer age;
	private String birthday;
	private String email;
	private String address;
	private String state;
	private String city;
	private String telephone;
	private String bankCode;// 银行卡号
	private String openBank;//开户银行
	private String zfbCode;//支付宝
	private String identityCard;// 身份证号码
	private String sex;// 性别
	private String bankName;// 银行名称
	private Boolean activated=true;// 账号是否邮件激活
//	private float totalScore = 0;// 总金额
	private float availableScore = 0;// 可用金额
	private float actionScore = 0;// 活动金额
	private float frozenScore = 0;// 冻结金额
	private String randomCode;// 账号验证邮件随机码(和session绑定)
	private int type;
	private String moneyPwd;
	private String qq;
	private String ip;//ip
	/**
	 * 推荐人id
	 */
	private String commendMemberId;
	/**
	 * 生成推广唯一ID
	 */
	private String predId;
	@Column(name = "money_pwd", length = 64)
	public String getMoneyPwd() {
		return moneyPwd;
	}

	public void setMoneyPwd(String moneyPwd) {
		this.moneyPwd = moneyPwd;
	}

	@Column(name = "commend_member_id", length = 64)
	public String getCommendMemberId() {
		return commendMemberId;
	}

	public void setCommendMemberId(String commendMemberId) {
		this.commendMemberId = commendMemberId;
	}
	@Column(name = "pred_id", length = 64)
	public String getPredId() {
		return predId;
	}
	
	public void setPredId(String predId) {
		this.predId = predId;
	}

	@Column(name = "user_name", length = 255)
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "password", length = 255)
	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	@Column(name = "real_name", length = 255)
	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	@Column(name = "age")
	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	@Column(name = "birthday", length = 32)
	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	@Column(name = "email", length = 128)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "address", length = 255)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "state", length = 64)
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(name = "city", length = 64)
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(name = "type", length = 10)
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	@Column(name = "telephone", length = 64)
	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	@Column(name = "bank_code", length = 64)
	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	@Column(name = "identity_card", length = 64)
	public String getIdentityCard() {
		return identityCard;
	}

	public void setIdentityCard(String identityCard) {
		this.identityCard = identityCard;
	}

	@Column(name = "sex", length = 8)
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Column(name = "bank_name", length = 64)
	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	@Column(name = "random_code", length = 32)
	public String getRandomCode() {
		return randomCode;
	}

	public void setRandomCode(String randomCode) {
		this.randomCode = randomCode;
	}

	@Column(name = "activated")
	public Boolean getActivated() {
		return activated;
	}

	public void setActivated(Boolean activated) {
		this.activated = activated;
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

	@Column(name = "frozen_score")
	public float getFrozenScore() {
		return frozenScore;
	}

	public void setFrozenScore(float frozenScore) {
		this.frozenScore = frozenScore;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getZfbCode() {
		return zfbCode;
	}

	public void setZfbCode(String zfbCode) {
		this.zfbCode = zfbCode;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getOpenBank() {
		return openBank;
	}

	public void setOpenBank(String openBank) {
		this.openBank = openBank;
	}


}
