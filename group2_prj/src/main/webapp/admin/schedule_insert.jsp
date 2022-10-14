<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.sist.vo.ShowVO"%>
<%@page import="project.dao.AdminScheduleDAO"%>
<%@page import="project.vo.AdminScheduleVO"%>
<%@page import="project.vo.AdminShowVO"%>

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
request.setCharacterEncoding("UTF-8"); %>
 <!-- 1. bean 생성  -->
<jsp:useBean id="aschVO" class="project.vo.AdminScheduleVO" scope="page"/>
<!-- 2. setter method 호출 -->
<jsp:setProperty property="showId" name="aschVO"/>
<jsp:setProperty property="schId" name="aschVO"/>
<jsp:setProperty property="schDate" name="aschVO"/>
<jsp:setProperty property="schTime" name="aschVO"/>


<%
AdminScheduleDAO aschDAO = AdminScheduleDAO.getInstance();//객체생성

String showId=request.getParameter("showId"); 
System.out.println("showId:" + showId);

String schId = request.getParameter("schId");
System.out.println("schId:" + schId);

String schDate = request.getParameter("schDate");
System.out.println("schDate:"+ schDate);

String schTime = request.getParameter("schTime");

System.out.println("schTime:" + schTime);

int cnt = aschDAO.insertSchedule(aschVO);


if(cnt != -1){%>
<script>
 location.href="showINGBoard.jsp"; 
</script>
<%}%>
	
		




 
