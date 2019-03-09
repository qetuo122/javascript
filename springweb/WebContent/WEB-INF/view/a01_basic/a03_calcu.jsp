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
<link rel="stylesheet" href="${path}/a00_com/a00_com.css" >
<style type="text/css">

</style>
<script src="https://code.jquery.com/jquery-3.3.1.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready( function(){
		//if("${param.num01}"!=""){
			$("[name=num01]").val("${param.num01}");
			$("[name=cal]").val("${param.cal}");
			$("[name=num02]").val("${param.num02}");
		//}
	});
</script>
</head>
<body>
<form action="${path}/calcu.do" method="post">
<input type="text" name="num01"/>
<select name="cal">
	<option value="0"> + </option>
	<option value="1"> - </option>
	<option value="2"> * </option>
	<option value="3"> / </option>
</select>
<input type="text" name="num02"/><br>
<input type="submit" value="결과"/><br>
</form>
<h3>${result}</h3>
</body>
</html>