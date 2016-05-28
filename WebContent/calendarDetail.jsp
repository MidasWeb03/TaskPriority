<%@page import="dto.TaskDto"%>
<%@page import="dao.CalendarDao"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body{
	text-align:center;
}
.content table{
	margin:auto;
}
</style>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
<%
String tid = (String)request.getAttribute("tid");

System.out.println("tid = " + tid);
CalendarDao cdao = (CalendarDao)CalendarDao.getInstance();
TaskDto tdto = new TaskDto();
tdto.setTid(Integer.parseInt(tid));
tdto = (TaskDto)cdao.readTuple(tdto);

System.out.println(tdto.toString());

Calendar cal = Calendar.getInstance();

int tyear = cal.get(Calendar.YEAR);
int tmonth = cal.get(Calendar.MONTH);
int tday = cal.get(Calendar.DATE);
int thour = cal.get(Calendar.HOUR_OF_DAY);		// 24시간
int tmin = cal.get(Calendar.MINUTE);		

%>
<jsp:include page="layout_top.jsp"></jsp:include>
<div class="content">
	<form action="calendarWriteAf.jsp" method="post">
	<table border="1">
		<tr>
			<th>제목</th>
			<td><input type="text" name="taskName" style="width:100%"/></td>
		</tr>
		<tr>
			<th>일정</th>
			<td>
				
				
			</td>
		</tr>
		<tr>
			<th>메모</th>
			<td><textarea rows="10" cols="100%" name="taskMemo"></textarea></td>
		</tr>
		<tr>
			<th>중요도</th>
			<td>
				<select name="taskPriority" style="width:100%">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>색깔</th>
			<td>
			<select name="taskColor" style="width:100%">
				<option value="#ff0000">빨강</option>
				<option value="#0000ff">파란</option>
				<option value="#00ff00">녹색</option>
				<option value="#eaeaea">회색</option>
				<option value="#000000">블랙</option>
			</select>
			</td>
		</tr>
	</table>
	<div class="transmit">
	<input type="submit" value="저장">
	<a href="main.jsp">취소</a>
	</div>
	</form>
</div>

</body>
</html>