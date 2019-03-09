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
<h2>부서정보</h2>
	<form class="form-inline" action="${path}/deptList.do" method="post">
		<label for="dname">부서명:</label>
		<input type="text" class="form-control" id="dname" 
			name="dname" value = "${param.dname}"/>
		<label for="loc">부서위치:</label>
		<input type="text" class="form-control" id="loc" 
			name="loc" value = "${param.loc}"
		/>
		<button type="submit" class="btn btn-primary">검색</button>
	</form>
	
	<table class="table table-hover">
		<thead class="thead-light">
			<tr><th>부서번호</th>
				<th>부서명</th>
				<th>부서위치</th></tr>
		</thead>
		<tbody>
		<c:forEach var = "dept" items="${dlist}">
			<tr>
			<td>${dept.deptno}</td>
			<td>${dept.dname}</td>
			<td>${dept.loc}</td>
			</tr>
		</c:forEach>			
		</tbody>
	
	</table>
</div>
</body>
</html>