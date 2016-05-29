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
String tid = (String)request.getParameter("tid");

CalendarDao cdao = (CalendarDao)CalendarDao.getInstance();
TaskDto tdto = new TaskDto();
tdto.setTid(Integer.parseInt(tid));
tdto = (TaskDto)cdao.readTuple(tdto);
%>
<jsp:include page="layout_top.jsp"></jsp:include>
<div class="content">
	<form action="calendarUpdate.jsp" method="post">
	<table border="1">
		<tr>
			<th>제목</th>
			<td><input type="text" name="taskName" value="<%=tdto.getTaskName() %>" style="width:100%"/></td>
		</tr>
		<tr>
			<th>일정</th>
			<td>
				<%=tdto.getStartDate() %> - <%=tdto.getEndDate() %>
			</td>
		</tr>
		<tr>
			<th>메모</th>
			<td><textarea rows="10" cols="100%" name="taskMemo"><%=tdto.getDescription() %></textarea></td>
		</tr>
		<tr>
			<th>중요도</th>
			<td>
				<select name="taskPriority" style="width:100%">
					<%for(int i=1; i<6; i++){ 
						if(i == tdto.getPriority()){%>
						<option value=<%=i %> selected="selected"><%=i %></option>
						<%} else {%>
						<option value=<%=i %>><%=i %></option>
						<%} %>
					<%} %>
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
	<input type="submit" value="수정">
	<a href="main.jsp">취소</a>
	</div>
	</form>
</div>

</body>
</html>