<%@page import="dao.CalendarDao"%>
<%@page import="dto.TaskDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
<%
String tid = request.getParameter("tid");
TaskDto tdto = new TaskDto(Integer.parseInt(tid), 0, 0, null, null, null, null, null, null);
CalendarDao cdao = (CalendarDao)CalendarDao.getInstance();
boolean result = cdao.deleteTuple(tdto);
if(result){%>
<script>
alert("일정이 삭제되었습니다.");
location.href="main.jsp";
</script>
<%} else{%>
<script>
alert("일정 삭제를 실패하였습니다.");
location.href="main.jsp";
</script>
<%}%>

</body>
</html>