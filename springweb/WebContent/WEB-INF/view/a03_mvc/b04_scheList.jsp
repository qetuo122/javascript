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
		$("#btnAdd").on("click",function(){
			$("form").submit();
		});
		$(".data").on("dblclick",function(){
			var refno=$(this).children().eq(0).html();
			$("#refno").val(refno);
			$("form").submit();

		});
	});
</script>
</head>
<body>
<div class="container">
<h2>일정 계획</h2>
	<form method="post" action="${path}/schedule.do?method=insert">
	
		<input type="hidden" name="refno" id="refno" value="0"/>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text width30">일정내용</span>
			</div>
			<input type="text" id="content" name="content" class="form-control" placeholder="등록할 일정 내용 입력"/>
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text width30">기간</span>
			</div>
			<input type="date" id="fromDate" name="fromDate" class="form-control" placeholder="YYYYMMDD"/> ~
			<input type="date" id="toDate" name="toDate" class="form-control" placeholder="YYYYMMDD"/>
		</div>		
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text width30">담당자</span>
			</div>
			<input type="text" id="manager" name="manager" class="form-control" placeholder="등록할 일정 내용 입력"/>
			<input type="button" value="추가" class="btn btn-success" id="btnAdd" />
		</div>		
	</form>	
	<table class="table table-hover table-striped">
		<thead class="thead-light">
			<tr>
				<th>번호</th>
				<th>상위번호</th>
				<th>일정내용</th>
				<th>기간</th>
				<th>담당자</th>
				
				</tr>
		</thead>
		<tbody>
			<c:forEach var="sch" items="${list}">
			<tr class="data">
				<td>${sch.no }</td>
				<td>${sch.refno }</td>
				<td>
				<c:forEach varStatus="sts" begin="1" end="${sch.level}">
					&nbsp;&nbsp;
					<!-- 1 레벨 초과이고, 마지막  부분에서는 화살표 표시를 처리한다. -->
					<c:if test="${sch.level>1 and sts.last}">☞</c:if>
				</c:forEach>
				<span>${sch.content }</span></td>
				<td>
					${sch.fromDate} ~ ${sch.toDate }
				</td>
				<td>${sch.manager}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>	
</div>
</body>
</html>