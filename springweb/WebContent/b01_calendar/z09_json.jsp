<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
[
<c:forEach var="cal" items="${list}">
{"id":${cal.id},"title":"${cal.title}","start":"${cal.start}","end":"${cal.end}","url":"${cal.url }"},
</c:forEach>
]