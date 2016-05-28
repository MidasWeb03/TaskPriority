<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정 추가</title>
<style>
.nav li{
	display:inline;
}
body{
	text-align:center;
}
.content table{
	margin:auto;
}
</style>
</head>
<body>

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


<div class="header">
<h2>무엇이 중헌디</h2>
</div>
<div class="nav">
<ul>
	<li><a href="calendarMenu.jsp">캘린더</a></li>
	<li><a href="friendMenu">친구</a></li>
	<li><a href="optionMenu">설정</a></li>
</ul>
  
</div>
<div class="content">
	<form action="calendarWriteAf.jsp" method="post">
	<table border="1">
		<tr>
			<th>제목</th>
			<td><input type="text" name="taskName"/></td>
		</tr>
		<tr>
			<th>일정</th>
			<td>
				<select>
					<%for(int i=tyear-5;i<tyear+5; i++){ %>
						<option <%=year.equals(i+"") ? "selected='selected'":"" %> 
							value="<%=i %>"><%=i %></option>
					<%} %>
				</select>년
				<select>
					<%for(int i=1;i<13; i++){ %>
						<option <%=month.equals(i+"") ? "selected='selected'":"" %> 
							value="<%=i %>"><%=i %></option>
					<%} %>
				</select>월
				<select>
					<%for(int i=1;i<=cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){ %>
						<option <%=day.equals(i+"") ? "selected='selected'":"" %> 
							value="<%=i %>"><%=i %></option>x
					<%} %>
				</select>일
				<select>
					<%for(int i = 0; i<24; i++){%>
						<option <%=(thour+"").equals(i+"") ? "selected='selected'":"" %> 
								value="<%=i %>"><%=i %></option>
					<%}%> 
				</select>시
				<select>
					<%for(int i = 0; i<60; i++){%>
						<option <%=(tmin+"").equals(i+"") ? "selected='selected'":"" %> 
								value="<%=i %>"><%=i %></option>
					<%}%> 
				</select>분 - 
				<select>
					<%for(int i=tyear-5;i<tyear+5; i++){ %>
						<option <%=year.equals(i+"") ? "selected='selected'":"" %> 
							value="<%=i %>"><%=i %></option>
					<%} %>
				</select>년
				<select>
					<%for(int i=1;i<13; i++){ %>
						<option <%=month.equals(i+"") ? "selected='selected'":"" %> 
							value="<%=i %>"><%=i %></option>
					<%} %>
				</select>월
				<select>
					<%for(int i=1;i<=cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){ %>
						<option <%=day.equals(i+"") ? "selected='selected'":"" %> 
							value="<%=i %>"><%=i %></option>
					<%} %>
				</select>일
				<select>
					<%for(int i = 0; i<24; i++){%>
						<option <%=(thour+"").equals(i+"") ? "selected='selected'":"" %> 
								value="<%=i %>"><%=i %></option>
					<%}%> 
				</select>시
				<select>
					<%for(int i = 0; i<60; i++){%>
						<option <%=(tmin+"").equals(i+"") ? "selected='selected'":"" %> 
								value="<%=i %>"><%=i %></option>
					<%}%> 
				</select>분
				
			</td>
		</tr>
		<tr>
			<th>메모</th>
			<td><input type="text" name="taskName"/></td>
		</tr>
		<tr>
			<th>중요도</th>
			<td><input type="text" name="taskName"/></td>
		</tr>
		<tr>
			<th>색깔</th>
			<td><input type="text" name="taskName"/></td>
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