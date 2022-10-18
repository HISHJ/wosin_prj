<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="비밀번호찾기 process"%>
    
    
  <jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="session"/>			
<%								

									request.setCharacterEncoding("UTF-8");			
									/* phone값 합치기  */
									String tel1=request.getParameter("tel1");
									String tel2=request.getParameter("tel2");
									String tel3=request.getParameter("tel3");
									
									String phone=tel1+"-"+tel2+"-"+tel3;
									String id=request.getParameter("memberId");
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
								 	  String Phone=de.encryption(phone);
									
									%>
														
									
									<jsp:setProperty property="name" name="mbVO"/>
									<jsp:setProperty property="phone" name="mbVO" value="<%=Phone %>"/>
									<jsp:setProperty property = "memberId" name="mbVO" value="<%=Id %>"/>
									 
									 
									
									
									
									
									
									
				 

				 
			<% 		
				MemberDAO mbrDAO =MemberDAO.getInstance();
			 	mbVO = mbrDAO.selectMemberPass(mbVO);
		
				if(mbVO.getPwd()==null){%>
					<script>
						alert("일치하는 계정이 없습니다.");
						location.href="http://localhost/group2_prj/login/find_password.jsp"
					</script>
				
				<%}else{%>
						<script>
						locatin.href="http://localhost/group2_prj/login/passModify.jsp";
						</script>
					<%} 
					System.out.println(mbVO);
					%> 				



