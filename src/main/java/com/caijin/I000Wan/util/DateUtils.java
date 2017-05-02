package com.caijin.I000Wan.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

public class DateUtils {

	public static String getCurrentChongQingShiShicai() {
		StringBuffer stringBuffer = new StringBuffer();
		Calendar currentDate = Calendar.getInstance(TimeZone
				.getTimeZone("GMT+08:00"));
		int date = currentDate.get(Calendar.DAY_OF_MONTH);
		int hours = currentDate.get(Calendar.HOUR_OF_DAY);
		int month = currentDate.get(Calendar.MONTH) + 1;
		int mis = currentDate.get(Calendar.MINUTE);
		mis = mis + 1;
		if (mis > 60) {
			hours = hours + 1;
			if (hours > 23) {
				hours = 0;
			}
			mis = mis - 60;
		}
		int years = currentDate.get(Calendar.YEAR);
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
				end = end + (mis / 10) + 1;
			} else {
				end = 96;
				end = end + (hours - 22) * 60 / 5;
				end = end + (mis / 5) + 1;
			}
			if (end > 120) {
				end = 120;
			}
			if (end < 10) {
				stringBuffer.append("00");
			} else if (10 <= end && end < 100) {
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
			} else {
				end = end + 23;
			}
			if (end < 10) {
				stringBuffer.append("00");
			} else if (10 <= end && end < 100) {
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
		List<String> list = new ArrayList<String>();
		for (int i = end; i <= 120; i++) {
			if (i < 10) {
				temp = str + "00" + String.valueOf(i);
			} else if (10 <= i && i < 100) {
				temp = str + "0" + String.valueOf(i);
			} else if (i >= 100) {
				temp = str + String.valueOf(i);
			}
			list.add(temp);
		}
		return list;
	}

	public static String getLeftShangyiqiChongQingShiShicai(String current) {
		int end = Integer.valueOf((String) current.substring(8));
		String temp = "";
		String str = current.substring(0, 8);
		int ed = (end - 1);
		if (ed == 0) {
			StringBuffer stringBuffer = new StringBuffer();
			Calendar currentDate = Calendar.getInstance(TimeZone
					.getTimeZone("GMT+08:00"));
			int date = currentDate.get(Calendar.DAY_OF_MONTH);
			int month = currentDate.get(Calendar.MONTH) + 1;
			int years = currentDate.get(Calendar.YEAR);
			date = date - 1;
			currentDate.add(Calendar.DAY_OF_MONTH, -1);
			date = currentDate.get(Calendar.DAY_OF_MONTH);
			month = currentDate.get(Calendar.MONTH) + 1;
			years = currentDate.get(Calendar.YEAR);

			str = years + "";
			if (month < 10) {
				str += "0";
			} else {
				str += month;
			}
			if (date <= 10) {
				str += "0";
			} else {
				str += date;
			}

		} else {
			if (ed < 10) {
				str = str + "00" + ed;
			} else if (10 <= ed && ed < 100) {
				str = str + "0" + ed;
			} else {
				str = str + "0" + ed;
			}

		}
		return str;
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
		mis = mis + 1;
		if (mis > 60) {
			hours = hours + 1;
			if (hours > 23) {
				hours = 0;
			}
			mis = mis - 60;
		}
		if (0 <= hours && hours < 2) {
			return (5 - mis % 5) * 60 - ms;
		} else if (2 < hours && hours < 10) {
			return ((10 - hours) * 60 - mis) * 60 - ms;
		} else if (10 <= hours && hours < 22) {
			return (10 - mis % 10) * 60 - ms;
		} else if (22 <= hours) {
			return (5 - mis % 5) * 60 - ms;
		}
		return mis;
	}

