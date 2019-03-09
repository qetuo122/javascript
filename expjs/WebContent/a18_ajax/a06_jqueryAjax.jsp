<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#v1, #v2").keyup(function(){
			// $("form").serialize() : form 하위에 있는 모든 요소객체를 제이슨형태로 변환처리
			
			//$("div").html($("form").serialize());
			//$.ajax({속성 : 속성값, 속성2 : 속성값2});
			// 속성들
			// 1. type : 전송방식 get/post
			// 2. data : 서버에 요청할 데이터 설정
			//	1)query string : key=val&key2=val2
			//	2)json향식 : {key:val, key2:val2}
			//	3)$("form객체").serialize()
			// 3. dataType : 서버에서 전송되어 오는 데이터 형식
			//	1) html, text, json, xml 형식으로 서버에서 전송되어 오는 데이터 형식을 지정
			// 4. success : function(data){} 서버에서 받은 데이터를 data에 저장, 받은 후처리할 내용을 함수에 지정
			// 5. error : function(err){} 에러가 발생했을 때 에러코드내용
			// 6. url : 요청할 서버의 주소
			$.ajax({
				type : "get",
				url : "z03_data4.jsp",
				data : $("form").serialize(),
				dataType : "text",
				success : function(data){
					$("div").html(data);
				},
				error : function(err){
					console.log(err);
				}
			});
		})	
	});
</script>
</head>
<body>
<form>
값1 : <input type = "text" name = "v1" id = "v1"><br>
값1 : <input type = "text" name = "v2" id = "v2"><br>
<div>결과값 처리</div>
</form>
</body>
</html>