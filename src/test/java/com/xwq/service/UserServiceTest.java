package com.xwq.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xwq.vo.UserVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:beans.xml"})
public class UserServiceTest {
	@Autowired
	private UserService userService;
	
	@Test
	public void testList() {
		List<UserVo> userList = this.userService.list();
		
		for(UserVo u : userList) {
			System.out.println(u.getUid() + "," + u.getUsername() + "," + u.getEname() + "," + u.getRname());
		}
	}
}
