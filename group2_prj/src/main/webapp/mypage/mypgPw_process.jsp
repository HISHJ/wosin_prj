<%@page import="kr.co.sist.vo.MemberVO"%>
<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="mypage진입 비밀번호 prcoess"%>
    



 <jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="session"/> 
 <jsp:setProperty property="pwd" name="mbVO"/> 
 <jsp:setProperty property="memberId" name="mbVO"/>
 
<%request.setCharacterEncoding("UTF-8"); 
MemberDAO mbrDAO =MemberDAO.getInstance();
	
boolean result= mbrDAO.login(mbVO);

if(result){
		response.sendRedirect("http://localhost/group2_prj/mypage/memberMng.jsp");
}else { %>
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		location.href="http://localhost/group2_prj/mypage/password_mypage.jsp";
	</script>

<%}//endif %>




