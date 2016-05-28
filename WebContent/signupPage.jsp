<%@page import="dto.Dto"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.Dao"%>
<%@ page import="conn.conn2DB"%>
<%@ page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
<% 
		request.setCharacterEncoding("UTF-8");
	%>
	<%
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		
		MemberDao dao = (MemberDao)MemberDao.getInstance();
		
		MemberDto dto = new MemberDto(name,email,password);
		boolean result = dao.signUp(dto);
		
		
		if(result){
			%>
			alert("SignUp ok");
			location.href = "login.jsp";
			<%
		}else{
			%>
			alert("회원 가입 실패");
			location.href = "signup.jsp";
			<%
		}
		%>
		</script>
</body>
</html>