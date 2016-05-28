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
		<h2>Calendar List</h2>
		<ul>
			<%
				for (int i = 0; i < calendarList.size(); i++) {
			%>
			<li><%=calendarList.get(i)%>
				<button id="calendar">remove</button></li>
			<%
				}
			%>
	</div>
	
	<div>
		<h2>Create Calendar</h2>
		<form action="createCalendar.jsp" method="post">
			<input type="text" name="title" placeholder = "제목" ><br/>
			<div id="friendDiv">
				<ul id="friendUL">공유할 친구</ul>
				<input id="addFriendList" type="hidden" name="friendList"   />
			</div>
			<select id="friendList" >
				<%
					for(int i = 0 ; i < friendList.size(); i++){
						%>				
						<option value="<%= friendList.get(i).getEmail() %>" > <%= friendList.get(i).getName()+"  " + friendList.get(i).getEmail() %></option>
				<%	}
				%>
			</select>
			<br/>
			<input type="submit" value="생성" />
		</form>
	</div>
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-rc1/jquery.js"></script>
	<script>
		<%
			MemberDto dto = (MemberDto)session.getAttribute("login");
		%>
		$("#addFriendList").val("<%=dto.getEmail()%>");
		$("#friendList").change(function( data){
			console.log($("#friendList option:selected").val());
			
			
			if($("#friendList option:selected").index() != 0){
				$("#friendUL").append("<li>"+ $("#friendList option:selected").text()+"</li>");
				$("#addFriendList").val($("#addFriendList").val()+","+$("#friendList option:selected").val());
				console.log($("#friendList option:selected").remove());
			}
		});
	</script>
</body>
</html>