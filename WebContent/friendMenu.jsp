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
		/* 이 페이지 불러올  친구 리스트*/
		request.setCharacterEncoding("UTF-8");
		FriendDao friendDao = (FriendDao)FriendDao.getInstance();
		
		
		/* 이 페이지 불러올 데이터 캘린더 리스트 & 친구 리스트*/
		MemberDto dto = (MemberDto)session.getAttribute("login");
		
		ArrayList<Dto> friendList= (ArrayList<Dto>)friendDao.readAllFriends(new FriendDto(dto.getEmail(),""));
	%>
</head>
<body>
	<jsp:include page="layout_top.jsp"></jsp:include>
	<div>
		<h2>Friend List</h2>
		<button id="refreshBtn">새로고침</button>
		<input id="sessionEmail" type="hidden" value="<%= dto.getEmail()%>" />
		<ul id="memberList">
			<%
				for (int i = 0; i < friendList.size(); i++) {
					MemberDto memberDto =  (MemberDto)(friendList.get(i));
			%>
			<li class="member"><%=memberDto.getName() + "  " + memberDto.getEmail()%>
				<button value="<%=memberDto.getEmail() %>" class="friendRemove">remove</button></li>
			<%
				}
			%>
		
	</div>

	<div>
		<h2>Search Friend</h2>
		<div>
			<input type="radio" class="checkBtn" id="checkName" checked="true"
				value="Name"><label>Name</label> <input type="radio"
				class="checkBtn" id="checkEmail" value="Email"><label>Email</label><br />
			<input type="text" id="inputData" name="inputData"
				placeholder="Input"> <input type="button" id="searchBtn"
				value="검색" />
			</form>
		</div>

		<div>
			<iframe id="searchFrame" name="testname" frameborder="0" height="450"
				leftmargin="0" marginheight="3" marginwidth="3" scrolling="no"
				src="friendSearch.jsp" topmargin="0" width="600"> </iframe>
		</div>









		<script type="text/javascript"
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-rc1/jquery.js"></script>
		<script> 
		$("#checkName").click(function(){
			$("#checkEmail").prop("checked",false);
		});
		$("#checkEmail").click(function(){
			$("#checkName").prop("checked",false);
		});

		$(".friendRemove").click(function(){
			console.log("deleteFriend.jsp?MEmail="+$("#sessionEmail").val()+"&FEmail="+$(this).val());
			location.href="deleteFriend.jsp?MEmail="+$("#sessionEmail").val()+"&FEmail="+$(this).val();
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
		
		$("#refreshBtn").click(function(){
			location.href="friendMenu.jsp";
				
		});
	</script>
</body>
</html>