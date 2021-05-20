package com.mall.common;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
    private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	//list for saving the web socket session
	private List<WebSocketSession> sessionList=new ArrayList<WebSocketSession>();
	
	//after successfully connection with the client
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		sessionList.add(session);
		logger.info("{} connected", session.getId());
		System.err.println("the user entering this chatting room: "+session.getPrincipal().getName());
	}
	
	//in case the data is transfered through the web socket server
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		logger.info("{} gave {}: ", session.getId(), message.getPayload());
		
		//sending the messages to all the clients connected
		for(WebSocketSession sess:sessionList) {
			sess.sendMessage(new TextMessage(session.getPrincipal().getName()+"|"+message.getPayload()));
		}
	}
	
	//in case disconnection with the client happens
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		sessionList.remove(session);
		logger.info("disconnection with {}", session.getId());
		System.err.println("the user who has already exit from the chatting room: "+session.getPrincipal().getName());
	}
}
