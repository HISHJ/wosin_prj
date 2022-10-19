<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="kr.co.sist.dao.MemberDAO"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    

<%request.setCharacterEncoding("UTF-8"); %>


<!-- useBean을 사용하여  MemberVO를 불러온다 -->

<jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="session"/>

<%request.setCharacterEncoding("UTF-8"); 
String id=request.getParameter("memberId");
String pw=request.getParameter("pwd");


//key가져오기
  ServletContext sc = getServletContext();
  String plainText = sc.getInitParameter("keyU"); 


  //키를 넣어 암호화 객체 생성
  DataEncrypt de= new DataEncrypt(plainText);


  String Id=de.encryption(id);
  String pwd=DataEncrypt.messageDigest("SHA-1", pw);


%>




<jsp:setProperty property="memberId" name="mbVO" value="<%=Id %>" />
<jsp:setProperty property="pwd" name="mbVO"  value="<%=pwd %>"/> 




<% 
MemberDAO mbrDAO= MemberDAO.getInstance();
boolean result = mbrDAO.login(mbVO);

if(result){
	//로그인 성공
	session.setAttribute("memberId", mbVO.getMemberId());  
	
 /* 	String id=(String)session.getAttribute("memberId");  */
	
/* 	out.println(id); 세션확인용*/
	
%>	 <script>
		alert("${param.memberId}님 환영합니다.")
		location.href="http://localhost/group2_prj/main/index.jsp";   
	</script>
<%

	

}else{%>
	<script>
		alert("아이디 또는 비밀번호를 확인해주세요.");
		location.href="http://localhost/group2_prj/login/login.jsp";
	</script>
	
<%}//end if%>
