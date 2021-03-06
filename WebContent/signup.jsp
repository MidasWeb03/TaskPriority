<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="dto.Dto"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.Dao"%>
<%@ page import="conn.conn2DB" %>
<%@ page import="dao.MemberDao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign up Page</title>
<style>
body{
	background-image:url("image/background_tp.png");
}
.signupWindow{
	margin:auto;
}
.header{
	text-align:center;
}
</style>
</head>
<body> 

<%
request.setCharacterEncoding("UTF-8");
MemberDao dao = (MemberDao)MemberDao.getInstance();
%>
<div class="header">
		<h1>무엇이 중헌디?</h1>
</div>
<div>
		<form action="signupPage.jsp" method="post">
			<table class="signupWindow"> 
				<tr>
					<td><input id="signupEmail" type="text" name="email" value="" placeholder="Email" /></td>
				</tr>
				<tr>
					<td><input type="text" name="name" value="" placeholder="name" /></td>
				</tr>
				<tr>
					<td><input id="password" type="password" name="password" value="" placeholder="Password" /></td>
				</tr>
				<tr>
					<td><input id="password2" type="password" name="password2" value="" placeholder="Password확인" /></td>
				</tr>
				<tr>
					<td><input id="submitBtn" type="submit" value="SignUp" /></td>
				</tr>
			</table>
		</form>
</div>
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-rc1/jquery.js"></script>
	<script>
		
		$( "form" ).submit(function( event ) {
		  if ( $( "#password" ).val() == $( "#password2" ).val() ) {
		    return;
		  }else{
			alert("비밀번호 일치 하지 않습니다.");		  
			  event.preventDefault();
		  }
		});	
		
		
	</script>
</body>
</html>