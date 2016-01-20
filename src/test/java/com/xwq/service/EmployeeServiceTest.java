package com.xwq.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:beans.xml"})
public class EmployeeServiceTest {
	@Autowired
	private EmployeeService employeeService;
	
	@Test
	public void testList() {
		this.employeeService.list();
	}
}
