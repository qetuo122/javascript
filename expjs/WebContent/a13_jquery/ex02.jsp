<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript">
	function numbering(){
		alert("번호입력");
		// 1. td객체 호출
		// 2. .each(function(idex,item){})
		var td = $("td");
		$.each(td,function(index,item){
			$(item).html(index + 1);
		});
	}
	
	function playGame(){
		// 1. td호출
		// 2. 임의의 idx값 가져오기 0 ~ 8
		// 3. $("td").eq("임의의 idx").html("두더지 출현")
		var score = 0;
		
		setInterval(function () {
			$("td").html("");

			var td = $("td");
			var idx = Math.ceil((Math.random()*8) + 1);
			$("td").eq(idx).text("두더지");
		}, 1000);
		
		$("#score").text(score);
		$("td").click(function(){
			if($(this).text() == "두더지"){
				$("#score").text(score++);
			}
		});
		
	}
	$(document).ready(function(){
		
	});
	
	
</script>
</head>
<body>
	<h1 onclick="numbering()">번호입력</h1>
	<h1 onclick="playGame()">게임시작</h1>
	<h1>현재점수 : </h1><h1 id = "score"></h1>
	<table width = "300" height = "300" border>
		<tr><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>
</body>
</html>