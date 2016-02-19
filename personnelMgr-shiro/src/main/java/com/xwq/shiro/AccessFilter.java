package com.xwq.shiro;

import java.util.Map;
import java.util.Set;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;

public class AccessFilter extends AccessControlFilter {

	@SuppressWarnings("unchecked")
	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue)
			throws Exception {
		Map<String,String> permUrlMap = (Map<String, String>) request.getServletContext().getAttribute("permUrlMap");
		
		String requestUrl = getPathWithinApplication(request);
		
		if(permUrlMap != null) {
			Set<String> keySet = permUrlMap.keySet();
			for(String key : keySet) {
				if(pathsMatch(key, requestUrl)) {
					String permission = permUrlMap.get(key);
					Subject subject = getSubject(request, response);
					if(subject.isPermitted(permission)) return true;
					else {
						HttpServletRequest req = (HttpServletRequest) request;
						HttpServletResponse resp = (HttpServletResponse) response;
						resp.sendRedirect(req.getContextPath() + "/permDedy");
						return false;
					}
				}
			}
		}
		return true;
	}

	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		return false;
	}

}
