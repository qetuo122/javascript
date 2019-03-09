<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="springweb.z01_vo.*, java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<c:set var = "path" value="${pageContext.request.contextPath}"/>  
<fmt:requestEncoding value="utf-8"/>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    body {
      margin: 40px 10px;
      padding: 0;
      font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
      font-size: 14px;
    }
    #calendar {
      max-width: 900px;
      margin: 0 auto;
    }
</style>
<link href='${path}/a00_com/fullcalendar.min.css' rel='stylesheet' />
<link href='${path}/a00_com/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='${path}/a00_com/lib/moment.min.js'></script>
<script src='${path}/a00_com/lib/jquery.min.js'></script>
<script src='${path}/a00_com/fullcalendar.min.js'></script>

<script type="text/javascript">
	$(document).ready( function(){
		
		var xhr = new XMLHttpRequest();
		xhr.open("get","${path}/calendar.do?sch=y",true);
		xhr.send();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4){
				if(xhr.status>=200 && xhr.status<300){
					var jlist = eval("("+xhr.responseText+")");
					//alert(jlist.length);
					init(jlist);
				}
			}
		};
	});
function init(jlist){
    $('#calendar').fullCalendar({
        header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month,agendaWeek,agendaDay'
        },
        defaultDate: '2018-12-12',
        navLinks: true, // can click day/week names to navigate views
        selectable: true,
        selectHelper: true,
        select: function(start, end) {
          var title = prompt('일정등록:');
          alert("title:"+title);
          alert("시작날짜.:"+start.toISOString());
          alert("마지막..날짜.:"+end.toISOString());
          var eventData;
          if (title) {
            eventData = {
              title: title,
              start: start,
              end: end
            };
            
            $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
            // ajax..(등록과 조회..)		
            		
            		
          }
          $('#calendar').fullCalendar('unselect');
        },
        editable: true,
        eventLimit: true, // allow "more" link when too many events
        events: jlist
      });	
	
}	
	
	
	
	  </script>
  </head>
  <body>
	    <div id='calendar'></div>
  </body>
</html>
