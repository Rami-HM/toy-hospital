package com.spring.socket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

// 아래 주소로 웹소켓이 연결된다.
@ServerEndpoint(value="/broadcasting",
		configurator = GetHttpSessionForWebSocket.class)
public class SocketHandler {

	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	private EndpointConfig config;
	
	
	public int getIndex(Set<Session> clients, Session find_se) {
		int result = 0;
		for (Session client : clients) {
			if (client.equals(find_se))
				return result;
			result++;
		}
		
		return -1;
	}
	
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {

		/*
		 HttpSession httpSession = (HttpSession)
		 config.getUserProperties().get(HttpSession.class.getName()); ServletContext
		 servletContext = httpSession.getServletContext(); LoginVo login = (LoginVo)
		 servletContext.getAttribute("login");
		
		
		System.out.println(login.getId() + " : ")*/
		
		System.out.println(message);
		System.out.println(session);
		synchronized (clients) {			
			for (Session client : clients) {
				System.out.println(client);
				if(getIndex(clients,session) != -1)
				{
					if (!client.equals(session)) {
						client.getBasicRemote().sendText(message);
					}
				}
			}
		}
	}

	@OnOpen
	public void onOpen(Session session) throws IOException {

		this.config = config;
		
		Session nowclient = session;
		
		clients.add(session);
		System.out.println("채팅창에 접속 한 회원 수 : " + clients.size());
		System.out.println(nowclient.toString());

		if(clients.size() > 2)
		{
			for(Session client : clients) {
				if(nowclient.equals(client))
				{
					client.getBasicRemote().sendText("접속중인 사용자가 있습니다.");
					client.getBasicRemote().sendText("----잠시후 시도해 주세요.");
					onClose(client);
					clients.remove(nowclient);
					return;
				}
			}
		}
	}

	@OnClose
	public void onClose(Session session) throws IOException {
		System.out.println("close : " + session);
		clients.remove(session);
		for(Session client : clients) {
			System.out.println(client + ":");
		}
	}
}
