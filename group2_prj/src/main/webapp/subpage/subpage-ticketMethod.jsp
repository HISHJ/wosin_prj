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
		<title>예매안내</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/main.css" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/reset.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/subheader.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/headerFooter.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/navtab.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/login.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/ticket.css">
		<!-- 10-16 하지윤: 이거 어딨는거야 파일 못 찾음 -->
		<link rel="stylesheet" type="text/css" href="/static/portal/css/layout_new.css">
		
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<!--제이쿼리-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<style>
			#nav{
				margin-right:170px;
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
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">티켓구입방법</strong>
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
									<span>고객센터</span>
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
									<a href="#"><span>티켓구입방법</span></a>
									<ul class="depth">
									<li><a href="http://localhost/group2_prj/subpage/subpage-ticketMethod.jsp" ><span>티켓구입방법</span></a></li>
									<li><a href="http://localhost/group2_prj/subpage/subpage-ticketReceive.jsp" ><span>티켓수령방법</span></a></li>
									<li><a href="http://localhost/group2_prj/subpage/subpage-ticketCancel.jsp" ><span>예매변경·취소안내</span></a></li>
									<li><a href="http://localhost/group2_prj/subpage/subpage-ticketProvision.jsp" ><span>예매약관</span></a></li>
									</ul>
									</div>
							</li>
						
						</li>
					</ul>
				</div>

			</div>

					<!---여기까지는 공통영역-->

			<!-- Main -->
			
								<!--내용 시작-->  
								<script>
									$(window).resize(function(){
										if ( $(window).width() > 1024 ){
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
								<div id="cont">
									<div id="sub_page">
										<div class="inner">
											
										</div>
								
										<script>
										var loc = $("#depth_w > div > ul > li").length - 1;
										$("#depth_w .dep1").addClass("li"+loc);
								
										var len = $(".tabs-st1 li").length;
										$(".tabs-st1").addClass("li"+len);
										</script>
								
										<div class="sub_page">
										
								<article class="ticket_com inner">
								<ul>
									<li class="group">
										<div class="tit">인터넷 예매 <span>인터넷 예매는 PC 홈페이지 및 모바일웹에서 예매가 가능합니다. </span></div>
										<div class="cont">
											<dl class="t1">
												<dt> * 예매 시간</dt>
												<dd> 24시간 예매 가능  (공연시간 2시간 전까지 인터넷 예매 가능, 일부공연 제외)</dd>
												<dt> * 예매 방법</dt>
												<dd>회원가입 및 로그인    >    공연선택    >    예매날짜 / 시간 / 좌석 선택    >    결제선택 / 예매완료</dd>
												<dt> * 예매 수수료</dt>
												<dd> 예매 수수료 없음 </dd>
												<dt> * 결제방법 </dt>
												<dd>
													<strong class="t"> 신용카드 결제</strong>
								 카드결제를 하시면 바로 결제가 완료됩니다.
								 <div class="sect">
								<strong class="t">  가상계좌 결제</strong>
								<ol class="bul-decimal">
								<li>가상계좌는 해당 공연일로부터 3일 전까지 전화나 인터넷으로 예매 할 수 있습니다.</li>
								<li>가상계좌 결제 시, 예매완료 후 받으시는 가상계좌번호로 입금하시기 바랍니다.<br>
									(가상계좌번호는 입장권 결제마다 개별적으로 부여되는 번호입니다. 입금처리가 되면 실시간으로 결제처리가 되기 때문에 <br/>입금 확인하실 필요가 없습니다.)</li>
								<li>가상계좌번호는 부여 받은 후 공연일 4일 전 예매일 기준 다음날 오후 11시 59분 이전까지, 공연일 3일 전 기준 예매 당일<br/> 오후 11시 59분 이전까지 유효합니다. 
									그 이후에는 자동 소멸되기 때문에 입금이 되지 않습니다.</li>
									</ol>
												</div>	
												</dd>
											</dl>
										</div>
									</li>
									<li class="group">
										<div class="tit">전화 예매</div>
										<div class="cont">
											<dl class="t1">
												<dt> * 예매 시간</dt>
												<dd>  09:00 ~ 20:00 (연중무휴)  <span class="color-purple">*연중무휴 , 공연 2시간전까지 가능, 일부 공연에 한하여 전화 예매가 불가능 할 수 있습니다. </span></dd>
												<dt>  * 예매 방법</dt>
												<dd>전화  : 02 - 399 - 1000</dd>
												<dt> * 예매 수수료</dt>
												<dd> 예매 수수료 없음 </dd>
												<dt> * 결제방법 </dt>
												<dd>
													 신용카드 , 가상계좌 결제 가능
												</dd>
											</dl>
										</div>
									</li>
									<li class="group">
										<div class="tit">서비스 플라자 현장예매</div>
										<div class="cont">
											<dl class="t1">
												<dt> * 예매 시간</dt>
												<dd>  10:00 ~ 20:00 (연중무휴) <span class="color-purple">*점심시간: 13시~14시</span></dd>
												<dt>  * 예매 방법</dt>
												<dd>서비스 플라자를 방문하시면 바로 예매하실 수 있습니다. 서비스 플라자 위치는 세종문화회관 중앙계단 위에 위치하고 있습니다.  
												<!-- <a href="#" target="_blank" title="새 창으로 이동합니다." class="btn-link"> 서비스플라자 위치보기</a> -->
												</dd>
												<dt> * 예매 수수료</dt>
												<dd> 예매 수수료 없음 </dd>
												<dt> * 결제방법 </dt>
												<dd>
													 신용카드 , 가상계좌 결제 가능
												</dd>
											</dl>
										</div>
									</li>
									<li class="group">
										<div class="tit">장애인 , 국가유공자 우대할인 예매안내</div>
										<div class="cont">
											<ul class="bul-dot t2">
												<li>
												장애인 복지카드와 국가유공자카드를 소지하고 계신 분들의 경우 <strong class="color-navy">50% 할인혜택</strong>을 제공하고 있습니다.
													<ol class="bul-decimal color-navy">
														<li>장애인 복지카드(1급-3급) : 동반 1인까지 50%할인</li>
								<li>장애인 복지카드(4급-6급) : 본인에 한하여 50%할인</li>
								<li>국가유공자카드 : 동반 1인까지 50%할인</li>
								<li>대관공연 및 대관전시의 경우, 해당 기획사의 정책에 따라 차이가 있습니다.</li>
													</ol>
												</li>
												<li>
												장애인 · 국가유공자 우대할인 예매는 인터넷 예매와 현장예매, 전화예매가 가능합니다.(일부 공연의 경우, 전화예매로만 운영될 수 있습니다.)</li>
								<li>인터넷 예매와 현장예매, 전화예매 모두 입장권 수령(발권) 시 장애인 복지카드와 국가유공자 카드를 반드시 제시하셔야 합니다.<br>
								(미증빙시 할인을 받으실 수 없으며, 선 할인 받은 금액이 있으면 차액을 지불하셔야 합니다.)</li>
								<li class="rel"><strong class="color-navy">인터넷 예매</strong> 할인권종에서 장애인 국가유공자 할인을 선택하여 선 할인 예매 후 장애인 복지카드, 국가유공자 카드를 지참하시고 현장에서 증빙 후<br/>
																								 입장권을 수령해 주시기 바랍니다.</li>
								<li class="rel"><strong class="color-navy">현장 예매 </strong> 장애인 복지카드, 국가유공자 카드를 지참하시고 현장에서 증빙 후 예매와 발권을 동시에 진행하시면 됩니다.</li>
								<li class="rel"><strong class="color-navy">전화 예매 </strong> 세종문화회관 고객센터에서 전화예매 시 장애인, 국가유공자임을 말씀해 주시고, 현장에서 장애인 복지카드, 
														 국가유공자 카드 지참하시어<br/> 증빙 후 입장권을 수령해 주시기 바랍니다.</li>
											</ul>
										</div>
									</li>
								</ul>
								</article>
										</div>
									</div>
								
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