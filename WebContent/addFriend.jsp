<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="dto.Dto"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.Dao"%>
<%@ page import="conn.conn2DB"%>
<%@ page import="dao.MemberDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  
		request.setCharacterEncoding("UTF-8"); 
		MemberDto sessionDto = (MemberDto)session.getAttribute("login");
		
		String MEmail = request.getParameter("MEmail");
		String FEmail= request.getParameter("FEmail");
		MemberDao dao = (MemberDao)MemberDao.getInstance();
		MemberDto dto;
		%>
</body>
</html>