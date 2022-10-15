<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="회원탈퇴"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    


<jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="session"/>
<jsp:useBean id="qmVO" class="kr.co.sist.vo.QuitMemberVO" scope="session"/>
<%
String id=mbVO.getMemberId();
String pw=mbVO.getPwd();
String reason=request.getParameter("reason");%>

<jsp:setProperty property="memberId" name="mbVO"/>
<jsp:setProperty property="pwd" name="qmVO"/>
<jsp:setProperty property="memberId" name="qmVO" value="<%=mbVO.getMemberId() %>"/>
<jsp:setProperty property="pwd" name="qmVO" value="<%=mbVO.getPwd() %>"/>
<jsp:setProperty property="reason" name="qmVO" value="<%=reason%>"/>
<%
MemberDAO mbrDAO =MemberDAO.getInstance();

 int updateMbsCnt = mbrDAO.updateMemberStatus(id, pw);
 int qmCnt=mbrDAO.insertQuitMember(qmVO);

%>



 <% if(updateMbsCnt==0){/* 회원정보수정 실패 */	%>
					<script>
						alert("비밀번호를 다시 확인해주세요");
					</script>
				<%}else if(updateMbsCnt==-1){%>
				<script>
				alert("비밀번호를 다시 확인해주세요.");
			
				</script>
				<%}else{ 
					if(qmCnt==-1){%>
								<script>			
									alert("비밀번호를 다시 확인해주세요.");
								</script>
						<%}else{%>						
								<script>
							
								alert("회원탈퇴 되었습니다. 그동안 이용해주셔서 감사합니다.");
								location.href="http://localhost/group2_prj/main/index.jsp";
								</script>
						<%} 
						
				}
						%>
			




</body>
</html>