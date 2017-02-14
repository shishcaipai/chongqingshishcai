package com.caijin.I000Wan.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 历史中奖号码存记录
 * 
 * @author jiangneng
 * 
 */
@Entity
@Table(name = "history_period")
public class LotteryPeriod {

	private String lotteryCode;// 彩票编码

	private String lotteryPeriod;// 中奖号码

	private String periodNumber;// 彩票期号

	private Integer status;// 期数状态 如当前期、以往期、预售期
	
	public String opentime;
	
	public long opentimestamp;

	@Column(name = "lotterycode", length = 20)
	public String getLotteryCode() {
		return lotteryCode;
	}

	public void setLotteryCode(String lotteryCode) {
		this.lotteryCode = lotteryCode;
	}

	@Column(name = "lotteryperiod", length = 120)
	public String getLotteryPeriod() {
		return lotteryPeriod;
	}

	public void setLotteryPeriod(String lotteryPeriod) {
		this.lotteryPeriod = lotteryPeriod;
	}

	@Column(name = "status", length = 10)
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Id
	@Column(name = "periodnumber", length = 45)
	public String getPeriodNumber() {
		return periodNumber;
	}

	public void setPeriodNumber(String periodNumber) {
		this.periodNumber = periodNumber;
	}

	public String getOpentime() {
		return opentime;
	}

	public void setOpentime(String opentime) {
		this.opentime = opentime;
	}

	public long getOpentimestamp() {
		return opentimestamp;
	}

	public void setOpentimestamp(long opentimestamp) {
		this.opentimestamp = opentimestamp;
	}

}
