<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="scriptlet의 사용"%>
<!DOCTYPE HTML>
<!--
	Dopetrope by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>오시는길</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/main.css" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/reset.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/subheader.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/headerFooter.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/navtab.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/login.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/transport.css">

		<!-- 10-16 하지윤: 이거 어딨는거야 파일 못 찾음 -->
		<link rel="stylesheet" type="text/css" href="/static/portal/css/layout_new.css">

		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/navtab.css">
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<!--제이쿼리-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style>
		#nav{
		
		margin-right:180px;
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
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">공연장 위치 안내</strong>
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
									<a href="memberMng.html">
										<span>오시는길</span>
									</a>
									<!-- display:none -->
									<ul class="depth" >
										<li>
											<a href="#">공연정보</a>
										</li>
										<li>
											<a href="#">예매정보</a>
										</li>
										<li>
											<a href="#">고객센터</a>
										</li>
										<li>
											<a href="#">오시는길</a>
										</li>
									</ul>
								</div>
							</li>
						<li>
							<li>
									<div class="rel">
									<a href="http://localhost/group2_prj/subpage/subpage-location.jsp"><span>공연장 위치 안내</span></a>
									</div>
							</li>
						
						</li>
						</ul>
					</div>
	
				</div>
			<script>
				$(window).resize(function(){
					if ( $(window).width() > 800 ){
						$("#depth_w .rel").hover(function(){
							$(this).closest("#depth_w").addClass("on")
							$(this).find(".depth").show();
						},function(){
							$(this).closest("#depth_w").removeClass("on")
							$(this).find(".depth").hide();
						})
						$("#depth_w .rel > a").focus(function(){
							$(this).closest("#depth_w").addClass("on")
							$(this).next(".depth").show();
						})
						$("#depth_w .depth > li:last-child a").focusout(function(){
							$(this).closest("#depth_w").removeClass("on")
							$("#depth_w .depth").stop(true,true).slideUp(150);
						})
					}else {
						$("#depth_w .rel").click(function(){
							$(this).closest("#depth_w").toggleClass("on")
							$(this).find(".depth").toggle();
						})
					}
				}).resize();
				</script>
				<script>
					var loc = $("#depth_w > div > ul > li").length - 1;
					$("#depth_w .dep1").addClass("li"+loc);
			
					var len = $(".tabs-st1 li").length;
					$(".tabs-st1").addClass("li"+len);
					</script>
					<div id="cont">
								
										<div class="sub_page">
										
								<article class="location">
								<style>
								#sub_page{background: #f1f1f1;}
								/* .tabs-st1,#loc{display: none;} */
								</style>
								<div class="bg">
									<div class="tit inner">
										<div class="t">
											<ul class="loc_tabs clearfix">
												<li class="loc1 active"><a href="http://localhost/group2_prj/subpage/subpage-location.jsp"><span>공연장 위치 안내</span></a></li>
												
												<li class="loc2"><a href="http://localhost/group2_prj/subpage/subpage-transport.jsp"><span>대중교통 이용시</span></a></li>
											</ul>
											<dl>
												<dt class="color-navy">공연장 <span>위치안내</span></dt>
												<dd class="add">서울특별시 종로구 세종대로 175 (세종로)<span> 우신문화회관 (우)03172</span></dd>
												<dd class="tel">02-399-1000(오전 9시 ~ 오후 8시)</dd>
												<dd class="link clearfix">
																		<font color="red"><B><p class="bul-mark2 b">세종로 공영주차장 입차 70분 후부터 공연시간(4시간 한정/유료전시 2시간) 이내에 사전 정산을 하시면 
																													공연 종료 후 출차 시 혼잡으로 인한 서비스 시간을 적용 받으실 수 있습니다. <span>광화문광장 공사 및 외부 
																													교통 신호등에 의해 차량 정체가 빈번히 발생하오니 가급적 대중교통을 이용해 주시기 바랍니다. 
																													</span> </p></B></font>																												
													
													
												</dd>
											</dl>
										</div>
										<ul class="area" id="area">
											<li class="active m1" tabindex="0"><img style="height: 500px; width: auto;" src="http://localhost/group2_prj/images/1.jpg" alt="지도API사용"> <a href="#tabs" class="sc hide"></a></li>
										</ul>
									</div>
								</div>
							</article>
										</div>
									<!-- </div> -->
								</div><!-- #cont -->

								<!-- 내용 끝 -->

					

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
			<script src="http://localhost/group2_prj/assets/js/jquery.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/jquery.dropotron.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/browser.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/breakpoints.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/util.js"></script>
			<script src="http://localhost/group2_prj/assets/js/main.js"></script>

	</body>
</html>