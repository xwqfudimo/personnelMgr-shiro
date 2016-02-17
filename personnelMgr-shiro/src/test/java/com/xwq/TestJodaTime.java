package com.xwq;

import org.joda.time.DateTime;
import org.junit.Test;

public class TestJodaTime {
	
	@Test
	public void test() {
		DateTime dateTime = DateTime.now();
		System.out.println(dateTime.toString("yyyy-MM"));
		
		DateTime prevMonth = dateTime.minusMonths(1);
		System.out.println(prevMonth.toString("yyyy-MM"));
	}
}
