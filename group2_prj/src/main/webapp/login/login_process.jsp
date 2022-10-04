<%@page import="kr.co.sist.common.dao.AdminMemberDAO"%>
<%@page import="ko.co.sist.vo.MemberVO"%>
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
<%request.setCharacterEncoding("UTF-8"); %>

 <!-- 1.parmeter를 받을 VO생성   -->

<!-- useBean을 사용하여 MemberDAO와 MemberVO를 불러온다 -->
<jsp:useBean id="mbrDAO" class="kr.co.sist.common.dao.MemberDAO" scope="page"/>   
<jsp:useBean id="mbVO" class="ko.co.sist.vo.MemberVO" scope="page"/>
<!-- VO에 있는 모든 값을 set해줌  -->
<jsp:setProperty property="*" name="mbVO"/>

 

<%-- <jsp:setProperty property="*" name="mbVO"/> --%>
<jsp:setProperty property="memberId" name="mbVO" />
<jsp:setProperty property="pwd" name="mbVO" />   

 
<%--   <jsp:getProperty property="name" name="mbVO"%=request.getParameter("name") %>"/> --%>

<% 

boolean result = mbrDAO.login(mbVO);

if(result){
	//로그인 성공
	session.setAttribute("memberId", mbVO.getMemberId()); 
 	String id=(String)session.getAttribute("memberId"); 
	
/* 	out.println(id); */
/* 	response.sendRedirect("http://localhost/group2_prj/main/index.html");//url추후변경 */
	
%>	<script>
		alert("${param.memberId}님 환영합니다.")
		 location.href="http://localhost/group2_prj/main/index.html"; 
	</script>


<%}else{%>
	<script>
		alert("아이디 또는 비밀번호를 확인해주세요.");
		location.href="http://localhost/group2_prj/login/login.html";
	</script>
	
<%}//end if%>


</body>
</html>




