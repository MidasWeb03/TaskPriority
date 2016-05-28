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
<%request.setCharacterEncoding("UTF-8");%>
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
		<col width="200"><col width="450">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=mdto.getName() %>"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" value="<%=mdto.getEmail()%>" disabled="disabled"/></td>
			</tr>
			<tr>
				<td>비밀번호 변경</td>
				<td><input type="password" name="password" id="pw"/></td>
			</tr>
			<tr>
				<td>비밀번호 변경 확인</td>
				<td><input type="password" name="passwordcheck" id="pwcheck"/><span id="warning"></span></td>
			</tr>
		</table>
		<input type="submit" id="_submit" value="수정하기">
		</form>
	</div>
</div>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-rc1/jquery.min.js"></script>
<script>
$(document).ready(function () {
    $("#pwcheck").keyup(function(){
        if($('#pw').val() != $('#pwcheck').val()){
        	$('#warning').text('  비밀번호가 다릅니다');
        	$('#warning').css('color','red');
        	$('#_submit').attr('disabled', 'disabled');
        } else {
        	$('#warning').text('  비밀번호가 같습니다');
        	$('#warning').css('color','green');
        	$('#_submit').removeAttr('disabled');
        }
    });
    
 });

</script>
</body>
</html>