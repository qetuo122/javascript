<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>     
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
<h1>화면 호출되었습니다(view!!)</h1>
<h2>변수만 호출: ${call01}</h2>
<h2>객체 호출: ${obj01}</h2><!--  new Person("신길동",25,"서울 당산") -->
<h2>객체 호출(이름): ${obj01.name}</h2><!--  obj01.getName() -->
<h2>객체 호출(나이): ${obj01.age}</h2><!--  obj01.getAge() -->
<h2>객체 호출(사는곳): ${obj01.loc}</h2><!--  obj01.getLoc()-->
<h3>배열 처리?${list}</h3>
<h3>배열 처리[0]?${list[0]}</h3>
<h3>배열 처리[1]?${list[1]}</h3>
<h3>배열 처리.get(0)- ArrayList가 아니기에 에러발생?</h3>
<h3>배열 처리.get(1)- ArrayList가 아니기에 에러발생?</h3>
<!-- jstl을 통해 배열이나 collection 객체 처리.. 

String []fruits = {"사과","바나나","딸기"};
c:forEach  var="fruit"  items="배열선언내용"
for(String fruit:fruits){

}
-->
<h3>배열의 크기:${fn:length(list)}  </h3>
<c:forEach var="fruit" items="${list}">
	<h4>배열의 내용:${fruit}</h4>
</c:forEach>
<!-- 
객체 배열 for 처리
for(Person p:plist){
	p.getName()
	p.getAge()
	p.getLoc()
}
 -->
<c:forEach var="product" items="${prods}"> 
	<h4>${product.key} - ${product.value}</h4>
</c:forEach>





</body>
</html>