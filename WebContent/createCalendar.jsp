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
<title>CreateCalendar</title>
</head>
<body>
<% 
		request.setCharacterEncoding("UTF-8");
	%>
	<%
		String title = request.getParameter("title");
		String friendList = request.getParameter("friendList");
	
		String emailList[] = friendList.split(",");
		System.out.println(title);
		System.out.println(friendList);
		MemberDao dao = (MemberDao)MemberDao.getInstance();
		
// 		MemberDto dto = new MemberDto(name,email,password);
// 		boolean result = dao.signUp(dto);
		%>
</body>
</html>