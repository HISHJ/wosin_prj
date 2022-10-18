<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="mypage update process"%>
<%request.setCharacterEncoding("UTF-8"); %>    
<jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="session"/>
<jsp:setProperty property="*" name="mbVO"/>
			<%
				
				String email1=request.getParameter("email1");
				String email2=request.getParameter("email2");
				String email=email1+"@"+email2;
				
				String id=mbVO.getMemberId();
				String phone=mbVO.getPhone();
				String addr2=mbVO.getAddr2();
				
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
				
				  String Id=de.encryption(id);
				  String Email=de.encryption(email);
				  String Phone=de.encryption(phone);
				  String Addr2=de.encryption(addr2);
				  
				
				//생일 합치기
				String birth1 = request.getParameter("birthdayYear");
				String birth2 = request.getParameter("birthdayMonth");
				String birth3 = request.getParameter("birthdayDay");
				
				String birth = birth1+"-"+birth2+"-"+birth3;
				
				
				%>

    				<jsp:setProperty property="name" name="mbVO"/>
    				<jsp:setProperty property="memberId" name="mbVO" value="<%=Id %>"/>
    				<jsp:setProperty property="pwd" name="mbVO" />
 					<jsp:setProperty property="birth" name="mbVO" value="<%=birth %>"/>
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
				
				System.out.println(updateMbCnt);%>   



