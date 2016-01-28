package com.xwq.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.xwq.annotation.LogText;
import com.xwq.constant.SystemConstants;
import com.xwq.model.Log;
import com.xwq.service.LogService;
import com.xwq.util.DateUtil;
import com.xwq.util.JsonUtil;

/**
 * 日志记录拦截器
 */
public class LogInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	private LogService logService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		if(handler instanceof HandlerMethod) {
			HandlerMethod hm = (HandlerMethod) handler;
			LogText logText = hm.getMethodAnnotation(LogText.class);
			
			if(logText != null) {
				String logStr = logText.value();
				
				if(logStr != null) {
					Object usernameObj = request.getSession().getAttribute(SystemConstants.SESSION_LOGIN_USER);
					
					if(usernameObj != null) {
						String username = usernameObj.toString();
						String url = request.getRequestURI();
						url = url.replace(request.getContextPath(), "");
						String param = JsonUtil.toJson(request.getParameterMap());
						
						Log log = new Log();
						log.setUname(username);
						log.setLogMsg(logStr);
						log.setUrl(url);
						log.setParam(param);
						log.setRecordTime(DateUtil.getCurrentTime());
						this.logService.addLog(log);
					}
				}
			}
		}
		
		super.postHandle(request, response, handler, modelAndView);
	}
}
