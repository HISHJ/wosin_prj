<%@page import="javax.tools.DocumentationTool.Location"%>
<%@page import="kr.co.sist.dao.AdminShowDAO"%>
<%@page import="kr.co.sist.vo.AdminShowVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>


					<%request.setCharacterEncoding("UTF-8"); %>
				   
					<jsp:useBean id="asVO" class="kr.co.sist.vo.AdminShowVO" scope="page"/>
					<%-- 이거 하나로 처리해도 될 거 같음 : <jsp:setProperty property="*" name="asVO"/> --%>
					<jsp:setProperty property="showId" name="asVO"/>
					<jsp:setProperty property="name" name="asVO"/>
					<jsp:setProperty property="genreId" name="asVO"/>
					<jsp:setProperty property="startDate" name="asVO"/>
					<jsp:setProperty property="endDate" name="asVO"/>
					<jsp:setProperty property="runningTime" name="asVO"/>
					<jsp:setProperty property="ratingId" name="asVO"/>
					<jsp:setProperty property="price" name="asVO"/>
					<jsp:setProperty property="thImg" name="asVO"/>
					<jsp:setProperty property="mImg" name="asVO"/>
					<jsp:setProperty property="infoImg" name="asVO"/>
					<jsp:setProperty property="status" name="asVO"/> 
					
					
					<%
					AdminShowDAO asDAO = AdminShowDAO.getInstance();
					int cnt = asDAO.updateShow(asVO); 
					
					
					//board페이지로 이동
					if(cnt!=-99){%>
						<script>
						location.href="showBoard.jsp";
						</script>
					<%}%>  --%>
