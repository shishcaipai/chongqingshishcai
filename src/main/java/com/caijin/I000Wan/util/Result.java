package com.caijin.I000Wan.util;

import java.util.ArrayList;
import java.util.List;

public class Result<T> {

	private  int  total;//总记录数
    private  List<T> rows=new ArrayList<T>() ; //每页存放数据
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	
}
