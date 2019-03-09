<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>받은 page</h1>
<!-- ?id=@@@&pass=@@@  형식으로 요청값이 들어오면, 서버 페이지에서는
el tag로 해당 id와 pass 값을 받는다..
 -->
<h2>요청받은 id:${param.id}</h2>
<h2>요청받은 pass:${param.pass}</h2>
<h2>인증 여부 :${param.id=='himan' and param.pass=='7777'?'인증성공':'인증실패' }</h2>
<!-- 
서버에서 받은 요청값을 가지고 java프로그램으로 화면을 만든 후,
client에 해당 페이지를 reponse으로 스트림으로 html을 만들어 보낸다.
 -->

</body>
</html>