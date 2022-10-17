<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="kr.co.sist.dao.AdminMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
  <%  request.setCharacterEncoding("UTF-8"); %>  


<jsp:useBean id="admVO" class="kr.co.sist.vo.AdminMemberVO" scope="session"/>
<jsp:useBean id="aqmVO" class="kr.co.sist.vo.AdminQuitMemberVO" scope="page"/>
<jsp:setProperty property="memberId" name="admVO"/>

<% 
AdminMemberDAO admDAO=AdminMemberDAO.getInstance();
int  updateMemberCnt = admDAO.updateMemberStatus(admVO.getMemberId());
int insertCnt=admDAO.insertQuitMember(aqmVO);





 if(updateMemberCnt==0){/* 회원정보수정 실패 */	%>
					<script>
						alert("비밀번호를 다시 확인해주세요");
					</script>
				<%}else{%>
							
					<%if(insertCnt==1){%>
						<script>
						alert("회원탈퇴 성공하였습니다");
						location="http://localhost/group2_prj/admin/useBoard.jsp";
					</script>
					<%}else{%>
					<script>
					alert("회원 탈퇴 실패하였습니다. 다시 시도해주세요");
					</script>
				<%}//insertCnt end
		}//updateMemberCnt end%> 



