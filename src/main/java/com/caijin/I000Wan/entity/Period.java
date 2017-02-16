package com.caijin.I000Wan.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 彩票期数实体
 * 
 * @author jeff
 * @since 2014-06-20 22:00
 */
@Entity
@Table(name = "lottery_period")
public class Period {

	private static final long serialVersionUID = 7196198838990921150L;

	public final static Integer STATUS_CURRENT = 1;// 下单状态

	public final static Integer STATUS_BEFORE = 0;// 下单状态

	public final static Integer STATUS_AFTER = 2;// 开奖

	public final static String SHISHI_CAI_CHONGQING = "cqssc";
	
	public final static String SHISHI_CAI_GUANGDONG11XUAN5 = "gd11x5";
	
	public final static String SHISHI_CAI_JIANGXI = "jx11x5";

	private Integer id;

	private String lotteryCode;// 彩票编码

	private String lotteryPeriod;// 彩票期数

	private Integer status;// 下单状态0 1，2
	private Integer winning=0;// 开奖状态 0,1,2
	private String orderId; // 订单号

	private Integer beisu; // 倍数
	private  float money=0;//中奖金额


	@Column(name = "beisu", length = 20)
	public Integer getBeisu() {
		return beisu;
	}

	public void setBeisu(Integer beisu) {
		this.beisu = beisu;
	}

	public Integer getWinning() {
		return winning;
	}

	public void setWinning(Integer winning) {
		this.winning = winning;
	}

	public float getMoney() {
		return money;
	}

	public void setMoney(float money) {
		this.money = money;
	}

	/**
	 * 创建日期
	 */
	private Date createDate;
	/**
	 * 修改日期
	 */
	private Date updateDate;

	private Date endTime;// 当期彩票截止时间

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = true)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "lottery_code", length = 250)
	public String getLotteryCode() {
		return lotteryCode;
	}

	public void setLotteryCode(String lotteryCode) {
		this.lotteryCode = lotteryCode;
	}

	@Column(name = "lottery_period", length = 100)
	public String getLotteryPeriod() {
		return lotteryPeriod;
	}

	@Column(name = "orderid", length = 64)
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public void setLotteryPeriod(String lotteryPeriod) {
		this.lotteryPeriod = lotteryPeriod;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "create_date")
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column(name = "update_date")
	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Column(name = "period_end_time")
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}


}
