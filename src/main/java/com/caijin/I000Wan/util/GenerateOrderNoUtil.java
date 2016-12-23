package com.caijin.I000Wan.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import com.caijin.I000Wan.web.OrderController;

/**
 * 生成订单号工具类
 * @author Administrator
 *
 */
public class GenerateOrderNoUtil {

	public static String getOrderNumber(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		Date date = new Date();
		String orderNumber = "jj1000"+sdf.format(date);
		orderNumber += randamNext();
		return orderNumber;
	}
	
	public static Integer randamNext(){
		int[] array = {0,1,2,3,4,5,6,7,8,9};
		Random rand = new Random();
		for (int i = 10; i > 1; i--) {
			int index = rand.nextInt(i);
			int tmp = array[index];
			array[index] = array[i - 1];
			array[i - 1] = tmp;
		}
		int result = 0;
		for(int i = 0; i < 6; i++)
			result = result * 10 + array[i];
		return result;
	}
	
	public static void main(String[] args){
		String orderNo = getOrderNumber();
		System.out.println(orderNo);
	}
	
}
