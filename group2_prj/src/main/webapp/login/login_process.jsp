<%@page import="kr.co.sist.dao.MemberDAO"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    

<%request.setCharacterEncoding("UTF-8"); %>



<!-- useBean을 사용하여  MemberVO를 불러온다 -->

<jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="session"/>
<!-- VO에 있는 모든 값을 set해줌  -->
<%-- <jsp:setProperty property="*" name="mbVO"/> --%>

 

 <jsp:setProperty property="*" name="mbVO"/> 
<%--  <jsp:setProperty property="memberId" name="mbVO" />
<jsp:setProperty property="pwd" name="mbVO" />    --%>



<% 
MemberDAO mbrDAO= MemberDAO.getInstance();
boolean result = mbrDAO.login(mbVO);

if(result){
	//로그인 성공
	session.setAttribute("memberId", mbVO.getMemberId());  
 /* 	String id=(String)session.getAttribute("memberId");  */
	
/* 	out.println(id); 세션확인용*/
	
%>	 <script>
		alert("${param.memberId}님 환영합니다.")
		location.href="http://localhost/group2_prj/main/index.jsp";   
	</script>
<%

	

}else{%>
	<script>
		alert("아이디 또는 비밀번호를 확인해주세요.");
		location.href="http://localhost/group2_prj/login/login.jsp";
	</script>
	
<%}//end if%>





