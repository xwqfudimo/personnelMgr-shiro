package com.xwq.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.xwq.service.UserService;
import com.xwq.util.ParameterUtil;

@Controller
@SessionAttributes("loginUser")
public class LoginController {
	@Autowired
	private UserService userService;
	
	/**
	 * 用户登录
	 * @param request
	 * @param model
	 */
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(HttpServletRequest request, Model model,
			@CookieValue(name="loginUser", defaultValue="") String username, 
			@CookieValue(name="password", defaultValue="") String password,
			@CookieValue(name="remember", defaultValue="") String remember) {
		//设置contextPath
		request.getSession().getServletContext().setAttribute("ctxPath", request.getContextPath());
		
		model.addAttribute("username", username);
		model.addAttribute("password", password);
		model.addAttribute("remember", remember);
		
		return "login";
	}
	
	/**
	 * 用户登录提交
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response, Model model) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String rememberPwd =request.getParameter("remember_pwd");
		
		if(ParameterUtil.parameterOK(username, password)) {
			if(this.userService.userIsExist(username)) {
				String pwd = this.userService.getPwdByUsername(username);
				if(pwd.equals(DigestUtils.md5Hex(password))) { //登录成功
					request.getSession().setAttribute("loginUser", username);
					
					Cookie usernameCookie = new Cookie("loginUser", username);
					response.addCookie(usernameCookie);
					
					//记住密码
					if(rememberPwd != null && "1".equals(rememberPwd)) {
						Cookie pwdCookie = new Cookie("password", password);
						response.addCookie(pwdCookie);
						Cookie rememberCookie = new Cookie("remember", "1");
						response.addCookie(rememberCookie);
					} else {
						Cookie pwdCookie = new Cookie("password", "");
						response.addCookie(pwdCookie);
						Cookie rememberCookie = new Cookie("remember", "0");
						response.addCookie(rememberCookie);
					}
					
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
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		session.invalidate();

		return "redirect:/login";
	}
}
