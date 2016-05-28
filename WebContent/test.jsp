<%@page import="dto.Dto"%>
<%@page import="java.util.List"%>
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
	<%
		MemberDao dao = (MemberDao)MemberDao.getInstance();	
		List<Dto> dtoList = dao.readAllTuple();
		for(int i=0; i<dtoList.size();i++){
			MemberDto dto = (MemberDto)dtoList.get(i);
			out.println(dto.getEmail()+" "+dto.getName());
		}
	%>
</body>
</html>