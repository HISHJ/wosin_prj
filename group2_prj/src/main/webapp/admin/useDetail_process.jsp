<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="kr.co.sist.dao.AdminMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
  <%  request.setCharacterEncoding("UTF-8"); 

  String status=(String)session.getAttribute("status");

  %>  


<jsp:useBean id="admVO" class="kr.co.sist.vo.AdminMemberVO" scope="page"/>
<jsp:useBean id="aqmVO" class="kr.co.sist.vo.AdminQuitMemberVO" scope="page"/>
<jsp:setProperty property="memberId" name="admVO"/>
<jsp:setProperty property="status" name="admVO" value="<%=status %>"/>
<jsp:setProperty property="memberId" name="aqmVO" value="<%=admVO.getMemberId()%>"/>



  <% 
AdminMemberDAO admDAO=AdminMemberDAO.getInstance();
int  updateMemberCnt = admDAO.updateMemberStatus(admVO.getMemberId());
int insertCnt=admDAO.insertQuitMember(aqmVO);


if(admVO.getStatus().equals("N")){%>
<script>
alert("이미 탈퇴한 회원입니다.");
location="http://localhost/group2_prj/admin/useBoard.jsp";
</script>

<%}else{
 		if(updateMemberCnt==0){/* 회원정보수정 실패 */	%>
					<script>
						alert("다시시도해주세요");
						location="http://localhost/group2_prj/admin/useDetail.jsp";
					</script>
				<%}else{%>
							
					<%if(insertCnt==1){%>
						<script>
						alert("회원탈퇴 성공하였습니다");
						location="http://localhost/group2_prj/admin/useBoard.jsp";
					</script>
					<%
					session.removeAttribute("status");
					}else{%>
					<script>
					alert("회원 탈퇴 실패하였습니다. 다시 시도해주세요");
					location="http://localhost/group2_prj/admin/useDetail.jsp";
					</script>
				<%}//insertCnt end
		}//updateMemberCnt end
		
}%>  


