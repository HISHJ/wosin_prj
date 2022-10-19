<%@page import="java.security.MessageDigest"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    


 <jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="page"/>




  <%
  request.setCharacterEncoding("UTF-8"); 
  
  String id=(String)session.getAttribute("Id");
  String pw=request.getParameter("pwd");
  String pwd=DataEncrypt.messageDigest("SHA-1", pw);


  

 	int updatePassCnt=0;	
	MemberDAO mbrDAO=MemberDAO.getInstance();
	updatePassCnt= mbrDAO.updatePass(id, pwd);
	
if(updatePassCnt==0){	
%>   
<script>
	alert("비밀번호를 다시 확인해주세요.");
	location.href="http://localhost/group2_prj/login/passModify.jsp"

</script>
<%}else{ %>
<script>
	alert("비밀번호 변경 완료되었습니다.");
	location.href="http://localhost/group2_prj/main/index.jsp";
</script>
<%} %>
