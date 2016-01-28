package com.xwq.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.xwq.constant.SystemConstants;

/**
 * 登录检测拦截器
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		if(request.getSession().getAttribute(SystemConstants.SESSION_LOGIN_USER) == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}
}
