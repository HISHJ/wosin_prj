<%@page import="java.security.MessageDigest"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="kr.co.sist.vo.MemberVO"%>
<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="mypage진입 비밀번호 prcoess"%>
    



 <jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="session"/> 

 
<%request.setCharacterEncoding("UTF-8"); 

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



%>

<jsp:setProperty property="pwd" name="mbVO"  value="<%=pwd %>"/> 


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




