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
		$("[name=num01], [name=num02]").keyup(function(){
			var num01Val = $("[name=num01]").val();
			var num02Val = $("[name=num02]").val();
			
			var send = "num01=" + num01Val + "&num02=" + num02Val;
			$("h1").html(send);
			
			var xhr = new XMLHttpRequest();
			xhr.open("get","z03_data3.jsp?" + send,true);
			xhr.onreadystatechange=function(){
				if(xhr.readyState == 4){
					if(xhr.status >= 200 && xhr.status < 300){
						var show = "<h2>" + xhr.responseText + "</h2>";
						$("div").html(show);
					}
				}
			};
			xhr.send();
		});
	});
</script>
</head>
<body>
<h1> 연산처리 </h1>
<input type ="text" name = "num01" value = "0"> + 
<input type ="text" name = "num02" value = "0"><br>
<div>결과출력</div>
</body>
</html>