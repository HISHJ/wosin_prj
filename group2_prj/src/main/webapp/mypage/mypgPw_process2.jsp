<%@page import="java.security.MessageDigest"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="kr.co.sist.vo.MemberVO"%>
<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=" 비밀번호변경 전 비밀번호확인 prcoess"%>
    



 <jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="page"/> 

 
<%request.setCharacterEncoding("UTF-8"); 
String pw=(String)session.getAttribute("pwd");
String memberId = (String)session.getAttribute("memberId");



%>
<jsp:setProperty property="memberId" name="mbVO" value="<%=memberId%>"/>
<jsp:setProperty property="pwd" name="mbVO"  value="<%=pw%>"/> 




 <%MemberDAO mbrDAO =MemberDAO.getInstance();
	
boolean result= mbrDAO.login(mbVO);

if(result){
		response.sendRedirect("http://localhost/group2_prj/mypage/passModify2.jsp");
}else { %>
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		location.href="http://localhost/group2_prj/mypage/passModify.jsp";
	</script>

<%}//endif %> 

