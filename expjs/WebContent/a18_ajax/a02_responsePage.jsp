<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>받은page</h1>
<h2>요청받은 id : ${param.id}</h2>
<h2>요청받은 pass : ${param.pwd}</h2>
<h2>인증여부 : ${param.id == "himan" and param.pwd == "7777" ? "인증성공" : "인증실패"}</h2>
</body>
</html>