<%@page import="java.util.List"%>
<%@page import="kr.co.sist.dao.RsrvtDAO"%>
<%@page import="kr.co.sist.vo.RsrvtInfoVO"%>
<%@page import="kr.co.sist.vo.ShowVO"%>
<%@page import="kr.co.sist.dao.MainDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    
<%  /* 여기서는 select 말고 상영일정이랑, 시간을 뿌려줘야되는데 무슨DAO쓰더라 */
	/* String swId = request.getParameter("showId"); */
	String swId = (String)session.getAttribute("showId");
	MainDAO mDAO = MainDAO.getInstance();
	ShowVO sVO = mDAO.selectShowMain(swId);
	
	RsrvtDAO rDAO = RsrvtDAO.getInstance();
	List<RsrvtInfoVO> listRVO = rDAO.selectShowSch(swId);
	
	
%>    

<!DOCTYPE HTML>
<html>
	<head>
		<title>예매하기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<link rel="stylesheet" href="../assets/css/reset.css">
		<link rel="stylesheet" href="../assets/css/headerFooter.css">
		<link rel="stylesheet" href="../assets/css/subheader.css">
		
		<!-- 공연상세페이지만을 위한 css -->
		<link rel="stylesheet" href="../assets/css/perform.css">
		<link rel="stylesheet" href="../assets/css/tab.css">
		
		
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<style>

			#nav{
						margin-right: 150px;
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
					<div class="container">
						<div class="row">
							<div class="col-4 col-12-medium">

								<!-- Sidebar -->
									<section class="box">
										<a class="image featured"><img src="poster/rj.jpeg" alt="" /></a>
										<header>
											<h3 class="h3"><%=swId %>qqqq</h3>
										</header>
									</section>
									<section class="box">
										<ul class="divided">
											<li>기간　　<%=sVO.getStartDate() %>~<%=sVO.getEndDate() %></li>
											<li>장소　　우신문화회관 대극장</li>
											<li>연령　　<%=sVO.getRatingId() %></li>
											<li>티켓　　<%=sVO.getPrice() %></li>
											<li>공연시간　　<%=sVO.getRunningTime() %></li>
										</ul>
									</section>

							</div>
							<div class="col-4 col-12-medium">
							<!-- /////////////////////////////////////////////////// -->
							<form action="show_rsrvt2.jsp" method="get" id="testSchFrm">
								<!-- Sidebar -->
									<section class="box" style="margin-bottom: 30px; height: 470px;">
										<header>
										
											<h3 class="h3">날짜선택</h3>
										</header>
										<footer>
										<!-- <input type="date" name="서버가 인식할값" value="서버에 전송할값"><br> -->

										<select name="schtest">
										<% for(RsrvtInfoVO rVO : listRVO){ %>
											<option value="<%=rVO.getSchId()%>"><%=rVO.getSchDate()%>,<%=rVO.getSchTime()%></option>
											<%-- <input type=radio name="schdate" value="<%=rVO.getSchId()%>"><%=rVO.getSchDate()%>,<%=rVO.getSchTime()%><br> --%>
											<%-- <input type="text" name="schtime" value="<%=rVO.getSchTime()%>"> --%>
												<%-- <%= rVO.getSchDate() %>,<%= rVO.getSchTime() %> --%>
										<%} %>
										</select>
										
										
										</footer>
									</section>
									<section class="box" style="margin-bottom: 30px;">
										<header>
											<h3 class="h3">시간선택</h3>
										</header>
										<ul class="divided">
										<!-- 이거 처리를 어떻게 ?  -->
											<li>15:00</li>
											<li>18:00</li>
										</ul>
									</section>
								<a href="page2.html" class="button alt button_minBack" style="background: #c5c5c3;">이전</a>
								<!-- <a href="show_rsrvt2.jsp" class="button alt button_minNext">다음</a> -->
								<input type="submit" value="테스트">
							</form>	
							<!-- /////////////////////////////////////////////////// -->
							</div>
						</div>
					</div>
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

		<script src="../assets/js/jquery.dropotron.min.js"></script>
		<script src="../assets/js/browser.min.js"></script>
		<script src="../assets/js/breakpoints.min.js"></script>
		<script src="../assets/js/util.js"></script>
		<script src="../assets/js/main.js"></script>
			
			<!-- tap관련 추가한거 -->
			<script src="../assets/js/tab.js"></script>

	</body>
</html>