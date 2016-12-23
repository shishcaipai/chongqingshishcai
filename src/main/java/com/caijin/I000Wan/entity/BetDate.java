package com.caijin.I000Wan.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 竞彩足球比赛期数实体
 * @author pingan
 *
 */

@Entity
@Table(name = "bet_date")
public class BetDate {
	private Integer betDateId;
    private String dayDate;
    private String matchInfo;
    private Date updateDate;
    private Date createDate;
    private String pdate;
    private Integer status;//状态（0-历史期，1-当前期）

	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="bet_date_id", nullable = true)
	public Integer getBetDateId() {
		return betDateId;
	}
	public void setBetDateId(Integer betDateId) {
		this.betDateId = betDateId;
	}
	@Column(name="day_date",length=16)
	public String getDayDate() {
		return dayDate;
	}
	public void setDayDate(String dayDate) {
		this.dayDate = dayDate;
	}
	@Column(name="match_info",length=16)
	public String getMatchInfo() {
		return matchInfo;
	}
	public void setMatchInfo(String matchInfo) {
		this.matchInfo = matchInfo;
	}
	@Column(name="update_date")
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	@Column(name="create_date")
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	@Column(name="pdate",length=16)
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	@Column(name="status")
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	} 
	@Override
    public String toString() {
        return "bet_date{" +
                "day_date='" + dayDate + '\'' +
                ", match_info='" + matchInfo + '\'' +
                '}';
	}
}
