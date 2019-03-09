package springweb.a04_chat;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

// springweb.a07_chat.ChatHandler
// 채팅시, 바로 실시간으로 처리되는 내용..
@Controller("chatHandler2")
public class A03_ChatHandler extends TextWebSocketHandler{
	
	// 접속자 수만큼 WebSocketSession을 설정해서 사용할 수 있는 Map객체 생성..
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();
	// 접속자의 명단을 client에 보내기 위해서..
	private ArrayList<String> ids = new ArrayList<String>();
	// 접속자 id와 nickname을 함께 가지고 있는 객체 선언..
	private Map<String, String> target = new ConcurrentHashMap<>();
	
	// 접속 했을 때, 처리할 내용.
	// 클라이언트에서 넘겨온 websocketsession을 현재 서버단의 리스트에 추가..
	// 클라이언트 웹소켓 해당 메서드와 연결
	//      wsocket.onopen = onOpen;
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log(session.getId()+"접속");
		users.put(session.getId(), session);
		/* 화면단에서 접속자 list 확인할 수 있도록 전송 - view(전송된 내용을 받아서 출력)*/
		
	}
	// 접속을 종료할 때, 처리할 내용..
	// 클라이언트에서 접속종료 메서드 호출시, 서버에서 현재 메서드를 통해, websession을 삭제처리.
	// 클라이언트 웹소켓 해당 메서드와 연결;
	//      wsocket.onclose = onClose;	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log(session.getId()+"접속 종료");
		users.remove(session.getId());
	}

	// 메시지 보냈을 때, 처리할 내용
	// 클라이언트 웹소켓 해당 메서드와 연결
	//      wsocket.onmessage = onMessage;
	@Override
	public void handleMessage(WebSocketSession session, 
			WebSocketMessage<?> message) throws Exception {
		// TODO Auto-generated method stub
		// WebSocketMessage의 getPayload()는 클라이언트가 넘겨준 메시지를 
		// 서버에는 받은 내용을 출력한다.
		log("전송한 id:"+session.getId()+", 전송된 내용:"+message.getPayload());
		
		// 넘겨온 데이터 - msg:하이맨2:김길동님 비밀채팅하시죠.: 김길동
		// 구분자(int/msg/del) : 메시지보낸사람nickname : 메시지 : 전달할 사람nickname
		// int:홍길동
		String []msg= message.getPayload().toString().split(":");
		// msg[0] : 구분자.
		// msg[1] : 메시지 보내는 사람
		// msg[2] : 메시지
		// msg[3] : 메시지 받는 사람
/*  client 보내는 nickname과 서버에 식별자로 사용하는 session를  id
 *  1. 서버에서 사용하는 id과 client에서 전달하는 nickname의 데이터 함께 가지고
 *      있는 저장객체가 필요하다.
 *  2. 전역변수로 이 처리하는 객체 선언하고, 접속시 마다 id와 nickname을 저장한다.
 *      
 *  
 * 
 * 
 * */		
		
		// msg[0]/msg[1]
		// int:홍길동
		// 접속할 때 처리..(누가접속했는지?) int:홍길동
		if(msg[0].equals("int")) {
			// 메시지는 보낼 내용(누가 접속했는지)
			ids.add( msg[1] );
			// 접속시에 nickname을 보내는 순간에 id와 nickname을 같이 저장.
			target.put(session.getId(), msg[1]);
			
			// 현재접속된 사람의 id를 curName으로 저장하여, 
			// client에 보내주기 위해서 처리..
			String curNames="";
			for(int idx=0;idx<ids.size();idx++){
				curNames+=ids.get(idx);
				if((idx+1)!=ids.size()) {
					curNames+=";";
				}		
			}
			// int:홍길동;김길동;신길동
			// 현재 접속한 모든 클라이언트에게 전송.. 
			for(WebSocketSession s:users.values()) {
				// 클라이언트에 전달... client의 websocket의 onmessage 
				s.sendMessage(new TextMessage("int:"+curNames));
				
			}			
			
		}else if(msg[0].equals("del")){
			// 해당 client 삭제..
			ids.remove( msg[1] );
			String curNames="";
			for(int idx=0;idx<ids.size();idx++) {
				curNames+=ids.get(idx);
				if((idx+1)!=ids.size()) {
					curNames+=";";
				}
			}
			for(WebSocketSession s:users.values()) {
				// 클라이언트에 전달... client의 websocket의 onmessage 
				s.sendMessage(new TextMessage("del:"+curNames));
			}			
			
			
			
			
		}else {
		// 메시지를 보낼 때.
			
			
		
			// 접속한 사용자를 추가 처리..//
			/*
			 접속한 모든 client들에 메시지를 전달... 
			 1. users.values() : 접속한 WebSocketSession의 모든 리스트..
			 2. sendMessage("보낼 문자열포함한 객체") : 지정한 클라이언트에 보낼 문자열 처리..
			 */
			// 상대방이 있는 것 메시지를 보낼 때,
			//   상대방의 nickname을 가지고,  id값을 추출한다. 
			String ckId="";
			if(!msg[3].trim().equals("")) {
				// 현재 등록된 target<id, nickname>
				//  target.keyset() : key값만 배열로 가져오고,
				//  target.get(key) : value값을 가져온다.
				for(String key:target.keySet()) {
					if(target.get(key).equals(msg[3].trim())) {
						ckId=key;
					}
				}
			}
			
			
			
			// 접속한 client를 loop
			for(WebSocketSession s:users.values()) {
				// 클라이언트에 전달... client의 websocket의 onmessage
				// 0. 전체보내기와 클릭시, 대화 상대방을 구분..
				if(!msg[3].trim().equals("")) {
					// 1. s.getId() 기준으로 검색해서 전달하여야 한다.
					// 2. 현재메시지를 보내는 사람 전달..
					//    현재 메시지를 보낼때, 해당 세션의 id값 :session.getId()      
					if(s.getId().equals(session.getId()) ||
					   s.getId().equals(ckId)  ) {
						// 현재 접속한 id와 서버에 등록한 sockeSession id가 같을 때.
						//  해당 접속 session에 메시저를 전송한다.
						s.sendMessage(new TextMessage(""
						+msg[1]+":"+msg[2]));
					}
					// 3. 보내는 상대방에 전달.
					
				}else {
					// 전체 전달..
					s.sendMessage(new TextMessage(""+msg[1]+":"+msg[2]));
				}

				
				
			}
		}
	}
	private void log(String msg) {
		System.out.println(new Date()+" : "+msg);
	}
	// 에러발생
	public void handleTransportError(WebSocketSession session, 
				Throwable exception)throws Exception{
		log(session.getId()+" 예외 발생: "+ exception.getMessage());
	}
}
