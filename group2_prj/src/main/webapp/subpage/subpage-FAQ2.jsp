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
		<title>FAQ-예매</title>
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

			<c:import  url="http://localhost/group2_prj/common/user_subpage_header.jsp" > 
    	<c:param name="memberId" value="<%= memberId %>"></c:param> 
    	</c:import>

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
								<!-- 	<form name="frm" id="frm" method="post" action="/portal/singl/faq/list.do?menuNo=200052"> -->
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
												<span class="num">10.</span>
												<span class="sort">예매</span>
												<span class="t"><a href="#1" title="답변 열기">패키지 취소규정이 어떻게 되나요?</a></span>
											</div>
											<div class="a" id="#1">
											
												<html><head></head><body spellcheck="false"><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun="">구입하신 패키지티켓은 해당 패키지 첫 공연 전일 17시까지만 환불 가능합니다. </p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun="">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun="">개별공연 예매 취소 후 패키지 별도 취소 시에만 환불가능하며 개별공연 취소 후 패키지결제 미취소시 환불이 불가합니다.<br></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun="">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun="">좌석/일정변경 장기공연의 경우 공연일정 내 좌석 및 일정변경이 가능하며, 개별공연 취소 후 재예매하시면 됩니다. </p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun="">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun="">이 때 발생하는 취소수수료는 없습니다.<br><br>공연의 출연진 및 프로그램 등 세부내용은 주최 측 사정에 따라 변경될 수 있으며, 이에 따른 패키지 상품 환불은 불가합니다.<br><br>티켓을 소지하고 있을 경우, 공연 전일 오후 5시까지 서비스플라자에 직접 방문하시어 티켓을 반납하셔야 취소, 변경이 가능합니다.</p></body></html>
											</div>
										</li>
										
										
										<li class="item">
											<div class="q">
												<span class="num">9.</span>
												<span class="sort">예매</span>
												<span class="t"><a href="#1" title="답변 열기">패키지 구매내역 확인은 어떻게 하나요?</a></span>
											</div>
											<div class="a" id="#1">
											
												<html><head></head><body spellcheck="false"><p style="margin-top: 0pt; margin-bottom: 0pt; direction: ltr; unicode-bidi: embed; vertical-align: baseline; font-family: 'Malgun Gothic'; font-size: 16px; line-height: normal;">세종문화회관 홈페이지 &gt; 로그인 &gt; 마이페이지 &gt; 예매내역확인 &gt; 패키지구매내역/예매내역 순으로 확인하시면 됩니다.<br></p></body></html>
											</div>
										</li>
										
										
										<li class="item">
											<div class="q">
												<span class="num">8.</span>
												<span class="sort">예매</span>
												<span class="t"><a href="#1" title="답변 열기">패키지 티켓 혜택은 어떤 것이 있나요?</a></span>
											</div>
											<div class="a" id="#1">
											
												<html><head></head><body spellcheck="false"><p style="font-family: 'Malgun Gothic'; font-size: 16px; line-height: normal; margin-top: 0px; margin-bottom: 0px;">패키지를 구매하신 모든 분들께 년도별 &lt;세종시즌&gt; 시즌북과 기념품을 드리며, 패키지별 구매 혜택은 홈페이지를 통해 공지 됩니다.<br></p></body></html>
											</div>
										</li>
										
										
										<li class="item">
											<div class="q">
												<span class="num">7.</span>
												<span class="sort">예매</span>
												<span class="t"><a href="#1" title="답변 열기">패키지 구매 후, 어떻게 사용하나요?</a></span>
											</div>
											<div class="a" id="#1">
											
												<html><head></head><body spellcheck="false"><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun="">구매한 패키지 상품 예매권을 사용하여 개별 공연 예매 후 관람 가능합니다. </p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun="">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun="">좌석 조기 매진 시 예매 불가하며, 각 패키지 해당 등급 좌석만 적용 가능합니다.<br><br>패키지 상품 구매 시 동일공연 중복 선택은 불가하며 구매 완료 후 선택한 공연 변경이 안되는 점 참고해 주시기 바랍니다.</p></body></html>
											</div>
										</li>
										
										
										<li class="item">
											<div class="q">
												<span class="num">6.</span>
												<span class="sort">예매</span>
												<span class="t"><a href="#1" title="답변 열기">패키지는 언제, 어떻게 구매하나요?</a></span>
											</div>
											<div class="a" id="#1">
											
												<html><head></head><body spellcheck="false"><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun="">패키지 구매는 홈페이지, SNS등을 통해 티켓 오픈날짜가 공지되오니 참고해 주시기 바랍니다.<br><br>결제는 신용카드(체크카드 포함)로의 결제만 가능하며 회원가입 후 </p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun="">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun="">세종문화회관 세종시즌 홈페이지, 서비스플라자, 콜센터(02-399-1000, 오전 9시부터 오후 8시까지 연중무휴)를 통해 예매할 수 있습니다.<br><br>비회원은 구매 불가한 점 참고 부탁드립니다.</p></body></html>
											</div>
										</li>
										
										
										<li class="item">
											<div class="q">
												<span class="num">5.</span>
												<span class="sort">예매</span>
												<span class="t"><a href="#1" title="답변 열기">예매 후 결제수단 변경이 가능한가요?</a></span>
											</div>
											<div class="a" id="#1">
											
												<html><head></head><body spellcheck="false"><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun="">현재 세종문화회관에서는 예매 이후 결제수단 변경 서비스가 운영되고 있지 않습니다. <br></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun="">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 16px;="" gothic";="" malgun="">결제 수단 변경의 경우 좌석 취소 후 재결제를 통해서만 가능하오니(좌석변동가능), 이 점 참고하시어 이용 부탁드립니다.</p></body></html>
											</div>
										</li>
										
										
										<li class="item">
											<div class="q">
												<span class="num">4.</span>
												<span class="sort">예매</span>
												<span class="t"><a href="#1" title="답변 열기">예매 취소 했는데 환불 처리는 언제 되나요?</a></span>
											</div>
											<div class="a" id="#1">
											
												<html><head></head><body spellcheck="false"><p style="font-family: 'Malgun Gothic'; font-size: 16px; line-height: normal; margin-top: 0px; margin-bottom: 0px;">결제 취소의 경우 카드사나 은행 상황에 따라 3~5일 이내 환불이 진행됩니다.<br></p></body></html>
											</div>
										</li>
										
										
										<li class="item">
											<div class="q">
												<span class="num">3.</span>
												<span class="sort">예매</span>
												<span class="t"><a href="#1" title="답변 열기">예매 티켓의 현금영수증 신청하고 싶어요.</a></span>
											</div>
											<div class="a" id="#1">
											
												<html><head></head><body spellcheck="false"><p class="0" style="font-family: 'Malgun Gothic'; font-size: 16px; line-height: normal; margin-top: 0px; margin-bottom: 0px;" malgun="" gothic";="" font-size:="" 16px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">현금영수증의 경우</span></span></span></span></span><span style="letter-spacing: 0pt; color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">, </span></span></span></span></span><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">예매 시 현금영수증 발급을 체크하시면 신청 가능합니다</span></span></span></span></span><span style="letter-spacing: 0pt; color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">. </span></span></span></span></span></span></p><p class="0" style="font-family: 'Malgun Gothic'; font-size: 16px; line-height: normal; margin-top: 0px; margin-bottom: 0px;" malgun="" gothic";="" font-size:="" 16px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">예매 단계에서 현금영수증을 신청하지 않은 경우에는 자진발급으로 처리되며 추후 국세청 홈택스에서 승인번호</span></span></span></span></span><span style="letter-spacing: 0pt; color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">, </span></span></span></span></span><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">거래일자</span></span></span></span></span><span style="letter-spacing: 0pt; color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">, </span></span></span></span></span><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">거래금액 조회를 통해 직접 신청하실 수 있습니다</span></span></span></span></span><span style="letter-spacing: 0pt; color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">.&nbsp;</span></span></span></span></span></span></p><p class="0" style="font-family: 'Malgun Gothic'; font-size: 16px; line-height: normal; margin-top: 0px; margin-bottom: 0px;" malgun="" gothic";="" font-size:="" 16px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">자진발급분 처리를 위한 승인번호는 세종문화회관 콜센터</span></span></span></span></span><span style="letter-spacing: 0pt; color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">(02-399-1000)</span></span></span></span></span><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">를 통해 확인 가능합니다</span></span></span></span></span><span style="letter-spacing: 0pt; color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">.</span></span></span></span></span></span></p><p class="0" style="font-family: 'Malgun Gothic'; font-size: 16px; line-height: normal; margin-top: 0px; margin-bottom: 0px;" malgun="" gothic";="" font-size:="" 16px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="letter-spacing: 0pt; color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><br style="font-size: 12pt;" 맑은="" 고딕";"=""></span></span></span></span></p><p class="0" style="font-family: 'Malgun Gothic'; font-size: 16px; line-height: normal; margin-top: 0px; margin-bottom: 0px;" malgun="" gothic";="" font-size:="" 16px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">    </span></span></span></span></span></span></p><p class="0" style="font-family: 'Malgun Gothic'; font-size: 16px; line-height: normal; margin-top: 0px; margin-bottom: 0px;" malgun="" gothic";="" font-size:="" 16px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="letter-spacing: 0pt; color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">※&nbsp;</span></span></span></span></span><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">자진발급분 등록</span></span></span></span></span></span></p><p class="0" style="font-family: 'Malgun Gothic'; font-size: 16px; line-height: normal; margin-top: 0px; margin-bottom: 0px;" malgun="" gothic";="" font-size:="" 16px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">국세청 홈택스 로그인 </span></span></span></span></span><span style="letter-spacing: 0pt; color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">→ </span></span></span></span></span><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">조회</span></span></span></span></span><span style="letter-spacing: 0pt; color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">/</span></span></span></span></span><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">발급</span></span></span></span></span><span style="letter-spacing: 0pt; color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">(</span></span></span></span></span><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">현금영수증</span></span></span></span></span><span style="letter-spacing: 0pt; color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">) </span></span></span></span></span><span style="letter-spacing: 0pt; color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">→ </span></span></span></span></span><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">현금영수증 수정 </span></span></span></span></span><span style="letter-spacing: 0pt; color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">→ </span></span></span></span></span><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="color: black; font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span 맑은="" 고딕";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";="" font-size:="" 18.6667px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"=""><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">자진발급분 소비자등록</span></span></span></span></span></span></p><div id="hwpEditorBoardContent" class="hwp_editor_board_content" data-hjsonver="1.0" data-jsonlen="7807" style="font-family: 'Malgun Gothic'; font-size: 16px; line-height: normal; margin-top: 0px; margin-bottom: 0px;" malgun="" gothic";="" font-size:="" 16px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="">&nbsp;</div><p style="font-family: 'Malgun Gothic'; font-size: 16px; line-height: normal; margin-top: 0px; margin-bottom: 0px;" malgun="" gothic";="" font-size:="" 16px;="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="">&nbsp;</p></body></html>
											</div>
										</li>
										
										
										<li class="item">
											<div class="q">
												<span class="num">2.</span>
												<span class="sort">예매</span>
												<span class="t"><a href="#1" title="답변 열기">티켓예매창이 안열려요[PC/모바일]</a></span>
											</div>
											<div class="a" id="#1">
											
												<html><head></head><body spellcheck="false"><p style="line-height: 150%; font-family: 'Times New Roman'; margin-top: 0px; margin-bottom: 0px; font-size: 16px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 18pt; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;"><span style="line-height: 18pt; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><span style="line-height: 18pt; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;"><span style="font-size: 12pt; font-family: NanumGothic; line-height: 24px; margin-top: 0px; margin-bottom: 0px;">티켓예매창 비활성화 문제 해결방법 안내 드립니다.</span></span></span></span></p><p style="line-height: 120%; font-family: 'Times New Roman'; margin-top: 0px; margin-bottom: 0px; font-size: 16px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;"><br style="font-size: 12pt;"><span style="font-size: 12pt; font-family: NanumGothic; line-height: 19.2px; margin-top: 0px; margin-bottom: 0px;">[PC]</span></span></p><p style="line-height: 120%; font-family: 'Times New Roman'; margin-top: 0px; margin-bottom: 0px; font-size: 16px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;"><br style="font-size: 12pt;"><strong style="font-size: 12pt;"><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><span style="font-size: 12pt; font-family: NanumGothic; line-height: 19.2px; margin-top: 0px; margin-bottom: 0px;">1. FlashPlayer 설치여부 확인</span></span></strong><br style="font-size: 12pt;"><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><span style="font-size: 12pt; font-family: NanumGothic; line-height: 19.2px; margin-top: 0px; margin-bottom: 0px;">&nbsp; &nbsp;- 기존에 설치된 FlashPlayer가 있다면 삭제 후 다시 설치하여 주시기 바랍니다.</span></span><br style="font-size: 12pt;"><strong style="font-size: 12pt;"><br style="font-size: 12pt;"><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><span style="font-size: 12pt; font-family: NanumGothic; line-height: 19.2px; margin-top: 0px; margin-bottom: 0px;">2. 보안프로그램(nProtect online Security, Delfino) 삭제 후 예매 재실행</span></span></strong><br style="font-size: 12pt;"><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><span style="font-size: 12pt; font-family: NanumGothic; line-height: 19.2px; margin-top: 0px; margin-bottom: 0px;">&nbsp; &nbsp;- 안정적인 삭제를 위해 삭제 전 웹브라우저 전부 종료 후 진행해 주시기 바랍니다.</span></span><br style="font-size: 12pt;"><strong style="font-size: 12pt;"><br style="font-size: 12pt;"><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><span style="font-size: 12pt; font-family: NanumGothic; line-height: 19.2px; margin-top: 0px; margin-bottom: 0px;">3. 인터넷 익스플로어 창의 설정에서 인터넷 옵션 설정</span></span></strong><br style="font-size: 12pt;"><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><span style="font-size: 12pt; font-family: NanumGothic; line-height: 19.2px; margin-top: 0px; margin-bottom: 0px;">&nbsp; 1) 인터넷 옵션 - 고급 - 설정항목 중 ‘향상된 보호 모드 사용’ 체크해제</span></span><br style="font-size: 12pt;"><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><span style="font-size: 12pt; font-family: NanumGothic; line-height: 19.2px; margin-top: 0px; margin-bottom: 0px;">&nbsp; 2) 인터넷 옵션 - 일반 - 삭제(D) - 임시 인터넷 파일 및 웹사이트 파일(T) 만 체크하고</span></span><br style="font-size: 12pt;"><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><span style="font-size: 12pt; font-family: NanumGothic; line-height: 19.2px; margin-top: 0px; margin-bottom: 0px;">&nbsp; &nbsp; &nbsp; 나머지 체크해제 후 삭제</span></span><br style="font-size: 12pt;"><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><span style="font-size: 12pt; font-family: NanumGothic; line-height: 19.2px; margin-top: 0px; margin-bottom: 0px;">&nbsp; 3) 인터넷 옵션 - 고급 - 하단의 internet Explorer 기본설정복원 항목에 원래대로(S) 실행</span></span></span></p><p style="line-height: 120%; font-family: 'Times New Roman'; margin-top: 0px; margin-bottom: 0px; font-size: 16px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;"><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><br style="font-size: 12pt;"></span></span></p><p style="line-height: 120%; font-family: 'Times New Roman'; margin-top: 0px; margin-bottom: 0px; font-size: 16px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;"><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;"><span style="font-size: 12pt; font-family: NanumGothic; line-height: 19.2px; margin-top: 0px; margin-bottom: 0px;">[모바일]</span></span></span></span></p><p style="line-height: 120%; font-family: 'Times New Roman'; margin-top: 0px; margin-bottom: 0px; font-size: 16px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;"><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;"><br style="font-size: 12pt;"></span></span></span></p><p style="line-height: 120%; font-family: 'Times New Roman'; margin-top: 0px; margin-bottom: 0px; font-size: 16px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;"><strong style="font-size: 12pt;"><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><span style="font-size: 12pt; font-family: NanumGothic; line-height: 19.2px; margin-top: 0px; margin-bottom: 0px;">1. 아이폰 Safari 브라우저의 경우, Safari&nbsp; 팝업설정 해제</span></span></strong></span></p><p style="line-height: 120%; font-family: 'Times New Roman'; margin-top: 0px; margin-bottom: 0px; font-size: 16px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;"><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><span style="font-size: 12pt; font-family: NanumGothic; line-height: 19.2px; margin-top: 0px; margin-bottom: 0px;">- 설정 - Safari - 팝업차단 해제하고 예매창 재실행해주시기 바랍니다.</span></span></span></p><p style="line-height: 120%; font-family: 'Times New Roman'; margin-top: 0px; margin-bottom: 0px; font-size: 16px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;"><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><br style="font-size: 12pt;"></span></span></p><p style="line-height: 120%; font-family: 'Times New Roman'; margin-top: 0px; margin-bottom: 0px; font-size: 16px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;"><strong style="font-size: 12pt;"><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><span style="font-size: 12pt; font-family: NanumGothic; line-height: 19.2px; margin-top: 0px; margin-bottom: 0px;">2. 브라우저 캐시 삭제 후 예매 재실행</span></span></strong></span></p><p style="line-height: 120%; font-family: 'Times New Roman'; margin-top: 0px; margin-bottom: 0px; font-size: 16px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;"><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><span style="font-size: 12pt; font-family: NanumGothic; line-height: 19.2px; margin-top: 0px; margin-bottom: 0px;">- 브라우저에 남아있는 캐시를 삭제 후 재실행해주시기 바랍니다. </span></span></span></p><p style="line-height: 120%; font-family: 'Times New Roman'; margin-top: 0px; margin-bottom: 0px; font-size: 16px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;"><br style="font-size: 12pt;"><br style="font-size: 12pt;"><span style="line-height: 120%; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><span style="font-size: 12pt; font-family: NanumGothic; line-height: 19.2px; margin-top: 0px; margin-bottom: 0px;">위 내용으로 실행 시 정상적으로 예매창이 활성화되니 예매 시 참고 부탁 드립니다.</span></span></span></p></body></html>
											</div>
										</li>
										
										
										<li class="item">
											<div class="q">
												<span class="num">1.</span>
												<span class="sort">예매</span>
												<span class="t"><a href="#1" title="답변 열기">티켓 예매 후 어떻게 수령하나요?</a></span>
											</div>
											<div class="a" id="#1">
											
												<html><head></head><body spellcheck="false"><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" gothic";="" malgun="" 16px;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 12pt;"="" 고딕";="" 맑은=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 12pt;"="" 고딕";="" 맑은=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 고딕";="" 맑은="">예매티켓의 수령은 공연당일 공연장 로비의 현장매표소 수령과 세종문화회관&nbsp;서비스플라자 방문수령 가능합니다.</span></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" gothic";="" malgun="" 16px;"=""><br style="font-family:;" 12pt;"="" 고딕";="" 맑은=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 12pt;"="" 고딕";="" 맑은=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" 12pt;"="" 고딕";="" 맑은=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" 고딕";="" 맑은="">인터넷 예매의 경우, 예매확인서 또는 예매번호를 반드시 지참해 주시기 바랍니다.</span></span></span></p></body></html>
											</div>
										</li>
										
										
									</ul>
									
										<div class='paginationSet'><ul class='pagination pagination-centered'><li class='i first disabled'><a title='처음 목록' href='/portal/singl/faq/list.do?menuNo=200052&searchWrd=&searchfaqGbnCd=34&searchCnd=1&amp;pageIndex=1' onclick='return false;'><span class='s'><span>처음 <span class='t'>목록</span></span></span></a></li><li class='i prev disabled'><a title='이전 목록' href='/portal/singl/faq/list.do?menuNo=200052&searchWrd=&searchfaqGbnCd=34&searchCnd=1&amp;pageIndex=0' onclick='return false;'><span class='s'><span>이전 <span class='t'>목록</span></span></span></a></li><li class='active'><span><em title='현재목록'><span>1</span></em></span></li><li class='i next disabled'><a title='다음 목록' href='/portal/singl/faq/list.do?menuNo=200052&searchWrd=&searchfaqGbnCd=34&searchCnd=1&amp;pageIndex=11' onclick='return false;'><span class='s'><span>다음 <span class='t'>목록</span></span></span></a></li><li class='i end disabled'><a title='마지막 목록' href='/portal/singl/faq/list.do?menuNo=200052&searchWrd=&searchfaqGbnCd=34&searchCnd=1&amp;pageIndex=3' onclick='return false;' data-endpage='3'><span class='s'><span>끝 <span class='t'>목록</span></span></span></a></li></ul></div>
									
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
</html></html>