<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="mypage update process"%>
    


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
						location.href="http://localhost/group2_prj/mypage/memberMng.jsp"
					</script>
				<%} %>   
