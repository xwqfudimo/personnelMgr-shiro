package com.xwq.util;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xwq.model.Employee;
import com.xwq.service.EmployeeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:beans.xml"})
public class JsonUtilTest {
	@Autowired
	private EmployeeService employeeService;
	
	@Test
	public void testToJson() {
		Employee e = this.employeeService.get(2);
		
		System.out.println(JsonUtil.toJson(e));
	}
}
