<%@page import="javax.tools.DocumentationTool.Location"%>
<%@page import="project.dao.AdminScheduleDAO"%>
<%@page import="project.vo.AdminScheduleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    
<% //POST방식의 요청 한글 처리 
request.setCharacterEncoding("UTF-8"); %>
<!-- 1. bean 생성  -->
<jsp:useBean id="aschVO" class="project.vo.AdminScheduleVO" scope="page"/>
<!-- 2. setter method 호출  -->

<jsp:setProperty property="schId" name="aschVO"/>
<jsp:setProperty property="schDate" name="aschVO"/>
<jsp:setProperty property="schTime" name="aschVO"/>

<%
String schId = request.getParameter("schId");
System.out.println("schId:" + schId);

String schDate = request.getParameter("schDate");
System.out.println("schDate:"+ schDate);

String schTime = request.getParameter("schTime");
System.out.println("schTime:" + schTime);

AdminScheduleDAO aschDAO = AdminScheduleDAO.getInstance();
int cnt = aschDAO.updateSchedule(aschVO);




if(cnt != -99){%>
<script>
location.href="showINGBoard.jsp";
</script>

<%}%>