	public static String getLeftEndDate(String pharsh) {
		Calendar currentDate = Calendar.getInstance(TimeZone
				.getTimeZone("GMT+08:00"));
		int date = currentDate.get(Calendar.DAY_OF_MONTH);
		int month = currentDate.get(Calendar.MONTH);
		int years = currentDate.get(Calendar.YEAR);

		int end = Integer.valueOf((String) pharsh.substring(8));
		if (end < 24) {
			currentDate.set(years, month, date, 5 * end / 60, 5 * end % 60);
		}
		if (end >= 24 && end < 97) {
			end = end - 24;
			currentDate.set(years, month, date, 10 * end / 60 + 10,
					10 * end % 60);
		}
		if (end >= 97) {
			end = end - 97;
			currentDate
					.set(years, month, date, 5 * end / 60 + 22, 5 * end % 60);
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.util.Date dates = currentDate.getTime();
		String str = sdf.format(dates);
		return str;

	}

	public static String getjiangxiLeftEndDate(String pharsh) {
		Calendar currentDate = Calendar.getInstance(TimeZone
				.getTimeZone("GMT+08:00"));
		int date = currentDate.get(Calendar.DAY_OF_MONTH);
		int month = currentDate.get(Calendar.MONTH);
		int years = currentDate.get(Calendar.YEAR);

		int end = Integer.valueOf((String) pharsh.substring(6));
			currentDate.set(years, month, date, 9+10*end/60, 10* end % 60);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.util.Date dates = currentDate.getTime();
		String str = sdf.format(dates);
		return str;

	}
	public static String getguandongLeftEndDate(String pharsh) {
		Calendar currentDate = Calendar.getInstance(TimeZone
				.getTimeZone("GMT+08:00"));
		int date = currentDate.get(Calendar.DAY_OF_MONTH);
		int month = currentDate.get(Calendar.MONTH);
		int years = currentDate.get(Calendar.YEAR);

		int end = Integer.valueOf((String) pharsh.substring(6));
		currentDate.set(years, month, date, 9+10*end/60, 10* end % 60);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.util.Date dates = currentDate.getTime();
		String str = sdf.format(dates);
		return str;

	}

	
	public static String getCurrentGuangDongShiYiYun() {
		StringBuffer stringBuffer = new StringBuffer();
		Calendar currentDate = Calendar.getInstance(TimeZone
				.getTimeZone("GMT+08:00"));
		int date = currentDate.get(Calendar.DAY_OF_MONTH);
		int hours = currentDate.get(Calendar.HOUR_OF_DAY);
		int month = currentDate.get(Calendar.MONTH) + 1;
		int mis = currentDate.get(Calendar.MINUTE);
		int years = currentDate.get(Calendar.YEAR);
		stringBuffer.append(years % 1000);
		if (month < 10) {
			stringBuffer.append("0");
		}
		stringBuffer.append(month);
		if (date < 10) {
			stringBuffer.append("0");
		}
		stringBuffer.append(date);
		int num = ((hours - 9) * 60 + mis) / 10;
		int end = 1 + num;
		if (end < 0) {
			stringBuffer.append("00");
			end = 1;
		} else if (0 < end && end < 10) {
			stringBuffer.append("0");
		}
		stringBuffer.append(end);
		return stringBuffer.toString();

	}

	public static int getGuangDongShiYiXuanWuLeftMisecond() {
		Calendar currentDate = Calendar.getInstance(TimeZone
				.getTimeZone("GMT+08:00"));
		int mis = currentDate.get(Calendar.MINUTE);
		int ms = currentDate.get(Calendar.SECOND);
		return (9 - mis % 10) * 60 + ms;
	}

	public static List<String> getLeftGuangDongShiYiXuanWu(String current) {
		int end = Integer.valueOf(current);
		int biggest = end / 100 * 100 + 84;
		int temp;
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < 5; i++) {
			temp = end + i + 1;
			if (temp <= biggest) {
				list.add(temp + "");
			}
		}
		return list;
	}

	// ~~~~~~~~~~~~jiangxi shi shi cai
	public static String getCurrentJiangXiShiShiCai() {
		StringBuffer stringBuffer = new StringBuffer();
		Calendar currentDate = Calendar.getInstance(TimeZone
				.getTimeZone("GMT+08:00"));
		int date = currentDate.get(Calendar.DAY_OF_MONTH);
		int hours = currentDate.get(Calendar.HOUR_OF_DAY);
		int month = currentDate.get(Calendar.MONTH) + 1;
		int mis = currentDate.get(Calendar.MINUTE);
		int years = currentDate.get(Calendar.YEAR);
		stringBuffer.append(years % 1000);
		if (month < 10) {
			stringBuffer.append("0");
		}
		stringBuffer.append(month);
		if (date < 10) {
			stringBuffer.append("0");
		}
		stringBuffer.append(date);
		int num = ((hours - 9) * 60 + mis) / 10;
		int end = 1 + num;
		if (num < 0) {
			num = 0;
		}
		if (end < 10) {
			stringBuffer.append("0");
		}
		stringBuffer.append(end);
		return stringBuffer.toString();

	}

