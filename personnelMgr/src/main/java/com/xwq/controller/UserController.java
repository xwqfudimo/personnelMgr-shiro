package com.xwq.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.xwq.service.UserService;

@Controller
@SessionAttributes("loginUser")
public class UserController {
	@Autowired
	private UserService userService;
	
	/**
	 * 用户登录
	 * @param request
	 * @param model
	 */
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(HttpServletRequest request, Model model) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if(username != null && !"".equals(username.trim()) && password != null && !"".equals(password.trim())) {
			if(this.userService.userIsExist(username)) {
				String pwd = this.userService.getPwdByUsername(username);
				if(pwd.equals(DigestUtils.md5Hex(password))) { //登录成功
					request.getSession().setAttribute("loginUser", username);
					
					return "redirect:/index";
				}
			}
		}
		
		return "redirect:/login";
	}
	
	
	/**
	 * 用户退出
	 * @param request
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().setAttribute("loginUser", null);
		return "redirect:/login";
	}
}
