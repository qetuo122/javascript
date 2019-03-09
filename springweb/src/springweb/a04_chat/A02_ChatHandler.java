package springweb.a04_chat;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


// 실제 chatting socket으로 데이터가 오면 처리해주는 객체..
@Controller("chatHandler")
public class A02_ChatHandler  extends TextWebSocketHandler{
	@Autowired(required=false)
	private A02_ChatService service;
	
	// 접속 client를 식별하기 위하 WebSocketSession 선언..
	private Map<String, WebSocketSession> 
		users = new ConcurrentHashMap<>();
	
	
	// 웹소켓이 client(화면단에서 종료할 때 처리할 내용)
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
		System.out.println("###소켙 연결 종료");
		users.remove(session.getId());
		System.out.println("###현재 접속자 수:"+users.size());
	}
	// 웹소켓이 화면단에 연결할때, 처리될 내용..
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionEstablished(session);
		System.out.println("###소켙 연결 시작!! 접속한 소켓세션 id:"+session.getId());

		users.put(session.getId(), session);
		System.out.println("###현재 접속자 수:"+users.size());
	}
	// 웹소켓을 통해 메시지를 전달 할 때, 처리할 내용
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		// TODO Auto-generated method stub
		super.handleMessage(session, message);
		// message.getPayload() : 클라이언트 메시지를 전송했을 때, 가져오는 부분..
		System.out.println("###메시지(전송)!!:"
				+message.getPayload());
		String msg[] = ((String)message.getPayload()).split(":");
		System.out.println(msg[0]+"-"+msg[1]);
		if(msg[1].indexOf("입장")>=0) {
			// 등록하는 id 처리..
			service.insertChat(new Chatt(msg[0],"A"));
			System.out.println("로그인 DB");
		}
		System.out.println("종료시:"+msg[1].indexOf("종료"));
		if(msg[1].indexOf("종료")>=0) {
			
			service.logoutChat(new Chatt(msg[0],"A"));
			System.out.println("로그아웃 DB");
		}	
		
		// 접속한 모든 사람들에게 session 정보를 전송..
		for(WebSocketSession s:users.values()) {
			// 접속한 모든 client에게 메시지 정보를 보냅니다..
			System.out.println("멤버들에게 "+message.getPayload());
			s.sendMessage(message);
		}
		
		
	}
	// 웹소켓을 통해 에러가 발생시, 처리할 내용..
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		super.handleTransportError(session, exception);
		System.out.println("###에러발생!!");
	}
	
	
	
}
