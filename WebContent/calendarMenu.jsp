<%@page import="dto.FriendDto"%>
<%@page import="dto.Dto"%>
<%@page import="dto.CalendarDto"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.Dao"%>
<%@ page import="conn.conn2DB"%>
<%@ page import="dao.CalendarDao"%>
<%@ page import="dao.FriendDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Calendar Page</title>

	<% 
		request.setCharacterEncoding("UTF-8");
		MemberDto dto = (MemberDto)session.getAttribute("login");
		CalendarDao dao = (CalendarDao)CalendarDao.getInstance();
		FriendDao friendDao = (FriendDao)FriendDao.getInstance();
		
		
		/* 이 페이지 불러올 데이터 캘린더 리스트 & 친구 리스트*/
		ArrayList<Dto> calendarList = (ArrayList<Dto>)dao.readAllTuple(dto);
		
		ArrayList<Dto> friendList= (ArrayList<Dto>)friendDao.readAllFriends(new FriendDto(dto.getEmail(),""));
	%>
</head>
<body>
<jsp:include page="layout_top.jsp"></jsp:include>
	<div>
		<h2>Calendar List</h2>
		<ul>
			<%
				for (int i = 0; i < calendarList.size(); i++) {
					CalendarDto calendarDto = (CalendarDto)(calendarList.get(i));
			%>
			<li><%=calendarDto.getCName()%>
				<button value="<%=calendarDto.getCid() %>" class="removeBtn">remove</button></li>
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
				<option value="-------">-------</option>
				<%
					for(int i = 0 ; i < friendList.size(); i++){
						MemberDto memberDto =  (MemberDto)(friendList.get(i));
						%>				
						<option value="<%=memberDto.getEmail()%>"> <%=memberDto.getName()%> <%=memberDto.getEmail()%></option>
				<%	}
				%>
			</select>
			<br/>
			<input type="submit" value="생성" />
		</form>
	</div>
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-rc1/jquery.js"></script>
	<script>
<%-- 		$("#addFriendList").val("<%=dto.getEmail()%>"); --%>
		$("#friendList").change(function( data){
			console.log($("#friendList option:selected").val());
			
			
			if($("#friendList option:selected").index() != 0){
				$("#friendUL").append("<li>"+ $("#friendList option:selected").text()+"</li>");
				$("#addFriendList").val($("#addFriendList").val()+","+$("#friendList option:selected").val());
				console.log($("#friendList option:selected").remove());
			}
		});
		
		$(".removeBtn").click(function(){
			if($(this).val() == 0){
				alert("기본 캘린더는 삭제할 수 없습니다.");
			}else{
				location.href="deleteCalendar.jsp?cid="+$(this).val();
			}
		});
	</script>
</body>
</html>