	public static int getJiangXiShiShiCaiLeftMisecond() {
		Calendar currentDate = Calendar.getInstance(TimeZone
				.getTimeZone("GMT+08:00"));
		int mis = currentDate.get(Calendar.MINUTE);
		int ms = currentDate.get(Calendar.SECOND);
		return (9 - mis % 10) * 60 + ms;
	}

	public static List<String> getLeftJiangXiShiShiCai(String current) {
		int end = Integer.valueOf(current);
		int biggest = end / 100 * 100 + 78;
		int temp;
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < 5; i++) {
			temp = end + i + 1;
			if (temp <= biggest) {
				list.add(temp + "");
			}
		}
		return list;
	}

	// ~~~~~~~~~~~~Shandong shi yi yun
	public static String getCurrentShanDongShiYiYun() {
		StringBuffer stringBuffer = new StringBuffer();
		Calendar currentDate = Calendar.getInstance(TimeZone
				.getTimeZone("GMT+08:00"));
		int date = currentDate.get(Calendar.DAY_OF_MONTH);
		int hours = currentDate.get(Calendar.HOUR_OF_DAY);
		int month = currentDate.get(Calendar.MONTH) + 1;
		int mis = currentDate.get(Calendar.MINUTE);
		int years = currentDate.get(Calendar.YEAR);
		stringBuffer.append(years % 1000);
		if (month < 10) {
			stringBuffer.append("0");
		}
		stringBuffer.append(month);
		if (date < 10) {
			stringBuffer.append("0");
		}
		stringBuffer.append(date);
		int num = ((hours - 9) * 60 + mis) / 10;
		if (num < 0) {
			num = 0;
		}
		int end = 1 + num;
		if (end < 10) {
			stringBuffer.append("0");
		}
		stringBuffer.append(end);
		return stringBuffer.toString();

	}

	public static int getShanDongShiYiYunLeftMisecond() {
		Calendar currentDate = Calendar.getInstance(TimeZone
				.getTimeZone("GMT+08:00"));
		int mis = currentDate.get(Calendar.MINUTE);
		int ms = currentDate.get(Calendar.SECOND);
		System.out.println("mis:::" + mis + "::ms::" + ms);
		return (9 - mis % 10) * 60 + ms;
	}

	public static List<String> getLeftShanDongShiYiYun(String current) {
		int end = Integer.valueOf(current);
		int biggest = end / 100 * 100 + 78;
		int temp;
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < 5; i++) {
			temp = end + i + 1;
			if (temp <= biggest) {
				list.add(temp + "");
			}
		}
		return list;
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
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = s;
		res = simpleDateFormat.format(date);
		return res;
	}

	/**
	 * 计算两个日期之间相差的天数
	 * 
	 * @param smdate
	 *            较小的时间
	 * @param bdate
	 *            较大的时间
	 * @return 相差天数
	 * @throws ParseException
	 */
	public static int daysBetween(Date smdate, Date bdate)
			throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		smdate = sdf.parse(sdf.format(smdate));
		bdate = sdf.parse(sdf.format(bdate));
		Calendar cal = Calendar.getInstance();
		cal.setTime(smdate);
		long time1 = cal.getTimeInMillis();
		cal.setTime(bdate);
		long time2 = cal.getTimeInMillis();
		long between_days = (time2 - time1) / (1000 * 3600 * 24);

		return Integer.parseInt(String.valueOf(between_days));
	}

	/**
	 * 字符串的日期格式的计算
	 */
	public static int daysBetween(String smdate, String bdate)
			throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(sdf.parse(smdate));
		long time1 = cal.getTimeInMillis();
		cal.setTime(sdf.parse(bdate));
		long time2 = cal.getTimeInMillis();
		long between_days = (time2 - time1) / (1000 * 3600 * 24);

		return Integer.parseInt(String.valueOf(between_days));
	}
}
