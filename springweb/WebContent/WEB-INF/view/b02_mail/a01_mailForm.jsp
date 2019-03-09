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
		$("#sendBtn").click(function(){
			$("form").submit();
		});
	});
</script>
</head>
<body>
	<div class="container">
		<h2>메일 발송</h2>
		<form method="post" action="${path}/mail.do?method=send">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">수신자</span>
				</div>
				<input type="text" name="receiver" class="form-control" 
					placeholder="수신자를 입력하세요"/>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">발신자</span>
				</div>
				<input type="text" name="sender" class="form-control" 
					placeholder="발신자를 입력하세요"/>
			</div>			
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				</div>
				<input type="text" name="subject" class="form-control" 
					placeholder="제목을 입력하세요"/>
			</div>		
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">내용</span>
				</div>
				<textarea rows="5" name="content" class="form-control" ></textarea>

			</div>
			<input type="button" id="sendBtn" class="btn btn-primary" value="메일발송"/>				
		</form>
	</div>
</body>
</html>