<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
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
MemberDto mdto = (MemberDto)session.getAttribute("login");
String name = request.getParameter("name");
String email = mdto.getEmail();
String password = request.getParameter("password");

MemberDao mdao = (MemberDao)MemberDao.getInstance();

boolean result = mdao.updateTuple(new MemberDto(name, email, password));

if(result){
	MemberDto mdto2 = new MemberDto(name, email, password);
	session.setAttribute("login", mdto2);
%>
	<script>
	alert("개인정보가 수정되었습니다.");
	location.href = "optionMenu2.jsp";
	</script>
<%} else {%>
	<script>
	alert("수정 실패하였습니다");
	location.href = "optionMenu2_room.jsp";
	</script>
<%}%>
</body>
</html>