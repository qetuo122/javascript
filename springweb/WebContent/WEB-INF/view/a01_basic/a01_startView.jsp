<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<c:set var = "path" value="${pageContext.request.contextPath}"/>  
<fmt:requestEncoding value="utf-8"/>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script src="https://code.jquery.com/jquery-3.3.1.js" type="text/javascript"></script>
<script type="text/javascript">
	
	$(document).ready( function(){
		var result = "${result}";
		if(result!="") alert(result);
	});
</script>
</head>
<body>
<h1>스프링 시작!!!</h1><!-- login.do?id=@@@&pass=@@  -->
<form method="post" action="${path}/login.do">
아이디:<input type="text" name="id"/><br>
패스워드:<input type="password" name="pass"/><br>
<input type="submit" value="로그인"/>

</form>


</body>
</html>