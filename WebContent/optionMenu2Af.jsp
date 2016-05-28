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
		MemberDto sdto = (MemberDto)session.getAttribute("login");
		String email = sdto.getEmail();
		String password = request.getParameter("password");

		MemberDao dao = (MemberDao)MemberDao.getInstance();
		
		MemberDto dto = new MemberDto("",email,password);
		dto = (MemberDto)dao.Login(dto);
		
		if (dto !=null){
	%>
	<script>
		alert("수정페이지로 이동합니다!") 
		location.href = "optionMenu2_room.jsp";
	</script>
	<%
		} else {
	%>
	<script>
		alert("아이디 및 패스워드를 확인해주세요!");
		location.href = "optionMenu2.jsp";
	</script>
	<%
		}
	%>

</body>
</html>