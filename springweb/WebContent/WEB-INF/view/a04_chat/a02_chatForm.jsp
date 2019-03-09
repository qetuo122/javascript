<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<fmt:requestEncoding value="UTF-8"/>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/jquery-ui/jquery-ui-1.10.3.custom.css"/>
<link rel="stylesheet" href="${path}/a00_com/a00_com.css"/>
<style>
   #chatMessageArea{
   	 width:100%;
   	 height:100pt;
   	 background:lightgreen;
   	 text-align:left;
   	 overflow-y: auto;
   } 
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"  ></script>
<script type="text/javascript" src="${path}/a00_com/jquery-ui/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript">
/* server의 ChatHandler와 연동 되어 처리..
 1. websock 연결 처리..
 	1) 객체 생성: new WebSocket("서버의 handler를 호출..")
 	2) 연결 처리 메서드 : onopen
 	3) 메세지 전송시 메서드 : onmessage
 	3) 연결 해제 메서드 : onclose
 */
 	var wsocket;
 	// 초기 연결 처리 함수..
 	function connect(){
 		// 외부에 현재 서버에 접속해야 하기 때문에, local IP 주소 확인
 		// 192.168.0.72
 		// handler 연결은 스프링 테이너 설정설정 파일에 있음..
 		wsocket = new WebSocket("ws://192.168.0.5:7080/${path}/chat-ws2.do");
 		// 서버에 연결 이나, 종료 후에,
 		// 다시 클라이언트 단에서 호출 되어 처리할 메서드 정의!!
 		
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
		
 		
 	}
 	function onOpen(evt){
 		// 연결시, 연결 처리 내용 서버에 보냅..
 		alert("연결되었습니다!!");
 		// 연결 정보를 서버에 전송 하기위해.
 		// 누가 접속하는지만 처리.. int:홍길동
 		wsocket.send("int:"+$("#nickname").val());
 	}
	function onClose(evt){
		alert("접속 종료합니다!!");
	}
	function onMessage(evt){
		// int:홍길동;김길동;신길동
		var revMsg=evt.data;
		if(revMsg.substring(0,3)=="int"||revMsg.substring(0,3)=="del"){
			var users=revMsg.substring(4).split(";")
			var listView="";
			for(var idx=0;idx<users.length;idx++){
				listView+="<span onclick='ckuser(this)'>"+users[idx]+"</span><br>";
			}
			$("p").html(listView);
		}else{
			$("#chatMessageArea").append(revMsg+"<br>");
			// 포함하는 div의 높이를 가져온다.(범위)
			var chatAreaHeight = $("#chatArea").height();
			// 현재  message영역의 div 높이를 가져온다.(메시지)
			// 최대 스크롤 크기 :  메시지의 높이 - 메시지를처리할 범위
			var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
			// jquery에서 지원한는 scrollTop() 함수에서 최대 스크롤 높이를
			//  지정하면 자동 스크롤 처리된다.
			$("#chatArea").scrollTop(maxScroll);
			
		}
		
	}
	var user="";
	function ckuser(obj){
		// 대상자의 색상을 변경..
		// 1. span의 다른 클릭한 내용을 초기화.
		$("span").css("background","");
		// 2. 해당 내용을 배경색 변경..
		if(user==""){
			$(obj).css("background","pink");
			user=$(obj).html();
		}else{
			// 한번더 클릭시, 해제 처리
			user="";
		}
		// 3. 전달할 대상자 지정처리..
		
	}
	function disconnect(){
		// 서버에 해당 대화nickname을 대화상대에서 제외처리..
		wsocket.send("del:"+$("#nickname").val());
		wsocket.close();
		$("#nickname").val("");
		$("p").html("");
		$("#chatMessageArea").html("")
	}
	function  send(){
		// 이름과 메세지를 서버에 전송..
		var nickname=$("#nickname").val();
		var msg=$("#message").val();
		// 서버에 전송..
		// 1) msg인지 여부(ins/del), 2) nickname, 3) 1:1대화 상대방..
		//alert("msg:"+nickname+":"+msg+": "+user);
		wsocket.send("msg:"+nickname+":"+msg+": "+user);
		$("#message").val("");
		
	}
	$(document).ready(function(){
		/* enter 이벤트 처리..*/
		$("#message").keypress(function(event){
			var keycode = (event.keyCode? event.keyCode:event.which);
			if(keycode==13) send();
			event.stopPropagation();
			
		});
		
		
		
		$("#enterBtn").click(function(){
			connect();
		});
		$("#exitBtn").click(function(){
			disconnect();
		});
		$("#sendBtn").click(function(){
			// 전송시, 처리할 내용..
			send();	
		});
		
		
	});
</script>
</head>
<body>
  	<h1>채팅 화면</h1>
  	<table>
  		<tr><td>이름</td>
  			<td><input type="text" id="nickname"/></td></tr>
  		<tr><td colspan="2">
  			<input type="button" id="enterBtn" value="입장" />
  			<input type="button" id="exitBtn" value="나가기" />
  			</td></tr>
  		<tr><td>채팅중<br>
  				<p></p>
  			
  			</td>
  			<td style="text-align:center;">
  				<div id="chatArea" ><div id="chatMessageArea"></div></div><br>
  				메시지<input type="text" id="message"/><br>
  				<input type="button" id="sendBtn" value="전송"/>
  			</td>
  		</tr>	
  	</table>
</body>
</html>