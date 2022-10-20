<%@page import="java.util.Enumeration"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.dao.MainDAO"%>
<%@page import="kr.co.sist.vo.ShowVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
//검증완료
String memberId = (String) session.getAttribute("memberId");

MainDAO mDAO = MainDAO.getInstance();
List<ShowVO> swList = mDAO.selectThImg();

session.removeAttribute("selectedSeats");
session.removeAttribute("showId");
session.removeAttribute("schTest");
session.removeAttribute("year");
session.removeAttribute("lastday");
session.removeAttribute("adminId");
session.removeAttribute("rId");
session.removeAttribute("day");
session.removeAttribute("month");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>우신문화회관</title>
<link rel="stylesheet" type="text/css"
	href="http://localhost/group2_prj/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="http://localhost/group2_prj/slick/slick-theme.css" />
<link rel="stylesheet"
	href="http://localhost/group2_prj/assets/css/main.css" />
<!-- jQuery -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- 슬라이드 라이브러리 -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript"
	src="http://localhost/group2_prj/slick/slick.min.js"></script>
<!-- 팝업 플러그인 -->
<script type="text/javascript"
	src="http://localhost/group2_prj/js/slide_me.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.js"></script>
<link rel="stylesheet"
	href="http://localhost/group2_prj/assets/css/mainindex copy.css">
<!-- 왜 copy? -->
<link rel="stylesheet"
	href="http://localhost/group2_prj/assets/css/headerFooterIndex.css">
<link rel="stylesheet"
	href="http://localhost/group2_prj/assets/css/main_style.css">
<link rel="stylesheet"
	href="http://localhost/group2_prj/assets/css/popup.css">
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
button.play {
	margin-right: 20px;
}

button.stop {
	margin-right: 50px;
}

h1#logo {
	margin-right: 20px;
	margin-left: 10px
}

/*설빈 2022-10-17*/
#m2 {
	padding: 60px 130px !important;
}

.slick-slide {
	width: 92px;
}

button.go_show_con {
	bottom: -130px !important;
	left: 300px !important;
}

div.btn-wrap {
	width: 0px !important;
	height: 0px !important;
	margin-top: 100px;
}

