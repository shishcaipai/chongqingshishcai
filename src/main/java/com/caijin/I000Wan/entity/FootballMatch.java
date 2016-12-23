package com.caijin.I000Wan.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 足球赛事实体
 * @author jeff
 * 2014-06-17
 */
@Entity
@Table(name="football_match")
public class FootballMatch {
	
	public static final String FOOTBALL_JCZQ_SFP_CODE = "jczq-sfp";
	public static final String FOOTBALL_JCZQ_SFP_NAME = "竞足--胜负平/让球";
	
	public static final String FOOTBALL_JCZQ_JQS_CODE = "jczq-jqs";
	public static final String FOOTBALL_JCZQ_JQS_NAME = "竞足--进球数";
	
	public static final String FOOTBALL_JCZQ_BQC_CODE = "jczq-bqc";
	public static final String FOOTBALL_JCZQ_BQC_NAME = "竞足--半全场";

	private Integer footballMatchId;
	
	private String typeCode;//比赛类型编码
	
	private String typeName;//比赛类型名称
	
	private String pdate;//比赛日期
	
	private String gameNum;
	
	private String league;//赛事类型 如世界杯
	
	private String endTime;//比赛结束时间
	
	private String homesxName;//主队
	
	private String awaysxName;//客队
	
	private String nspf1;
	
	private String nspf2;
	
	private String nspf3;
	
	private String nspf4;
	
	private String nspf5;
	
	private String nspf6;
	
	private String spf1;
	
	private String spf2;
	
	private String spf3;
	
	private String spf4;
	
	private String spf5;
	
	private String spf6;
	
	private String spf7;
	
	private String spf8;
	
	private Date updateDate;
	
	private Date createDate;
	
	private String periodId;//关联期数
	
	private String concedeTlineGreen;

	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="football_match_id", nullable = true)
	public Integer getFootballMatchId() {
		return footballMatchId;
	}

	public void setFootballMatchId(Integer footballMatchId) {
		this.footballMatchId = footballMatchId;
	}

	@Column(name="type_code")
	public String getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	@Column(name="type_name")
	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	@Column(name="pdate")
	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	@Column(name="game_num")
	public String getGameNum() {
		return gameNum;
	}

	public void setGameNum(String gameNum) {
		this.gameNum = gameNum;
	}

	public String getLeague() {
		return league;
	}

	public void setLeague(String league) {
		this.league = league;
	}

	@Column(name="end_time")
	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	@Column(name="homesxname")
	public String getHomesxName() {
		return homesxName;
	}

	public void setHomesxName(String homesxName) {
		this.homesxName = homesxName;
	}

	@Column(name="awaysxname")
	public String getAwaysxName() {
		return awaysxName;
	}

	public void setAwaysxName(String awaysxName) {
		this.awaysxName = awaysxName;
	}

	public String getNspf1() {
		return nspf1;
	}

	public void setNspf1(String nspf1) {
		this.nspf1 = nspf1;
	}

	public String getNspf2() {
		return nspf2;
	}

	public void setNspf2(String nspf2) {
		this.nspf2 = nspf2;
	}

	public String getNspf3() {
		return nspf3;
	}

	public void setNspf3(String nspf3) {
		this.nspf3 = nspf3;
	}

	public String getNspf4() {
		return nspf4;
	}

	public void setNspf4(String nspf4) {
		this.nspf4 = nspf4;
	}

	public String getNspf5() {
		return nspf5;
	}

	public void setNspf5(String nspf5) {
		this.nspf5 = nspf5;
	}

	public String getNspf6() {
		return nspf6;
	}

	public void setNspf6(String nspf6) {
		this.nspf6 = nspf6;
	}

	public String getSpf1() {
		return spf1;
	}

	public void setSpf1(String spf1) {
		this.spf1 = spf1;
	}

	public String getSpf2() {
		return spf2;
	}

	public void setSpf2(String spf2) {
		this.spf2 = spf2;
	}

	public String getSpf3() {
		return spf3;
	}

	public void setSpf3(String spf3) {
		this.spf3 = spf3;
	}

	public String getSpf4() {
		return spf4;
	}

	public void setSpf4(String spf4) {
		this.spf4 = spf4;
	}

	public String getSpf5() {
		return spf5;
	}

	public void setSpf5(String spf5) {
		this.spf5 = spf5;
	}

	public String getSpf6() {
		return spf6;
	}

	public void setSpf6(String spf6) {
		this.spf6 = spf6;
	}
	
	public String getSpf7() {
		return spf7;
	}

	public void setSpf7(String spf7) {
		this.spf7 = spf7;
	}

	public String getSpf8() {
		return spf8;
	}

	public void setSpf8(String spf8) {
		this.spf8 = spf8;
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

	@Column(name="lottery_period_id",length=32)
	public String getPeriodId() {
		return periodId;
	}

	public void setPeriodId(String periodId) {
		this.periodId = periodId;
	}
	@Column(name="concede_t_line_green",length=8)
	public String getConcedeTlineGreen() {
		return concedeTlineGreen;
	}

	public void setConcedeTlineGreen(String concedeTlineGreen) {
		this.concedeTlineGreen = concedeTlineGreen;
	}
}
