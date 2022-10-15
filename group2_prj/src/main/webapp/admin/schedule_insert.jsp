<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.sist.vo.ShowVO"%>
<%@page import="kr.co.sist.dao.AdminScheduleDAO"%>
<%@page import="kr.co.sist.vo.AdminScheduleVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    
    
    <%--  <%
AdminScheduleVO aVO=new AdminScheduleVO();
aVO.setSchId(request.getParameter("schId"));
aVO.setSchDate(request.getParameter("schDate"));
aVO.setSchTime(request.getParameter("schTime"));

System.out.println(aVO.toString());
 
 %> --%>
    

<% //POST방식의 요청 한글 처리 
request.setCharacterEncoding("UTF-8"); 
String showId=request.getParameter("showId"); 
String schDate = request.getParameter("schDate");

String schTime1 = request.getParameter("schTime1");
String schTime2 = request.getParameter("schTime2");
String schTime = schTime1+":"+schTime2;


%>
 <!-- 1. bean 생성  -->
<jsp:useBean id="aschVO" class="kr.co.sist.vo.AdminScheduleVO" scope="page"/>
<!-- 2. setter method 호출 -->
<jsp:setProperty property="schId" name="aschVO"/>
<jsp:setProperty property="schDate" name="aschVO"/>
<jsp:setProperty property="schTime" name="aschVO" value="<%=schTime %>"/>


<%
AdminScheduleDAO aschDAO = AdminScheduleDAO.getInstance();//객체생성
	int cnt = aschDAO.insertSchedule(aschVO);


if(cnt != -00){%>
<script>
 location.href="schedule_Board.jsp"; 
</script>
<%}%>
	
		
<%
System.out.println("showId:" + showId);
System.out.println("schDate:"+ schDate);
System.out.println("schTime:" + schTime); 
%>




 
