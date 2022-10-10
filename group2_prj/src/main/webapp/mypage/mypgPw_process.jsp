<%@page import="kr.co.sist.vo.MemberVO"%>
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


 <jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="session"/> 
 <jsp:setProperty property="pwd" name="mbVO"/> 
 <jsp:setProperty property="memberId" name="mbVO"/>
 
<%request.setCharacterEncoding("UTF-8"); 
MemberDAO mbrDAO =MemberDAO.getInstance();
	
boolean result= mbrDAO.login(mbVO);

if(result){
		response.sendRedirect("http://localhost/group2_prj/mypage/memberMng.jsp");
}else { %>
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		location.href="http://localhost/group2_prj/mypage/password_mypage.jsp";
	</script>

<%}//endif %>




</body>
</html>