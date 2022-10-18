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
		<title>관람예절</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/main.css" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/reset.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/subheader.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/headerFooter.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/manner.css">
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
		#sub_page{
			width:90%;
		}

		#nav{
			margin-right: 180px;
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
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">관람예절</strong>
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
									<a href="#"><span>관람예절</span></a>
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
										
								<article class="etq inner">
									<header class="tit">
										<strong class="color-purple">공연관람예절 이것만은 지키자 !! </strong>
										<p>많은 사람들이 모이는 곳, 그 곳이 더군다나 예술작품을 함께 감상해야 하는 장소라면 더군다나 서로 지켜야 할 기본적인 예절을 지켜야 서로의 작품 감상에 방해가 되지 않을 것입니다.</p>
									</header>
									<ul class="clearfix">
										<li class="item clearfix">
											<div class="ico"><img src="http://localhost/group2_prj/images/ee1.gif" alt="01" /></div>
											<div class="cont">
												<strong class="t">감상을 방해할 만한 행동</strong>
												<ul class="bul-dot">
													<li>객석 내 음식물 반입 및 섭취 </li>
													<li>공연 중 옆사람과의 대화</li>
													<li>공연 중 서서 관람하는 행위 </li>
													<li>지정석 이외의 자리에 앉는 행위</li>
													<li>음주 후 공연 관람</li>
												</ul>
											</div>
										</li>
										<li class="item clearfix">
											<div class="ico"><img src="http://localhost/group2_prj/images/ee2.gif" alt="02" /></div>
											<div class="cont">
												<strong class="t">사진 촬영은 절대 금물</strong>
												<ul class="bul-dot">
													<li>공연 중에는 사전 허가를 받은 전문인만 사진을 촬영 할 <br/>수 있습니다. </li>
												</ul>
											</div>
										</li>
										<li class="item clearfix">
											<div class="ico"><img src="http://localhost/group2_prj/images/ee3.gif" alt="03" /></div>
											<div class="cont">
												<strong class="t">어린이 동행 시 출입 가능한<br/> 나이를
								     							사전에 체크하셔야<br/> 합니다. </strong>
												<ul class="bul-dot">
													<li>공연 내용에 따라 5세이상, 7세 이상,<br/>
														 12세 이상 관람가능 연령이 나누어져 있으며<br/> 관람 연령에 따라 입장이 불가한 경우 
														 <br/>어린이 놀이방을 이용하여 주시기 바랍니다. </li>
												</ul>
											</div>
										</li>
										<li class="item clearfix">
											<div class="ico"><img src="http://localhost/group2_prj/images/ee4.gif" alt="04" /></div>
											<div class="cont">
												<strong class="t">공연장 도착은 20분전, 
													<br/>객석 입장은 10분 전 </strong>
												<ul class="bul-dot">
													<li>원칙적으로 공연 시작 이후 공연장 입장은 금지이나<br/>>
														지연 관객을 위한 입장이 있다면 안내원의 안내에 따라 <br/>
														빈 좌석에 착석하여 주시고 휴식시간에 본 좌석으로<br/> 이동하여 주시기 바랍니다.</li>
												</ul>
											</div>
										</li>
										<li class="item clearfix">
											<div class="ico"><img src="http://localhost/group2_prj/images/ee5.gif" alt="05" /></div>
											<div class="cont">
												<strong class="t">음식물은 휴게실에서<br/> 공연장에선 공연감상만 </strong>
												<ul class="bul-dot">
													<li>모든 일체의 음식물은 공연장 안으로 <br/>가져갈 수 없습니다. 
									  자신의 조그만 부주의가 <br/>공연자는 물론 객석의 관람자에게도 큰 피해를<br/>
									 주어 공연장 분위기를 망칠 수 있는 것을 양해 <br/>해 주시고, 음식물은 꼭 
									 드신 후 입장해 주시기 바랍니다. </li>
												</ul>
											</div>
										</li>
										<li class="item clearfix">
											<div class="ico"><img src="http://localhost/group2_prj/images/ee6.gif" alt="06" /></div>
											<div class="cont">
												<strong class="t">공연장에서 조심해야 할 물건들 </strong>
												<ul class="bul-dot">
													<li>소리가 많이 나는 비닐제품이나 꽃다발, 음식물 등은 <br/>물품보관소에 맡겨주시고, 휴대폰 전원은 종료 후에<br/>입장 해주시기 바랍니다.  </li>
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