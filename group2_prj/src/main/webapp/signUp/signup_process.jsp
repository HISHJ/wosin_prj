<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    


<!DOCTYPE HTML>
<!--
	Dopetrope by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="apple-touch-icon" sizes="180x180" href="/static/commons/img/favicon_180.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/static/commons/img/favicon_32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/static/commons/img/favicon_16.png">
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets\css\reset.css">
		<link rel="stylesheet" href="assets\css\subheader.css">
		<link rel="stylesheet" href="assets\css\headerFooter.css">
		<link rel="stylesheet" href="assets\css\login.css">
	
	 <link rel="stylesheet" type="text/css" href="static/portal/css/sub_new.css">
   <link rel="stylesheet" type="text/css" href="static/portal/css/style.css">
   <link rel="stylesheet" type="text/css" href="static/portal/css/layout_new.css">
	 <link rel="stylesheet" type="text/css" href="static/portal/css/bbs_new.css">
	 <!-- 부트스트랩 -->
		<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<!--제이쿼리-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script>
		$(function(){
			$("input:checkbox[name='save_id']").prop("checked", true);
		});

		</script>
		<style>
			section#header{
			 /* background-image:  url("../../images/subvisual-200001.jpg"); */
		 background: url("images/subvisual-common.jpg") no-repeat ; 
		 background-size: 100%; 
		 background-attachment: fixed;
	 
	 }
 
		 #nav{
			 margin-right: 130px;
		 }
	 </style>
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">

		
				<!-- Header -->
				<section id="header">
			
					<!-- Logo -->
						
					<!-- Nav -->
						<nav id="nav">
							<!-- left -->
							<ul id="header_left">
								<li class="current">
									<a href="page1.html">공연정보</a>
									<ul>
										<li><a href="page1.html">공연일정</a></li>
										<!-- <li><a href="calendar.html">일정조회</a></li> -->
										<!-- <li><a href="#">예매</a></li> -->
										<li><a href="page2.html">공연정보상세보기</a></li>
										<li><a href="page7.html">좌석배치도</a></li>
									</ul>
								</li>
								<li>
									<a href="">예매정보</a>
									<ul>
										<li><a href="subpage-ticketmethod.html">티켓구입방법</a></li>
										<li><a href="subpage-ticketreceive.html">티켓수령방법</a></li>
										<li><a href="subpage-ticketcancel.html">예매취소,변경안내</a></li>
										<li><a href="subpage-ticketprovision .html">예매약관</a></li>					
									</ul>
								</li>
								<li>
									<a href="page9.html">고객센터</a>
									<ul>
										<li><a href="page9.html">FAQ</a></li>
										<li><a href="#">관람예절</a></li>				
									</ul>
								</li>
								<li><a href="subpage-way.html">오시는 길</a></li>
								
								
							</ul>
	
							<ul id="header_center">
								<h1 id="logo">
									<a href="index.html">
									우신문화회관
									</a>
									</h1>	
								
							</ul>
	
							<!--right  -->
							<ul id="header_right">
								<li class="current"><a href="login.html">LOGIN</a></li>
								<li><a href="ticket.html">티켓</a></li>
								<li class="calender">
									<a href="calendar.html">
										<span class="material-symbols-outlined md_20">
											calendar_month
											</span>
								 </a>
								</li>
								<li class="search_icon"><a href="#">
									<span class="material-symbols-outlined md_20">
										search
										</span>
								</a></li>
							</ul>
						</nav>

						<!--❤️여기에 서브제목 입력하세욮 ex) 공연일정-->
						<div id="sut-t_wrap">
						<h2 id="sub-t">
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">회원 가입</strong>
						</h2>
					</div>
					</section>

						<!--------------------------------------위까지가 헤더----------------------------------------->

				
				</section>

			<!-- 로그인 영역 -->
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
								<!-- display:none -->
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
				<!-- 회원가입 jsp -->
				<%request.setCharacterEncoding("UTF-8"); %>
				
				
					
					<!-- useBean을 사용하여  MemberVO를 불러온다 -->
				   
					<jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="page"/>
					<!-- VO에 있는 모든 값을 set해줌  -->
					 <jsp:setProperty property="*" name="mbVO"/>
					 
					
					<!-- 회원가입 페이지에서 넘어온 정보를 넣어준다. -->
			<%--   <jsp:setProperty property="name" name="mbVO"/>
					<jsp:setProperty property="memberId" name="mbVO"/>
					<jsp:setProperty property="pwd" name="mbVO"/>
					<jsp:setProperty property="birth" name="mbVO"/>
					<jsp:setProperty property="gender" name="mbVO"/>
					<jsp:setProperty property="zipcode" name="mbVO"/>
					<jsp:setProperty property="addr1" name="mbVO"/>
					<jsp:setProperty property="addr2" name="mbVO"/>
					<jsp:setProperty property="email" name="mbVO"/>
					<jsp:setProperty property="phone" name="mbVO"/>
					<jsp:setProperty property="hPhone" name="mbVO"/>
					<jsp:setProperty property="mailChk" name="mbVO"/>
					<jsp:setProperty property="smsChk" name="mbVO"/>  --%>
					<%-- <jsp:setProperty property="inputdate" name="mbVO"/> 
					<jsp:setProperty property="status" name="mbVO"/>  
					 --%>
				
			
					
					
				  <% 
					MemberDAO mbrDAO = MemberDAO.getInstance();
					try{
					int cnt = mbrDAO.insertMember(mbVO);
					
					if(cnt==-1){%>
						<script>
							alert("회원가입 실패")
							location.href="http://localhost/group2_prj/signUp/signup.jsp"
							</script>
					<%
						}else{%>
					
						<script>
						alert("회원가입완료")
					 /* location.href="http://localhost/jsp_prj/design%20final%20intergration/signup_result.html";  */
					</script>
					<% }//end if 
					
					
					}catch(SQLException se){%>
						<script>
							alert("회원가입 오류")
						</script>	
						
						
					<%}finally{
						
						}%>   
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
								<a href="index.html">메인</a>
							</button>
							<button class="login_back">
								<a href="login.html">로그인</a>
							</button>
						</div>
					</div>

					</div>
				</div>
			
				
		

				<!----------------------------------------------여기서부터 끝까지 footer-------------------------------------------->

			<!-- Footer -->
				<section id="footer">
					<div class="footer_line"></div>
					<div class="container">
						<div class="row">
							<div class="col-8 col-12-medium">
								<section>
									<header>
										<h2>
											<a href="index.html">
												<img class="footer_logo" src="common\logo_white.png" alt="우신문화회관">
											</a>
										</h2>
										<div class="l">
											<address>
												재단법인 우신문화회관 서울특별시 쌍용구 우신대로 175 (우신로) (우)03172
											  <br/>
											  대표자 : 최정민 유원준 정선홍 하지윤 유설빈 사업자등록번호 : 101-12-12345
												<br/>
												통신판매업신고 : 서울쌍용-0988호
											</address>
											<p class="copyright">
												COPYRIGHT(C) WOOSHIN CENTER FOR THE PERFORMING ARTS. ALL RIGHTS RESERVED</p>
											</p>
										</div>

							</div>
						</div>
					</div>
				</section>

		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>