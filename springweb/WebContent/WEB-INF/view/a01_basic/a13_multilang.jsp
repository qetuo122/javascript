<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>     
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
		$("select[name=lang]").val("${param.lang}")
		$("select[name=lang]").change(function(){
			//alert($(this).val());
			$(location).attr("href",
					"${path}/multi.do?method=lang&lang="+$(this).val());
		});
	});
</script>
</head>
<body>
<!-- 
ko=korean
en=english
welcome=welcome!! good day!!
id=id
pass=pass
 -->
<div class="container">
	<select name="lang">
		<c:forEach var="cd" items="${chLan }">
			<option value="${cd.key}">
				<spring:message code="${cd.value}"/>
			</option>
		</c:forEach>
	</select>
	<h2><spring:message code="welcome"/></h2>
	
	
	<span><spring:message code="id"/>:</span>
	<input type="text"/><br>
	<span><spring:message code="pass"/>:</span>
	<input type="password"/><br>
</div>
</body>
</html>