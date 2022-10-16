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
		<title>예매변경·취소 안내</title>
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
	<%if(memberId != null){%>
	<style>
	#nav {
	margin-left: 130px;
	}
	</style>
	<%} %>
	
	
	
	<style>
		#nav{
			margin-right:170px;
		}
	</style>
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">

	<c:import  url="http://localhost/group2_prj/common/user_subpage_header.jsp" > 
    <c:param name="memberId" value="<%= memberId %>"></c:param> 
    </c:import>
						<!--❤️여기에 서브제목 입력하세욮 ex) 공연일정-->
						<div id="sut-t_wrap">
						<h2 id="sub-t">
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">예매변경·취소</strong>
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
										<span>예매정보</span>
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
									<a href="#"><span>예매변경·취소안내</span></a>
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
				<section id="main">
					<div class="container">
						<div class="row">
							<div class="col-12">
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
										<div class="tit">예매 취소방법</div>
										<div class="cont">
											<ul class="bul-dot t2">
												<li>인터넷 예매
												<div class="color-navy small">세종문화회관 홈페이지 > 마이페이지 : <br> <span class="color-grey">홈페이지 로그인 후 마이페이지 – 예매내역 확인/취소에서 취소공연을 선택 후 취소하시면 됩니다.</span></div>
												</li>
												<li>서비스플라자 현장예매
												<div class="color-navy small">세종문화회관 중앙계단 위 서비스플라자 방문 </div>
												</li>
												<li>콜센터
												 <div class="color-navy small">세종문화티켓: 02-399-1000</div>
												 </li>
											</ul>
											<p class="bul-mark2 b" style="margin-top: 2.3em;">사전 수령 티켓의 경우 실물 티켓 회수 후 취소/환불처리 됩니다. 반드시 실물 티켓을 지참 후 서비스플라자로 방문바랍니다.<br/> (티켓 분실 시 취소불가)</p>
										</div>
									</li>
									<li class="group">
										<div class="tit">예매 취소, 변경 가능시간  </div>
										<ul class="bul-dot t2">
										<li><strong>관람일 전일 오후 5시까지 가능</strong> (평일 / 주말(토, 일요일) / 공휴일)   </li>
										<li>관람일 당일에는 예매취소, 변경, 환불 불가  </li>
										</ul>
									</li>
									<li class="group">
										<div class="tit">예매 취소수수료 안내</div>
										<table class="tbl-st1">
											<caption>구분, 취소수수료로 구성된 예매 취소 수수료 안내 테이블</caption>
											<thead>
												<tr>
													<th scope="col" colspan="2">구분</th>
													<th scope="col">취소수수료</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td rowspan="2">공연일 기준</td>
													<td>공연 <strong class="color-purple">10일전</strong></td>
													<td>없음</td>
												</tr>
												<tr>
													<td>공연 <strong class="color-purple">9일 전부터 취소 마감시간</strong></td>
													<td>티켓 금액의 10%</td>
												</tr>
												<tr>
													<td rowspan="3">예매당일 취소</td>
													<td>공연 <strong class="color-purple">3일전</strong></td>
													<td>없음</td>
												</tr>
												<tr>
													<td>공연 <strong class="color-purple">2일~1일전</strong></td>
													<td>티켓 금액의 10%</td>
												</tr>
												<tr>
													<td>공연 <strong class="color-purple">당일 취소</strong></td>
													<td>취소 불가</td>
												</tr>
											</tbody>
										</table>
									</li>
								</ul>
								</article>
										</div>
									</div>
								
								</div><!-- #cont -->
								




								<!-- 내용 끝 -->

							</div>
						</div>
					</div>
				</section>

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
	</body>
</html>