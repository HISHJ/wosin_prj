<%@page import="javax.tools.DocumentationTool.Location"%>
<%@page import="org.apache.tomcat.jni.Local"%>
<%@page import="kr.co.sist.dao.AdminShowDAO"%>
<%@page import="kr.co.sist.vo.AdminShowVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>


					<%request.setCharacterEncoding("UTF-8"); %>
				   
					<jsp:useBean id="asVO" class="kr.co.sist.vo.AdminShowVO" scope="page"/>
					
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
					
					 <jsp:getProperty property="name" name="asVO"/>
					<jsp:getProperty property="showId" name="asVO"/>
					<jsp:getProperty property="genreId" name="asVO"/>
					<jsp:getProperty property="startDate" name="asVO"/>
					<jsp:getProperty property="endDate" name="asVO"/>
					<jsp:getProperty property="runningTime" name="asVO"/>
					<jsp:getProperty property="ratingId" name="asVO"/>
					<jsp:getProperty property="price" name="asVO"/> 
					<jsp:getProperty property="thImg" name="asVO"/>
					<jsp:getProperty property="mImg" name="asVO"/>
					<jsp:getProperty property="infoImg" name="asVO"/>
					<jsp:getProperty property="status" name="asVO"/>
					
					
					<% 
					AdminShowDAO asDAO = AdminShowDAO.getInstance();
					int cnt = asDAO.updateShow(asVO);%> <!-- DAO손보기 -->


</body>
</html>