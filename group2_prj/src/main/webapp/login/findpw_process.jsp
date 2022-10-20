<%@page import="java.util.Enumeration"%>
<%@page import="kr.co.sist.vo.MemberVO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="비밀번호찾기 process"%>
    
    
	
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
									  
									 
									
									  //키를 넣어 암호화 객체 생성
									  DataEncrypt de= new DataEncrypt(plainText);
									
								 	  String Id=de.encryption(id);
								 	  String Phone=de.encryption(phone);
									  String name=request.getParameter("name");
									
														
									
														
										MemberVO mbVO = new MemberVO();
										MemberDAO mbrDAO =MemberDAO.getInstance();
									 	mbVO = mbrDAO.selectMemberPass(Id,name,Phone);
										System.out.println(Id);
										System.out.println(name);
										System.out.println(Phone);
								
									if(mbVO==null){%>
											<script>
												alert("일치하는 계정이 없습니다.");
												location.href="http://localhost/group2_prj/login/find_password.jsp";
											</script>
										
										<%}else{
												session.setAttribute("Id",mbVO.getMemberId());
												session.setAttribute("pwd",mbVO.getPwd());%>
												<script>
												location.href="http://localhost/group2_prj/login/passModify.jsp";
												</script>
											<%} 
											
									
											
											
											
											
											%> 				
						
					
