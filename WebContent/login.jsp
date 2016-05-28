<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
<style>
body{
	background-image:url("image/background_tp.png");
}
.loginWindow{
	margin:auto;
}
.header{
	text-align:center;
}
</style>
</head>
<body>
	<div class="header">
		<h1>무엇이 중헌디?</h1>
	</div>
	<form action="loginPage.jsp" method="post">
		<table class="loginWindow">
		<tr>
			<td><input type="text" name="email" value="" placeholder="Email" /></td>
		</tr>
		<tr>
			<td><input type="password" name="password" value="" placeholder="Password" /></td>
		</tr>
		<tr>
			<td><input type="submit" value="LOGIN" /><a href="signup.jsp">SIGN UP</a></td>
		</tr>
		</table>
	</form>
</body>
</html>