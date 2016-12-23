package com.caijin.I000Wan.enu;
/**
 * 枚举银行
 * @author Jeff
 *
 */
public enum Bank {

	BOC("BOC","中国银行"),//中国银行
	ICBC("ICBC","中国工商银行"),//工行
	ABC("ABC","中国农业银行"),//农行
	CCB("CCB","中国建设银行");//建行
	
	private String name;//银行名称
	               
	private String code;//银行编码

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	private Bank(String code,String name){
		this.code=code;
		this.name=name;
	}
	
	
}
