package com.caijin.I000Wan.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;

import com.caijin.I000Wan.common.entity.BaseEntity;

/**
 * 消息文章表
 * @author jeff
 * @since 2014-06-17
 */
@Entity
@Table(name = "article")
public class Article extends BaseEntity{

	private static final long serialVersionUID = 6147279787219774183L;
	
	public static final Integer NOTICE=0;//公告
	
	public static final Integer SAISHI=1;//赛事
	
	public static final Integer NEWHELP=2;//新手
	
	public static final Integer CAIPIAOZIXUN=3;//彩票资讯
	
	public static final Integer HEMAIHELP=4;//合买指引
	
	private Integer type;//类型
	
	private String title;//标题
	
	private String content;//内容
	
	private String author;//作者
	
	private String source;//来源
	
	private Integer clickNumber;//点击数

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Lob
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	@Column(name="click_number")
	public Integer getClickNumber() {
		return clickNumber;
	}

	public void setClickNumber(Integer clickNumber) {
		this.clickNumber = clickNumber;
	}

}
