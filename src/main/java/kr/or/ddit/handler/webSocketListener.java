package kr.or.ddit.handler;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.ddit.dto.AllimVO;

public class webSocketListener extends TextWebSocketHandler{

	//접속한 websocket sessione들을 저장 하려 해용
	private static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	
	
	public void AdviceAllim(AllimVO allim) throws Exception{
		for(WebSocketSession single : list) {
			TextMessage message = new TextMessage(allim.getFromId()+"가"+allim.getToId());
			single.sendMessage(message);
		}
	}
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		list.add(session);   // 리스트에 접속한 session들을 다마버려용
	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(message);
		System.out.println("여기 데이터 전달된다~");
		//접속해 있는 모든 session에 열락하깅
		for (WebSocketSession single : list) {
			
			single.sendMessage(message);			
		}
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		list.remove(session);
	}
}
