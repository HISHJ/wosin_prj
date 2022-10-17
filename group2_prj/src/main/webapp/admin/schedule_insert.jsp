
<%@page import="kr.co.sist.dao.AdminScheduleDAO"%>
<%@page import="kr.co.sist.vo.AdminScheduleVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    
    


<% //POST방식의 요청 한글 처리 
request.setCharacterEncoding("UTF-8"); 
//값 가져오기
String showId=request.getParameter("showId");
String schDate = request.getParameter("schDate");
String schTime1 = request.getParameter("schTime1");
String schTime2 = request.getParameter("schTime2");
String schTime = schTime1+":"+schTime2;

%>

<!-- 1. bean 생성  -->
<jsp:useBean id="schVO" class="kr.co.sist.vo.AdminScheduleVO" scope="page"/>
<!-- 2. setter method 호출 -->
<%-- <jsp:setProperty property="schId" name="aschVO"/> --%>
<jsp:setProperty property="schDate" name="schVO"/>
<jsp:setProperty property="showId" name="schVO"/>
<jsp:setProperty property="schTime" name="schVO" value="<%=schTime %>"/>

<% 
AdminScheduleDAO schDAO = AdminScheduleDAO.getInstance();
	int schCnt = schDAO.insertSchedule(schVO);


if(schCnt != -99){%>
<script>
 location.href="schedule_Board.jsp";
 alert("상영일정 추가 완료");
</script>
<%}%>
	
		
<%
System.out.println("schDate:"+ schDate);
System.out.println("showId:" + showId);
System.out.println("schTime:" + schTime);
%>


 
