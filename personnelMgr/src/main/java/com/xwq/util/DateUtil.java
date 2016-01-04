package com.xwq.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	private static Calendar calendar = Calendar.getInstance();
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	//获取本月年份-月份
	public static String getThisMonth() {
		calendar.setTime(new Date());
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1;
		
		String s_month = "";
		if(month < 10) s_month = "0" + month;
		else s_month = "" + month;
		
		return year + "-" + s_month;
	}
	
	//获取上月年份-月份
	public static String getLastMonth() {
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1;
		
		if(month == 1) {
			year--;
			month = 12;
		} else {
			month--;
		}
		
		String s_month = "";
		if(month < 10) s_month = "0" + month;
		else s_month = "" + month;
		
		return year + "-" + s_month;
	}
	
	public static String getToday() {
		return sdf.format(new Date());
	}
}
