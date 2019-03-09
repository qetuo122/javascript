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
	<h2>회원가입</h2>
	<form action="">
	<div class="form-group">
		<label>아이디</label>
		<input type="text" class="form-control" id="id" name="id"/>
	</div>
	<div class="form-group">
		<label>취미:</label>
		<c:forEach var="hb" items="${hobby}">
		<div class="form-check-inline">
			<label class="form-check-label">
				<input type="checkbox" class="form-check-input" 
					name="hobby" value="${hb}">${hb}
			</label>
		</div>
		</c:forEach>
	
	</div>
	<div class="form-group">
		<label>성별</label>
		<select class="form-control" name="gender">
			<c:forEach var = "ch" items="${gender}">
			<option value="${ch.key}">${ch.value}</option>
			</c:forEach>
		</select>
	</div>
	</form>
<!-- 
   사원 검색
사원명:[   ]
부서:[select] 인사/총무/it사업부/기획
직급:[]사원 [] 대리 [] 과장 [] 차장[] 부장[] 
성별:()남 ()여
 -->
</div>
</body>
</html>