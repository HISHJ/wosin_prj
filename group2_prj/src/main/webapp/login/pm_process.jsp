<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    

<!-- 세션 값 받아오기 useBean : scope="session"사용하면 필요없을듯! -->
<%-- <%String id=(String)session.getAttribute("memberId"); %> --%>


 <jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="session"/>
 <jsp:setProperty property="pwd" name="mbVO"/>



  <%
	int updatePassCnt=0;	
	MemberDAO mbrDAO=MemberDAO.getInstance();
	updatePassCnt= mbrDAO.updatePass(mbVO.getMemberId(), mbVO.getPwd());
	
if(updatePassCnt==0){	
%>   
<script>
	alert("비밀번호를 다시 확인해주세요.");
	location.href="passModify.jsp"

</script>
<%}else{ %>
<script>
	alert("비밀번호 변경 완료되었습니다.");
	location.href="../main/index.jsp";
</script>
<%} %>
