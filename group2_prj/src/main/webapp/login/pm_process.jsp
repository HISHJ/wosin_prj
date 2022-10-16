<%@page import="java.security.MessageDigest"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    


 <jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="session"/>




  <%
  request.setCharacterEncoding("UTF-8"); 
  
  String id=mbVO.getMemberId();
  String pw=request.getParameter("pwd");
//key가져오기
  ServletContext sc = getServletContext();
  String plainText = sc.getInitParameter("keyU"); 
  //알고리즘 설정하여 MessageDigest
  MessageDigest md=MessageDigest.getInstance("MD5");
  md.update(plainText.getBytes());
  new String(md.digest());
  //키 생성
  String key=DataEncrypt.messageDigest("MD5", plainText);
  //키를 넣어 암호화 객체 생성
  DataEncrypt de= new DataEncrypt(key);



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
