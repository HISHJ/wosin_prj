<%@page import="java.sql.SQLException"%>
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
<jsp:useBean id="mbrDAO" class="prj2DAO.MemberDAO" scope="page"/>   
<jsp:useBean id="mbVO" class="prj2DAO.MemberVO" scope="page"/>
<!-- VO에 있는 모든 값을 set해줌  -->
<jsp:setProperty property="*" name="mbVO"/>


<!-- 회원가입 페이지에서 넘어온 정보를 넣어준다. -->
 <jsp:setProperty property="name" name="mbVO"/>
<jsp:setProperty property="memberId" name="mbVO"/>
<jsp:setProperty property="pwd" name="mbVO"/>
<jsp:setProperty property="birth" name="mbVO"/>
<jsp:setProperty property="gender" name="mbVO"/>
<jsp:setProperty property="zipcode" name="mbVO"/>
<jsp:setProperty property="addr1" name="mbVO"/>
<jsp:setProperty property="addr2" name="mbVO"/>
<jsp:setProperty property="phone" name="mbVO"/>
<jsp:setProperty property="hPhone" name="mbVO"/>
<jsp:setProperty property="mdate" name="mbVO"/>
<jsp:setProperty property="mailChk" name="mbVO"/>
<jsp:setProperty property="smsChk" name="mbVO"/>



 <%-- <jsp:getProperty property="name" name="mbVO"/>
<jsp:getProperty property="memberId" name="mbVO"/>
<jsp:getProperty property="pwd" name="mbVO"/>
<jsp:getProperty property="birth" name="mbVO"/>
<jsp:getProperty property="gender" name="mbVO"/>
<jsp:getProperty property="zipcode" name="mbVO"/>
<jsp:getProperty property="addr1" name="mbVO"/>
<jsp:getProperty property="addr2" name="mbVO"/>
<jsp:getProperty property="phone" name="mbVO"/>
<jsp:getProperty property="hPhone" name="mbVO"/>
<jsp:getProperty property="mailChk" name="mbVO"/>
<jsp:getProperty property="smsChk" name="mbVO"/>
<jsp:getProperty property="mdate" name="mbVO"/>
<jsp:getProperty property="status" name="mbVO"/> 
 --%>




 <% 

try{
int cnt = mbrDAO.insertMember(mbVO);

if(cnt>0){%>
<script>
	alert("회원가입완료")
	location.href="http://localhost/jsp_prj/design%20final%20intergration/signup_result.html";
</script>
	
<%
	}else if(cnt<=0){%>
	<script>
		alert("회원가입 실패")
		</script>
		
<% }//end if 


}catch(SQLException se){%>
	<script>
	
		alert("회원가입 오류")
	</script>	
	
	
<%}
	
%>  
</body>

</html>