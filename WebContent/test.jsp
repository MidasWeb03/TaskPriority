<%@page import="dto.FriendDto"%>
<%@page import="dao.FriendDao"%>
<%@page import="dto.CalendarDto"%>
<%@page import="dao.Dao"%>
<%@page import="dao.CalendarDao"%>
<%@page import="dto.Dto"%>
<%@page import="java.util.List"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
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
		MemberDao dao = (MemberDao)MemberDao.getInstance();	
		CalendarDao caldao = (CalendarDao)CalendarDao.getInstance();
		MemberDto dto = new MemberDto("jinsub","elliottful@naver.com","1");
		
		
		
		FriendDao fdao = (FriendDao)FriendDao.getInstance();
		FriendDto fdto = new FriendDto("elliottful@naver.com","abc@abc.com");
		
		fdao.addTuple(fdto);
		
		
		/* List<Dto> flist = fdao.readAllFriends(fdto);		
		for(int i=0;i<flist.size();i++){
			FriendDto d = (FriendDto)flist.get(i);
			out.println(d.getFEmail());
		} */ 
		/* List<Dto> dtoList = caldao.readAllTuple(dto);
		out.println(dtoList.size());
		for(int i=0;i<dtoList.size();i++){
			CalendarDto caldto = (CalendarDto)dtoList.get(i);
			out.println(caldto.getCName()+" "+caldto.getIsActive());
		} */
	%>
</body>
</html>