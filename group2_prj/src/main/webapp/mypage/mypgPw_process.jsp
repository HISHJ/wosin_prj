<%@page import="java.security.MessageDigest"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="kr.co.sist.vo.MemberVO"%>
<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="mypage진입 비밀번호 prcoess"%>
    



 <jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="page"/> 

 
<%request.setCharacterEncoding("UTF-8"); 
String id=(String)session.getAttribute("memberId");
String pw=request.getParameter("pwd");


String pwd=DataEncrypt.messageDigest("SHA-1", pw);



%>

<jsp:setProperty property ="memberId" name="mbVO" value="<%=id %>"/>
 <jsp:setProperty property="pwd" name="mbVO"  value="<%=pwd%>"/> 


<%
MemberDAO mbrDAO =MemberDAO.getInstance();	
boolean result= mbrDAO.login(mbVO);

if(result){
		session.setAttribute("pwd", mbVO.getPwd());
		response.sendRedirect("http://localhost/group2_prj/mypage/memberMng.jsp");
}else { %>
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		location.href="http://localhost/group2_prj/mypage/password_mypage.jsp";
		System.out.println(mbVO);
	</script>

<%}//endif %>




