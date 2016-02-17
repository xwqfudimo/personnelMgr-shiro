package com.xwq;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.junit.Test;

public class ShiroTest {

	@Test
	public void testMd5(){
		Md5Hash hash = new Md5Hash("1", "nyy");
		System.out.println(hash.toHex());
	}
}
