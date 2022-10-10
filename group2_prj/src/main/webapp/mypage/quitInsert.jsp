<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
 <%request.setCharacterEncoding("UTF-8"); %>   
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
<jsp:useBean id="qmVO" class="kr.co.sist.vo.QuitMemberVO" scope="session"/>



<%String reason=request.getParameter("reason");%>
<jsp:setProperty property="memberId" name="mbVO"/>
<jsp:setProperty property="memberId" name="qmVO" value="<%=mbVO.getMemberId() %>"/>
<jsp:setProperty property="reason" name="qmVO" value="<%=reason%>"/>




 <%
MemberDAO mbrDAO =MemberDAO.getInstance();
int qmCnt=mbrDAO.insertQuitMember(qmVO);
if(qmCnt==-1){%>
		<script>			
			alert("추가실패");
		</script>
<%}else{%>						
		<script>
		location.href="http://localhost/group2_prj/mypage/quit_process.jsp"
		</script>
<%} %>


</body>
</html>