package com.caijin.I000Wan.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.caijin.I000Wan.common.entity.BaseEntity;

/**
 * 订单明细表
 * 
 * @author Jeff
 * @since 2014-07-21
 */
@Entity
@Table(name = "order_detail")
public class OrderDetail extends BaseEntity {

	private static final long serialVersionUID = 3257399167964896792L;

	private Order order;

	private String detailName;

	private Integer detailMoney;// 明细金额

	private String buyCaiNumber;// 购买的彩票号码
	
	private String check_0;
	private String check_1;
	private String check_2;
	private String check_3;
	private String check_4;
	private String check_5;
	private String check_6;
	private String check_7;
	private String check_8;

	@ManyToOne
	@JoinColumn(name = "order_id")
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@Column(length = 200, name = "detail_name")
	public String getDetailName() {
		return detailName;
	}

	public void setDetailName(String detailName) {
		this.detailName = detailName;
	}

	@Column(precision = 10, name = "detail_money")
	public Integer getDetailMoney() {
		return detailMoney;
	}

	public void setDetailMoney(Integer detailMoney) {
		this.detailMoney = detailMoney;
	}

	@Column(length = 100, name = "buy_cai_number")
	public String getBuyCaiNumber() {
		return buyCaiNumber;
	}

	public void setBuyCaiNumber(String buyCaiNumber) {
		this.buyCaiNumber = buyCaiNumber;
	}

	public String getCheck_0() {
		return check_0;
	}

	public void setCheck_0(String check_0) {
		this.check_0 = check_0;
	}

	public String getCheck_1() {
		return check_1;
	}

	public void setCheck_1(String check_1) {
		this.check_1 = check_1;
	}

	public String getCheck_2() {
		return check_2;
	}

	public void setCheck_2(String check_2) {
		this.check_2 = check_2;
	}

	public String getCheck_3() {
		return check_3;
	}

	public void setCheck_3(String check_3) {
		this.check_3 = check_3;
	}

	public String getCheck_4() {
		return check_4;
	}

	public void setCheck_4(String check_4) {
		this.check_4 = check_4;
	}

	public String getCheck_5() {
		return check_5;
	}

	public void setCheck_5(String check_5) {
		this.check_5 = check_5;
	}

	public String getCheck_6() {
		return check_6;
	}

	public void setCheck_6(String check_6) {
		this.check_6 = check_6;
	}

	public String getCheck_7() {
		return check_7;
	}

	public void setCheck_7(String check_7) {
		this.check_7 = check_7;
	}

	public String getCheck_8() {
		return check_8;
	}

	public void setCheck_8(String check_8) {
		this.check_8 = check_8;
	}

	
}
