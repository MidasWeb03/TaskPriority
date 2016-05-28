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

<%request.setCharacterEncoding("UTF-8"); %>
<%
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");

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
	<form action="calendarWriteAf.jsp" method="post">
	<table border="1">
		<tr>
			<th>제목</th>
			<td><input type="text" name="taskName" style="width:100%"/></td>
		</tr>
		<tr>
			<th>일정</th>
			<td>
				<select name="byear">
					<%for(int i=tyear-5;i<tyear+5; i++){ %>
						<option <%=year.equals(i+"") ? "selected='selected'":"" %> 
							value="<%=i %>"><%=i %></option>
					<%} %>
				</select>년
				<select name="bmonth">
					<%for(int i=1;i<13; i++){ %>
						<option <%=month.equals(i+"") ? "selected='selected'":"" %> 
							value="<%=i %>"><%=i %></option>
					<%} %>
				</select>월
				<select name="bday">
					<%for(int i=1;i<=cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){ %>
						<option <%=day.equals(i+"") ? "selected='selected'":"" %> 
							value="<%=i %>"><%=i %></option>x
					<%} %>
				</select>일
				<select name="bhour">
					<%for(int i = 0; i<24; i++){%>
						<option <%=(thour+"").equals(i+"") ? "selected='selected'":"" %> 
								value="<%=i %>"><%=i %></option>
					<%}%> 
				</select>시
				<select name="bmin">
					<%for(int i = 0; i<60; i++){%>
						<option <%=(tmin+"").equals(i+"") ? "selected='selected'":"" %> 
								value="<%=i %>"><%=i %></option>
					<%}%> 
				</select>분 - 
				<select name="ayear">
					<%for(int i=tyear-5;i<tyear+5; i++){ %>
						<option <%=year.equals(i+"") ? "selected='selected'":"" %> 
							value="<%=i %>"><%=i %></option>
					<%} %>
				</select>년
				<select name="amonth">
					<%for(int i=1;i<13; i++){ %>
						<option <%=month.equals(i+"") ? "selected='selected'":"" %> 
							value="<%=i %>"><%=i %></option>
					<%} %>
				</select>월
				<select name="aday">
					<%for(int i=1;i<=cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){ %>
						<option <%=day.equals(i+"") ? "selected='selected'":"" %> 
							value="<%=i %>"><%=i %></option>
					<%} %>
				</select>일
				<select name="ahour">
					<%for(int i = 0; i<24; i++){%>
						<option <%=(thour+"").equals(i+"") ? "selected='selected'":"" %> 
								value="<%=i %>"><%=i %></option>
					<%}%> 
				</select>시
				<select name="amin">
					<%for(int i = 0; i<60; i++){%>
						<option <%=(tmin+"").equals(i+"") ? "selected='selected'":"" %> 
								value="<%=i %>"><%=i %></option>
					<%}%> 
				</select>분
				
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