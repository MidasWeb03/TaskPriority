<%@page import="dao.CalendarDao"%>
<%@page import="dto.TaskDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%!
public String two(String msg){
	 return msg.trim().length()<2 ? "0" + msg : msg.trim();
}
%>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
<%
String taskName = request.getParameter("taskName");
String byear = request.getParameter("byear");
String bmonth = request.getParameter("bmonth");
String bday = request.getParameter("bday");
String bhour = request.getParameter("bhour");
String bmin = request.getParameter("bmin");
String ayear = request.getParameter("ayear");
String amonth = request.getParameter("amonth");
String aday = request.getParameter("aday");
String ahour = request.getParameter("ahour");
String amin = request.getParameter("amin");
String taskPriority = request.getParameter("taskPriority");
String taskColor = request.getParameter("taskColor");
String taskMemo = request.getParameter("taskMemo");
String tid = request.getParameter("tid");

String startDate = byear + "-" + two(bmonth) + "-" + two(bday) + " " + two(bhour) + ":" + two(bmin);
String endDate = ayear + "-" + two(amonth) + "-" + two(aday) + " " + two(ahour) + ":" + two(amin);

int cid = (int)session.getAttribute("initcal");

TaskDto tdto = new TaskDto(Integer.parseInt(tid), cid, Integer.parseInt(taskPriority), taskName, startDate, endDate, null, taskColor, taskMemo);
System.out.println(tdto.toString());
CalendarDao cdao = (CalendarDao)CalendarDao.getInstance();
boolean result = cdao.updateTuple(tdto);

if(result){%>
<script>
alert("일정이 수정되었습니다.");
location.href="main.jsp";
</script>
<%} else{%>
<script>
alert("일정 수정을 실패하였습니다.");
location.href="main.jsp";
</script>
<%}%>

</body>
</html>