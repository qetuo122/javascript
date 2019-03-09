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
		$("#sch").click(function(){
			$("form").attr("action","${path}/emplist.do");
			$("form").submit();
		});
		// emplistExcel.do emplistPdf.do
		$("#exl").click(function(){
			$("form").attr("action","${path}/emplistExcel.do");
			$("form").submit();
		});
		$("#pdf").click(function(){
			$("form").attr("action","${path}/emplistPdf.do");
			$("form").submit();
		});		
	});
</script>
</head>
<body>
<div class="container">
	<h2>사원 정보</h2>
	<form class="form-inline" method="post">
		<label for="ename">사원명:</label>
		<input type="text" class="form-control" id="ename" 
			name="ename" value = "${param.ename}"/>
		<label for="job">직책:</label>
		<input type="text" class="form-control" id="job" 
			name="job" value = "${param.job}"
		/>
		<input type="button" id="sch" class="btn btn-primary" value="검색"/>
		<input type="button" id="exl" class="btn btn-info" value="엑셀다운로드"/>
		<input type="button" id="pdf" class="btn btn-warning" value="pdf다운로드"/>
		
	</form>
	
	<table class="table table-hover">
		<thead class="thead-light">
			<tr><th>사원번호</th>
				<th>사원명</th>
				<th>직책</th>
				<th>관리자번호</th>
				<th>입사일</th>
				<th>급여</th>
				<th>보너스</th>
				<th>부서번호</th></tr>
		</thead>
		<tbody>
		<c:forEach var = "emp" items="${list}">
			<tr>
			<td>${emp.empno}</td>
			<td>${emp.ename}</td>
			<td>${emp.job}</td>
			<td>${emp.mgr}</td>
			<td><fmt:formatDate value="${emp.hiredate}"/> </td>
			<td><fmt:formatNumber value="${emp.sal}"/>  </td>
			<td><fmt:formatNumber value="${emp.comm}"/> </td>
			<td>${emp.deptno} </td>
			</tr>
		</c:forEach>			
		</tbody>
	
	</table>
</div>	
</body>
</html>