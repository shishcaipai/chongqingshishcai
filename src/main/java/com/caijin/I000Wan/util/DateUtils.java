package com.caijin.I000Wan.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

public class DateUtils {
	
	public static String getShangQiChongQingShiShicai() {
		StringBuffer stringBuffer = new StringBuffer();
		Calendar currentDate = Calendar.getInstance(TimeZone
				.getTimeZone("GMT+08:00"));
		int date = currentDate.get(Calendar.DAY_OF_MONTH);
		int hours = currentDate.get(Calendar.HOUR_OF_DAY);
		int month = currentDate.get(Calendar.MONTH)+1;
		int mis = currentDate.get(Calendar.MINUTE);
		int years = currentDate.get(Calendar.YEAR);
		System.out.println("date:"+date+"month:"+month);
		if (hours >= 10) {
			stringBuffer.append(years);
			if (month < 10) {
				stringBuffer.append("0");
			}
			stringBuffer.append(month);
			if (date < 10) {
				stringBuffer.append("0");
			}
			stringBuffer.append(date);
			int end = 24;
			if (hours < 22) {
				end = end + (hours - 10) * 60 / 10;
				end = end + (mis / 10)+1;
			} else {
				end = 97;
				end = end + (hours - 22) * 60 / 5;
				end = end + (mis / 5)+1;
			}
			if (end > 120) {
				end = 120;
			}
			if (end < 10) {
				stringBuffer.append("00");
			} else if (10<=end&&end < 100) {
				stringBuffer.append("0");
			}
			stringBuffer.append(end-1);
			return stringBuffer.toString();
		} else {
			stringBuffer.append(years);
			if (month < 10) {
				stringBuffer.append("0");
			}
			stringBuffer.append(month);
			if (date < 10) {
				stringBuffer.append("0");
			}
			stringBuffer.append(date);
			int end = 1;
			if (hours < 2) {
				end = end + hours * 60 / 5;
				end = end + (mis / 5);
			}else{
				end=end+23;
			}
			if (end < 10) {
				stringBuffer.append("00");
			} else if (10<=end&&end < 100) {
				stringBuffer.append("0");
			}
			stringBuffer.append(end-1);
			return stringBuffer.toString();
		}

	}
	
	
	public static String getCurrentChongQingShiShicai() {
		StringBuffer stringBuffer = new StringBuffer();
		Calendar currentDate = Calendar.getInstance(TimeZone
				.getTimeZone("GMT+08:00"));
		int date = currentDate.get(Calendar.DAY_OF_MONTH);
		int hours = currentDate.get(Calendar.HOUR_OF_DAY);
		int month = currentDate.get(Calendar.MONTH)+1;
		int mis = currentDate.get(Calendar.MINUTE);
		int years = currentDate.get(Calendar.YEAR);
		System.out.println("date:"+date+"month:"+month);
		if (hours >= 10) {
			stringBuffer.append(years);
			if (month < 10) {
				stringBuffer.append("0");
			}
			stringBuffer.append(month);
			if (date < 10) {
				stringBuffer.append("0");
			}
			stringBuffer.append(date);
			int end = 24;
			if (hours < 22) {
				end = end + (hours - 10) * 60 / 10;
				end = end + (mis / 10)+1;
			} else {
				end = 97;
				end = end + (hours - 22) * 60 / 5;
				end = end + (mis / 5)+1;
			}
			if (end > 120) {
				end = 120;
			}
			if (end < 10) {
				stringBuffer.append("00");
			} else if (10<=end&&end < 100) {
				stringBuffer.append("0");
			}
			stringBuffer.append(end);
			return stringBuffer.toString();
		} else {
			stringBuffer.append(years);
			if (month < 10) {
				stringBuffer.append("0");
			}
			stringBuffer.append(month);
			if (date < 10) {
				stringBuffer.append("0");
			}
			stringBuffer.append(date);
			int end = 1;
			if (hours < 2) {
				end = end + hours * 60 / 5;
				end = end + (mis / 5);
			}else{
				end=end+23;
			}
			if (end < 10) {
				stringBuffer.append("00");
			} else if (10<=end&&end < 100) {
				stringBuffer.append("0");
			}
			stringBuffer.append(end);
			return stringBuffer.toString();
		}

	}

	public static List<String> getLeftChongQingShiShicai(String current) {
		int end = Integer.valueOf((String) current.substring(8));
		String temp = "";
		String str = current.substring(0, 8);
		 List<String> list=new ArrayList<String>();
		for (int i = end; i <= 120; i++) {
			if (i < 10) {
				temp = str + "00" + String.valueOf(i);
			} else if (10<=i&&i < 100) {
				temp = str + "0" + String.valueOf(i);
			} else if(i>=100){
				temp = str + String.valueOf(i);
			}
			list.add(temp);
		}
		return list;
	}

	public static int getLeftMisecond() {
		Calendar currentDate = Calendar.getInstance(TimeZone
				.getTimeZone("GMT+08:00"));
		int date = currentDate.get(Calendar.DAY_OF_MONTH);
		int hours = currentDate.get(Calendar.HOUR_OF_DAY);
		int month = currentDate.get(Calendar.MONTH);
		int mis = currentDate.get(Calendar.MINUTE);
		int years = currentDate.get(Calendar.YEAR);
		int ms = currentDate.get(Calendar.SECOND);
		System.out.println("mis:::" + mis + "::ms::" + ms);
		if (0 <= hours && hours < 2) {
			return (5 - mis % 5) * 60 - ms;
		} else if (2 < hours && hours < 10) {
			return ((10 - hours) * 60 - mis+10) * 60 - ms;
		} else if (10 <= hours && hours < 22) {
			return (10 - mis % 10) * 60 - ms;
		} else if (22 <= hours) {
			return (5 - mis % 5) * 60 - ms;
		}
		return mis;
	}

	/*
	 * 将时间转换为时间戳
	 */
	public static String dateToStamp(String s) throws ParseException {
		String res;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		Date date = simpleDateFormat.parse(s);
		long ts = date.getTime();
		res = String.valueOf(ts);
		return res;
	}
	/*
	 * 将时间转换为时间戳
	 */
	public static String dateToString(String s) throws ParseException {
		String res;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		Date date = simpleDateFormat.parse(s);
		long ts = date.getTime();
		res = String.valueOf(ts);
		return res;
	}

	/*
	 * 将时间戳转换为时间
	 */
	public static String stampToDate(Date s) {
		String res;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
				"yyyy-MM-dd");
		Date date = s;
		res = simpleDateFormat.format(date);
		return res;
	}
}
