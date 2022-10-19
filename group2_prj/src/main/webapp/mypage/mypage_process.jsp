<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="mypage update process"%>
<%request.setCharacterEncoding("UTF-8");

%>   
 
<jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="page"/>



	<%
				
				String email1=request.getParameter("email1");
				String email2=request.getParameter("email2");
				String email=email1+"@"+email2;
				
				String id= (String)session.getAttribute("memberId");
				String phone=request.getParameter("phone");
				String addr2=request.getParameter("addr2");
				String pw=(String)session.getAttribute("pwd");
				
				//key가져오기
				  ServletContext sc = getServletContext();
				  String plainText = sc.getInitParameter("keyU"); 
				  
				  DataEncrypt de= new DataEncrypt(plainText);
				
		
				  String Email=de.encryption(email);
				  String Phone=de.encryption(phone);
				  String Addr2=de.encryption(addr2);
				  
				
				%>

    				<jsp:setProperty property="name" name="mbVO"/>
    				<jsp:setProperty property="memberId" name="mbVO" value="<%=id %>"/>
    				<jsp:setProperty property="pwd" name="mbVO" value="<%=pw %>"/>
 					<jsp:setProperty property="birth" name="mbVO"/>
					<jsp:setProperty property="gender" name="mbVO"/>
					<jsp:setProperty property="zipcode" name="mbVO"/>
					<jsp:setProperty property="addr1" name="mbVO"/>
					<jsp:setProperty property="addr2" name="mbVO" value="<%=Addr2 %>"/>
					<jsp:setProperty property="email" name="mbVO" value="<%=Email %>"/>
					<jsp:setProperty property="phone" name="mbVO" value="<%=Phone %>"/>
					<jsp:setProperty property="mailChk" name="mbVO"/>
					<jsp:setProperty property="smsChk" name="mbVO"/>  


  <%			MemberDAO mbrDAO= MemberDAO.getInstance();
				int updateMbCnt=mbrDAO.updateMember(mbVO);
				if(updateMbCnt==0){/* 회원정보수정 실패 */	%>
					<script>
						alert("회원정보를 다시 확인해주세요.");
						location.href="https://localhost/group2_prj/mypage/mypage.jsp";
					</script>
		
				<%}else{ %>
					<script>
						alert("회원정보가 수정되었습니다.");
						location.href="http://localhost/group2_prj/mypage/mypage.jsp";
					</script>
				<%}  
				System.out.println(mbVO);
				System.out.println(updateMbCnt);%>    



