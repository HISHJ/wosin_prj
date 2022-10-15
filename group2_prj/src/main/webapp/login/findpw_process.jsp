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

<%								request.setCharacterEncoding("UTF-8");
				
			
							/* phone값 합치기  */
									String tel1=request.getParameter("tel1");
									String tel2=request.getParameter("tel2");
									String tel3=request.getParameter("tel3");
									
									String phone=tel1+"-"+tel2+"-"+tel3;%>
									
		<jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="session"/>
				<jsp:setProperty property="name" name="mbVO"/>
				<jsp:setProperty property="phone" name="mbVO" value="<%=phone %>"/>
				 <jsp:setProperty property = "memberId" name="mbVO"/>
				<% 		
				MemberDAO mbrDAO =MemberDAO.getInstance();
			 	mbVO = mbrDAO.selectMemberPass(mbVO);
		
				if(mbVO.getPwd()==null){%>
					<script>
						alert("일치하는 계정이 없습니다.");
						location.href="http://localhost/group2_prj/login/find_password.jsp"
					</script>
				
				<%}else{
						
				
						session.setAttribute("memberId", mbVO.getMemberId());
						response.sendRedirect("http://localhost/group2_prj/login/passmodify.jsp"); 
						
					} %> 				



</body>
</html>