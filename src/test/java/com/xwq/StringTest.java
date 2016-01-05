package com.xwq;

import org.junit.Test;

public class StringTest {

	@Test
	public void test() {
		String s1 = new String("abc");
		String s2 = "abc";
		System.out.println(s1 == s2);
	}
}
