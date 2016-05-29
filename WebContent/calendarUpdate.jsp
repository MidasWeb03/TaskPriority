<%@page import="dto.TaskDto"%>
<%@page import="dao.CalendarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정 추가</title>
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
<%!
String color[] = {"#ff0000","#0000ff","#00ff00","#eaeaea","#000000"};
String colorName[] = {"빨강","파랑","녹색","회색","검정"};
%>
<%request.setCharacterEncoding("UTF-8"); %>
<%
String tid = request.getParameter("tid");

CalendarDao cdao = (CalendarDao)CalendarDao.getInstance();
TaskDto tdto = new TaskDto();
tdto.setTid(Integer.parseInt(tid));
tdto = (TaskDto)cdao.readTuple(tdto);

String startDate = tdto.getStartDate();
int byear = Integer.parseInt(startDate.substring(0,4));
int bmonth = Integer.parseInt(startDate.substring(5,7));
int bday = Integer.parseInt(startDate.substring(8,10));
int bhour = Integer.parseInt(startDate.substring(11,13));
int bmin = Integer.parseInt(startDate.substring(14,16));
String endDate = tdto.getEndDate();
int ayear = Integer.parseInt(endDate.substring(0,4));
int amonth = Integer.parseInt(endDate.substring(5,7));
int aday = Integer.parseInt(endDate.substring(8,10));
int ahour = Integer.parseInt(endDate.substring(11,13));
int amin = Integer.parseInt(endDate.substring(14,16));

// Member user = (Member)session.getAttribute("login");
Calendar cal = Calendar.getInstance();

int tyear = cal.get(Calendar.YEAR);
int tmonth = cal.get(Calendar.MONTH);
int tday = cal.get(Calendar.DATE);
int thour = cal.get(Calendar.HOUR_OF_DAY);		// 24시간
int tmin = cal.get(Calendar.MINUTE);		

%>


<jsp:include page="layout_top.jsp"></jsp:include>
<div class="content">
	<form action="calendarUpdateAf.jsp" method="post">
	<table border="1">
		<tr>
			<th>제목</th>
			<td><input type="text" name="taskName" value="<%=tdto.getTaskName() %>" style="width:100%"/></td>
		</tr>
		<tr>
			<th>일정</th>
			<td>
				<select name="byear">
					<%for(int i=byear-5;i<byear+5; i++){ %>
						<option <%=byear==i ? "selected='selected'":"" %> 
							value="<%=i %>"><%=i %></option>
					<%} %>
				</select>년
				<select name="bmonth">
					<%for(int i=1;i<13; i++){ %>
						<option <%=bmonth == i ? "selected='selected'":"" %> 
							value="<%=i %>"><%=i %></option>
					<%} %>
				</select>월
				<select name="bday">
					<%for(int i=1;i<=cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){ %>
						<option <%=bday == i ? "selected='selected'":"" %> 
							value="<%=i %>"><%=i %></option>
					<%} %>
				</select>일
				<select name="bhour">
					<%for(int i = 0; i<24; i++){%>
						<option <%=bhour == i ? "selected='selected'":"" %> 
								value="<%=i %>"><%=i %></option>
					<%}%> 
				</select>시
				<select name="bmin">
					<%for(int i = 0; i<60; i++){%>
						<option <%=tmin == i ? "selected='selected'":"" %> 
								value="<%=i %>"><%=i %></option>
					<%}%> 
				</select>분 - 
				<select name="ayear">
					<%for(int i=ayear-5;i<ayear+5; i++){ %>
						<option <%=ayear==i ? "selected='selected'":"" %> 
							value="<%=i %>"><%=i %></option>
					<%} %>
				</select>년
				<select name="amonth">
					<%for(int i=1;i<13; i++){ %>
						<option <%=amonth == i ? "selected='selected'":"" %> 
							value="<%=i %>"><%=i %></option>
					<%} %>
				</select>월
				<select name="aday">
					<%for(int i=1;i<=cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){ %>
						<option <%=aday == i ? "selected='selected'":"" %> 
							value="<%=i %>"><%=i %></option>
					<%} %>
				</select>일
				<select name="ahour">
					<%for(int i = 0; i<24; i++){%>
						<option <%=ahour == i ? "selected='selected'":"" %> 
								value="<%=i %>"><%=i %></option>
					<%}%> 
				</select>시
				<select name="amin">
					<%for(int i = 0; i<60; i++){%>
						<option <%=amin == i ? "selected='selected'":"" %> 
								value="<%=i %>"><%=i %></option>
					<%}%> 
				</select>분
				
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
				<%for(int i=0; i<color.length; i++){
					if(color[i].equals(tdto.getColor())){%>
						<option value="<%=color[i]%>" selected="selected"><%=colorName[i] %></option>
					<%} else {%>
						<option value="<%=color[i]%>"><%=colorName[i] %></option>
					<%} %>
				<%} %>
			</select>
			</td>
		</tr>
	</table>
	<div class="transmit">
	<input type="hidden" name="tid" value="<%=tdto.getTid() %>">
	<input type="submit" value="수정">
	<a href="main.jsp">취소</a>
	</div>
	</form>
</div>

</body>
</html>