<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="비밀번호 변경과정 process"%>
    



 <jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="session"/>




  <%
  request.setCharacterEncoding("UTF-8"); 
  
  String id=mbVO.getMemberId();
  String pw=mbVO.getPwd();
//key가져오기
  ServletContext sc = getServletContext();
  String plainText = sc.getInitParameter("keyU"); 
  //키를 넣어 암호화 객체 생성
  DataEncrypt de= new DataEncrypt(plainText);
  String pwd=DataEncrypt.messageDigest("SHA-1", pw);
	int updatePassCnt=0;	
	MemberDAO mbrDAO=MemberDAO.getInstance();
	updatePassCnt= mbrDAO.updatePass(id, pwd);
	
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
