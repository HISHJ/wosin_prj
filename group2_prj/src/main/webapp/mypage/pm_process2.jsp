<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="비밀번호 변경과정 process"%>
    



 <jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="page"/>




  <%
  request.setCharacterEncoding("UTF-8"); 
  
  String id= (String)session.getAttribute("memberId");
  String pw=(String)session.getAttribute("pwd");


	int updatePassCnt=0;	
	MemberDAO mbrDAO=MemberDAO.getInstance();
	updatePassCnt= mbrDAO.updatePass(id, pw);
	
if(updatePassCnt==0){	
%>   
<script>
	alert("비밀번호를 다시 확인해주세요.");
	location.href="http://localhost/group2_prj/mypage/passModify2.jsp"

</script>
<%}else{ %>
<script>
	alert("비밀번호 변경 완료되었습니다.");
	location.href="http://localhost/group2_prj/mypage/memberMng.jsp";
</script>
<%} %>
