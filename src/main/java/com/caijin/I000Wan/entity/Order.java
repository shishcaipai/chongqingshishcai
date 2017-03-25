package com.caijin.I000Wan.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import com.caijin.I000Wan.common.entity.BaseEntity;
import com.caijin.I000Wan.util.ConstantUtil;

/**
 * 订单表
 * 
 * @author Jeff
 * @since 2014-07-21
 */

@Entity
@Table(name = "trade_order")
public class Order extends BaseEntity {

	private static final long serialVersionUID = 7485168642747519619L;
	// 充值订单
	public final static int RECHARGE_ORDER = 1;
	// 代购彩票订单
	public final static int PROXY_BUY_ORDER = 2;
	// 发起合购彩票订单
	public final static int HEMAI_BUY_ORDER = 3;
	// 合购彩票子订单
	public final static int HEMAI_IMP_BUY_ORDER = 4;
	// 返奖订单
	public final static int AWARD_ORDER = 5;
	// 提现订单
	public final static int DEPOSIT_ORDER = 6;

	public final static int ORDER_SUCESS = 1;
	public final static int WAIT_ORDER = 0;
	public final static int ORDER_FAILUE = 2;
	// 订单还没确认
	public final static int ORDER_UN = -1;

	public final static int PAY_STATUS_NO = 0;// 未支付

	public final static int PAY_STATUS_SUCESS = 1;// 支付成功

	public final static int PAY_STATUS_FAILUE = 2;// 支付失败

	public final static int PAY_STATUS_OFFTIME = 3;// 支付超时
	public final static int PAY_STATUS_FANXIAN = 4;// 订单取消，返回金额

	public final static int WPRISE_STATUS_NO = 0;// 待计算奖

	public final static int WPRIS_STATUS_PORTION = 1;// 部分中奖

	public final static int WPRIS_STATUS_ALL = 2;// 全部中奖

	public final static int WPRIS_STATUS_WI = 3;// 未中奖
	public final static int WPRIS_STATUS_PWI = 4;// 部分不中奖

	public final static int CASHBACKSTATUS_NO = 0;// 订单返现状态
	public final static int CASHBACKSTATUS_PORTION = 1;
	public final static int CASHBACKSTATUS_ALL = 2;

	private String name;

	private String orderNo;// orderNo

	private int orderType = 0;// 订单类型 1为订单充值 2为代购订单 3为合买类型订单

	private int orderStatus = 0;// 订单状态类型 1为下订单成功 2为下订单失败

	private int payStatus = 0;// 支付状态类型 0为未支付 1为支付成功 2为支付失败 3为支付超时

	private String otherId; // 其他关联id 当订单为1，4，5，6时关联的其他对像

	private Date orderTime;// 下订单时间

	private MemberUser memberUser;

	private List<Period> period;// 彩票期数

	private float totalMoney = 0;// 订单购买总金额

	private int lotteryCount = 0; // 彩票注数

	private String lotteryType;// 彩票类型

	private int isCut = 0;
	private int isZhuiHao = 0;

	public float currentWPMoney;// 当前中奖金额

	public int wprizeStatus = 0; // 中奖计算是否完成状态为0，1，2

	public int cashBackStatus = 0;// 返现是否完成0，1，2

	public String content = "";

	public boolean autoPrizes = ConstantUtil.AUTO_PRIZES;

	public boolean autoDrawn = ConstantUtil.AUTO_DRAWN;
	
	
	
	public boolean isAutoPrizes() {
		return autoPrizes;
	}

	public void setAutoPrizes(boolean autoPrizes) {
		this.autoPrizes = autoPrizes;
	}

	public boolean isAutoDrawn() {
		return autoDrawn;
	}

	public void setAutoDrawn(boolean autoDrawn) {
		this.autoDrawn = autoDrawn;
	}

	@Column(length = 200)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(length = 10)
	public int getIsCut() {
		return isCut;
	}

	public void setIsCut(int isCut) {
		this.isCut = isCut;
	}

	public int getIsZhuiHao() {
		return isZhuiHao;
	}

	public void setIsZhuiHao(int isZhuiHao) {
		this.isZhuiHao = isZhuiHao;
	}

	@Column(length = 200)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "order_no", length = 32)
	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	@Column(precision = 1, name = "order_type")
	public int getOrderType() {
		return orderType;
	}

	public void setOrderType(int orderType) {
		this.orderType = orderType;
	}

	@Column(precision = 1, name = "order_status")
	public int getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}

	@Column(precision = 1, name = "pay_status")
	public int getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(int payStatus) {
		this.payStatus = payStatus;
	}

	@Column(name = "order_time")
	@Temporal(TemporalType.DATE)
	public Date getOrderTime() {
		return orderTime;
	}

	@Column(name = "other_id", length = 36)
	public String getOtherId() {
		return otherId;
	}

	public void setOtherId(String otherId) {
		this.otherId = otherId;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	@ManyToOne
	@JoinColumn(name = "member_id")
	public MemberUser getMemberUser() {
		return memberUser;
	}

	public void setMemberUser(MemberUser memberUser) {
		this.memberUser = memberUser;
	}

	@Column(precision = 10, name = "current_wp_money")
	public float getCurrentWPMoney() {
		return currentWPMoney;
	}

	public void setCurrentWPMoney(float currentWPMoney) {
		this.currentWPMoney = currentWPMoney;
	}

	@Transient
	public List<Period> getPeriod() {
		return period;
	}

	public void setPeriod(List<Period> period) {
		this.period = period;
	}

	@Column(precision = 10, name = "total_money")
	public float getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(float totalMoney) {
		this.totalMoney = totalMoney;
	}

	@Column(name = "lottery_count")
	public int getLotteryCount() {
		return lotteryCount;
	}

	public void setLotteryCount(int lotteryCount) {
		this.lotteryCount = lotteryCount;
	}

	@Column(name = "lottery_type")
	public String getLotteryType() {
		return lotteryType;
	}

	public void setLotteryType(String lotteryType) {
		this.lotteryType = lotteryType;
	}

	@Column(length = 10)
	public int getWprizeStatus() {
		return wprizeStatus;
	}

	public void setWprizeStatus(int wprizeStatus) {
		this.wprizeStatus = wprizeStatus;
	}

}
