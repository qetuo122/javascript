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
<br>
<div class="container">
	<h1>문제 은행 조회 화면</h1>
	<form>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">검색항목</span>
			</div>
		    <select class="form-control" id="type" name="extype">
			    <option>문제유형(전체)</option>
			    <option>주관식</option>
			    <option>객관식</option>
			</select>
			<input type="text" class="form-control" placeholder="문제">
			<div class="input-group-append">
				<button class="btn btn-success" type="submit">검색</button>
			</div>
		</div>	
	
	</form>
	<br>	
	<table class="table table-hover">
		<thead class="thead-light">
			<tr>
				<th>번호</th>
				<th>문제유형</th>
				<th>문제명</th>
				<th>정답</th>
				<th>등록일</th>
		</thead>
		<tbody>
			<c:forEach var="exam" items="${exlist}">
			<tr>
				<td>${exam.no }</td>
				<td>${exam.extype }</td>
				<td>${exam.content }</td>
				<td>${exam.coranswer }</td>
				<td><fmt:formatDate value="${coranswer.credte}"/></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>		
	
</div>
</body>
</html>