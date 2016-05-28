<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:include page="layout_top.jsp"></jsp:include>
<div class="content">
	<jsp:include page="layout_option_leftaside.jsp"></jsp:include>
	<div class="rightAside">
		<h3>목록</h3>
		<table>
			<tr>
				<td><input type="checkbox"></td>
				<td>캘린더1</td>
			</tr>
			<tr>
				<td><input type="checkbox"></td>
				<td>캘린더2</td>
			</tr>
		</table>
	</div>
</div>

</body>
</html>