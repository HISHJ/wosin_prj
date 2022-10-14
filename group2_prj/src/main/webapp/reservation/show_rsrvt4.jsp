<%@page import="java.util.Enumeration"%>
<%@page import="kr.co.sist.vo.RsrvtInfoVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.dao.RsrvtDAO"%>
<%@page import="kr.co.sist.vo.ShowVO"%>
<%@page import="kr.co.sist.dao.MainDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    
    
    
<%
// 공연코드랑, swId랑, 좌석이름, 좌석아이디??는어떻게받더라?
	String swId = (String)session.getAttribute("showId");
	MainDAO mDAO = MainDAO.getInstance();
	ShowVO sVO = mDAO.selectShowMain(swId); // 다주는 메서드
	
	pageContext.setAttribute("sVO", sVO);
	//System.out.println(swId);
	//System.out.println(sVO.getName());
	
	String schId = (String)session.getAttribute("schTest");
	System.out.println(schId);
	System.out.println(swId); // ㅇㅇ 둘다 잘 받아졌음 
	RsrvtDAO rDAO = RsrvtDAO.getInstance();
	////////////////////////////////////////////////
	
	//받아온값을 다 활용해서 RsrvtInfoVO에 넣고 그 VO를 script에서 버튼눌리면 VO를 넣는다?? 되나?되겠지뭐
	
	request.setCharacterEncoding("UTF-8");
	Enumeration rp = request.getParameterNames();
	while(rp.hasMoreElements()){
		String getrp = rp.nextElement()+"";
		System.out.println("@@@@request : "+getrp+":"+request.getParameter(getrp)); // values안하니까 좌석 하나만 나옴 ㅇㅇ
	}
	Enumeration se = session.getAttributeNames();
	while(se.hasMoreElements()){
		String getse = se.nextElement()+"";
		System.out.println("@@@@session : "+getse+":"+session.getAttribute(getse));
	}
	
	
	RsrvtInfoVO rVO = (RsrvtInfoVO)request.getAttribute("req_rVO");
	System.out.println("show_rsrvt4.jsp에서 받음 ㅇㅇ"+rVO.toString());
	
	String[] selectedSeats = (String[])session.getAttribute("selectedSeats");
	for(String str : selectedSeats){
		System.out.print(str+",");
	}
	
	
	//******************* rsrvtInfoVO 를 만들고 거기에 값을 다 넣고 이 VO로 쿼리문을 실행해야지?
%>    
<!DOCTYPE HTML>
<!--
	Dopetrope by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>예매하기 | 예매완료</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<link rel="stylesheet" href="../assets\css\reset.css">
		<link rel="stylesheet" href="../assets\css\headerFooter.css">
		<link rel="stylesheet" href="../assets\css\subheader.css">
		
		<!-- 공연상세페이지만을 위한 css -->
		<link rel="stylesheet" href="../assets\css\perform.css">
		<link rel="stylesheet" href="../assets\css\tab.css">
		
		<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.dropotron.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
			
			<!-- tap관련 추가한거 -->
			<script src="assets/js/tab.js"></script>
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		
		<style>
#nav{
			margin-right: 150px;
		}

		</style>
		<script>
		$(function(){
			$("#rsrvt_test_ok").click(function(){
				<%
				// 세션값지우기
				session.removeAttribute("selectedSeats");
				session.removeAttribute("showId");
				session.removeAttribute("schTest");
				
				// session iinvalidate는 아이디는 세션에있어야하니까 사용하지않고? ㅇㅇ
				%>
				
				/* location.href="show_rsrvt5_testtesttesttesttest.jsp"; 세션값확인 테스트용 */
				location.href="http://localhost/group2_prj/main/index.jsp";
			})
		})
		</script>
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
										<li><a href="subpage-manner.html">관람예절</a></li>				
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
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">예매하기</strong>
						</h2>
					</div>
					</section>

						<!--------------------------------------위까지가 헤더----------------------------------------->
				<!-- Main -->
				<section id="main">
				<form>
					<div class="container">


						<div class="col-12">

							<!-- Blog -->
								<section>
									<div class="row">
										<div class="col-4 col-12-small">
											<section class="box" style="margin-bottom: 30px;">
												<a class="image featured"><img src="poster/rj.jpeg" alt="포스터" /></a><!-- 사진에도 링크 ㅇㅇ  -->
												<header>
													<h3><%=rVO.getShowName() %></h3>
													
												</header>
											</section>
										</div>
										<div class="col-8 col-12-small">
											<section class="box" style="margin-bottom: 30px;">
												<header>
													<ul class="divided">
														<li class="h3">예매완료</li>
														<li>날짜　　<%=rVO.getSchDate() %></li>
														<li>장소　　우신문화회관 대극장</li>
														<li>시간　　<%= rVO.getSchTime() %></li>
														<li>좌석  
															<%if(selectedSeats.length>0){
																for(int i=0;i<selectedSeats.length;i++){%>
																	<input type="text" name="seats" value="<%= selectedSeats[i]%>" readonly="readonly"
																		style="border:none; width:25px; margin-left:30px; display:inline; color:#555555; padding:0px; font-weight: 900">번
																<%}
															}%></li>
														<li>예매번호　　<%=rVO.getRsrvtId() %></li>
														
													</ul>
												</header>
											</section>
										</div>
									</div>
								</section>

						</div>


							<!-- <a href="index.jsp" class="button alt button_minNext">메인으로</a> -->
							<input type="button" id="rsrvt_test_ok" class="button alt button_minNext" value="메인으로">
						
					</div>
				</form>					
				</section>
		

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

		

	</body>
</html>