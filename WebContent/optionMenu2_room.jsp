<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.MemberDto" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.content{
	display:inline-flex;
	width:100%;
}
.rightAside{
	text-align:center;
	width:80%;
}
.rightAside li{
	list-style:none;
}
.rightAside table{
	margin:auto;
	text-align:left;
}
</style>
</head>
<body>
<%
	MemberDto mdto = (MemberDto)session.getAttribute("login");
%>
<jsp:include page="layout_top.jsp"></jsp:include>
<div class="content">
	<jsp:include page="layout_option_leftaside.jsp"></jsp:include>
	<div class="rightAside">
		<h3>개인 정보 변경</h3>
		<form action="optionMenu2_roomAf.jsp" method="post">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=mdto.getName() %>"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" disabled="disabled" value="<%=mdto.getEmail()%>"/></td>
			</tr>
			<tr>
				<td>비밀번호 변경</td>
				<td><input type="text" name="password"/></td>
			</tr>
			<tr>
				<td>비밀번호 변경 확인</td>
				<td><input type="text" name="passwordcheck"/></td>
			</tr>
		</table>
		<input type="submit" value="수정하기">
		</form>
	</div>
</div>
</body>
</html>