<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign up Page</title>
</head>
<body>
<div>
		<form action="signupPage.jsp" method="post">
			<input type="text" name="email" value="" placeholder="Email" /><br />
			<input type="text" name="name" value="" placeholder="name" /><br />
			<input id="password" type="password" name="password" value="" placeholder="Password" /><br />
			<input id="password2" type="password" name="password2" value="" placeholder="Password확인" /><br />
			<input id="submitBtn" type="submit" value="SignUp" />
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