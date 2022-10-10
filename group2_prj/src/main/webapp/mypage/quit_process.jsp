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
<jsp:useBean id="qmVO" class="kr.co.sist.vo.QuitMemberVO" scope="session"/>


<jsp:setProperty property="*" name="mbVO"/>

<%
MemberDAO mbrDAO =MemberDAO.getInstance();
int updateMbsCnt = mbrDAO.updateMemberStatus(mbVO.getPwd());
int qmCnt=mbrDAO.insertQuitMember(qmVO);
%>

	<% if(updateMbsCnt==0){/* 회원정보수정 실패 */	%>
					<script>
						alert("비밀번호를 다시 확인해주세요");
					</script>
				<%}else if(updateMbsCnt==-1){%>
				<script>
				 	alert("회원탈퇴 실패.");
			
				</script>
				<%}else{ %>
					<script>
						alert("회원탈퇴 되었습니다. 그동안 이용해주셔서 감사합니다.");
						location.href="http://localhost/group2_prj/main/index.jsp"
					</script>
				<%} %>   





</body>
</html>