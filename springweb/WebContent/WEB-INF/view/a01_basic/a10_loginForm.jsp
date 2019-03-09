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

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready( function(){
		
	});
</script>
</head>
<body>
<div class="container">
	<h2>로그인</h2>
	<form method="post">
	<div class="form-group">
		<label>아이디</label>
		<input type="text" class="form-control" id="id" name="id"/>
	</div>
	<div class="form-group">
		<label>패스워드</label>
		<input type="password" class="form-control" 
			id="pass" name="pass"/>
	</div>	
	<div class="form-group">
		<input type="submit" class="form-control" value="로그인"/>
	</div>		
	</form>
</body>
</html>