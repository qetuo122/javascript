<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h1").click(function(){
			alert("ajax호출 시작");
			
			var xhr = new XMLHttpRequest();
			alert("생성여부 확인 : " + (xhr != null));
			// 2. 서버에 있는 특정자원의 호출
			//	1) .open("get/post", "서버에있는 자원", 비동기여부)
			xhr.open("get","z01_data01.txt",true);
			// 3. 서버에 전송하는 내용과 받는 내용에 따른 코드 확인
			// 정상적인 요청전달과 데이터 받았을때 처리할 이벤트 선언
			// ajax 이벤트 : readystatechange
			xhr.onreadystatechange = function(){
				// 성태값이 변할 때 처리하는 함수 지정
				// 1) readyState 확인.
				// 		0 : 객체생성, 1,2 : 데이터 전송준비, 3 : 일부전송, 4: 데이터 전송 완료
				// 2) http 반응코드 status
				// 		정상적인 반응코드 범위인 200 ~ 299일때 처리
				// 3) 위의 내용이 정상범위 안에 있을때 responseText를 통해서 ajax값을 가져온다.
				if (xhr.readyState == 4){
					if (xhr.status >= 200 && xhr.status < 300){
						alert(xhr.responseText);
						var foods = JSON.parse(xhr.responseText);
						var show = "";
						$.each(foods, function(idx, item){
							alert(idx + " : " + item);
							show += "<h2>" + (idx + 1) + " : " + item.food + " : " + item.price + "</h2>"; 
						});
						$("div").html(show);
						//$("div").text("입력받은 json : " + xhr.responseText);
					}
				}
			};
			// 4. 서버에 요청 전송
			xhr.send();
			
		});
	});
</script>
</head>
<body>
<h1> ajax호출처리</h1>
<div> </div>
</body>
</html>