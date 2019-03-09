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
	input[type=text],label,textarea{
		margin-bottom:12px;padding:.4em;width:95%;
	}      
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css">
<link href='${path}/a00_com/fullcalendar.min.css' rel='stylesheet' />
<link href='${path}/a00_com/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='${path}/a00_com/lib/moment.min.js'></script>
<script src='${path}/a00_com/lib/jquery.min.js'></script>
<script src='${path}/a00_com/fullcalendar.min.js'></script>
<script src='${path}/a00_com/locale-all.js'></script>
<script src='${path}/a00_com/locale/ko.js'></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	var g_event={};
	$(document).ready( function(){
		init(); // fullcalendar 호출.
		$("#dialog").dialog({
			autoOpen:false,
			buttons:{
				"등록":function(){ 
					var title=$("#dialog>#title").val();
					var start=$("#dialog>#start").val();
					var end=$("#dialog>#end").val();
					var content=$("#dialog>#content").val();
			          var eventData;
			          if (title) {
			        	insertSch(start, end, title, content );
						$("#dialog>#title").val("");
						$("#dialog>#content").val("");	
			            eventData = {
			              title: title,
			              start: start,
			              end: end,
			              content:content
			            };
			            $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true		
			          }
			          $('#calendar').fullCalendar('unselect');							
					$("#dialog").dialog("close");
				
					
					
				},
			},
			modal:true
		});
		$("#dialog2").dialog({
			autoOpen:false,
			buttons:{
				"수정":function(){ 
					var id = $("#dialog2>#id01").val();
					var title=$("#dialog2>#title").val();
					var start=$("#dialog2>#start").val();
					var end=$("#dialog2>#end").val();
					var content=$("#dialog2>#content").val();
					
					
					var event=g_event;
					event.id = id;
					event.title = title;
					//event.start = new Date(start);
					//event.end = new Date(end);
					
					$("#dialog2").dialog("close");
					$('#calendar').fullCalendar('updateEvent', event);
					updateSch(id, title,start,end, content);	
					
				},
				"삭제":function(){ 
					var id = $("#dialog2>#id01").val();
					var event={};
					event.id = id;		
	        		$("#calendar").fullCalendar( 'removeEvents' ,event.id);
		        	deleteSch(id);
					$("#dialog2").dialog("close");
				}
			},
			modal:true
		});		
		/*
		$("[name=start], [name=end]").datepicker({
			dataFormat:"YYYY-MM-DD",
			numberOfMonths:1
			
		});
		*/
	});
function init(){

    $('#calendar').fullCalendar({
        header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month,agendaWeek,agendaDay'
        },
        locale: 'ko',
        defaultDate: '2019-02-12',
        navLinks: true, // can click day/week names to navigate views
        selectable: true,
        selectHelper: true,
        select: function(start, end) {
          //var title = prompt('일정등록:');
    	  $("#dialog>#start").val(start.toISOString());
		  $("#dialog>#end").val( end.toISOString() );        
          $("#dialog").dialog("open");

          
        },
        droppable: true,
        
        
        eventDrop: function(event, delta, revertFunc) {
        	$('#calendar').fullCalendar('updateEvent', event);	
          //alert("Dropped on " + event.start.format()+":"+event.id);
          updateSch(event.id, event.title, event.start.format(), event.end.format(), event.content);
        },       
        eventDragStop: function( event, jsEvent, ui, view ) {
        	
        	
        	$('#calendar').fullCalendar('updateEvent', event);
            //alert("Dropped on " + event.start.format()+":"+event.id);
            updateSch(event.id, event.title, event.start.format(), event.end.format(), event.content);
        },           
        eventResize: function(event, delta, revertFunc) {
        	$('#calendar').fullCalendar('updateEvent', event);
            //alert(event.title + " end is now " + event.end.format());
            updateSch(event.id, event.title, event.start.format(), event.end.format(), event.content);
            
			/*
            if (!confirm("is this okay?")) {
              revertFunc();
            }
			*/

        },        
        editable: true,
        eventLimit: true, 
        eventClick: function(event, element) {
        	g_event = event;
        	//alert(event.start);
        	$("#dialog2").dialog("open");
			$("#dialog2>#id01").val(event.id);
        	$("#dialog2>#title").val(event.title);
			$("#dialog2>#start").val(event.start.toISOString());
			$("#dialog2>#end").val(event.end.toISOString());
			$("#dialog2>#content").val(event.content);
        },  
		events: function(start, end, timezone, callback) {
	        jQuery.ajax({
	            url: '${path}/calendar.do?method=data',
	            type: 'POST',
	            dataType: 'json',
	            success: function(doc) {
	            	//alert(doc.list.length);
	                var events = [];
	                if(!!doc.list){
	                    $.map( doc.list, function( r ) {
	                        events.push({
	                            id: r.id,
	                            title: r.title,
	                            start: r.start,
	                            end: r.end,
	                            content:r.content
	                        });
	                    });
	                }
	                callback(events);
	            }
	        });
	    }
      });	
}	
	
function insertSch(start, end, title, content){
	var sndData="start="+start+"&end="+end+"&title="+title+"&content="+content;
	
	$.ajax({
		type:"post",
		url:"${path}/calendar.do?method=insert",
		data:sndData,
		dataType:"json",
		success:function(data){
			alert("등록 완료!");
			$('#calendar').fullCalendar({
				events: data.list
			});
		}
	});
	
}	
function updateSch(id, title, start, end, content){

	var sndData="id="+id+"&start="+start+"&end="+end+"&title="+title+"&content="+content;

	$.ajax({
		type:"post",
		url:"calendar.do?method=update",
		data:sndData,
		dataType:"json",
		success:function(data){
			alert("수정 완료!");
			$('#calendar').fullCalendar({
				events: data.list
			});
		}
	});	
}
function deleteSch(id){
	//alert("삭제할 데이터-"+id);
	var sndData = "id="+id;
	$.ajax({
		type:"post",
		url:"calendar.do?method=delete",
		data:sndData,
		dataType:"json",
		success:function(data){
			alert("삭제 완료!");
			$('#calendar').fullCalendar({
				events: data.list
			});
		}
	});		
}

	  </script>
  </head>
  <body>
	    <div id='calendar'></div>
	    <form>
		<div id="dialog" title="일정등록 ">
			<h2>일정등록</h2>
			<label>일정 이름</label>
			<input id="title" name="title" type="text" />
			<label>내용</label>
			<textarea  id="content"  name="content" rows="5" cols="20"></textarea><br>
			
			<label>시작날짜</label>
			<input id="start" name="start"  type="text" readonly/>
			<label>마지막날짜</label>
			<input id="end" name="end"  type="text" readonly/>	
		</div>
		</form>	 
		<div id="dialog2" title="일정상세 ">
			<input id="id01" type="hidden" />
			<h2>일정상세</h2>
			<label>일정 이름</label>
			<input id="title"  name="title"  type="text" />
			<label>내용</label>
			<textarea id="content" rows="5" cols="10"></textarea>
			<label>시작날짜</label>
			<input id="start"  name="start"  type="text" readonly/>
			<label>마지막날짜</label>
			<input id="end"  name="end"   type="text" readonly/>	
		</div>  
  </body>
</html>
