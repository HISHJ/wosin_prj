<%@page import="userVO.ShowVO"%>
<%@page import="java.util.List"%>
<%@page import="userDAO.ShowDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="scriptlet의 사용" %>
<!DOCTYPE html>
<html>
<head>
		<title>공연검색결과</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		
		<!-- 부트스트랩 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets\css\reset.css">
		<link rel="stylesheet" href="assets\css\headerFooter.css">
		<link rel="stylesheet" href="assets\css\subheader.css">
		
		<!-- 공연상세페이지만을 위한 css -->
		<link rel="stylesheet" href="assets\css\NewFile.css">
		<link rel="stylesheet" href="assets\css\perform.css">
		
		<!-- 부트스트랩 -->
		
		
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<style>

#nav{
			margin-right: 130px;
		}
	
	</style>	
	</head>
	<body class="homepage is-preload">
<%
String showName = request.getParameter("showName"); //값 잘 받아와짐

ShowDAO sDAO = ShowDAO.getInstance();
List<ShowVO> shoList = sDAO.selectMainShow(showName);

%>	
	
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
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">공연검색결과</strong>
						</h2>
					</div>
					</section>

						<!--------------------------------------위까지가 헤더----------------------------------------->
<!-- Main -->
<section id="main">
	<div class="container">

						<!-- Content -->
	<article class="box post">
						<!-- 따온거  -->
	<!-- 					
		<form name="frm" id="frm" method="get" action="/portal/performance/performance/list.do">
			<input type="hidden" name="pageIndex" value="">
			<input type="hidden" name="menuNo" value="200004">
			<input type="hidden" name="searchPackage" value="">
			<input type="hidden" name="searchSort" id="searchSort" value="1">
			
			<div class="schedule__date">
				<div class="item" style="height: 80px">
					<input type="radio" name="schRange" id="range1" value="1" />
					<label for="range1">오늘</label>
					<input type="radio" name="schRange" id="range2" value="2" />
					<label for="range2">1주</label>
					<input type="radio" name="schRange" id="range3" value="3" checked/>
					<label for="range3">1개월</label>
					<input type="radio" name="schRange" id="range4" value="4" />
					<label for="range4">3개월</label>
					<input type="radio" name="schRange" id="range5" value="5" />
					<label for="range5">전체</label>
				</div>
				<a href="javascript:void(0);" class="arrow prev">이전</a>
				
				<p class="txt" id="yearData">2022</p>
				<a href="javascript:void(0);" class="arrow next">다음</a>
			</div>
			
			<div class="schedule_w item5">
				<ul class="clearfix">
					<li class="item s1" tabindex="0">
						<span class="t">기간은?</span>
						<div class="cont rangeArrow">
							<input type="hidden" name="sdate" class="sdate" id="period1" value="2022-09-17" />
							<input type="hidden" name="edate" class="edate" id="period2" value="2022-10-17"/>
							<input type="text" class="datepickerRange" value="2022-09-17 - 2022-10-17"/>
						</div>
					</li>
					<li class="item s2" tabindex="0">
						<div class="cont">
							<select name="searchGenreCdData" id="searchGenreCdData">
								<option value="" >장르선택</option>
									<option value="1001" >뮤지컬</option>
									<option value="1002" >기악</option>
									<option value="1003" >오페라</option>
									<option value="1004" >무용</option>
							</select>
						</div>
					</li>
					
					<li class="item s4" tabindex="0">
						<label for="searchWrd" class="hide">공연명은?</label>
						<div class="cont">
							<input type="hidden" name="searchCnd" value="1" />
							<input type="text" name="searchWrd" id="searchWrd" placeholder="공연명을 입력하세요."  value="" onkeypress="press(event);"/>
							<button type="button" onclick="fn_search('1')" value="검색">검색</button>
						</div>
					</li>
				</ul>
			</div>
		</form> -->
		
		<% if(shoList != null && !shoList.isEmpty()){
		for(ShowVO shVO : shoList){%>
	
		<!-- p에 있는 텍스트 마우스오버시 색상 안바뀌게, 이미지 배열 -->
		  <div class="poster_wrap">
        	<div class="row row_flex " >
           		<div class="col set">
					<div class="card" style="width: 18rem;">
					<a href="page2.html"><img src="http://localhost/2ndProject_2/ysb/common/<%=shVO.getThImg() %>.do" class="card-img-top" alt="<%= shVO.getName() %>">
						<!-- <a href="page2.html"><img src="poster/rj.jpeg" class="card-img-top" alt="..."> -->
					 	<div class="card-body">
					    <h5 class="card-title h3"><%= shVO.getName() %></h5>
					    <p class="card-text datail1"  style="color: #111111;"><%=shVO.getTotalDate() %></p>
					    <p class="card-text datail2"><%= shVO.getGenreType() %></p>
		 				</div>
		  				</a>
					</div>
				</div>
			</div>
			<%} %>
			<%} %>
       
				<!-- ▲ row -->
			</div> <!--포스터 감싸기 끝-->

		
						<!-- 따온거 끝  -->
		</article>
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

		<!-- </div> -->

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			
			<!-- 추가한거 -->
			<script src="assets/js/tab.js"></script>

	</body>
</html>