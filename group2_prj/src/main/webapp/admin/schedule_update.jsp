<%@page import="javax.tools.DocumentationTool.Location"%>
<%@page import="kr.co.sist.dao.AdminScheduleDAO"%>
<%@page import="kr.co.sist.vo.AdminScheduleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="상영정보 변경"%>
    
<%
request.setCharacterEncoding("utf-8");
String schId = request.getParameter("schId");
String schDate = request.getParameter("schDate");

String schTime1 = request.getParameter("schTime1");
String schTime2 = request.getParameter("schTime2");
String schTime = schTime1+":"+schTime2;
%>
<!-- 1. bean 생성  -->
<jsp:useBean id="schVO" class="kr.co.sist.vo.AdminScheduleVO"  scope="page"/>
<!-- 2. setter method 호출 -->
<jsp:setProperty property="schDate" name="schVO" />
<jsp:setProperty property="schTime" name="schVO" value="<%=schTime %>"/>
<jsp:setProperty property="schId" name="schVO" />


<%
		AdminScheduleDAO schDAO = AdminScheduleDAO.getInstance();
		int schCnt = schDAO.updateSchedule(schVO); 
					
					
		//board페이지로 이동
		if(schCnt != -99){%>
					<script>
				alert("상영일정 변경 완료")
			location.href="schedule_Board.jsp"; 
					</script>
<%} %>


<%
System.out.println("schId:" + schId);
System.out.println("schDate:"+ schDate);
System.out.println("schTime:" + schTime ); 
%>

