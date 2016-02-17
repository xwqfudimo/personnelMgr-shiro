package com.xwq.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xwq.model.Menu;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:beans.xml"})
public class MenuServiceTest {
	@Autowired
	private MenuService menuService;
	
	@Test
	public void testList() {
		List<Menu> menuList = this.menuService.listTree();
		
		System.out.println(">>" + menuList.get(0).getChildren().size());
	}
}
