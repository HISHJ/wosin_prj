<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="kr.co.sist.dao.AdminMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
  <%  request.setCharacterEncoding("UTF-8"); 
 String id=(String)session.getAttribute("memberId");
 String status=(String)session.getAttribute("status");

  %>  


<jsp:useBean id="admVO" class="kr.co.sist.vo.AdminMemberVO" scope="session"/>
<jsp:useBean id="aqmVO" class="kr.co.sist.vo.AdminQuitMemberVO" scope="page"/>
<jsp:setProperty property="*" name="admVO"/>
<jsp:setProperty property="memberId" name="admVO" value="<%=id%>"/>
<jsp:setProperty property="status" name="admVO" value="<%=status %>"/>
<jsp:setProperty property="memberId" name="aqmVO" value="<%=id%>"/>



<% 
AdminMemberDAO admDAO=AdminMemberDAO.getInstance();
int  updateMemberCnt = admDAO.updateMemberStatus(admVO.getMemberId());
%>




<% if(admVO.getStatus().equals("N")){%>
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
				<%}else{
						int insertCnt=admDAO.insertQuitMember(aqmVO);	%>
					<%if(updateMemberCnt==0&&insertCnt==0){%>
						<script>
					alert("회원 탈퇴 실패하였습니다. 다시 시도해주세요");
					location="http://localhost/group2_prj/admin/useDetail.jsp";
					</script>
					<%}else if(updateMemberCnt==1&&insertCnt==1){%>
						<script>
						alert("회원탈퇴 성공하였습니다");
						location="http://localhost/group2_prj/admin/useBoard.jsp";
					</script>
					<%
					session.removeAttribute("status");
					session.removeAttribute("id");
					System.out.println(updateMemberCnt);
					System.out.println(insertCnt);
					}//insertCnt
				}
		}//updateMemberCnt end
		
%>  


 --%>