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
		<title>FAQ-회원</title>
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
								<!-- 	<form name="frm" id="frm" method="post" action="subpage-FAQ1.html"> -->
									<input type="hidden" name="bbsId">
									<input type="hidden" name="pageIndex" value="1">
									<div class="bbs-category clearfix select btn_w">
										<label for="searchfaqGbnCd" class="hide">분류 선택</label>
										<select name="searchfaqGbnCd" id="searchfaqGbnCd" onchange="location.href=this.value">
									
											<option value="http://localhost/group2_prj/subpage/subpage-FAQ1.jsp">공연</option>
								   
										   <option value="http://localhost/group2_prj/subpage/subpage-FAQ2.jsp">예매</option>
								   
										   <option value="http://localhost/group2_prj/subpage/subpage-FAQ3.jsp">좌석</option>
								   
										   <option value="http://localhost/group2_prj/subpage/subpage-FAQ4.jsp">관람</option>
								   
										   <option value="http://localhost/group2_prj/subpage/subpage-FAQ5.jsp">회원</option>

								   
								</select>
								</div>
								<!-- 	</form> -->
									
	<ul class="bbs-faq">
		
		<li class="item">
			<div class="q">
				<span class="num">9.</span>
				<span class="sort">회원</span>
				<span class="t"><a href="#1" title="답변 열기">개명을 했을 경우 어떻게 하나요?</a></span>
			</div>
			<div class="a" id="#1">
			
				<html lang="ko-kr" lang="ko-kr" xml:lang="ko-kr"><head></head><body spellcheck="false"><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="">개명 관련해서는 번거로우시더라도 연락을 부탁드립니다.</span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun=""><br></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="">콜센터 (02-399-1000, 오전 9시부터 오후 8시까지 연중무휴)로 전화를 주시면 처리를 도와드리겠습니다.</span></span></p></body></html>
			</div>
		</li>
		
		
		<li class="item">
			<div class="q">
				<span class="num">8.</span>
				<span class="sort">회원</span>
				<span class="t"><a href="#1" title="답변 열기">공연/전시 티켓을 현장에서 구매하면 적립이 안되나요?</a></span>
			</div>
			<div class="a" id="#1">
			
				<html><head></head><body spellcheck="false"><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">멤버십 포인트 및 이용횟수 적립을 위해서는 세종문화회관 홈페이지 내에서 결제해야 하며, </p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">공연당일 공연장 내 운영되는 현장매표소에서 티켓을 구매하시는 경우 포인트 및 이용횟수 적립이 “불가”합니다. </p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><br>다만, 홈페이지 내 결제가 어려우신 경우 콜센터(02-399-1000) 및 서비스플라자 방문 예매 시, </p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">홈페이지 회원 ID를 말씀해 주시면 적립이 가능합니다.(회원가입 필수)</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun="" normal;="">&nbsp;</p></body></html>
			</div>
		</li>
		
		
		<li class="item">
			<div class="q">
				<span class="num">7.</span>
				<span class="sort">회원</span>
				<span class="t"><a href="#1" title="답변 열기">타 사이트에서 예매한 내역은 적립이 안되나요? </a></span>
			</div>
			<div class="a" id="#1">
			
				<html><head></head><body spellcheck="false"><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">네, 세종S멤버십은 세종문화회관 홈페이지 회원 정책으로 </p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">세종문화회관 홈페이지에서 결제한 내역만 적립이 가능합니다.</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun="" normal;="">&nbsp;</p></body></html>
			</div>
		</li>
		
		
		<li class="item">
			<div class="q">
				<span class="num">6.</span>
				<span class="sort">회원</span>
				<span class="t"><a href="#1" title="답변 열기">포인트 및 이용횟수는 언제, 어떻게 적립되나요?</a></span>
			</div>
			<div class="a" id="#1">
			
				<html><head></head><body spellcheck="false"><p style="line-height: 120%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun="">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">적립 시점은 예매일/신청일 기준이 아닌, “관람일(공연/전시), 강좌종료일(강좌) 기준”이며,</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><br>포인트 적립기준은 공연/전시/강좌 결제 시 금액 100원 당 1ⓢ(세종포인트)로 적립됩니다.</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">(예술단 및 기획공연 관람 시 50% 추가포인트)</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><br>또한 이용횟수 적립 기준은 공연/전시 1회차 당 1회 이용 적립되며, </p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">매수와 관계없이 동일 행사의 동일 회차는 1회 이용 인정, </p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">동일 행사이지만 다른 회차는 개별 이용 횟수로 인정됩니다. (강좌는 1강좌 당 1회 이용 적립)</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><br>자세한 내용은 세종문화회관 콜센터(02-399-1000)나 <strong style="color: rgb(102, 0, 255);"><span style="color: rgb(102, 0, 255); line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">회원제도소개</span></strong>를 참고해주시기 바랍니다.</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><a href="https://www.sejongpac.or.kr/portal/main/contents.do?menuNo=200091" target="_blank"><img style="border: 0px solid currentColor; border-image: none; width: 319px; height: 46px;" src="https://admin.sejongpac.or.kr:443/upload/2021/03/20210329_152949906_39451.gif" border="0"></a><br></p><p style="line-height: 120%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun="">&nbsp;</p></body></html>
			</div>
		</li>
		
		
		<li class="item">
			<div class="q">
				<span class="num">5.</span>
				<span class="sort">회원</span>
				<span class="t"><a href="#1" title="답변 열기">등급과 적립내역은 어디에서 확인할 수 있나요?</a></span>
			</div>
			<div class="a" id="#1">
			
				<html><head></head><body spellcheck="false"><p style="line-height: 150%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun="">세종홈페이지 &gt; <strong>마이페이지</strong>에서 올해 적용 된 등급과, 적립 내역 및 예상등급까지 확인할 수 있습니다.<br></p><p style="line-height: 150%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun="">&nbsp;</p></body></html>
			</div>
		</li>
		
		
		<li class="item">
			<div class="q">
				<span class="num">4.</span>
				<span class="sort">회원</span>
				<span class="t"><a href="#1" title="답변 열기">할인가능한 매수가 무엇인가요?</a></span>
			</div>
			<div class="a" id="#1">
			
				<html><head></head><body spellcheck="false"><p style="line-height: 150%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">할인가능한 매수는 한 공연당 회원님이 할인 적용을 받아보실 수 있는 최대 티켓 매수를 의미합니다.</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><br>한 공연당 할인받으실 수 있는 매수만 제한되며, 1년간 이용 횟수 제한은 없습니다.</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><br>할인가능매수는 시그니처등급 6매, 스페셜등급 4매, 스타트등급 2매입니다. </p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">또한 할인율은 공연 별로 상이할 수 있으니 티켓 오픈 시 참고해주시기 바랍니다.<br><br></p><p style="line-height: 150%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p><p style="line-height: 150%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun="">&nbsp;</p></body></html>
			</div>
		</li>
		
		
		<li class="item">
			<div class="q">
				<span class="num">3.</span>
				<span class="sort">회원</span>
				<span class="t"><a href="#1" title="답변 열기">회원 등급 변경은 어떻게 해야 하나요?</a></span>
			</div>
			<div class="a" id="#1">
			
				<html><head></head><body spellcheck="false"><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">세종S멤버십은 연간으로 운영되며, 등급은 전년도 구매 횟수 및 금액에 따라 부여됩니다. </p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">등급 상승을 위한 조건은 로그인 후 <strong>마이페이지</strong>에서 확인이 가능합니다.</p></body></html>
			</div>
		</li>
		
		
		<li class="item">
			<div class="q">
				<span class="num">2.</span>
				<span class="sort">회원</span>
				<span class="t"><a href="#1" title="답변 열기">회원 등급별 공연할인 혜택을 알려주세요.</a></span>
			</div>
			<div class="a" id="#1">
			
				<html><head></head><body spellcheck="false"><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun="" normal;="">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">할인율은 등급 뿐만아니라 공연, 전시 등 행사 별로 상이하므로 각 행사 티켓오픈 시 안내를 참고하여 주십시오.</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><br>또한 선예매, 초대이벤트 등 자세한 등급별 혜택은 <strong style="color: rgb(102, 0, 255);"><span style="color: rgb(102, 0, 255); line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">회원혜택안내</span></strong> 페이지에서 상세히 확인하실 수 있습니다.</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><a href="https://www.sejongpac.or.kr/portal/main/contents.do?menuNo=200091" target="_blank"><img style="border: 0px solid currentColor; border-image: none; width: 319px; height: 46px;" src="https://admin.sejongpac.or.kr:443/upload/2021/03/20210329_152323239_32592.gif" border="0"></a><br></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun="" normal;="">&nbsp;</p></body></html>
			</div>
		</li>
		
		
		<li class="item">
			<div class="q">
				<span class="num">1.</span>
				<span class="sort">회원</span>
				<span class="t"><a href="#1" title="답변 열기">세종S멤버십은 무엇인가요? 가입비용이 있나요?</a></span>
			</div>
			<div class="a" id="#1">
			
				<html><head></head><body spellcheck="false"><p style="line-height: 150%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 12pt;="" roman";="" new="" times="" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;="">세종S멤버십은 세종문화회관의 공연/전시/강좌 이용 경험에 따라 혜택을 제공하는 통합 멤버십 서비스입니다. </span></p><p style="line-height: 150%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 12pt;="" roman";="" new="" times="" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><br></span></p><p style="line-height: 150%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 12pt;="" roman";="" new="" times="" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;="">가입비용은 없으며, 세종문화회관 홈페이지에서 회원 가입 후 혜택을 이용하실 수 있습니다.</span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><p style="line-height: 150%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 12pt;="" roman";="" new="" times="" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><br>등급은 총 4단계로 웰컴 &gt; 스타트 &gt; 스페셜 &gt; 시그니처 등급이며, 각 등급별로 산정 기준과 혜택이 다릅니다.</p><p style="line-height: 150%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 12pt;="" roman";="" new="" times="" 0px;"="" 0px;="" 16px;="" gothic";="" malgun="">&nbsp;</p><p style="line-height: 150%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 12pt;="" roman";="" new="" times="" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><br>자세한 내용은 <strong><span style="color: rgb(102, 0, 255); line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">회원혜택안내</span></strong> 페이지에서 상세히 확인하실 수 있습니다.</p><p style="line-height: 150%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 12pt;="" roman";="" new="" times="" 0px;"="" 0px;="" 16px;="" gothic";="" malgun="">&nbsp;</p><p style="line-height: 150%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 12pt;="" roman";="" new="" times="" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><a href="https://www.sejongpac.or.kr/portal/main/contents.do?menuNo=200091" target="_blank"><img style="border: 0px solid currentColor; border-image: none; width: 319px; height: 46px;" alt="세종S멤버십 혜택 확인하기" src="https://admin.sejongpac.or.kr:443/upload/2021/03/20210329_152145862_14661.gif" border="0"></a><br></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p></body></html>
			</div>
		</li>
		
		
	</ul>
	
		<div class='paginationSet'><ul class='pagination pagination-centered'><li class='i first disabled'><a title='처음 목록' href='/portal/singl/faq/list.do?menuNo=200052&searchWrd=&searchfaqGbnCd=37&searchCnd=1&amp;pageIndex=1' onclick='return false;'><span class='s'><span>처음 <span class='t'>목록</span></span></span></a></li><li class='i prev disabled'><a title='이전 목록' href='/portal/singl/faq/list.do?menuNo=200052&searchWrd=&searchfaqGbnCd=37&searchCnd=1&amp;pageIndex=0' onclick='return false;'><span class='s'><span>이전 <span class='t'>목록</span></span></span></a></li><li class='active'><span><em title='현재목록'><span>1</span></em></span></li><li class='i next disabled'><a title='다음 목록' href='/portal/singl/faq/list.do?menuNo=200052&searchWrd=&searchfaqGbnCd=37&searchCnd=1&amp;pageIndex=11' onclick='return false;'><span class='s'><span>다음 <span class='t'>목록</span></span></span></a></li><li class='i end disabled'><a title='마지막 목록' href='/portal/singl/faq/list.do?menuNo=200052&searchWrd=&searchfaqGbnCd=37&searchCnd=1&amp;pageIndex=1' onclick='return false;' data-endpage='1'><span class='s'><span>끝 <span class='t'>목록</span></span></span></a></li></ul></div>
	
</article>
									
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