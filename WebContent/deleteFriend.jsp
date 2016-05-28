<%@page import="dao.FriendDao"%>
<%@page import="dto.Dto"%>
<%@page import="dto.MemberDto"%>
<%@page import="dto.FriendDto"%>
<%@page import="dao.Dao"%>
<%@ page import="conn.conn2DB"%>
<%@ page import="dao.MemberDao"%>
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
	%>
	<%
		String MEmail = request.getParameter("MEmail");
		String FEmail = request.getParameter("FEmail");
		boolean result = FriendDao.getInstance().deleteTuple((Dto)new FriendDto(MEmail,FEmail));
		if (result){
			%>
			<script>
				alert("친구 삭제 성공") ;
				location.href = "friendMenu.jsp";
		</script>
		<%
			} else {
		%>
		<script>
				alert("친구 삭제 실패") ;
				location.href = "friendMenu.jsp";
		</script>
		<%
			}
		%>
</body>
</html>