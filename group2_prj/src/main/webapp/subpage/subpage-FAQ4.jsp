<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="scriptlet의 사용"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
//검증완료
String memberId= (String)session.getAttribute("memberId");
%>    
<!DOCTYPE HTML>

<html>
	<head>
		<title>FAQ-관람</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/main.css" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/reset.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/subheader.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/headerFooter.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/cvs&FAQ.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/manner.css">
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<!--제이쿼리-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<%if(memberId == null){%>
	<style>
	#nav {
	margin-right: 200px;
	}
	</style>
	<%} %>
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
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">FAQ</strong>
						</h2>
					</div>
					</section>

						<!--------------------------------------위까지가 헤더----------------------------------------->

				
				</section>

				<!---여기까지는 공통영역-->
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
										<a href="http://localhost/group2_prj/subpage/subpage-FAQ1.jsp">
											<span>고객센터</span>
										</a>
										<!-- display:none -->
									<ul class="depth" >
										<li>
											<a href="http://localhost/group2_prj/reservation/show_search.jsp">공연정보</a>
										</li>
										<li>
											<a href="http://localhost/group2_prj/subpage/subpage-ticketMethod.jsp">예매정보</a>
										</li>
										<li>
											<a href="http://localhost/group2_prj/subpage/subpage-FAQ1.jsp">고객센터</a>
										</li>
										<li>
											<a href="http://localhost/group2_prj/subpage/subpage-location.jsp">오시는길</a>
										</li>
									</ul>
									</div>
							</li>
							<li>
								<li>
									<div class="rel">
									<a href="#"><span>FAQ</span></a>
									<ul class="depth">
										<li><a href="http://localhost/group2_prj/subpage/subpage-FAQ1.jsp">FAQ</a></li>
										<li><a href="http://localhost/group2_prj/subpage/subpage-manner.jsp">관람예절</a></li>				
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
										
							
								
								<script>
								$(function() {
									$("#searchfaqGbnCd").change(function(){
										search('1');
									});
								});
								
								function search(pageNo) {
									document.frm.pageIndex.value = pageNo;
									document.frm.submit();
								}
								</script>
								
								<article class="bbs_w inner">
								<!-- 	<form name="frm" id="frm" method="post" action="/portal/singl/faq/list.do?menuNo=200052"> -->
									<input type="hidden" name="bbsId">
									<input type="hidden" name="pageIndex" value="1">
									<div class="bbs-category clearfix select btn_w">
										<label for="searchfaqGbnCd" class="hide">분류 선택</label>
												<select name="searchfaqGbnCd" id="searchfaqGbnCd" onchange="location.href=this.value">
									
											<option value="http://localhost/group2_prj/subpage/subpage-FAQ1.jsp">공연</option>
								   
										   <option value="http://localhost/group2_prj/subpage/subpage-FAQ2.jsp" >예매</option>
								   
										   <option value="http://localhost/group2_prj/subpage/subpage-FAQ3.jsp">좌석</option>
								   
										   <option value="http://localhost/group2_prj/subpage/subpage-FAQ4.jsp">관람</option>
								   
										   <option value="http://localhost/group2_prj/subpage/subpage-FAQ5.jsp">회원</option>

								   
								</select>
								
										
									</div>
								<!-- 	</form> -->
									<ul class="bbs-faq">
										
										<li class="item">
											<div class="q">
												<span class="num">8.</span>
												<span class="sort">관람</span>
												<span class="t"><a href="#1" title="답변 열기">공연중 음식물반입이 가능한가요?</a></span>
											</div>
											<div class="a" id="#1">
											
												<html lang="ko-kr" lang="ko-kr" xml:lang="ko-kr"><head></head><body spellcheck="false"><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="">모든 일체의 음식물은 공연장 안으로 가져갈 수 없습니다.</span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun=""><br></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="">자신의 조그만 부주의가 공연자는 물론 객석의 관람자에게도 큰 피해를 주어 공연장 분위기를 망칠 수 있는 것을 양해해 주시고, </span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun=""><br></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="">음식물은 꼭 드신 후 입장해 주시기 바랍니다.</span></span></p></body></html>
											</div>
										</li>
										
										
										<li class="item">
											<div class="q">
												<span class="num">7.</span>
												<span class="sort">관람</span>
												<span class="t"><a href="#1" title="답변 열기">공연중 자막을 볼수 있나요?</a></span>
											</div>
											<div class="a" id="#1">
											
												<html><head></head><body spellcheck="false"><p style="line-height: normal; font-family: 'Malgun Gothic'; font-size: 16px; margin-top: 0px; margin-bottom: 0px;" malgun="" gothic";="" margin-top:="" 0px;="" margin-bottom:="" font-size:="" 16px;"=""><span style="line-height: normal; font-family: 'Malgun Gothic'; font-size: 16px; margin-top: 0px; margin-bottom: 0px;" malgun="" gothic";="" margin-top:="" 0px;="" margin-bottom:="" font-size:="" 12pt;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" malgun="" gothic";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="">세종문화회관은 대극장 1층과 2층 좌석 앞쪽에 LCD모니터가 부착되어 있어 편리하게 자막을 보실 수 있습니다.</span></span></p><p style="line-height: normal; font-family: 'Malgun Gothic'; font-size: 16px; margin-top: 0px; margin-bottom: 0px;" malgun="" gothic";="" margin-top:="" 0px;="" margin-bottom:="" font-size:="" 16px;"=""><span style="line-height: normal; font-family: 'Malgun Gothic'; font-size: 16px; margin-top: 0px; margin-bottom: 0px;" malgun="" gothic";="" margin-top:="" 0px;="" margin-bottom:="" font-size:="" 12pt;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" malgun="" gothic";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="">
								<br/>대극장 3층은 좌우 벽면과 천정 중앙에 대형 스크린이 설치되어 있습니다.</span></span></p></body></html>
											</div>
										</li>
										
										
										<li class="item">
											<div class="q">
												<span class="num">6.</span>
												<span class="sort">관람</span>
												<span class="t"><a href="#1" title="답변 열기">공연 촬영, 녹음, 녹화가 가능한가요?</a></span>
											</div>
											<div class="a" id="#1">
											
												<html><head></head><body spellcheck="false"><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times="">사진촬영, 녹음, 녹화는 절대 금물입니다.</span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times=""><br></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times="">종합구성물의 무대장치나 공연장면, 유명연주자들의 모습은 모두 저작권에 해당하는 것으로, 무단촬영 배포가 금지되어 있습니다.</span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times=""><br></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times="">세종문화회관에서도 사전에 공연단체에게 허락을 받고 상업적인 사용을 하지 않는다는 약속을 한 후에 공연기록용 사진을 촬영하며, </span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times=""><br></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times="">프로그램이나 소식지에 사진을 사용하는 데에도 별도의 승인을 받고 있습니다.</span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times=""><br></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times="">공연 중의 사진 촬영이나 녹음, 녹화 등은 공연물의 초상권과 저작권을 침해하는 행위이며, </span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times=""><br></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times="">공연장은 공공장소라는 점을 감안하시어 공연관람의 기본적인 에티켓을 지켜 주시기 바랍니다.</span></span></p></body></html>
											</div>
										</li>
										
										
										<li class="item">
											<div class="q">
												<span class="num">5.</span>
												<span class="sort">관람</span>
												<span class="t"><a href="#1" title="답변 열기">공연장 입장시 복장 제한이 있나요?</a></span>
											</div>
											<div class="a" id="#1">
											
												<html><head></head><body spellcheck="false"><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times="">공연장에 입장하기 위한 복장 규정은 없습니다.</span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times=""><br></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times="">단, 공연은 영화와 달라서 관람하시는 그 순간이 지나면 다시는 똑같은 분위기, 연기를 보실수 없는 '현장' 예술입니다.</span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times=""><br></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times="">본인 스스로 편안하게 공연에 몰입할 수 있는 복장을 갖추시는 것이 좋습니다.</span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times=""><br></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times="">공연을 즐겨 관람하시는 분들은 스스로의 마음가짐을 위해서 정장을 고집하시기도 합니다.또 한가지는 주변의 다른 관객들에 대한 배려입니다.</span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times=""><br></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times="">바스락 거리는 소리가 많이 나는 재질의 옷이라던가 지나치게 화려한 색상이나 디자인은 삼가시는 것이 좋습니다.</span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times=""><br></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times="">공연관객들께서는 그 어느때보다 시각과 청각이 예민해져 있는 상태이기때문에 </span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times=""><br></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times="">평상시에는 잘 안들리던 소리나 모습에도 신경이 쓰일 수 밖에 없기 때문입니다.</span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times=""><br></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times="">공연장을 찾으실 때 옷차림은 소중한 시간을 마음껏 즐길 수 있는 마음가짐을 표현하시는 무난하고 편안한 복장이 좋습니다.</span></span></p></body></html>
											</div>
										</li>
										
										
										<li class="item">
											<div class="q">
												<span class="num">4.</span>
												<span class="sort">관람</span>
												<span class="t"><a href="#1" title="답변 열기">아이들의 경우 몇살까지 입장가능한가요?</a></span>
											</div>
											<div class="a" id="#1">
											
												<html><head></head><body spellcheck="false"><p style="line-height: 150%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><span style="line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;="">공연 내용과 장소에 따라서</span><span style="line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><strong><span style="line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""> </span><span style="color: rgb(0, 85, 255); line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;="" 13.3333px;=""><span style="line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;="">만 5세 이상, 7세 이상, 12세 이상</span></span><span style="color: rgb(0, 85, 255); line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;="" 13.3333px;=""><span style="line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""> <span style="line-height: 18pt; font-family: Times New Roman; font-size: 12pt; font-weight: normal; margin-top: 0px; margin-bottom: 0px;"><span style="color: black; line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">등으로</span> </span></span></span></strong></span><span style="line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;="">관람 가능 연령이 나누어져 있습니다. </span></span><br style="font-size: 12pt;"></p><p style="line-height: 150%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><span style="line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><br></span></span></p><p style="line-height: 150%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><span style="line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;="">관람을 원하시는 공연의 입장가능 연령을 사전에 꼭 확인해주시길 바랍니다.</span></span></p></body></html>
											</div>
										</li>
										
										
										<li class="item">
											<div class="q">
												<span class="num">3.</span>
												<span class="sort">관람</span>
												<span class="t"><a href="#1" title="답변 열기">공연시작후 빈좌석으로 이동이 가능한가요?</a></span>
											</div>
											<div class="a" id="#1">
											
												<html><head></head><body spellcheck="false"><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times="">매진이 되지 않아 좌석이 비어 있는 공연이라 하더라도 좌석 이동은 불가합니다.</span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times=""><br></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times="">공연 중에 좌석을 이동하는 것은 다른 관객에게 불편을 초래하는 일이며, 관람환경을 해하는 행위입니다.</span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times=""><br></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 16px;"="" roman";="" new="" times=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" roman";="" new="" times="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" roman";="" new="" times="">설사 공연 시작 전이라 하더라도 문화에티켓에 어긋나는 일입니다.</span></span></p></body></html>
											</div>
										</li>
										
										
										<li class="item">
											<div class="q">
												<span class="num">2.</span>
												<span class="sort">관람</span>
												<span class="t"><a href="#1" title="답변 열기">공연시작후 입장이 가능한가요?</a></span>
											</div>
											<div class="a" id="#1">
											
												<html><head></head><body spellcheck="false"><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="">세종문화회관에서는 공연 시작 후에는 객석으로 입장은 하실 수 없으며, 해당 공연의 내용에 맞춰 별도로 정해진 시간에 한하여 입장하셔야 하며, </span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun=""><br></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="">다른 관객의 관람에 방해되지 않도록 안내원이 유도하는 별도의 좌석에 앉으셔야 합니다.</span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun=""><br></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="">덧붙여 설명을 드리면, 무대감독이나 하우스 매니저는 해당 공연의 특성을 감안하여 최대한 공연에 방해가 되지 않도록 입장을 시켜 드립니다.&nbsp;</span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun=""><br></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="">단, 공연자의 특별한 요청으로 인해 지연관객을 입장시키는 행위가 공연에 큰 지장을 초래한다고 판단 될 경우 </span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun=""><br></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="">중간휴식시간 까지 입장이 불가할 경우도 있습니다. 그리고 지각관객은 원칙적으로 지정된 좌석에 앉을 수 없습니다만, </span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun=""><br></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="">중간 휴식시간이 있다면 중간휴식시간 이후에 지정좌석에 앉을 수 있습니다.</span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun=""><br></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="">공연시간 준수는 엄연히 예매/매표를 하실 때 공연에 대한 대다수 관객과의 일종의 약속이라 할 수 있으며, </span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun=""><br></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="">미리 입장하여 이미 관람중인 관객이나 공연자에게도 큰 지장을 초래할 수 있습니다. 관객 여러분들의 협조 부탁드립니다.</span></p></body></html>
											</div>
										</li>
										
										
										<li class="item">
											<div class="q">
												<span class="num">1.</span>
												<span class="sort">관람</span>
												<span class="t"><a href="#1" title="답변 열기">공연보러 갈때 몇시정도에 도착해야 하나요?</a></span>
											</div>
											<div class="a" id="#1">
											
												<html><head></head><body spellcheck="false"><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="">공연장 도착은 최소한 20분전까지는 완료하시고, 10분전에는 자신의 좌석에 앉아 편안한 마음으로 공연을 관람할 준비를 해 주시기 바랍니다.</span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun=""><br></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="">원칙적으로 공연장 입장은 공연시작 이후엔 출입금지입니다. </span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun=""><br></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="">늦게 도착하신 경우 대기석에서 기다린 후 휴식시간(intermission)에 고객님 자리로 이동하실 수 있습니다.</span></p></body></html>
											</div>
										</li>
										
										
									</ul>
									
										<div class='paginationSet'><ul class='pagination pagination-centered'><li class='i first disabled'><a title='처음 목록' href='/portal/singl/faq/list.do?menuNo=200052&searchWrd=&searchfaqGbnCd=36&searchCnd=1&amp;pageIndex=1' onclick='return false;'><span class='s'><span>처음 <span class='t'>목록</span></span></span></a></li><li class='i prev disabled'><a title='이전 목록' href='/portal/singl/faq/list.do?menuNo=200052&searchWrd=&searchfaqGbnCd=36&searchCnd=1&amp;pageIndex=0' onclick='return false;'><span class='s'><span>이전 <span class='t'>목록</span></span></span></a></li><li class='active'><span><em title='현재목록'><span>1</span></em></span></li><li class='i next disabled'><a title='다음 목록' href='/portal/singl/faq/list.do?menuNo=200052&searchWrd=&searchfaqGbnCd=36&searchCnd=1&amp;pageIndex=11' onclick='return false;'><span class='s'><span>다음 <span class='t'>목록</span></span></span></a></li><li class='i end disabled'><a title='마지막 목록' href='/portal/singl/faq/list.do?menuNo=200052&searchWrd=&searchfaqGbnCd=36&searchCnd=1&amp;pageIndex=1' onclick='return false;' data-endpage='1'><span class='s'><span>끝 <span class='t'>목록</span></span></span></a></li></ul></div>
									
								</article>
								<script>
								$(".bbs-faq .q a").click(function() {
									$(this).closest(".q").toggleClass("active");
									$(".bbs-faq .q a").not(this).attr({"title":"답변 열기"});
									$(".bbs-faq .q a").not(this).closest(".q").removeClass("active");
									var target = $(this).closest(".item").find(".a");
									var other = $(".bbs-faq .q a").not(this).closest(".item").find(".a");
									if ($(this).closest(".q").hasClass("active")){
										$(this).attr({"title":"답변 닫기"});
									}else{
										$(this).attr({"title":"답변 열기"});
									}
									target.slideToggle(150);
									other.slideUp(150);
									return false;
								});
								</script>
								
										</div>
									</div>
								
								</div><!-- #cont -->

								<!-- 내용 끝 -->

					

				<!----------------------------------------------여기서부터 끝까지 footer-------------------------------------------->

					<!-- Footer  -->
			<c:import url="http://localhost/group2_prj/common/user_allPage_footer.jsp"/> 
	    <!-- End footer -->
		<!-- Scripts -->
			<script src="http://localhost/group2_prj/assets/js/jquery.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/jquery.dropotron.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/browser.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/breakpoints.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/util.js"></script>
			<script src="http://localhost/group2_prj/assets/js/main.js"></script>
			<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
 		
  			<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  			<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

	</body>
</html>