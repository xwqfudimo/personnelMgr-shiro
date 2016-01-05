package com.xwq;

import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;

public class Md5Test {
	@Test
	public void testMd5() {
		System.out.println(DigestUtils.md5Hex("123"));
	}
}
