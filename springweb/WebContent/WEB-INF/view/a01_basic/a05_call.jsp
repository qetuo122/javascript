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
		var msg = "${msg}";
		if(msg!=""){
			alert(msg);
		}
	});
</script>
</head>
<body>
<div class="container">
	<h1>로그인</h1>
	<form action="${path}/login2.do">
		<div class="form-group">
			<label for="id">아이디</label>
			<input type="text" class="form-control" name="id" id="id"
				placeholder="아이디를 입력"
			/>
		</div>
		<div class="form-group">
			<label for="pass">패스워드</label>
			<input type="password" class="form-control" name="pass" id="pass"
				placeholder="패스워드 입력"
			/>
		</div>	
		<button type="submit" class="btn btn-primary">로그인</button>	
	</form>
</div>	
</body>
</html>