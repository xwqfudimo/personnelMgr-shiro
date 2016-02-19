package com.xwq.controller;

import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.xwq.constant.SystemConstants;
import com.xwq.model.Employee;
import com.xwq.model.User;
import com.xwq.service.MenuService;
import com.xwq.service.UserService;

@Controller
@SessionAttributes({"empId", "empName", "deptName", "modules"})
public class IndexController {
	@Autowired
	private UserService userService;
	@Autowired
	private MenuService menuService;

	/**
	 * 管理首页
	 * @param request
	 * @return
	 */
	@RequestMapping(value={"/", "/index"})
	public String index(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String username = session.getAttribute(SystemConstants.SESSION_LOGIN_USER).toString();
		
		User user = this.userService.getByUsername(username);
		Employee emp = user.getEmployee();
		
		session.setAttribute("empId", emp.getId());
		session.setAttribute("empName", emp.getName());
		session.setAttribute("deptName", emp.getDepartment().getName());
		
		session.setAttribute("menus", this.menuService.listByUsername(username));
		
		
		//系统基本信息
		Properties prop = System.getProperties();
		model.addAttribute("osName", prop.getProperty("os.name"));
		model.addAttribute("osArch", prop.getProperty("os.arch"));
		model.addAttribute("osVersion", prop.getProperty("os.version"));
		
		model.addAttribute("javaVersion", prop.getProperty("java.version"));
		model.addAttribute("runtimeName", prop.getProperty("java.runtime.name"));

		
		model.addAttribute("serverInfo", request.getServerName() + "[" + request.getRemoteAddr() + "]");
		
		return "index";
	}
}
