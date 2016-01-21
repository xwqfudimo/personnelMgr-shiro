package com.xwq.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:beans.xml"})
public class PrivilegeServiceTest {
	@Autowired
	private PrivilegeService privilegeService;
	
	@Test
	public void testList() {
		List<String> list = this.privilegeService.getAllPrivilegeUrlByUsername("zs");
		System.out.println(list);
	}
}
