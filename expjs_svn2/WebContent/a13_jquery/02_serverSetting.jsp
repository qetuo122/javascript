<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl 인식 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- server의 공통 폴드 즉, WebContent로 기본 인식 설정 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${path}/a00_comjs/jquery-3.3.1.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h1").html("서버 환경에서 jquery 설정 완료!!!");
	});

</script>
</head>
<body> <!-- ctrl + f11 -->
	<!--  /expjs는 서버의 url로  소스상으로는
		WebContent를 기준 폴드로 인식한다.
	 -->
	<h1></h1> 
	<h2>기본 경로:${path}</h2>
</body>
</html>