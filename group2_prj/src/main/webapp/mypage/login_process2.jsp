<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="kr.co.sist.dao.MemberDAO"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" type = "text/css" href = "http://211.63.89.146/jsp_prj/common/css/main_v1_220901.css"/>
<style type="text/css">

</style>
<!-- jQuery googld CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>



<script type="text/javascript">



</script>
</head>
<body>

<!-- useBean을 사용하여  MemberVO를 불러온다 -->

<jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="session"/>

<%request.setCharacterEncoding("UTF-8"); 
String id=request.getParameter("memberId");
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
		location.href="http://localhost/group2_prj/mypage/password_mypage.jsp";   
	</script>
<%
	/* response.sendRedirect("http://localhost/group2_prj/main/index.html"; */
	

}else{%>
	<script>
		alert("아이디 또는 비밀번호를 확인해주세요.");
		location.href="http://localhost/group2_prj/mypage/login.jsp";
	</script>
	
<%}//end if%>


</body>
</html>