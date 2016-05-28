<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-rc1/jquery.min.js"></script>
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
</style>

</head>
<body>
<%request.setCharacterEncoding("UTF-8");%>

<jsp:include page="layout_top.jsp"></jsp:include>
<div class="content">
	<jsp:include page="layout_option_leftaside.jsp"></jsp:include>
	<div class="rightAside">
		<h3>우선순위 설정</h3>
		<form action="optionMenu1Af.jsp" method="post">
		<ul>
			<li>1순위 
				<select name="first" >
					<option></option>
					<option value="pr_period">기한</option>
					<option value="pr_priority">우선순위</option>
					<option value="pr_old">계획한지 오래된것</option>
				</select>
			</li>
			<li>2순위 
				<select name="second">
					<option></option>
					<option>기한</option>
					<option>우선순위</option>
					<option>계획한지 오래된것</option>
				</select>
			</li>
			<li>3순위 
				<select name="third">
					<option></option>
					<option>기한</option>
					<option>우선순위</option>
					<option>계획한지 오래된것</option>
				</select>
			</li>
		</ul>
		<input type="radio" name="group" value="personal">개인
		<input type="radio" name="group" value="team">팀
		</form>
	</div>
</div>
</body>
</html>