@media screen and (max-width: 1700px) {
	button.go_show_con {
		bottom: -50px !important;
		left: 240px !important;
	}
} /* 1700px */
@media screen and (max-width: 1620px) {
	button.go_show_con {
		bottom: -20px !important;
		left: 210px !important;
	}
} /* 1600px */
@media screen and (max-width: 1550px) {
	button.go_show_con {
		bottom: 0px !important;
		left: 200px !important;
	}
} /* 1600px */
@media screen and (max-width: 1530px) {
	button.go_show_con {
		bottom: 0px !important;
		left: 200px !important;
	}
} /* 1530px */
@media screen and (max-width: 1430px) {
	button.go_show_con {
		margin-bottom: 300px;
		left: 170px !important;
	}
	@media screen and (max-width: 1297px) {
		button.go_show_con {
			margin-bottom: 310px;
			left: 150px !important;
		}
		@media screen and (max-width: 1290px) {
			button.go_show_con {
				display: none;
			}
		}
	}
} /* 1530px */
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

		<!-- 헤더 -->
		<c:import
			url="http://localhost/group2_prj/common/user_subpage_header.jsp">
			<c:param name="memberId" value="<%=memberId%>"></c:param>
		</c:import>
		<!-- 헤더 -->

		</section>


		<!-- SEARCH FORM -->
		<article id="top_sch">
			<form name="searchFrm" id="searchFrm"
				action="http://localhost/group2_prj/reservation/mainSearch_result.jsp"
				method="get">
				<div class="sch">
					<label for="sch_word" class="hide">검색어</label> <input type="text"
						name="kwd" id="sch_word" value="" placeholder="검색어를 입력해주세요." />
					<button type="submit">검색</button>
				</div>
			</form>
			<div class="inner">
				<div class="sch_txt table">
					<div class="vertical" id="top_apc_right_msg">
						<!-- "top_apc_right_msg"  ID 추가 및 기본 안내문구에서 두번째 제거 (20200906) -->
						<p class="bul-mark b">검색어를 입력하세요.</p>
					</div>
				</div>
				</li>
				<!-- .r -->
				</ul>

			</div>
			<button type="button" class="close close-pop">닫기</button>
		</article>
		<!-- SEARCH FORM -->



		<!--검색FORM-->

		<link rel="stylesheet"
			href="http://localhost/group2_prj/assets/css/mainindex copy.css">
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
						<%
						for (int i = 0; i < swList.size(); i++) {
						%>
						<div>
							<div class="img-box img-box-f ">
								<img
									src="http://localhost/group2_prj/admin/img/<%=swList.get(i).getmImg()%>">
								<!-- <figcaption class="hide">2022 가을·겨울 시즌 패키지 티켓 오픈</figcaption> -->
								<div class="btn-wrap">
									<a
										href="http://localhost/group2_prj/reservation/show_info.jsp?showId=<%=swList.get(i).getShowId()%>">
										<button class="go_show_con" style="padding: 15px 30px;">상세보기</button>
									</a>
								</div>
							</div>
						</div>
						<%
						}
						%>
					</div>



					<div class="nav_wrap">

						<div class="div_slider_nav slider slider-nav"
							style="padding-top: 30px;">
							<%
							for (int i = 0; i < swList.size(); i++) {
							%>
							<a
								href="http://localhost/group2_prj/reservation/show_info.jsp?showId=<%=swList.get(i).getShowId()%>">
								<img
								src="http://localhost/group2_prj/admin/img/<%=swList.get(i).getThImg()%>"
								style="width: 120px; height: 140.91px; margin-left: -100px;">
							</a>
							<%
							}
							%>

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
								aria-hidden="false"><a
								href="http://localhost/group2_prj/reservation/calendar.jsp"
								tabindex="0">
									<div class="img" style="top: 0px;">
										<img src="http://localhost/group2_prj/images/m1_3.gif" alt="">
									</div>
									<div class="txt">우신 일정</div>
							</a></li>

							<li class="slick-slide slick-current slick-active"
								role="tabpanel" id="slickSlide90" aria-labelledby="slickDot90"
								tabindex="-1" style="width: 150px;" data-slick-index="1"
								aria-hidden="false"><a
								href="http://localhost/group2_prj/subpage/subpage-seatMap.jsp"
								class="hover" tabindex="0">
									<div class="img" style="top: 0px;">
										<img src="http://localhost/group2_prj/images/m1_5.gif" alt="">
									</div>
									<div class="txt">좌석배치도</div>
							</a></li>

							<li class="slick-slide slick-current slick-active"
								role="tabpanel" id="slickSlide90" aria-labelledby="slickDot90"
								tabindex="-1" style="width: 150px;" data-slick-index="2"
								aria-hidden="false"><a
								href="http://localhost/group2_prj/subpage/subpage-ticketMethod.jsp"
								class="hover" tabindex="0">
									<div class="img" style="top: 0px;">
										<img src="http://localhost/group2_prj/images/m1_7.gif" alt="">
									</div>
									<div class="txt">예매안내</div>
							</a></li>

							<li class="slick-slide slick-current slick-active"
								role="tabpanel" id="slickSlide90" aria-labelledby="slickDot90"
								tabindex="-1" style="width: 150px;" data-slick-index="3"
								aria-hidden="false"><a
								href="http://localhost/group2_prj/subpage/subpage-location.jsp"
								tabindex="0">
									<div class="img" style="top: 0px;">
										<img src="http://localhost/group2_prj/images/m1_6.gif" alt="">
									</div>
									<div class="txt">오시는 길</div>
							</a></li>

							<li class="slick-slide slick-current slick-active"
								role="tabpanel" id="slickSlide90" aria-labelledby="slickDot90"
								tabindex="-1" style="width: 150px;" data-slick-index="0"
								aria-hidden="false"><a
								href="http://localhost/group2_prj/subpage/subpage-FAQ1.jsp"
								tabindex="0">
									<div class="img" style="top: 0px;">
										<img src="http://localhost/group2_prj/images/m1_12.gif" alt="">
									</div>
									<div class="txt">고객센터</div>
							</a></li>

						</div>
					</div>
				</ul>
			</div>
			<!--아이콘 영역 끝✔️-->


			<!--마지막  영역(슬라이드 X)-->
			<link rel="stylesheet"
				href="http://localhost/group2_prj/assets/css/mainscdslide.css">
			<!--썸네일 슬라이드ㅡ-->
			<div class="inner_m aos-init aos-animate" date-aos="fade-up">
				<div id="m2" date-aos="fade-up" class="aos-init aos-animate">
					<div class="in">
						<div class="tit-main">
							<span class="small"> Recommended Program </span>
							<h2 class="t">추천프로그램</h2>
							<!--<a href="#" class="more">더보기</a>-->
							<p class="txt">
								<span class="block-pc">우신문화회관의 다양한  </span> <br />프로그램 추천드립니다.
							</p>


						</div>
					</div>
					<div aria-live="polite" class="slick-list draggable">

						<ul class="clearfix cont s slick-initialized slick-slider">
							<%
							//System.out.println("size : "+swList.size());
							int[] randomArr = new int[swList.size()];
							int random ;
							for(int i=0;i<swList.size();i++){
								randomArr[i] = (int)(Math.random()*swList.size());
								for(int j=0;j<i;j++){
									if(randomArr[i]==randomArr[j]){
										i--;
									}
								}
							}
							//for(int i=0;i<swList.size();i++){
							//	System.out.print(randomArr[i]+" / ");
							//}
							for (int i = 0; i < 5; i++) { //swList.size()
							%>
							<li class="rel" tabindex="<%=i%>"
								style="float: left; display: block;"><a
								href="http://localhost/group2_prj/reservation/show_info.jsp?showId=<%=swList.get(randomArr[i]).getShowId()%>">
									<img
									src="http://localhost/group2_prj/admin/img/<%=swList.get(randomArr[i]).getThImg()%>"
									style="width: 209px; height: 294.08px;">
							</a>
							<!-- style="width:209px; height:294.08px;" --></li>
							<%
							}
							%>
						</ul>



					</div>
				</div>

			</div>
			<!--#m2---->
		</div>

		<!--마지막 슬라이드 영역 끝-->

		<!-----------------------footer------------------------>

		<!-- Footer  -->
		<c:import
			url="http://localhost/group2_prj/common/user_allPage_footer.jsp" />
		<!-- End footer -->
	</div>


	<!------------------------------------------푸터----------------------------------------->

	<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
	<script>
		AOS.init();
	</script>


	<script src="http://localhost/group2_prj/assets/js/jquery.dropotron.min.js"></script>
	<script src="http://localhost/group2_prj/assets/js/browser.min.js"></script>
	<script src="http://localhost/group2_prj/assets/js/breakpoints.min.js"></script>
	<script src="http://localhost/group2_prj/assets/js/util.js"></script>
	<script src="http://localhost/group2_prj/assets/js/main.js"></script>

</body>
</html>