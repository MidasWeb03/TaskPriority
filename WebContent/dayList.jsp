<%@page import="dto.TaskDto"%>
<%@page import="dto.Dto"%>
<%@page import="dao.CalendarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="md.challenge.MyCalendar"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%!
public String toDates(String mdate){
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분");
	String s = mdate.substring(0,4) + "-" + mdate.substring(4,6) + "-"
			+ mdate.substring(6, 8) + " " + mdate.substring(8, 10) + ":"
			+ mdate.substring(10, 12) + ":00"; 
	Timestamp d = Timestamp.valueOf(s);
	
	return sdf.format(d);
}
public String two(String msg){
	return msg.trim().length()<2 ? "0"+msg : msg.trim();
}
%> 
<style>
.nav li{
	display:inline;
}
</style>
</head>
<body>

<%
// year, month, day
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");

String dates = year + "-" + two(month) + "-" +  two(day);

CalendarDao cdao = (CalendarDao)CalendarDao.getInstance();
//List<MyCalendar> cdtos = cdao.getDayList(user.getId(), dates);
List<Dto> ldto = cdao.subTasksForADay((int)session.getAttribute("initcal"), dates);
for(int i=0; i<ldto.size(); i++){
	System.out.println(ldto.get(i).toString());
}
%>

<jsp:include page="layout_top.jsp"></jsp:include>

<div class="content">
<h2><%=year %>년 <%=month %>월 <%=day %>일</h2>
<table border="1">
	<col width="100"/><col width="225"/>
	<col width="450"/><col width="50"/>
	
	<tr bgcolor="#09bbaa">
		<td>번호</td>
		<td>시간</td>
		<td>제목</td>
		<td>수정</td>
		<td>삭제</td>
	</tr>
	
	<%
	for(int i=0; i<ldto.size(); i++){
		TaskDto tdto = (TaskDto)ldto.get(i);
		System.out.println(tdto.getStartDate());%>
		
		<tr>
			<td><%=i+1 %></td>
			<td><%= tdto.getStartDate() %></td>
			<td><a href='calendarDetail.jsp?seq=<%=tdto.getTid()%>'><%=tdto.getTaskName() %></a></td>
			<td>
				<form action="calendarUpdate.jsp" method="post">
					<input type="hidden" name="tid" value="<%=tdto.getTid()%>"/>
					<input type="submit" value="일정수정"/>
				</form>
			</td>
			<td>
				<form action="calendarDel.jsp" method="post">
					<input type="hidden" name="tid" value="<%=tdto.getTid()%>"/>
					<input type="submit" value="일정삭제"/>
				</form>
			</td>
		</tr>
	<%}
	%>
</table>
</div>
</body>
</html>