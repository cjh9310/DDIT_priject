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
}
	

