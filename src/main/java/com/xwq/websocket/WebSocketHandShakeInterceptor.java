package com.xwq.websocket;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import com.xwq.constant.SystemConstants;

public class WebSocketHandShakeInterceptor implements HandshakeInterceptor {

	/**
	 * 将http session中的登录用户名放入websocket session中
	 */
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		
		if(request instanceof ServletServerHttpRequest) {
			ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
			HttpSession httpSession = servletRequest.getServletRequest().getSession(false);
			
			if(httpSession != null) {
				String loginUsername = httpSession.getAttribute(SystemConstants.SESSION_LOGIN_USER).toString();
				attributes.put(SystemConstants.WEBSOCKET_USERNAME, loginUsername);
			}
		}
		
		return true;
	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception exception) {
		
	}

}
