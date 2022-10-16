<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<% //plainText가 null일 경우 오류뜹니다! null에 대한 유효성검사 하셔야 할 것 같아요 - 2022-10-16 14:03 유설빈 %>  
<%-- <%
//세션 넘겨받기 검증 완료
String memberId = (String)session.getAttribute("memberId");
%>  --%>
<%  //로그인 되어있는 경우, 메인페이지로 이동
 if( session.getAttribute("memberId") != null){
response.sendRedirect("http://localhost/group2_prj/main/index.jsp");
}  
%>     


 <!DOCTYPE HTML>

<html>
	<head>
		<title>회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="apple-touch-icon" sizes="180x180" href="http://localhost/group2_prj/static/commons/img/favicon_180.png">
    	<link rel="icon" type="image/png" sizes="32x32" href="http://localhost/group2_prj/static/commons/img/favicon_32.png">
    	<link rel="icon" type="image/png" sizes="16x16" href="http://localhost/group2_prj/static/commons/img/favicon_16.png">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/main.css" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\reset.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\subheader.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\headerFooter.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\login.css">
	
	 	<link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static/portal/css/sub_new.css">
   		<link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static/portal/css/style.css">
   		<link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static/portal/css/layout_new.css">
		 <link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static/portal/css/bbs_new.css">
	 
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<!-- google icons -->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!-- google fonts -->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<!-- 제이쿼리 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script>
		$(function(){
			$("input:checkbox[name='save_id']").prop("checked", true);
		});

		</script>
		
		<style>
			section#header{
			 /* background-image:  url("../../images/subvisual-200001.jpg"); */
		 background: url("http://localhost/group2_prj/images/subvisual-common.jpg") no-repeat ; 
		 background-size: 100%; 
		 background-attachment: fixed;
	 
		 }

	 </style>
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">

		
		<c:import  url="http://localhost/group2_prj/common/user_subpage_header.jsp" /> 
    	
    

						<!-- ❤️여기에 서브제목 입력하세욮 ex) 공연일정 -->
						<div id="sut-t_wrap">
						<h2 id="sub-t">
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">회원 가입</strong>
						</h2>
					</div>
					</section>

						------------------------------------위까지가 헤더---------------------------------------

				
				</section>

			로그인 영역
			<div id="depth_w">
				<div class="inner">
					<ul class="clrearfox dot dep1 li2">
						<li class="home">
							<span>
								<span>HOME</span>
							</span>
						</li>
						<li>
							<div class="rel">
								<a href="#">
									<span>회원서비스</span>
								</a>
								display:none
								<ul class="depth" >
									<li>
										<a href="page1.html">공연정보</a>
									</li>
									<li>
										<a href="subpage-ticketmethod.html">예매정보</a>
									</li>
									<li>
										<a href="subpage-FAQ1.html">고객센터</a>
									</li>
									<li>
										<a href="subpage-way.html">오시는길</a>
									</li>
								</ul>
							</div>
						</li>
						<li>
							<li>
								<div class="rel">
								<a href="signup.html"><span>회원가입</span></a>
								<ul class="depth">
								<li><a href="login.html" ><span>로그인</span></a></li>
								<li><a href="signup.html" ><span>회원가입</span></a></li>
								<li><a href="find_id.html" ><span>아이디 찾기</span></a></li>
								<li><a href="find_password.html" ><span>패스워드 찾기</span></a></li>
							
								</ul>
								</div>
							</li>
						
						</li>
					</ul>
				</div>

			</div> 
				<!-- 로그인 영역끝 -->
				<jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="page"/>
				
				<!-- 이메일 병홥 -->
				<%request.setCharacterEncoding("UTF-8"); 
					
					String id=request.getParameter("memberId");
					String pw=request.getParameter("pwd");
					String phone=request.getParameter("phone");
					String hphone=request.getParameter("hPhone");
					String addr2=request.getParameter("addr2");
					String email1=request.getParameter("email1");
					String email2=request.getParameter("email2");
					String email=email1+"@"+email2;
			
				//key가져오기
				  ServletContext sc = getServletContext();
				  String plainText = sc.getInitParameter("keyU"); 
				  //System.out.println( plainText );
				  
				  //알고리즘 설정하여 MessageDigest
				  MessageDigest md=MessageDigest.getInstance("MD5");
				  md.update(plainText.getBytes());
				  new String(md.digest());
				  //키 생성
				  String key=DataEncrypt.messageDigest("MD5", plainText);
				  //키를 넣어 암호화 객체 생성
				  DataEncrypt de= new DataEncrypt(key);
				
			 	  String Id=de.encryption(id);
			 	  String pwd=DataEncrypt.messageDigest("SHA-1", pw);
				  String Email=de.encryption(email);
				  String Phone=de.encryption(phone);
				  String hPhone=de.encryption(hphone);
				  String Addr2=de.encryption(addr2);
				 

		
		%>		   
				    <jsp:setProperty property="name" name="mbVO"/>
					<jsp:setProperty property="memberId" name="mbVO" value="<%=Id %>"/>
					<jsp:setProperty property="pwd" name="mbVO" value="<%=pwd %>"/>
					<jsp:setProperty property="birth" name="mbVO"/>
					<jsp:setProperty property="gender" name="mbVO"/>
					<jsp:setProperty property="zipcode" name="mbVO"/>
					<jsp:setProperty property="addr1" name="mbVO"/>
					<jsp:setProperty property="addr2" name="mbVO" value="<%=Addr2 %>"/>
					<jsp:setProperty property="email" name="mbVO" value="<%=Email %>"/>
					<jsp:setProperty property="phone" name="mbVO" value="<%=Phone %>"/>
					<jsp:setProperty property="hPhone" name="mbVO" value="<%=hPhone %>"/>
					<jsp:setProperty property="mailChk" name="mbVO"/>
					<jsp:setProperty property="smsChk" name="mbVO"/>  
				    <jsp:setProperty property="mdate" name="mbVO"/> 
					<jsp:setProperty property="status" name="mbVO"/>

	
 <% 
			
				  
				  
					MemberDAO mbrDAO = MemberDAO.getInstance();
			
					int cnt = mbrDAO.insertMember(mbVO);
					
					if(cnt<0){%>
						<script>
							alert("다시 시도해주세요.")
							location.href="http://localhost/group2_prj/signUp/signup.jsp"
							</script>
					<%}else{ 
						
				
						
					}//catch
					%>
		
					
		
				<!------------------------------------------main-------------------------------------->
				<div class="signup_result_wrap">
					<div class="signup_result_inner">
						<div class="inner_in_inner">
						<div class="sign_thanks">
							<span id="sign_member_name">${param.name }</span><span>님 우신문화회관 회원으로 가입해주셔서 감사합니다.</span>
							<br/><span>우신문화회관이 여러분의 즐거운 문화생활에 도움이 되길 바랍니다.</span>
						</div>
						<div class="sign_info">
							<div class="sign_info_inner">
								<span>가입정보</span><br/>
								
								<span id="getID"> 아이디 : ${param.memberId}</span>
							</div>
						</div>
						<div class="signup_btn">
							<button class="main">
								<a href="http://localhost/group2_prj/main/index.jsp">메인</a>
							</button>
							<button class="login_back">
								<a href="http://localhost/group2_prj/login/login.jsp">로그인</a>
							</button>
						</div>
					</div>

					</div>
				</div>
			
				
		

				<!----------------------------------------------여기서부터 끝까지 footer-------------------------------------------->

			<!-- Footer -->
				<!-- Footer -->
			<c:import url="http://localhost/group2_prj/common/user_allPage_footer.jsp"/> 
			<!-- End footer -->


		<!-- Scripts -->
			<script src="http://localhost/group2_prj/assets/js/jquery.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/jquery.dropotron.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/browser.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/breakpoints.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/util.js"></script>
			<script src="http://localhost/group2_prj/assets/js/main.js"></script>

	</body>
</html> 