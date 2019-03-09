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
		$("#form01 #ename, #form01 #job").on("keyup",function(){
			//$("#show01").html($(this).val());
			// 데이터 요청 처리 : key=value&key2=value
			//              key : 요청값   value : 실제 요청을 통해서 넘기는 데이터.
			//  $("#form01").serialize() : form 하위에 있는 모든 데이터를
			//     요청값 처리형식으로 변환해서 server 넘겨준다.
			//$("h2:eq(0)").html($("#form01").serialize());
			var send = $("#form01").serialize();
			// url:"${path}/ajax.do?method=level01" 를 통해서
			//    서버에 요청을 처리한다..
			//$("#show01").html(send);
			$.ajax({
				type:"post",
				url:"${path}/ajax.do?method=level01",
				data:send,
				dataType:"text",
				success:function(data){
					$("#show01").html(data);
				}	
			});
		});
		$("#form02 #ename,#form02 #job").on("keyup",function(){
			
			
			var send = $("#form02").serialize();
			//$("#show02").html(send);
			
			$.ajax({
				type:"post",
				url:"${path}/ajax.do?method=level02",
				data:send,
				dataType:"json",
				success:function(data){
					var list = data.emplist;
					var show="<table class='table table-hover'>";
					show+="<thead class='thead-light'><tr><th>번호</th><th>이름</th><th>직책</th><th>급여</th><th>부서번호</th></tr></thead>";
					$.each(list,function(idx, emp){
						show+="<tr>";
						show+="<td>"+emp.empno+"</td>";
						show+="<td>"+emp.ename+"</td>";
						show+="<td>"+emp.job+"</td>";
						show+="<td>"+emp.sal+"</td>";
						show+="<td>"+emp.deptno+"</td>";
						show+="</tr>";
						
					});
					$("#show02").html(show);
					
				}	
			});
			
		});
		$("h4").click(function(){
			alert("호출");
			// Person
			//var snd = {name:"홍길동",age:25,loc:"서울"};
			/*
			var snd=new Array();
			var obj = new Object();
			obj.name="홍길동";
			obj.age=25;
			obj.loc="서울";
			snd.push(obj);
			obj = new Object();
			obj.name="신길동";
			obj.age=35;
			obj.loc="대구";
			snd.push(obj);
			*/
			var send = "[{\"name\":\"홍길동\",\"age\":25},{\"name\":\"홍길동\",\"age\":25}]";
			//alert("name=[{\"name\":\"홍길동\",\"age\":25},{\"name\":\"홍길동\",\"age\":25}]");
			//jQuery.ajaxSettings.traditional = true;
			// json 배열로 요청값 처리..
			var snd = [{name:"",age:25,loc:"서울",fav:["사과","바나나","딸기"]},{name:"홍길동",age:30,loc:"부산",fav:["사과","바나나","딸기"]}];
			// JSON.stringify(snd)} : 문자열로 변환처리..
			//    [{name:\"홍길동\"}]
			
			$.ajax({
				type:"post",
				//traditional:true,
				url:"${path}/ajax.do?method=level03",
				data:{"list":JSON.stringify(snd)},
				dataType:"json",
				success:function(data){

					
				}	
			});		
			
		});
		
		
		
	});
</script>
</head>
<body>
	<div class="container">
		<h4>ajax(list형태 요청값 처리)</h4>
		<h2>ajax 시작!(resposebody 호출)</h2>
		<form id="form01" >
			<div class = "input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">조회항목</span>
				</div>
				<input type="text" class="form-control" id="ename" name="ename" 
					placeholder="사원명입력하세요"/>	
				<input type="text" class="form-control" id="job"  name="job" 
					placeholder="직책입력하세요"/>								
			</div>
			<div id="show01" class="container">
			</div>
		</form>
		<h2>ajax 시작!(pageJsonReport 호출)</h2>
		<form id="form02" >
			<div class = "input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">조회항목</span>
				</div>
				<input type="text" class="form-control" id="ename" name="ename" 
					placeholder="사원명입력하세요"/>	
				<input type="text" class="form-control" id="job"  name="job" 
					placeholder="직책입력하세요"/>								
			</div>
			<div id="show02" class="container">
			</div>
		</form>	
	</div>
</body>
</html>