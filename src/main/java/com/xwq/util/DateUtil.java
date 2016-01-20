package com.xwq.util;

import org.joda.time.DateTime;

public class DateUtil {
	//获取本月年份-月份
	public static String getThisMonth() {
		DateTime dateTime = DateTime.now();
		return dateTime.toString("yyyy-MM");
	}
	
	//获取上月年份-月份
	public static String getLastMonth() {
		DateTime dateTime = DateTime.now();
		DateTime prevMonth = dateTime.minusMonths(1);
		return prevMonth.toString("yyyy-MM");
	}
	
	public static String getToday() {
		return DateTime.now().toString("yyyy-MM-dd");
	}
	
	public static String getCurrentTime() {
		return DateTime.now().toString("yyyy-MM-dd HH:mm:ss");
	}
}
