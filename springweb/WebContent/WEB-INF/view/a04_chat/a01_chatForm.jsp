<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<c:set var = "path" value="${pageContext.request.contextPath}"/>  
<fmt:requestEncoding value="utf-8"/>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css">
<style type="text/css">
#chatArea {
	width: 80%; height: 130px; overflow-y:auto;
	border:1px solid green;
}
.clsWidth{width:20%;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready( function(){
		$("#enterBtn").click(function(){
			connect();
	
		});
		$("#exitBtn").click(function(){
	
			disconnect();
		});
		$("#message").keyup(function(e){
			//alert(e.keyCode);
			if(e.keyCode == 13){
				send();
			}
		});
		
	});
	var wsocket;
	function connect(){
		// http://192.168.0.5
		wsocket = new WebSocket("ws:192.168.0.5:7080/${path}/chat-ws.do");
		// 연결되었을 때, 
		// handler 클래스에 있는 연결후, 메시지전송, 닫히 후와 연결되어 있다.
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	function disconnect(){
		var nickname=$("#nickname").val();
		wsocket.send(nickname+":"+"접속을 종료합니다!");	
		alert("접속종료합니다!!");
		wsocket.close();
	}
	function onOpen(){
		var nickname=$("#nickname").val();
		wsocket.send(nickname+":"+"입장합니다!");	
		inLogin();
		
	}
	// 메시지를 보내기.
	function send(){
		var nickname=$("#nickname").val();
		var msg = $("#message").val();
		// 그룹에 대한 param   아이디:메시지:그룹
		wsocket.send(nickname+":"+msg);
		$("#message").val("");
	}
	function onMessage(evt){
		// 메시지를 서버에 받는 처리..
		// evt.data : 서버에 온 메시지..(서버에서 보내온 메시지 내용)
		var msg = evt.data;
		$("#chatMessageArea").append(msg+"<br>");
		// 스크롤링 처리..
		// 1. 채팅화면의 높이
		var chatH = $("#chatArea").height();
		// 2. 최고 scroll 위치..현재채팅화면 높이 - 감싸고 있는 div 높이..
		var maxScroll = $("#chatMessageArea").height() - chatH;
		// 3. 스크롤링 위치 지정.
		$("#chatArea").scrollTop(maxScroll);
		inLogin();
	}	
	function onClose(){
		alert("접속종료되었습니다.");
		$("#nickname").val("");
		$("#loginId").val("");
		$("#chatMessageArea").html("");
	}	
	
	function inLogin(){
		$.ajax({
			type:"post",
			url:"${path}/chat.do?method=getCurrLogin",
			dataType:"json",
			success:function(data){
				//alert(data.list.length)
				var list="";
				for(var pro in data.list){
					list+=data.list[pro]+",";
					//alert(pro +":"+data.list[pro]);
				}
				$("#loginId").val(list);
				//alert(data.list[0]);
			}	
		});			
		
	}
</script>
</head>
<body>
	<div class="container">
		<h1>채팅!!</h1>
		<div class="input-group mb-3 input-group-sm">
			<div class="input-group-prepend">
				<span class="input-group-text">입장 아이디</span>
			</div>
			<input type="text" id="nickname" class="form-control">
		</div>
		<div class="input-group mb-3 input-group-sm">
			<div class="input-group-prepend">
				<span class="input-group-text">로그인 중</span>
			</div>
			<input type="text" id="loginId" class="form-control">
		</div>		
		<div class="input-group mb-3 input-group-sm">
			<div class="input-group-prepend">
				<span class="input-group-text">기능처리</span>
			</div>
			<input type="button" id="enterBtn" value="입장" class="form-control  btn btn-primary">
			<input type="button" id="exitBtn" value="나가기" class="form-control btn btn-danger">
		</div>	
		<div class="input-group mb-3 input-group-sm">
			<div class="input-group-prepend">
				<span class="input-group-text">메세지</span>
			</div>
			<input type="text" id="message" class="form-control">
		</div>		
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">채팅중</span>
			</div>
			<div class="containter" id="chatArea">
				<div class="containter" id="chatMessageArea">
				</div>			
			</div>
			
			
		</div>			
		
	</div>
</body>
</html>