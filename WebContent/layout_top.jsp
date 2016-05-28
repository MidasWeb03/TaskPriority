<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.MemberDto" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.nav{
	border:1px solid yellow;
}
.nav li{
	display:inline;
}
.nav .logininfo{
	float:right;
	margin-right:10%;
}
</style>
</head>
<body>
<%request.setCharacterEncoding("UTF-8");%>
<%
MemberDto mdto = (MemberDto)session.getAttribute("login");
System.out.println(mdto.toString());
%>
	
<div class="header">
<h2>무엇이 중헌디</h2>
</div>
<div class="nav">
<ul>
	<li><a href="main.jsp">홈</a></li>
	<li><a href="calendarMenu.jsp">캘린더</a></li>
	<li><a href="friendMenu.jsp">친구</a></li>
	<li><a href="optionMenu.jsp">설정</a></li>
	<li style="padding-left:80%"><%=mdto.getName() %> 님 접속중
<a href="logout.jsp">로그아웃</a></li>
</ul>


</div>
</body>
</html>