<
<%@page import="kr.co.sist.vo.AdminVO"%>
<%@page import="kr.co.sist.dao.AdminDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="kr.co.sist.service.DbAdminService"%>
<%@page import="java.security.MessageDigest"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="scriptlet의 사용" %>
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
request.setCharacterEncoding("UTF-8");
//값 검증완료
String aId = request.getParameter("adminId");
String aPass = request.getParameter("adminPassword");
//plainText

//key가져오기
ServletContext sc = getServletContext();
String key = sc.getInitParameter("keyA");

//1. 키를 넣어 암호화 객체 생성
DataEncrypt de = new DataEncrypt(key);

//아이디 암호화
String adminId = de.encryption(aId);
//비번 암호화
String adminPass =DataEncrypt.messageDigest("SHA-1", aPass);

AdminDAO aDAO = AdminDAO.getInstance();
AdminVO aVO = new AdminVO();
aVO.setId(adminId);
aVO.setPwd(adminPass);

int chk = aDAO.selectAdmin(aVO);
 
if(chk == 1){ //로그인 성공
   //세션에 현재 아이디 세팅
   session.setAttribute("adminId", aId);   
%>

<script type="text/javascript">
 alert("${param.adminId}님 반갑습니다.")
 location.href="dashBoard.jsp";
</script>
<%}else{ //비밀번호(0) 또는 아이디(-1) 틀린 경우 %>
<script>
alert("아이디 또는 비밀번호를 확인해주세요.");
location.href="admingLogin.jsp";
</script>
<%}%>

</body>
</html>