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
<%
request.setCharacterEncoding("UTF-8");


%>


<jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="page"/>
<jsp:setProperty property="memberId" name="mbVO"/>
<div align="center">
	<br/><b>${param.memberId }</b>
<% 
MemberDAO mbrDAO = MemberDAO.getInstance();
boolean result=mbrDAO.selectChkId(mbVO);

if(result) {
	out.println("는 이미 존재하는 ID입니다.<p/>");
	
	
}else{
	out.println("는 사용 가능 합니다.<p/>");
	
}

%>
<a href="#" onclick="self.close()">닫기</a>
</div>
</body>
</html>

