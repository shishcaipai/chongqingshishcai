package com.caijin.I000Wan.util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.caijin.I000Wan.entity.Period;
import com.caijin.I000Wan.web.HeMaiController;

public class OrderUtils {
	private final Logger log = LoggerFactory.getLogger(OrderUtils.class);
	public static boolean getCurrentDate(String currentOrderId,
			List<Period> orderids) {
		int end = Integer.valueOf((String) currentOrderId.substring(8));
		String date = currentOrderId.substring(0, 8);
		for (Period per : orderids) {
			int end2 = Integer.valueOf((String) per.getLotteryPeriod().substring(8));
			String date2 =  per.getLotteryPeriod().substring(0, 8);
			System.out.println("date2:"+date2+":::end2::"+end2+":::date:"+date+":::end:"+end);
			if (Float.valueOf(date)>Float.valueOf(date2)) {
				return false;
			}
			if(end>end2){
				return false;
			}
		}
		return true;
	}
}
