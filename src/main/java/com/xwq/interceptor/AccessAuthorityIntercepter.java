package com.xwq.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.xwq.annotation.Auth;
import com.xwq.exception.PermissionDeniedException;

public class AccessAuthorityIntercepter extends HandlerInterceptorAdapter {
	
	@SuppressWarnings("unchecked")
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(handler instanceof HandlerMethod) {
			HandlerMethod hm = (HandlerMethod) handler;
			
			Auth auth = hm.getMethodAnnotation(Auth.class);
			if(auth != null) {
				String uri = auth.value().trim();
				
				//根据uri进行权限检查
				List<String> privilegeUriList = (List<String>) request.getSession().getServletContext().getAttribute("privilegeUriList");
				if(!privilegeUriList.contains(uri)) {  //用户没有访问该方法的权限，阻止
					throw new PermissionDeniedException("你没有权限访问该功能！");
				}
			}
		}
		
		return super.preHandle(request, response, handler);
	}
}
