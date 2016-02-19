package com.xwq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xwq.annotation.LogText;
import com.xwq.constant.SystemConstants;
import com.xwq.model.Menu;
import com.xwq.model.Privilege;
import com.xwq.service.MenuService;
import com.xwq.service.PrivilegeService;
import com.xwq.service.UserService;
import com.xwq.util.ParameterUtil;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;
	@Autowired
	private PrivilegeService privilegeService;
	@Autowired
	private MenuService menuService;
	
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
	@LogText("登录系统")
	@RequestMapping(value="/loginSubmit", method=RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response, Model model) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String rememberMe =request.getParameter("rememberMe");
		
		
		if(ParameterUtil.parameterOK(username, password)) {
			if(this.userService.userIsExist(username)) {
				
				//shiro用户登录
				Subject currentUser = SecurityUtils.getSubject();
				UsernamePasswordToken token = new UsernamePasswordToken(username, password);
//				token.setRememberMe(true);
				
				try {
					currentUser.login(token); //无异常表示登录成功
//					session.setAttribute(SystemConstants.SESSION_LOGIN_USER, username);
					request.getSession().setAttribute(SystemConstants.SESSION_LOGIN_USER, username);
					
					//将菜单名存入application中
					List<Menu> menuList = this.menuService.getAllMenuByUsername(username);
					Map<String,String> menuNameMap = new HashMap<String,String>();
					for(Menu m : menuList) {
						if(m.getHref() != null && !m.getHref().trim().equals("#")) {
							menuNameMap.put(m.getHref().substring(1).trim(), m.getName());
						}
					}
					request.getSession().getServletContext().setAttribute("menuNameMap", menuNameMap);
					
					
					//记住用户名
					Cookie usernameCookie = new Cookie("loginUser", username);
					response.addCookie(usernameCookie);
					
					//记住密码
					if(rememberMe != null && "1".equals(rememberMe)) {
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
					
					
					//将权限url Map放入到application中
					List<Privilege> permList = this.privilegeService.list();
					Map<String, String> permUrlMap = new HashMap<String,String>();
					for(Privilege p : permList) {
						String url = p.getUri();
						if(url.contains(",")) {
							for(String str : url.split(",")) {
								permUrlMap.put(str, p.getPermission());
							}
						}
						else {
							permUrlMap.put(url, p.getPermission());
						}
					}
					request.getSession().getServletContext().setAttribute("permUrlMap", permUrlMap);
					
					return "redirect:/index";
				} catch (AuthenticationException e) {
					e.printStackTrace();
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
		session.removeAttribute(SystemConstants.SESSION_LOGIN_USER);
		session.invalidate();

		return "redirect:/login";
	}
}
