
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Calendar Page</title>

<% 
		/* 이 페이지 불러올 데이터 캘린더 리스트 & 친구 리스트*/
		ArrayList<String> calendarList = new ArrayList<String>();

				calendarList.add("aaa");
				calendarList.add("bbb");
				calendarList.add("ccc");
				calendarList.add("aaa");
				calendarList.add("bbb");
				calendarList.add("ccc");
				calendarList.add("aaa");
				calendarList.add("bbb");
				calendarList.add("ccc");
				
		ArrayList<MemberDto> friendList= new ArrayList<MemberDto>();
				
				friendList.add(new MemberDto("test" ,"asd@naver.com",""));
				friendList.add(new MemberDto("test1" ,"asd1@naver.com",""));
				friendList.add(new MemberDto("test2" ,"asd2@naver.com",""));
				friendList.add(new MemberDto("test3" ,"asd3@naver.com",""));
				friendList.add(new MemberDto("test4" ,"asd4@naver.com",""));
				friendList.add(new MemberDto("test5" ,"asd5@naver.com",""));
				friendList.add(new MemberDto("test6" ,"asd6@naver.com",""));
	%>
</head>
<body>
	<div>
		<h2>Friend List</h2>
		<ul>
			<%
				for (int i = 0; i < friendList.size(); i++) {
			%>
			<li><%=friendList.get(i).getName() + "  " + friendList.get(i).getEmail()%>
				<button class="friend">remove</button></li>
			<%
				}
			%>
		
	</div>

	<div>
		<h2>Search Friend</h2>
		<div >
			<input type="radio" class="checkBtn" id="checkName" checked="true"
				value="Name"><label>Name</label> <input type="radio"
				class="checkBtn" id="checkEmail" value="Email"><label>Email</label><br />
			<input type="text" id="inputData" name="inputData" placeholder="Input"> <input
				type="button" id="searchBtn" value="검색" />
		</div>
	</div>
	<div>
		<iframe id="searchFrame" frameborder="0" height="450" leftmargin="0" marginheight="3"
			marginwidth="3" scrolling="no" src="friendSearch.jsp"
			topmargin="0" width="600"> </iframe>
	</div>









	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-rc1/jquery.js"></script>
	<script> 
		<% 
		MemberDto dto = (MemberDto)session.getAttribute("login");
		%> 
		
		$("#checkName").click(function(){
			$("#checkEmail").prop("checked",false);
		});
		$("#checkEmail").click(function(){
			$("#checkName").prop("checked",false);
		});
		
		$("#searchBtn").click(function(){
			if($("#checkName").is(":checked")){
				console.log("friendSearch.jsp?name='"+$("#inputData").val()+"'");
				$("#searchFrame").attr("src","friendSearch.jsp?name="+$("#inputData").val());
			}else{
				console.log("friendSearch.jsp?email='"+$("#inputData").val()+"'");
				$("#searchFrame").attr("src","friendSearch.jsp?email="+$("#inputData").val());
			}
		});
	</script>
</body>
</html>