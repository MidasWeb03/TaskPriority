<%@page import="dto.Dto"%>
<%@page import="dto.CalendarDto"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.Dao"%>
<%@ page import="conn.conn2DB"%>
<%@ page import="dao.CalendarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("cid");
	
		MemberDto dto = (MemberDto)session.getAttribute("login");
		CalendarDao dao = (CalendarDao)CalendarDao.getInstance();
		boolean result = dao.deleteChecked(dto.getEmail(), Integer.parseInt(title));
		if (result){
		%>
		<script>
			alert("캘린더 삭제 성공") 
			location.href = "calendarMenu.jsp";
		</script>
		<%
			} else {
		%>
		<script>
			alert("캘린더 삭제 실패");
			location.href = "calendarMenu.jsp";
		</script>
		<%
			}
		%>
</body>
</html>