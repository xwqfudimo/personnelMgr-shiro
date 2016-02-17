package com.xwq.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import com.xwq.constant.SystemConstants;


public class SystemWebSocketHandler implements WebSocketHandler {
	
	//一个websocket session是一个用户连接会话，对应于一个登录用户
	private static List<WebSocketSession> webSocketSessionList = new ArrayList<WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		webSocketSessionList.add(session);
	}

	//处理从客户端发过来的web socket消息
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		if(session.isOpen()) session.close();
		webSocketSessionList.remove(session);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		webSocketSessionList.remove(session);
	}

	@Override
	public boolean supportsPartialMessages() {
		return false;
	}
	
	/**
	 * 给所有在线用户发送消息
	 * @param msg
	 */
	public void sendMessageToUsers(TextMessage msg) {
		try {
			for(WebSocketSession session : webSocketSessionList) {
				if(session.isOpen()) session.sendMessage(msg);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 给指定用户发送消息
	 * @param username
	 * @param msg
	 */
	public void sendMessageToUser(String username, TextMessage msg) {
		try {
			for(WebSocketSession session : webSocketSessionList) {
				if(session.getAttributes().get(SystemConstants.WEBSOCKET_USERNAME).toString().equals(username)) {
					if(session.isOpen()) session.sendMessage(msg);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
