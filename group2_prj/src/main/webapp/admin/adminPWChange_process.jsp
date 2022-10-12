<%@page import="adminDAO.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="비밀번호 변경 값 확인 페이지" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://211.63.89.142/jsp_prj/common/css/main_v1_220901.css">
<style type="text/css">

</style>
<!--JQuery Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript">

</script>
</head>
<body>
<%
//값 검증완료
 String aId = (String)session.getAttribute("adminId");
 String pw = request.getParameter("password");
 String rePw = request.getParameter("newPassword");

 AdminDAO aDAO = AdminDAO.getInstance();
 //현재 비밀번호가 맞으면 새로운 비번으로 테이블 update
 int chk = aDAO.updateAdmin(aId, pw, rePw);
 
 //페이지 이동
 
 if(chk > 0){%>
 <script type="text/javascript">
$(function(){
	alert("비밀번호변경이 완료되었습니다.다시 로그인 해 주세요.");
	location.href="admingLogin.jsp";
})
</script> 
<%
 }else{%>
 <script type="text/javascript">
$(function(){
	alert("입력된 현재 비밀번호가 맞지 않습니다. 다시 입력해주세요.");
	location.href="adminPWChange.jsp";
})
</script> 	
<%	 
}
%>

</body>
</html>