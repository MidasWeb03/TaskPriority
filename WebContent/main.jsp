<%@page import="dto.TaskDto"%>
<%@page import="dao.CalendarDao"%>
<%@page import="md.challenge.MyCalendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="dao.CalendarDao" %>
<%@page import="dto.CalendarDto" %>
<%@page import="dto.Dto" %>
<%@page import="dto.MemberDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%!
 // calllist.jsp 이동시킬 메소드 = "href"
 public String callist(int year, int month, int day)
 {
	 String s = "";
	 
	 s+= String.format("<a href='%s?year=%d&month=%d&day=%d'>",
			 "dayList.jsp", year, month, day);
	 
	 s+= String.format("%2d", day);
	 s+= "</a>";
	 return s;
 }
 // 일정을 작성하기 위한 메소드
 public String showPen(int year, int month, int day)
 {
	 String s = "";
	 String url = "calendarWrite.jsp";
	 String image = "<img src='image/pen.gif'>";
	 
	 s = String.format("<a href='%s?year=%d&month=%d&day=%d'>%s</a>",
			 url, year, month, day, image);
	 return s;
 }
 public String two(String msg){
	 return msg.trim().length()<2 ? "0" + msg : msg.trim();
 }
 // 15지 이상이면..... 를 이용하여 표시
 public String dot3(String msg){
	 String s = "";
	 if(msg.length() >= 15){
		 s = msg.substring(0, 15);
		 s += "...";
	 } else {
		 s = msg.trim();
	 }
	 return s;
 }
 public String makeTable(int year, int month, int day, List<Dto> lcdtos){
	 String s = "";
	 String dates = (year + "-") + two(month + "") + "-" + two(day + "");
	 
	 
	 s = "<table>";
	 s += "<col width='98'>";
	 
	 for(Dto lcd:lcdtos){
		 TaskDto tdo = (TaskDto)lcd;
		 System.out.println("subString : " + tdo.getStartDate().substring(0, 10) + " / " + dates);
		 if(tdo.getStartDate().substring(0, 10).equals(dates)){
			 s += "<tr bgcolor='pink'>";
			 s += "<td>";
			 s += "<a href='calendarDetail.jsp?seq=" + tdo.getTid() + "'>";
			 s += "<font style='font-size:8; color:red'>";
			 s += dot3(tdo.getTaskName());
			 s += "</font>";
			 s += "</td>";
			 s += "</tr>";
		 }
	 }
	 s += "</table>";
	 return s;
 }
 %>    
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
.content{
	display:inline-flex;
	text-align:center;
}

.content .clist{
	border:1px solid red;
}
.content .cpriority{
	border:1px solid blue;
}
.content .clist li{
	list-style:none;
}
</style>
</head>
<body>

<%request.setCharacterEncoding("UTF-8"); %>


<%
String days[] = {"일","월","화","수","목","금","토"};

// MemberDAO dao = MemberDAO.getInstance();
MemberDto mdto = (MemberDto)session.getAttribute("login");

String syear = request.getParameter("year");
String smonth = request.getParameter("month");

Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
if(!(syear==null || syear.trim().equalsIgnoreCase(""))){
	year = Integer.parseInt(syear);
}
int month = cal.get(Calendar.MONTH) + 1;
if(!(smonth==null || smonth.trim().equalsIgnoreCase(""))){
	month = Integer.parseInt(smonth);
}

if(month<1){
	month = 12;
	year--;
}
if(month>12){
	month = 1;
	year++;
}
cal.set(year, month-1, 1);		// 첫 날로 세팅

// List<MyCalendar> cdtos = dao.getMyCalendarList(user.getId(), year+two(month+""));
CalendarDao cdao = (CalendarDao)CalendarDao.getInstance();
List<Dto> lcdto = cdao.readAllTuple(mdto);
session.setAttribute("initcal",cdao.getCurCid(lcdto));
List<Dto> ldto = cdao.subTasks(cdao.getCurCid(lcdto), year+"-"+two(month+""));

int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

String pp = String.format("<a href='%s?year=%d&month=%d'><img src='image/left.gif'></a>",
							"main.jsp", year-1, month);
String p = String.format("<a href='%s?year=%d&month=%d'><img src='image/prec.gif'></a>",
							"main.jsp", year, month-1);
String n = String.format("<a href='%s?year=%d&month=%d'><img src='image/next.gif'></a>",
							"main.jsp", year, month+1);
String nn = String.format("<a href='%s?year=%d&month=%d'><img src='image/last.gif'></a>",
							"main.jsp", year+1, month);
%>

<jsp:include page="layout_top.jsp"></jsp:include>

<div class="content">
	<div id="ccalendar">
		<table border="1">
			<col width="100"><col width="100"><col width="100"><col width="100">
			<col width="100"><col width="100"><col width="100">
			<tr height="100">
				<td colspan="7" align="center"><%=pp %><%=p %><font color="red" 
				style="font-size:20"><%=String.format("%d년&nbsp;&nbsp;%d월", year, month) %>
				</font><%=n %><%=nn %>
				</td>
			</tr>
			<tr height="100">
			  <%for(int i=0; i<7; i++){ %>
				<td><%=days[i] %></td>
				<%} %>
		  </tr>
		  <tr height="100" align="left" valign="top">
		  <%// 공백 부분
		  for(int i=1; i<dayOfWeek; i++){%>
		  		<td>&nbsp;</td>
		  <%}
		 	int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		 	for(int i=1; i<=lastDay; i++){%>
		 		<td><%=callist(year, month, i)%>&nbsp;<%=showPen(year, month, i) %>
		 		<%=makeTable(year, month, i, ldto) %>
		 		</td>
		 		<%
		 		if((i + dayOfWeek - 1)%7 == 0){%>
		 			</tr>
		 			<tr height="100" align="left" valign="top">
		 		<%}		
		 	}
		 	for(int i=0; i<(7-(dayOfWeek + lastDay - 1)%7)%7; i++){%>
		 		  		<td>&nbsp;</td>
		 	<%}%>
		 	</tr>
		</table>
	</div>
	<div class="clist">
	달력목록
	<%
	
	%>
	<ul>
	<%for(int i=0; i<lcdto.size(); i++){
		CalendarDto cdto = (CalendarDto)lcdto.get(i);
		%>
		<li><%=cdto.getCName() %></li>		
	<% }%>
	</ul>
	</div>
	<div class="cpriority">
	우선순위
	</div>
</div>

</body>
</html>