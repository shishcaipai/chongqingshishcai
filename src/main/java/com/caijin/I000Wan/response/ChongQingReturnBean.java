package com.caijin.I000Wan.response;

import java.util.List;

public class ChongQingReturnBean {
	public int rows;
	public String code;
	public String info;
	public List<ChongQingReturnData> data;
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public List<ChongQingReturnData> getData() {
		return data;
	}
	public void setData(List<ChongQingReturnData> data) {
		this.data = data;
	}
	
	
	
}
