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
	<h2>초기 form 화면..</h2>
	<!-- action을 생략하면, 이 jsp를 호출한 controller
	를 default로 호출한다. -->
	<form method="post">
		메서드:<input type="text" name="method" /><br>
		<input type="submit" value="post로 호출"/>
	</form>
	<a href="${path}/callMethod.do?method=call03">
					메서드 3방식(?method=call03)</a>
	<h2>계산기</h2>				
	<form method="post" ><!--  callMethod.do?method=calcu -->
		<input type="hidden" name="method"  value="calcu"/>
		첫번째:<input type="text" name="num01"/>	
		두번째:<input type="text" name="num02"/>	
		<input type="submit" value="계산기"/>
	</form>		
	<!--submit를 클릭하는 순간
	  callMethod.do?method=calcu&num01=25&num02=30  -->
	<h2>${plus}</h2>		
</body>
</html>