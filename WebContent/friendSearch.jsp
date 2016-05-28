<%@page import="java.util.ArrayList"%>
<%@page import="dto.Dto"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.Dao"%>
<%@ page import="conn.conn2DB"%>
<%@ page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	<%  
		request.setCharacterEncoding("UTF-8"); 
		MemberDto sessionDto = (MemberDto)session.getAttribute("login");
		
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		System.out.println(email);
		System.out.println(name);
		MemberDao dao = (MemberDao)MemberDao.getInstance();
		ArrayList<MemberDto> findList = new ArrayList<MemberDto>();
		MemberDto dto;
		if(email != null){
			dto= new MemberDto("",email,"");
			findList = (ArrayList<MemberDto>)dao.findUser(dto);
		}else if(name !=null){
			dto= new MemberDto(name,"","");
			findList = (ArrayList<MemberDto>)dao.findUser(dto);
		}
		System.out.println("size:"+findList.size());
	
		%>
		<%
		for(int i = 0 ; i < findList.size();i++){
			%>
			<div id="friendData<%=i%>"> 
				<label> <%= findList.get(i).getName()%> </label>
				<label class="friendEmail"> <%= findList.get(i).getEmail()%> </label>
				<button value="<%= findList.get(i).getEmail()%>" class="addFriendBtn"  >친구 추가</button>
			</div>
		<% 			
		}
		%>
		<input type="hidden"  id ="sessionEmail" value="<%= sessionDto.getEmail()%>" />
		<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-rc1/jquery.js"></script>
		
		<script>
			$(".addFriendBtn").click(function(){
				console.log($(this).val());
				console.log("addFriend.jsp?MEmail="+  $("#sessionEmail").val()+"&FEmail="+$(this).val());
				location.href="addFriend.jsp?MEmail="+  $("#sessionEmail").val()+"&FEmail="+$(this).val();
				t();
				
			});
		</script>
		
		
</body>
</html>