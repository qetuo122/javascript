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
	caption{caption-side: top;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready( function(){
		
		$("#pageSize").change(function(){
			$("#curPage").val(1);
			$("form").submit();
		});
		$("#reg").on("click",function(){
			$(location).attr("href","${path}/board.do?method=insForm");
			
		});		
		$("#seh").on("click",function(){
			$("#curPage").val(1);
			$("form").submit();
		});
		// 상세화면 조회 처리..
		$(".data").on("dblclick",function(){
			var no = $(this).attr("id");
			$(location).attr("href","${path}/board.do?method=detail&no="+no);
			//alert( no );
			
		});
		
	});
	function goPage(page){
		//alert(page);
		$("#curPage").val(page);
		$("form").submit();
	}
	
</script>
</head>
<body>
<br>
<div class="container">
	<h1>게시판 리스트</h1>
	<!--  controller에 modelattribute의 객체와 value이 form의 하위 객체와 연결된다.
	 	 form:form commandName="모델이름"
	 	 
	 	 요청값( request )는 client에서 서버에 데이터를 넘길 때, 활용된다.
	 	 	request.getParamter("name이름") - 서버..
	 	 Model 데이터를 server에서 client에 넘겨 주는 데이터를 말한다.
	 	 	model.addAttribute("key", 객체 나 값 )
	 	 	화면에 서  ${key} 	
	 	 	
	 	 
	 -->
	<form:form commandName="sch" method="post">
		<form:hidden path="curPage"/>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">검색항목</span>
			</div>
			
			<form:input path="title"  class="form-control" 
				placeholder="제목입력하세요" />
			<form:input path="writer" class="form-control" 
				placeholder="작성자입력하세요"  />				
			<div class="input-group-append">
				<input type="button" value="검색" class="btn btn-success" id="seh">
				<input type="button" value="등록" class="btn btn-primary" id="reg">
			</div>
		</div>	
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">총 ${sch.count} 건</span>
			</div>
			<input class="form-control" value=""/>
			<div class="input-group-append">
				<span class="input-group-text">페이지크기:</span>
				<form:select path="pageSize" class="form-control" >
					<form:option value="3">3</form:option>
					<form:option value="5">5</form:option>
					<form:option value="10">10</form:option>
					<form:option value="20">20</form:option>
					<form:option value="30">30</form:option>	
				</form:select>			
			</div>
		</div>	
				
	<table class="table table-hover table-striped">
	  <col width="10%">
  	  <col width="45%">
  	  <col width="15%">
  	  <col width="15%">
  	  <col width="15%">
		<thead class="thead-light">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회</th>
				<th>등록일</th></tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${blist}">
			<tr class="data" id="${board.no}">
				<td>${board.num }</td>
				<td>
				<!-- 답글 레벨만큼 들어 쓰기 표시 -->
				<c:forEach varStatus="sts" begin="1" end="${board.level}">
					&nbsp;&nbsp;
					<c:if test="${board.level>1 and sts.last}">☞</c:if>
				</c:forEach>
				${board.title }</td>
				<td>${board.writer }</td>
				<td>${board.readcnt }</td>
				<td><fmt:formatDate value="${board.credte}"/></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>		
	</form:form>
	<!--  
//			1 2 3 4 5 ->    1, 5     blocknum 1
//		 <- 6 7 8 9 10 ->   6, 10    blocknum 2
//		 <- 11 12 13        11, 13   blocknum 3 -->
	<ul class="pagination justify-content-center"
		 style="margin:20px 0">
		
		<!-- Previous가 나오는 조건은 시작블럭번호가 블럭의 크기보다 클때.
		     Previous를 클릭했을 시, 이전 블럭들이 나오게 처리..
		     	현재 시작 블럭번호보다 1더 적은 것을 나오게 처리.
		-->
		<c:if test="${sch.startBlock>sch.blockSize }">	
		<li class="page-item"><a class="page-link" 
			href="javascript:goPage(${sch.startBlock-1})">Previous</a></li>
		</c:if>
		<!-- 시작 block 번호 부터  마지막  block번호가 출력되게 처리하면 된다. -->
		<c:forEach var="cnt" begin="${sch.startBlock}" end="${sch.endBlock}">	 
			<li class="page-item ${sch.curPage==cnt?'active':''}">
				<a class="page-link"  
					href="javascript:goPage(${cnt})">${cnt}</a></li>
		</c:forEach>	
		<!-- 마지막 이동 link 조건은 
			마지막 블럭번호가 총페이지 수보다 적을 때, 보여주기 처리한다.
			Next를 클릭했을 때, 현재 마지막 block의 번호보다 하나더 많은 page번호가
			 나오게 하면된다..
		 --> 
		<c:if test="${sch.endBlock<sch.pageCount }">
			<li class="page-item"><a class="page-link" 
				href="javascript:goPage(${sch.endBlock+1})">Next</a></li>	 
		</c:if>	
		
	</ul>	

</div>

	
</body>
</html>