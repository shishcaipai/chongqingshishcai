package com.caijin.I000Wan.util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

import com.caijin.I000Wan.entity.Period;

public class OrderUtils {
	public static boolean getCurrentDate(String currentOrderId,
			List<Period> orderids) {
		int end = Integer.valueOf((String) currentOrderId.substring(8));
		String date = currentOrderId.substring(0, 8);
		for (Period per : orderids) {
			int end2 = Integer.valueOf((String) per.getLotteryPeriod().substring(8));
			String date2 =  per.getLotteryPeriod().substring(0, 8);
			if (!date.equals(date2)) {
				return false;
			}
			if(end<end2){
				return false;
			}
		}
		return true;
	}
}
