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
		// 같은부모를 기준으로 2개단위로 반복하여 글자색을 처리하세요
		// tr의 3번째 글자색상을 blue로 처리
		// td의 마지막을 배경색상은 blue 글자색은 yello로
		//$("td:nth-child(2n+1)").css("color","red");
		//$("td:nth-child(2n)").css("color","pink");
		$("tr:eq(2)").css('color','blue');
		$('td:last').css('background','blue').css('color','yellow');
	});
</script>
</head>
<body>
    <table>
        <tr><th>이름</th><th>혈액형</th><th>지역</th></tr>
        <tr><td>강민수</td><td>AB형</td><td>서울특별시 송파구</td></tr>
        <tr><td>구지연</td><td>B형</td><td>미국 캘리포니아</td></tr>
        <tr><td>김미화</td><td>AB형</td><td>미국 메사추세츠</td></tr>
        <tr><td>김선화</td><td>O형</td><td>서울 강서구</td></tr>
        <tr><td>남기주</td><td>A형</td><td>서울 노량진구</td></tr>
        <tr><td>윤하린</td><td>B형</td><td>서울 용산구</td></tr>
    </table>
</body>
</html>