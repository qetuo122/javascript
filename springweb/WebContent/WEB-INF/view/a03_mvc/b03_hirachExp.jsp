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
		$("#btnAdd").on("click",function(){
			$(location).attr("href",
					"${path}/hira.do?method=insert&show="+$("#addTxt").val());
		});
		$(".data").on("dblclick",function(){
			var refno=$(this).children().eq(0).html();
			//var add = $(this).children().find("span").html();
			var add = $("#addTxt").val()==""?$(this).children().find("span").html():$("#addTxt").val();
			$(location).attr("href",
					"${path}/hira.do?method=insert&show="+add+"&refno="+refno);

		});
	});
</script>
</head>
<body>
<div class="container">
<h2>계층형 sql 연습</h2>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">추가항목</span>
			</div>
			<input type="text" id="addTxt" class="form-control" placeholder="등록할 내용 입력"/>
			<input type="button" value="추가" class="btn btn-success" id="btnAdd" />
		</div>
	<table class="table table-hover table-striped">
		<thead class="thead-light">
			<tr>
				<th>번호</th>
				<th>상위번호</th>
				<th>항목</th></tr>
		</thead>
		<tbody>
			<c:forEach var="hi" items="${list}">
			<tr class="data">
				<td>${hi.no }</td>
				<td>${hi.refno }</td>
				<td>
				<!--  1 2 3...
				level은 초기값을 1로하고 계층이들어 갈수록 2와 3등으로 표시된다.
				 begin 시작으로 하여 end level으로 해서 레벨 수 많큼 공백을 추가하도록
				 한다.
				 -->
				<c:forEach varStatus="sts" begin="1" end="${hi.level}">
					&nbsp;&nbsp;
					<!-- 1 레벨 초과이고, 마지막  부분에서는 화살표 표시를 처리한다. -->
					<c:if test="${hi.level>1 and sts.last}">☞</c:if>
				</c:forEach>
				<span>${hi.show }</span></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>	
</div>
</body>
</html>