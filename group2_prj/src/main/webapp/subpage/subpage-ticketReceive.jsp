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
		<title>티켓수령방법</title>
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
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">티켓수령방법</strong>
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
										<a href="http://localhost/group2_prj/subpage/subpage-ticketMethod.jsp">
											<span>예매정보</span>
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
									<a href="#"><span>티켓수령방법</span></a>
									<ul class="depth">
									<li><a href="http://localhost/group2_prj/subpage/subpage-ticketMethod.jsp" ><span>티켓구입방법</span></a></li>
									<li><a href="http://localhost/group2_prj/subpage/subpage-ticketReceive.jsp" ><span>티켓수령방법</span></a></li>
									<li><a href="http://localhost/group2_prj/subpage/subpage-ticketCancel.jsp" ><span>예매변경·취소안내</span></a></li>
									<li><a href="http://localhost/group2_prj/subpage/subpage-ticketProvison.jsp" ><span>예매약관</span></a></li>
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
											
											<ul class="tabs-st1 clearfix">
												<li  class="active"><a href="/portal/main/contents.do?menuNo=200222"><span>현장수령</span></a></li>
											</ul>
											
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
										<div class="tit">현장수령</div>
										<p class="txt">관람일 당일 <strong class="color-purple">서비스플라자</strong> 또는 <strong class="color-purple">공연장 로비에서 예약번호와 신분증을 제시하고 티켓을 수령하는 방법</strong>입니다. </p>
										<div class="cont">
											<ul class="bul-dot t2">
												<li>수령장소 : 서비스 플라자 또는 공연장 로비 현장 매표소 </li>
												<li>
												
								운영시간 
												
													<ol class="bul-decimal color-navy">
														<li>서비스 플라자 : 연중무휴 , 오전 10시 ~ 오후 8시  <span class="color-purple">*점심시간: 13시~14시</span></li>
								<li>현장매표소 : 공연시작 1시간 30분 전부터 운영</li>
													</ol>
												</li>
												<li>1시간 전 현장에 도착하셔서 티켓을 받으시면 여유롭습니다. </li>
								<li>티켓 수령 시 예매번호, 신분증을 지참해 주시기 바랍니다. (예매 완료 후 예매확인서 또는 입금 확인 메일을 출력하시면 편리합니다.)</li>
											</ul>
										</div>
									</li>
									<!--<li class="group">
										<div class="tit">무료등기배송 (세종 프리미엄 회원에게만 제공) </div>
										<ul class="bul-dot t2">
											<li><strong class="color-purple">세종 프리미엄 회원</strong>인 경우, 공연일로부터 7일 전 결제 완료 시 무료등기발송 서비스를 받으실 수 있습니다.</li>
								<li><strong class="color-purple">세종 프리미엄 회원</strong>에게만 제공되는 ‘무료등기배송’ 서비스를 받으시려면 전화 <strong class="color-purple">02-399-1198~9</strong>로 연락주시면 예매티켓을 무료로 배송해드립니다. </li>
										</ul>
									</li> -->
								</ul>
								</article>
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

	</body>
</html>