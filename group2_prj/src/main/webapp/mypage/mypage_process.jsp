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

<!-- JSP부분 -->
				<%
				request.setCharacterEncoding("UTF-8");
				String email1=request.getParameter("email1");
				String email2=request.getParameter("email2");
				String email=email1+"@"+email2;
				
				String birth1 = request.getParameter("birthdayYear");
				String birth2 = request.getParameter("birthdayMonth");
				String birth3 = request.getParameter("birthdayDay");
				
				String birth = birth1+"-"+birth2+"-"+birth3;
				
				%>


				<jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="session"/>
				<jsp:setProperty property="*" name="mbVO"/>
				<jsp:setProperty property="email" name="mbVO" value="<%=email %>"/> 
				<jsp:setProperty property="birth" name="mbVO" value="<%=birth %>"/> 
				
		
				
	  	<%
				MemberDAO mbrDAO= MemberDAO.getInstance();
				int updateMbCnt=mbrDAO.updateMember(mbVO);
				if(updateMbCnt==0){/* 회원정보수정 실패 */	%>
					<script>
						alert("회원정보를 다시 확인해주세요.");
					</script>
				<%}else if(updateMbCnt==-1){%>
				<script>
				 	alert("회원정보가 수정 실패.");
			
				</script>
				<%}else{ %>
					<script>
						alert("회원정보가 수정되었습니다.");
						location.href="http://localhost/prj2/design final intergration/memberMng.jsp"
					</script>
				<%} %>   
</body>
</html>