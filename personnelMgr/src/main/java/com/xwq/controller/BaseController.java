package com.xwq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.xwq.model.Column;
import com.xwq.service.ColumnService;
import com.xwq.service.DepartmentService;
import com.xwq.service.EmployeeService;
import com.xwq.service.JiabanService;
import com.xwq.service.KaoqingService;
import com.xwq.service.QingjiaService;
import com.xwq.service.UserService;

@Controller
public class BaseController {
	@Autowired
	protected EmployeeService employeeService;
	@Autowired
	protected ColumnService columnService;
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
	
	/**
	 * 设置通用信息
	 * @param href
	 * @param model
	 */
	protected void infoSetting(String href, Model model) {
		Column column = this.columnService.getByHref(href);
		model.addAttribute("columnName", column.getName());
		
	}
}
