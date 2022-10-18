<%@page import="kr.co.sist.dao.AdminShowDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="scriptlet의 사용"%>
    
    
					<%request.setCharacterEncoding("UTF-8"); %>
				   
					<jsp:useBean id="asVO" class="kr.co.sist.vo.AdminShowVO" scope="page"/>
					
					<jsp:setProperty property="showId" name="asVO"/>
					
					
					<% 
					//문제) showId null값 나옴 >>와 해결 disabled 험악한놈..
					String showId=request.getParameter("showId"); 
					AdminShowDAO asDAO = AdminShowDAO.getInstance();
					int cnt = asDAO.deleteShow(showId); 
					
					
					//board페이지로 이동
					if(cnt!=-99){%>
						<script>
						alert("delete process 파일로 넘어왔다");
						location.href="showBoard.jsp";
						</script>
					<%}%>  --%>
					