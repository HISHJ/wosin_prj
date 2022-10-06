<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>우신문화회관</title>
<link rel="stylesheet" type="text/css" href="slick/slick.css" />
<link rel="stylesheet" type="text/css" href="slick/slick-theme.css" />
<link rel="stylesheet" href="assets/css/main.css" />
<!-- jQuery -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- 슬라이드 라이브러리 -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="slick/slick.min.js"></script>
<!-- 팝업 플러그인 -->
<script type="text/javascript" src="js\slide_me.js"></script>
<script type="text/javascript" 
	src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.js"></script>


<link rel="stylesheet" href="assets\css\mainindex copy.css">
<link rel="stylesheet" href="assets\css\headerFooterIndex.css">
<!-- <link rel="stylesheet" href="assets\css\headerFooter.css"> -->
<link rel="stylesheet" href="assets\css\main_style.css">
<link rel="stylesheet" href="assets\css\popup.css">


<!--aos 라이브러리-->
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />

<!--google icons-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<!--google fonts-->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<style>
	button.play{
		margin-right:20px;
	}
	
	button.stop{
		margin-right:50px;
	}

	h1#logo{
		margin-right:20px;
		margin-left:10px
	}
</style>

<script>
	$(function() {
		//썸네일 클릭
		$(".rel").each(function(i) {
			$(this).hover(function(e) {
				$(this).css({
					"display" : "block"
				}, {
					"opacity" : "0"
				})
			})

		})

		$(".box_s_img").each(function(i) {
			$(this).click(function(e) {
				$(this).toggleClass("active-color")

			})

		})

		//검색 팝업창 
		$(function() {
			$("#search_btn").click(function() {
				$('#top_sch').bPopup();
			})

			$(".close").click(function() {
				window.location.reload();
			})

		})

	})
</script>

</head>

<body class="homepage is-preload">
	<div id="page-wrapper">

    <section id="header">
				
      <!-- Logo -->
        
      <!-- Nav -->
        <nav id="nav">
          <!-- left -->
          <ul id="header_left">
            <li class="current">
              <a href="index.html">공연정보</a>
              <ul>
                <li><a href="page1.html">공연일정</a></li>
								<li><a href="page2.html">공연정보상세보기</a></li>
                <li><a href="page7.html">좌석배치도</a></li>
              </ul>
            </li>
            <li>
              <a href="#">예매정보</a>
              <ul>
                <li><a href="subpage-ticketmethod.html">티켓구입방법</a></li>
                <li><a href="subpage-ticketreceive.html">티켓수령방법</a></li>
                <li><a href="subpage-ticketcancel.html">예매취소,변경안내</a></li>
                <li><a href="subpage-ticketprovision .html">예매약관</a></li>					
              </ul>
            </li>
            <li>
              <a href="subpage-FAQ1.html">고객센터</a>
              <ul>
                <li><a href="subpage-FAQ1.html">FAQ</a></li>
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
              <a href="calendar.html" class="btn-book btn">
                <span class="material-symbols-outlined md_20">
                  calendar_month
                  </span>
             </a>
            </li>
            <li id="search_btn" class="search_icon">
							<a href="#">
              <span class="material-symbols-outlined md_20">
                search
                </span>
								</a>
           </li>
          </ul>
        </nav>
