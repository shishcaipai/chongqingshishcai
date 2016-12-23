package com.caijin.I000Wan.util;

import java.util.List;

/**
 * 封装数据 Base、PageModel
 * @author w.x.w
 * T - Object
 * @param <T>
 */
public class PageModel<T> {
	public static final String ORDER_ASC = "asc";
	public static final String ORDER_DESC = "desc";
	
	private int start;   // 第几行开始
	private int page;    // 第几页
	private int rows;    // 每页多少条数据
	private String sort;  //排序字段
	private String order;  //排序规则
	//private Object condition;  // 查询条件  - 对象
	private StringBuffer condition;  // 查询条件  - String字符串
	private int total;   // 总记录数
	private List<T> datas;  // 当前页的记录集
	private Object object;
	private Object requirement;
	
	public PageModel() {
	}
	public PageModel(int pageNo, int pageSize,StringBuffer condition) {
		this.page = pageNo;
		this.rows = pageSize;
		this.condition = condition;
	}
	public PageModel(int pageNo, int pageSize,Object object) {
		this.page = pageNo;
		this.rows = pageSize;
		this.object = object;
	}
	public int getStart() {
		this.start = (this.page-1)*this.rows;
		return this.start;
	}
	//求总页数
	public int getTotalPages() {
		return (this.total + rows - 1) / rows;
	}
	//首页
	public int getTopPage() {
		return 1;
	}
	//末页
	public int getBottomPage() {
		return this.getTotalPages() == 0 ? 1 : this.getTotalPages();
	}
	//上一页
	public int getUpPage() {
		if(this.page <= 1) {
			return 1;
		}
		return this.page - 1;
	}
	//下一页
	public int getNextPage() {
		if(this.page >= this.getTotalPages()) {
			return (this.getTotalPages() == 0 ? 1 : this.getTotalPages());
		}
		return page + 1;
	}
	
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public StringBuffer getCondition() {
		return condition;
	}
	public void setCondition(StringBuffer condition) {
		this.condition = condition;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int pageSize) {
		this.rows = pageSize;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int pageNo) {
		this.page = pageNo;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	public Object getObject() {
		return object;
	}
	public void setObject(Object object) {
		this.object = object;
	}
	@SuppressWarnings("unchecked")
	public List getDatas() {
		return datas;
	}
	@SuppressWarnings("unchecked")
	public void setDatas(List datas) {
		this.datas = datas;
	}
	@Override
	public String toString() {
		return "[pageNo: " + this.page + "] [pageSize: " + this.rows + "] [total：" + this.total + "] ";
	}
	public Object getRequirement() {
		return requirement;
	}
	public void setRequirement(Object requirement) {
		this.requirement = requirement;
	}

}
