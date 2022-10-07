<%@page import="kr.co.sist.dao.AdminShowDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="scriptlet의 사용"%>
    
    
<%
String showId=request.getParameter("showId"); //아...세션으로 줘야하나 삭제버튼 꺼내놓지 말라헸으니까
AdminShowVO asVO= new AdminShowVO();
AdminShowDAO asDAO=AdminShowDAO.getInstance();
AdminShowVO showDetail=asDAO.selectShowDetail(showId);  //이거 같은데?
int delet=asDAO.deleteShow(showId);  
%>
    
					<%request.setCharacterEncoding("UTF-8"); %>
				   
					<jsp:useBean id="showId" class="kr.co.sist.vo.AdminShowVO" scope="page"/>
					
					<jsp:setProperty property="showId" name="showId"/>
					<jsp:getProperty property="showId" name="showId"/> <!-- null뜨는데 아...세션으로 받아와야하나...-->
					
					<%-- <% 
					AdminShowDAO asDAO = AdminShowDAO.getInstance();
					int cnt = asDAO.deleteShow(showId);%> --%>
					
					<%-- //board페이지로 이동
					if(cnt!=-99){%>
						<script>
						location.href="showBoard.jsp";
						</script>
					<%}%> --%>