</section>


					<!--검색FORM-->

					<!-- SEARCH FORM -->
	<article id="top_sch">
		<!-- <button type="button" class="close first">닫기</button> -->
		<form name="searchFrm" id="searchFrm" action="/portal/search/list.do?menuNo=200174"	method="post">
		<div class="sch">
			<label for="sch_word" class="hide">검색어</label>
			<input type="text" name="kwd" id="sch_word" value="" placeholder="검색어를 입력해주세요." />
			<button type="submit" >검색</button>
		</div>
		</form>
		<div class="inner">
					<div class="sch_txt table">
						<div class="vertical" id="top_apc_right_msg">		<!-- "top_apc_right_msg"  ID 추가 및 기본 안내문구에서 두번째 제거 (20200906) -->
							<p class="bul-mark b">검색어를 입력하세요.</p>
							<!-- <p class="bul-caution">검색결과가 없습니다.</p> -->
						</div>
					</div>
				</li><!-- .r -->
			</ul>

		</div>
		<button type="button" class="close close-pop">닫기</button>
	</article>
	<!-- SEARCH FORM -->


					<!--검색FORM-->



		<!--검색FORM-->

		<link rel="stylesheet" href="assets\css\mainindex copy.css">
		<style>
			.js .slider-single>div:nth-child(1n+2) {
				display: none
			}
			
			.js .slider-single.slick-initialized>div:nth-child(1n+2) {
				display: block
			}
			
			.slider-nav .slick-slide {
				cursor: pointer;
			}
			
			/* .div_slider_nav{
			      background-color:rgba(0, 0, 0, 0.8);
			    }  */
			.div_slider_nav .img-box {
				display: flex;
				justify-content: center;
				align-items: center;
				margin: 10px;
				width: 40px;
			}
		</style>

		<div id="page">
			<div class="rows">
				<div class="column small-11 small-centered">
					<div class="slider slider-single">

						<div>
							<div class="img-box img-box-f ">
								<img src="images/imageSrc (2).jpeg"
									alt="2022 가을·겨울 시즌 패키지 티켓 오픈">
								<!-- <figcaption class="hide">2022 가을·겨울 시즌 패키지 티켓 오픈</figcaption> -->
								<div class="btn-wrap">
									<a href="page2.html"><button class="go_show_con">상세보기</button></a>
									<!-- <button class="go_show_con"><a href="page2.html">상세보기</a></button>  -->
								</div>
							</div>
						</div>
						<div>
							<div class="img-box  img-box-f">
								<img src="images/imageSrc (1).jpeg" alt="오페라 로미오와 줄리엣">
								<!-- <figcaption class="hide">오페라 로미오와 줄리엣</figcaption> -->
								<div class="btn-wrap">
									<a href="page2.html"><button class="go_show_con">상세보기</button></a>
								</div>
							</div>
						</div>
						<div>
							<div class="img-box  img-box-f">

								<img src="images/imageSrc (4).jpeg" alt="">
								<div class="btn-wrap">
									<a href="page2.html"><button class="go_show_con">상세보기</button></a>
								</div>
							</div>
						</div>
						<div>
							<div class="img-box  img-box-f">

								<img src="images/imageSrc (9).jpeg" alt="">
								<div class="btn-wrap">
									<a href="page2.html"><button class="go_show_con">상세보기</button></a>
								</div>
							</div>
						</div>
						<div>
							<div class="img-box img-box-f">

								<img src="images/imageSrc (3).jpeg" alt="">
								<div class="btn-wrap">
									<a href="page2.html"><button class="go_show_con">상세보기</button></a>
								</div>
							</div>
						</div>
						<div>
							<div class="img-box  img-box-f">

								<img src="images/imageSrc (1).jpeg" alt="">
								<div class="btn-wrap">
									<a href="page2.html"><button class="go_show_con">상세보기</button></a>
								</div>

							</div>
						</div>
						<div>
							<div class="img-box  img-box-f">

								<img src="images/imageSrc (4).jpeg" alt="">
								<div class="btn-wrap">
									<a href="page2.html"><button class="go_show_con">상세보기</button></a>
								</div>

							</div>
						</div>
						<div>
							<div class="img-box  img-box-f">

								<img src="images/imageSrc (9).jpeg" alt="">
								<div class="btn-wrap">
									<a href="page2.html"><button class="go_show_con">상세보기</button></a>
								</div>

							</div>
						</div>
						<div>
							<div class="img-box  img-box-f">

								<img src="images/imageSrc (2).jpeg" alt="">
								<div class="btn-wrap">
									<a href="page2.html"><button class="go_show_con">상세보기</button></a>
								</div>

							</div>
						</div>

					</div>



					<div class="nav_wrap">

						<div class="div_slider_nav slider slider-nav">

							<div class="img-box box_s">
								<img class="box_s_img" src="images/imageSrc (10).jpeg" alt="">
							</div>
							<div class="img-box  box_s">
								<img class="box_s_img" src="images/imageSrc (11).jpeg" alt="">
							</div>
							<div class="img-box  box_s">
								<img class="box_s_img" src="images/imageSrc (12).jpeg" alt="">
							</div>
							<div class="img-box  box_s">
								<img class="box_s_img" src="images/imageSrc (13).jpeg" alt="">
							</div>
							<div class="img-box  box_s">
								<img class="box_s_img" src="images/imageSrc (10).jpeg" alt="">
							</div>
							<div class="img-box box_s">
								<img class="box_s_img" src="images/imageSrc (11).jpeg" alt="">
							</div>
							<div class="img-box box_s">
								<img class="box_s_img" src="images/imageSrc (12).jpeg" alt="">
							</div>
							<div class="img-box box_s">
								<img class="box_s_img" src="images/imageSrc (13).jpeg" alt="">
							</div>
							<div class="img-box box_s">
								<img class="box_s_img" src="images/imageSrc (10).jpeg" alt="">
							</div>

						</div>
						<!--슬라이드 시작, 정지버튼-->
						<div class="btn_wrap">
							<button class="play">
								<span class="material-symbols-outlined play"> play_arrow
								</span>
							</button>
							<button class="stop">
								<span class="material-symbols-outlined stop"> stop </span>

							</button>
						</div>

					</div>
				</div>
			</div>

			<!--아이콘 영역---->

			<div id="ml" class="inner aos-init aos-animate" data-aos="fade-up">
				<ul class="clearfix s icon_s ms slick-initialized slick-slider">
					<div aria-live="polite" class="slick-list draggable icon_s_inner">
						<div class="slick-track icon_s_in"
							style="opacity: 1; width: 1200px; transform: translate3d(0px, 0px, 0px);">
							<li class="slick-slide slick-current slick-active"
								role="tabpanel" id="slickSlide90" aria-labelledby="slickDot90"
								tabindex="-1" style="width: 150px;" data-slick-index="0"
								aria-hidden="false"><a href="calendar.html" tabindex="0">
									<div class="img" style="top: 0px;">
										<img src="images\m1_3.gif" alt="">
									</div>
									<div class="txt">우신 일정</div>
							</a></li>

							<li class="slick-slide slick-current slick-active"
								role="tabpanel" id="slickSlide90" aria-labelledby="slickDot90"
								tabindex="-1" style="width: 150px;" data-slick-index="1"
								aria-hidden="false"><a href="page7.html" class="hover"
								tabindex="0">
									<div class="img" style="top: 0px;">
										<img src="images\m1_5.gif" alt="">
									</div>
									<div class="txt">좌석배치도</div>
							</a></li>

							<li class="slick-slide slick-current slick-active"
								role="tabpanel" id="slickSlide90" aria-labelledby="slickDot90"
								tabindex="-1" style="width: 150px;" data-slick-index="2"
								aria-hidden="false"><a href="subpage-ticketmethod.html"
								class="hover" tabindex="0">
									<div class="img" style="top: 0px;">
										<img src="images\m1_7.gif" alt="">
									</div>
									<div class="txt">예매안내</div>
							</a></li>

							<li class="slick-slide slick-current slick-active"
								role="tabpanel" id="slickSlide90" aria-labelledby="slickDot90"
								tabindex="-1" style="width: 150px;" data-slick-index="3"
								aria-hidden="false"><a href="subpage-way.html" tabindex="0">
									<div class="img" style="top: 0px;">
										<img src="images\m1_6.gif" alt="">
									</div>
									<div class="txt">오시는 길</div>
							</a></li>

							<li class="slick-slide slick-current slick-active"
								role="tabpanel" id="slickSlide90" aria-labelledby="slickDot90"
								tabindex="-1" style="width: 150px;" data-slick-index="0"
								aria-hidden="false"><a href="subpage-FAQ1.html" tabindex="0">
									<div class="img" style="top: 0px;">
										<img src="images\m1_12.gif" alt="">
									</div>
									<div class="txt">고객센터</div>
							</a></li>

						</div>
					</div>
				</ul>
			</div>
			<!--아이콘 영역 끝✔️-->


			<!--마지막  영역(슬라이드 X)-->
			<link rel="stylesheet" href="assets\css\mainscdslide.css">
			<!--  class="inner aos-init aos-animate" data-aos="fade-up" -->
			<!--썸네일 슬라이드ㅡ-->
			<div class="inner_m aos-init aos-animate" date-aos="fade-up">
				<div id="m2" date-aos="fade-up" class="aos-init aos-animate">
					<div class="in">
						<div class="tit-main">
							<span class="small"> Recommended Program </span>
							<h2 class="t">추천프로그램</h2>
							<!--<a href="#" class="more">더보기</a>-->
							<p class="txt">
								<span class="block-pc"> 오늘의 우신문화회관 </span> <br />추천 프로그램입니다.
							</p>


						</div>
					</div>
					<ul class="clearfix cont s slick-initialized slick-slider">
						<div aria-live="polite" class="slick-list draggable">
							<div class="slick-track"
								style="opacity: 1; width: 3405px; transform: translate3d(-1589px, 0px, 0px);">
								<li class="item slick-slide slick-cloned" role="option"
									tabindex="-1" style="width: 227px" data-slick-index="-3" id
									aria-hidden="true">
									<div class="rel" tabindex="0">
										<a href="page2.html" class="d" tabindex="-1"><img
											src="images\imageSrc (8).jpeg" alt="상세"></a>

									</div>
								</li>

								<li class="item slick-slide slick-cloned" role="option"
									tabindex="-1" style="width: 227px" data-slick-index="-3" id
									aria-hidden="true">
									<div class="rel" tabindex="0">
										<a href="page2.html" class="d" tabindex="-1"><img
											src="images\imageSrc (1).jpeg" alt="상세"></a>

									</div>
								</li>

								<li class="item slick-slide slick-cloned" role="option"
									tabindex="-1" style="width: 227px" data-slick-index="-3" id
									aria-hidden="true">
									<div class="rel" tabindex="0">
										<a href="page2.html" class="d" tabindex="-1"><img
											src="images\imageSrc (2).jpeg" alt="상세"></a>

									</div>
								</li>


								<li class="item slick-slide slick-cloned" role="option"
									tabindex="-1" style="width: 227px" data-slick-index="-3" id
									aria-hidden="true">
									<div class="rel" tabindex="0">
										<a href="page2.html" class="d" tabindex="-1"><img
											src="images\imageSrc (1).jpeg" alt="상세"></a>

									</div>
								</li>
								<li class="item slick-slide slick-cloned" role="option"
									tabindex="-1" style="width: 227px" data-slick-index="-3" id
									aria-hidden="true">
									<div class="rel" tabindex="0">
										<a href="page2.html" class="d" tabindex="-1"><img
											src="images\imageSrc (5).jpeg" alt="상세"></a>

									</div>
								</li>

								<li class="item slick-slide slick-cloned" role="option"
									tabindex="-1" style="width: 227px" data-slick-index="-3" id
									aria-hidden="true">
									<div class="rel" tabindex="0">
										<a href="page2.html" class="d" tabindex="-1"><img
											src="images\imageSrc (8).jpeg" alt="상세"></a>

									</div>
								</li>


								<li class="item slick-slide slick-cloned" role="option"
									tabindex="-1" style="width: 227px" data-slick-index="-3" id
									aria-hidden="true">
									<div class="rel" tabindex="0">
										<a href="page2.html" class="d" tabindex="-1"><img
											src="images\imageSrc (9).jpeg" alt="상세"></a>

									</div>
								</li>


								<li class="item slick-slide slick-cloned" role="option"
									tabindex="-1" style="width: 227px" data-slick-index="-3" id
									aria-hidden="true">
									<div class="rel" tabindex="0">
										<a href="page2.html" class="d" tabindex="-1"><img
											src="images\imageSrc (15).jpeg" alt="상세"></a>

									</div>
								</li>


								<li class="item slick-slide slick-cloned" role="option"
									tabindex="-1" style="width: 227px" data-slick-index="-3" id
									aria-hidden="true">
									<div class="rel" tabindex="0">
										<a href="page2.html" class="d" tabindex="-1"><img
											src="images\imageSrc (10).jpeg" alt="상세"></a>

									</div>
								</li>


								<li class="item slick-slide slick-cloned" role="option"
									tabindex="-1" style="width: 227px" data-slick-index="-3" id
									aria-hidden="true">
									<div class="rel" tabindex="0">
										<a href="page2.html" class="d" tabindex="-1"><img
											src="images\imageSrc (12).jpeg" alt="상세"></a>

									</div>
								</li>


								<li class="item slick-slide slick-cloned" role="option"
									tabindex="-1" style="width: 227px" data-slick-index="-3" id
									aria-hidden="true">
									<div class="rel" tabindex="0">
										<a href="page2.html" class="d" tabindex="-1"><img
											src="images\imageSrc (8).jpeg" alt="상세"></a>

									</div>
								</li>

								<li class="item slick-slide slick-cloned" role="option"
									tabindex="-1" style="width: 227px" data-slick-index="-3" id
									aria-hidden="true">
									<div class="rel" tabindex="0">
										<a href="page2.html" class="d" tabindex="-1"><img
											src="images\imageSrc (21).jpeg" alt="상세"></a>

									</div>
								</li>

							</div>
						</div>
					</ul>
				</div>

			</div>
			<!--#m2---->


		</div>



		<!--마지막 슬라이드 영역 끝-->

		<!-----------------------footer------------------------>

		<!-- Footer  -->
		<section id="footer">
			<div class="footer_line"></div>
			<div class="container">
				<div class="row">
					<div class="col-8 col-12-medium">
						<section>
							<header>
								<h2>
									<a href="index.html"> <img class="footer_logo"
										src="common\logo_white.png" alt="우신문화회관">
									</a>
								</h2>
								<div class="l">
									<address>
										재단법인 우신문화회관 서울특별시 쌍용구 우신대로 175 (우신로) (우)03172 <br /> 대표자 : 최정민
										유원준 정선홍 하지윤 유설빈 사업자등록번호 : 101-12-12345 <br /> 통신판매업신고 :
										서울쌍용-0988호
									</address>
									<p class="copyright">COPYRIGHT(C) WOOSHIN CENTER FOR THE
										PERFORMING ARTS. ALL RIGHTS RESERVED</p>
									</p>
								</div>
					</div>
				</div>
			</div>
		</section>


	</div>
	</div>


	<!------------------------------------------푸터----------------------------------------->

	<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
	<script>
		AOS.init();
	</script>
	
	
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	
</body>
</html>