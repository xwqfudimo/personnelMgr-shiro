package com.xwq.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class SpringContext implements ServletContextListener {
	
	private static ApplicationContext applicationContext;

	@Override
	public void contextDestroyed(ServletContextEvent event) {
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		applicationContext = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
	}

	public static ApplicationContext getApplicationContext() {
		return applicationContext;
	}
}
