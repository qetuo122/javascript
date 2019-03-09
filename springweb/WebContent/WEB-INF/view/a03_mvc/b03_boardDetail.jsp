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
 	.width30{width:100px;}
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
		$("#upt").on("click",function(){
			if(confirm("수정합니다!!")){
				$("form").attr("action","${path}/board.do?method=update")
				$("form").submit();
			}
		});
		$("#del").on("click",function(){
			if(confirm("삭제합니다!!")){
				$("form").attr("action","${path}/board.do?method=delete")
				$("form").submit();
			}
		});		
		$("#rep").on("click",function(){
			if(confirm("답글을 달겠습니까?")){
				$("[name=refno]").val($("[name=no]").val());
				$("[name=title]").val("RE:"+$("[name=title]").val());
				$("[name=etc]").val("");
				$("[name=writer]").val("");
				$("[name=content]").val("\n\n\n====이전글=====\n"+$("[name=content]").val());
				$("form").attr("action","${path}/board.do?method=insForm")
				$("form").submit();
			}			
		});
		$(".fnames").on("click",function(){
			if(confirm("파일을 다운로드 하시겠습니까?")){
				$(location).attr("href",
						"${path}/down.do?fname="+$(this).val());
			}

		});
	});
</script>
</head>
<body>

<br>
<div class="container">
	<h1>게시판상세화면</h1>
	<form method="post">
		<div class="input-group mb-3">
			<div class="input-group-prepend ">
				<span class="input-group-text width30">글번호</span>
			</div>
			<input type="text" class="form-control" 
				name="no" value="${board.no}" readOnly>
			<div class="input-group-prepend ">
				<span class="input-group-text width30">상위글번호</span>
			</div>
			<input type="text" class="form-control " 
				name="refno" value="${board.refno}" >				
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend ">
				<span class="input-group-text width30">제목</span>
			</div>
			<input type="text" class="form-control" 
				name="title" value="${board.title}" >
			<div class="input-group-prepend ">
				<span class="input-group-text width30">작성자</span>
			</div>
			<input type="text" class="form-control" 
				name="writer" value="${board.writer}" >				
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text width30">등록일</span>
			</div>
				<input type="text" class="form-control" 
					 value="<fmt:formatDate value="${board.credte}" type="both"/>" >			
	
		</div>	
		<div class="input-group mb-3">
		
			
			<div class="input-group-prepend">
				<span class="input-group-text width30">수정일</span>
			</div>
				<input type="text" class="form-control" 
					 value="<fmt:formatDate value="${board.uptdte}" type="both"/>" >		
		</div>			
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text width30">조회수</span>
			</div>
			<input type="text" class="form-control" 
				name="readcnt" value="${board.readcnt}" >
			<div class="input-group-prepend">
				<span class="input-group-text width30">기타</span>
			</div>
			<input type="text" class="form-control" 
				name="etc" value="${board.etc}" >				
		</div>		
				
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text width30">내용</span>
			</div>
			<textarea name="content" class="form-control"  
				rows="5" cols="100">${board.content}</textarea>
				<div class="input-group-prepend">
			</div>
		</div>
		<div class="input-group mb-3">
				<div class="input-group-prepend">
				<span class="input-group-text width30">파일</span>
			</div>	
			<div class="input-group-append">
			<c:forEach var="fname" items="${board.fnames}">
				<input type="button" value="${fname}" class="btn btn-info fnames" >&nbsp;
			</c:forEach>	
			</div>
		</div>			
		
		<div class="input-group mb-3">
				<div class="input-group-prepend">
				<span class="input-group-text width30">기능처리</span>
			</div>	
			<div class="input-group-append">
				<input type="button" value="답글" class="btn btn-warning" id="rep">
				<input type="button" value="수정" class="btn btn-primary" id="upt">
				<input type="button" value="삭제" class="btn btn-danger" id="del">
				<input type="button" value="메인화면" class="btn btn-success" id="main">
			</div>
		</div>		
	</form>

	
</div>

	
</body>
</html>