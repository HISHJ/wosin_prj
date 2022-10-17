<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="kr.co.sist.dao.AdminMemberDAO"%>
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

<jsp:useBean id="admVO" class="kr.co.sist.vo.AdminMemberVO" scope="session"/>
<jsp:useBean id="aqmVO" class="kr.co.sist.vo.AdminQuitMemberVO" scope="page"/>
<jsp:setProperty property="*" name="admVO"/>


<%
String id=(String)session.getAttribute("memberId");
String pw=admVO.getPwd();%>

<%= %>
<%-- 
//key가져오기
ServletContext sc = getServletContext();
String plainText = sc.getInitParameter("keyU"); 
//알고리즘 설정하여 MessageDigest
MessageDigest md=MessageDigest.getInstance("MD5");
md.update(plainText.getBytes());
new String(md.digest());
//키 생성
String key=DataEncrypt.messageDigest("MD5", plainText);
//키를 넣어 암호화 객체 생성
DataEncrypt de= new DataEncrypt(key);



String pwd=DataEncrypt.messageDigest("SHA-1", pw);

%>
<jsp:setProperty property="memberId" name="aqmVO" value="<%=id%>"/>
<jsp:setProperty property="pwd" name="aqmVO" value="<%=pwd %>"/>



 <%
AdminMemberDAO admDAO=AdminMemberDAO.getInstance();
int  updateMemberCnt = admDAO.updateMemberStatus(admVO.getMemberId());
int insertCnt=admDAO.insertQuitMember(aqmVO);





 		if(updateMemberCnt==0){/* 회원정보수정 실패 */	%>
					<script>
						alert("비밀번호를 다시 확인해주세요");
					</script>
				<%}else{%>
					<script>
					alert("회원 업데이트 성공");//업데이트 확인용 나중에 지우기
					</script>	
					
					<%if(insertCnt==1){%>
						<script>
						alert("회원탈퇴 성공하였습니다");
						location="useBoard.jsp";
					</script>
					<%}else{%>
					<script>
					alert("회원 업데이트 실패");
					</script>
				<%}//end if(insert)
					}//end if(update)%> 
</body>
</html> --%>