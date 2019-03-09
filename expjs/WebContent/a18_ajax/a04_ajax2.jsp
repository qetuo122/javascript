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
   			$("h1").click(function(){
   				var xhr = new XMLHttpRequest();
   				
   				xhr.open("get","z02_data2.txt",true);

   				xhr.onreadystatechange=function(){
   					if( xhr.readyState == 4){
						if( xhr.status >=200 && xhr.status<300 ){
							// JSON.parse("json문자열") : js Object 변환..
							var student = JSON.parse(xhr.responseText);
							//alert( foods.length );
							var show="";
							show+="<h2> 이름 : " + student.name+", 나이 : "+student.age + ", 주소 : " + student.address + "</h2>";
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
<h1> ajax 시작 </h1>
<div></div>
</body>
</html>