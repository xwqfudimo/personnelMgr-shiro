package com.xwq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.xwq.service.DepartmentService;
import com.xwq.service.EmployeeService;
import com.xwq.service.JiabanService;
import com.xwq.service.KaoqingService;
import com.xwq.service.MenuService;
import com.xwq.service.QingjiaService;
import com.xwq.service.ResourceService;
import com.xwq.service.UserService;

@Controller
public class BaseController {
	@Autowired
	protected EmployeeService employeeService;
	@Autowired
	protected UserService userService;
	@Autowired
	protected DepartmentService departmentService;
	@Autowired
	protected JiabanService jiabanService;
	@Autowired
	protected QingjiaService qingjiaService;
	@Autowired
	protected KaoqingService kaoqingService;
	@Autowired
	protected ResourceService resourceService;
	@Autowired
	protected MenuService menuService;
	
	/**
	 * 设置通用信息
	 * @param href
	 * @param model
	 */
	protected void infoSetting(String href, Model model) {
		String columnName = this.menuService.getMenuNameByHref(href);
		
		model.addAttribute("columnName", columnName);
	}
}
