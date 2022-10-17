<%@page import="kr.co.sist.dao.AdminScheduleDAO"%>
<%@page import="kr.co.sist.vo.AdminScheduleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="schedule delete"%>
    
    
    <%
    		request.setCharacterEncoding("UTF-8");
    %>
    
    
			<jsp:useBean id="schVO" class="kr.co.sist.vo.AdminScheduleVO" scope="page"/>
    
    		<jsp:setProperty property="schId" name="schVO"/>
    
    <% 
    			String schId=request.getParameter("schId");
    			AdminScheduleDAO schDAO = AdminScheduleDAO.getInstance();
    			int cnt = schDAO.deleteSchedule(schId);
    			
    			//board페이지로 이동
				if(cnt!=-99){%>
					<script>
					location.href="schedule_Board.jsp";
					</script>
				<%}%>  

    
    
    
    
    