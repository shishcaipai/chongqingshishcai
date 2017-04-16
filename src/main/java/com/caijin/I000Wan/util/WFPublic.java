package com.caijin.I000Wan.util;

public class WFPublic {

	// 通过玩法ID得到玩法名
	public static String getpalynamebyid(String id) {
		String palyname = "";
		if (id.equals("104")) {
			palyname = "五星复式";
	    } else if (id.equals("105")) {
			palyname = "三星复式";
		} else if (id.equals("106")) {
			palyname = "二星复式";
		} else if (id.equals("431")) {
			palyname = "前二星复式";
		} else if (id.equals("107")) {
			palyname = "一星复式";
		}

		else if (id.equals("108")) {
			palyname = "五星组合";
		} else if (id.equals("109")) {
			palyname = "三星组合";
		} else if (id.equals("110")) {
			palyname = "二星组合";
		} else if (id.equals("111")) {
			palyname = "大小单双";
		} else if (id.equals("112")) {
			palyname = "五星单式";
		} else if (id.equals("113")) {
			palyname = "后三直选单式";
		} else if (id.equals("421")) {
			palyname = "前三直选单式";
		} else if (id.equals("114")) {
			palyname = "二星直选单式";
		} else if (id.equals("437")) {
			palyname = "前二直选单式";
		} else if (id.equals("115")) {
			palyname = "混投";
		} else if (id.equals("116")) {
			palyname = "二星组选复式";
		}

		else if (id.equals("117")) {
			palyname = "二星组选单式";
		} else if (id.equals("118")) {
			palyname = "二星组选和值";
		}

		else if (id.equals("433")) {
			palyname = "前二组选复式";
		}

		else if (id.equals("434")) {
			palyname = "前二组选单式";
		} else if (id.equals("435")) {
			palyname = "前二组选和值";
		}

		else if (id.equals("124")) {
			palyname = "五星通选";
		} else if (id.equals("315")) {
			palyname = "组三";
		} else if (id.equals("316")) {
			palyname = "组六";
		} else if (id.equals("313")) {
			palyname = "组三单式";
		} else if (id.equals("314")) {
			palyname = "组六单式";
		} else if (id.equals("424")) {
			palyname = "前组三单式";
		} else if (id.equals("425")) {
			palyname = "前组六单式";
		} else if (id.equals("317")) {
			palyname = "包胆";
		} else if (id.equals("318")) {
			palyname = "三星组选和值";
		}

		else if (id.equals("701")) {
			palyname = "三星组三胆拖";
		} else if (id.equals("702")) {
			palyname = "三星组六胆拖";
		} else if (id.equals("703")) {
			palyname = "三星组选单式";
		} else if (id.equals("426")) {
			palyname = "前三组选单式";
		} else if (id.equals("319")) {
			palyname = "三星组合复式";
		} else if (id.equals("304")) {
			palyname = "三星直选和值";
		} else if (id.equals("704")) {
			palyname = "三星直选胆拖";
		} else if (id.equals("305")) {
			palyname = "二星直选和值";
		} else if (id.equals("432")) {
			palyname = "前二直选和值";
		} else if (id.equals("311")) {
			palyname = "二星组选包胆";
		} else if (id.equals("436")) {
			palyname = "前二组选包胆";
		} else if (id.equals("705")) {
			palyname = "后三星组三和值";
		} else if (id.equals("706")) {
			palyname = "后三星组六和值";
		} else if (id.equals("416")) {
			palyname = "前三组六";
		} else if (id.equals("418")) {

		palyname = "前三星组选和值";
		} else if (id.equals("419")) {
			palyname = "前三星组三和值";
		} else if (id.equals("420")) {
			palyname = "前三星组六和值";
		} else if (id.equals("125")) {
			palyname = "前三复式";
		} else if (id.equals("708")) {
			palyname = "前三和值";
		} else if (id.equals("121")) {
			palyname = "定位胆";
		} else if (id.equals("119")) {
			palyname = "后三不定位";
		} else if (id.equals("120")) {
			palyname = "前三不定位";
		} else if (id.equals("415")) {
			palyname = "前三组三";
		}
		return palyname;
	}

	// 2013-1-24
	// 通过玩法ID得到奖金
	public static float getpalyJj(String id) {
		// 2013-1-27
		float palyMoney = 0;
		if (id.equals("125") || id.equals("708") || id.equals("421")
				|| id.equals("105") || id.equals("304") || id.equals("113"))// 三星直选
		{
			palyMoney = 1800;
		} else if (id.equals("313") || id.equals("424") || id.equals("415")
				|| id.equals("315") || id.equals("419") || id.equals("705"))// 三星组三
		{
			palyMoney = 600;
		} else if (id.equals("314") || id.equals("425") || id.equals("416")
				|| id.equals("316") || id.equals("420") || id.equals("706"))// 组六单式
		{
			palyMoney = 300;
		} else if (id.equals("418") || id.equals("318") || id.equals("426")
				|| id.equals("703") || id.equals("120") || id.equals("119")
				|| id.equals("121")) // 前三星组选和值不参与倍投
		{
			palyMoney = (float) 6.6;
		}

		else if (id.equals("106") || id.equals("431") || id.equals("437")
				|| id.equals("114") || id.equals("432") || id.equals("305"))// 二星复式
		{
			palyMoney = 180;
		} else if (id.equals("434") || id.equals("433") || id.equals("116")
				|| id.equals("117") || id.equals("435") || id.equals("118"))// 前二组选单式
		{
			palyMoney = 80;
		} else if (id.equals("111"))// 大小单双
		{
			palyMoney = 4;
		}
		return palyMoney;
	}
}
