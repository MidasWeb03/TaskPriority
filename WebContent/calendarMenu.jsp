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
				
		ArrayList<String> friendList= new ArrayList<String>();
				friendList.add("aaa");
				friendList.add("bbb");
				friendList.add("ccc");
				friendList.add("aaa");
				friendList.add("bbb");
				friendList.add("ccc");
				friendList.add("aaa");
				friendList.add("bbb");
				friendList.add("ccc");
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
		<input type="text"  placeholder = "제목" ><br/>
		<div id="friendDiv">
			<ul id="addFriendList">공유할 친구</ul>
			
		</div>
		<select id="friendList" name="friendList">
			<%
				for(int i = 0 ; i < friendList.size(); i++){
					%>				
					<option value="<%= friendList.get(i) %>" > <%= friendList.get(i) %></option>
			<%	}
			%>
		</select>
	</div>
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-rc1/jquery.js"></script>
	<script>
		$("#friendList").change(function( data){
			console.log(data);
			
			$("#friendList").append("<li>"+ data+"</li>")
		});
	</script>
</body>
</html>