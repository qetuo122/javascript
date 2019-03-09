<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- server의 공통 폴더, webContent로 기본 인식 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value = "${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "${path}/a00_comjs/jquery-3.3.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h1").html("서버환경에서 jquery설정 완료");
	})
</script>
</head>
<body>
<!-- expjs는 서버의 url로 소스상으로는 webContent를 기준 폴더로 인식 -->
	<h2>기본경로 : ${path}</h2>
	<h1></h1>
</body>
</html>