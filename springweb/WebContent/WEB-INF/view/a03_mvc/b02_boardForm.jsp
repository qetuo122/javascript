<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>          
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
		
		$("#main").on("click",function(){
			//alert("메인화면으로");
			$(location).attr("href","${path}/board.do?method=list");
		});		
		$("#reg").on("click",function(){
			if(confirm("등록합니다!!")){
				$("form").submit();
			}
		});
		 $("#customFile").on('change', function() {
			  var input = $(this);
			  var label = input.val().replace(/\\/g, '/').replace(/.*\//, '');  
			  $("#" + input.data("display-target")).val(label);
			 });		
		
	});
</script>
</head>
<body>
<br>
<div class="container">
	<h1>게시판등록화면</h1>
	<form:form 
			commandName="board"
			action="${path}/board.do?method=insert" 
			enctype="multipart/form-data"
			method="post">
		<form:hidden path="refno" />	
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">제목</span>
			</div>
			<form:input path="title" class="form-control" placeholder="제목입력"/>
			<div class="input-group-prepend">
				<span class="input-group-text">작성자</span>
			</div>
			<form:input path="writer" class="form-control" placeholder="작성자입력"/>
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">내용</span>
			</div>
			<form:textarea path="content" class="form-control"  
				rows="5" cols="100" 
				placeholder="내용을 입력하세요!"/>
			<div class="input-group-prepend">
				<span class="input-group-text">파일등록</span>
				<div class="custom-file">
					<input type="file" name="report"/><br>	
					<input type="file" name="report"/><br>	
					<input type="file" name="report"/>	
				</div>
				
			</div>	
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">기타</span>
			</div>
			<form:input path="etc" class="form-control" placeholder="그외 참고사항 입력"/>
			<div class="input-group-append">
				<input type="button" value="등록" class="btn btn-primary" id="reg">
				<input type="button" value="메인화면" class="btn btn-success" id="main">
			</div>
		</div>		
	</form:form>

	
</div>

	
</body>
</html>