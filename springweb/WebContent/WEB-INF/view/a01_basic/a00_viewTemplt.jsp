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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready( function(){
		//alert("jquery 로딩");		
	});
</script>
</head>
<body>
	<div class="container-fluid">
		<h1>부트스트랩 페이지</h1>
		<p>기본 입력 텍스트 입니다!!</p>
	</div>
	<!--  12개의 col을 기본 cell로 해서 나누어 진단.. -->
	<div class = "row">
		<div class="col">첫번째 열</div>
		<div class="col">두번째 열</div>
		<div class="col">세번째 열</div>
	</div>
	<div class = "row">
		<div class="col-sm-4">첫번째 열</div>
		<div class="col-sm-8">두번째 열</div>
	</div>
	<div class = "row">
		<div class="col-sm-3">첫번째 열</div>
		<div class="col-sm-3">두번째 열</div>
		<div class="col-sm-3">세번째 열</div>
		<div class="col-sm-3">네번째 열</div>
	</div>
<!-- 
부트스트랩의 4 grid 시스템은 4가지 클래스를 가지고 있다.
1. .col : 576px 작을 때..
2. .col-sm- 화면넓이와 같거나 576px클때
3. .col-md- 화면넓이와 같거나 768px클때
4. .col-lg- 화면넓이와 같거나 992px클때
5. .col-xl- 화면넓이와 같거나 1200px클때
 -->
<!-- 
텍스트 색상 설정..
class ="text-XXX"
 --> 
<p class="text-muted">안녕하세요</p> 	
<p class="text-primary">안녕하세요text-primary</p> 	
<p class="text-success">안녕하세요text-success</p> 	
<p class="text-info">안녕하세요text-info</p> 	
<p class="text-warning">안녕하세요text-warning</p> 	
<p class="text-danger">안녕하세요text-danger</p> 	
<p class="text-secondary">안녕하세요text-secondary</p> 	
<p class="text-dark">안녕하세요text-dark</p> 	
<p class="text-body">안녕하세요text-body</p> 	
<p class="text-light">안녕하세요text-light</p> 	
<p class="text-white">안녕하세요text-white</p> 
<p class="text-muted">안녕하세요</p> 	

<p class="bg-primary text-white">안녕하세요bg-primary</p> 	
<p class="bg-success text-white">안녕하세요bg-success</p> 	
<p class="bg-info text-white">안녕하세요bg-info</p> 	
<p class="bg-warning text-white">안녕하세요bg-warning</p> 	
<p class="bg-danger text-white">안녕하세요bg-danger</p> 	
<p class="bg-secondary text-white">안녕하세요bg-secondary</p> 	
<p class="bg-dark text-white">안녕하세요bg-dark</p> 	
<p class="bg-body text-white">안녕하세요bg-body</p> 	
<p class="bg-light text-white">안녕하세요bg-light</p> 	
<p class="bg-white text-white">안녕하세요bg-white</p> 		
</body>
</html>