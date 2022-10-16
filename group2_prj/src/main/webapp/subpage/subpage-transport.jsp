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
		<title>오시는길-교통안내</title>
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
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<!--제이쿼리-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<%if(memberId != null){%>
	<style>
	#nav {
	margin-left: 120px;
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
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">대중교통 이용시</strong>
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
									<a href="http://localhost/group2_prj/subpage/subpage-location.jsp"><span>대중교통 이용시</span></a>
									</div>
							</li>
						
						</li>
					</ul>
				</div>

			</div>
					<!---여기까지는 공통영역-->

			<!-- Main -->
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
					
			<article class="location">
			<style>
			#sub_page{background: #f1f1f1;}
			.location .tit > *{vertical-align: top;}
			/* .tabs-st1,#loc{display: none;} */
			</style>
				<div class="bg">
					<div class="tit inner">
					<div class="t">
						<ul class="loc_tabs clearfix">
							<li class="loc2"><a href="http://localhost/group2_prj/subpage/subpage-location.jsp"><span>공연장 위치 안내</span></a></li>
							<li class="loc1 active"><a href="http://localhost/group2_prj/subpage/subpage-transport.jsp"><span>대중교통 이용시</span></a></li>
						</ul>
						<dl>
							<dt class="color-navy">대중교통 <span>이용시</span></dt>
							<dd class="add">서울특별시 종로구 세종대로 175 <span>(세종로) 우신문화회관 (우)03172</span></dd>
							<dd class="tel">02-399-1000(오전 9시 ~ 오후 8시)</dd>
							<dd class="link clearfix">
								<p class="bul-mark2 b"><span>대중교통 정보는 변경될 수 있으니 <br/>
															아래의 포털사이트를 통해 버스정류장 <br/>
															 위치 및 운행정보를 반드시 확인하시기 <br/>바랍니다.</span></p>
								<a href="http://kko.to/jnwEWIvj0" class="daum"><span>다음지도로 바로가기</span></a><a href="http://naver.me/GHme4YOA" class="naver"><span>네이버지도로 바로가기</span></a>
							</dd>
						</dl>
					</div>
						<div class="public_t">
						<ul class="clearfix">
							<li class="group bus">
								<h3 class="ttt"><strong>버스</strong> 이용안내</h3>
								
								<dl class="sect">
									<dt>우신문화회관</dt>
									<dd><span class="icon blue">B</span>간선 / 401, 406, 700, 704, 707</dd>
									<dd><span class="icon green">G</span>지선 / 1711, 7016, 7018, 7022, 721</dd>
									<dd><span class="icon red">R</span>광역 / 5000A, 5000B, 5005, 5500-2, 9000,<br/> 9000-1, 9200, 9401, 970, 9703</dd>
									<dd><span class="icon grey">B</span>기타 / (마을) 종로09, 종로11 (공항) 6005</dd>
								</dl>
								
								<dl class="sect">
									<dt>KT 광화문지사</dt>
									<dd><span class="icon blue">B</span>간선 / 109, 606, 708</dd>
									<dd><span class="icon green">G</span>지선 / 1020, 1711, 7016, 7018, 7212</dd>
									<dd><span class="icon red">R</span>기타 / (마을) 종로09, 종로11, 종로03</dd>
								</dl>
								
								<dl class="sect">
									<dt>광화문(01120 가변)</dt>
									<dd><span class="icon blue">B</span>간선 /600, 602</dd>
									<dd><span class="icon green">G</span>지선 / 7019 </dd>
									<!-- <dd><span class="icon red">R</span>광역 / 970</dd> -->
									<dd class="r"><span class="icon grey">B</span><span class="a">기타 /</span> (경기일반) 790, 799, 1002<br>(경기좌석) 1004, 9710, 9710-1, 8600, <br/>8601, 8601A, 9710, 9709, 9709A</dd>
								</dl>
								
								<dl class="sect">
									<dt>광화문(01009, 01010 중앙차로)</dt>
									<dd class="r"><span class="icon blue">B</span><span class="a">간선 /</span>130, 150, 160, 260, 270, 271, 273,<br/> 370, 470, 601, 
							 702A, 702B, 705, 720, 721, 741</dd>
									<dd><span class="icon red">R</span>광역 / 9701</dd>
									<dd><span class="icon grey">B</span>기타 /(심야) N26, N37 (공항) 6002</dd>
								</dl>
							</li>
							<li class="group subway">
								<h3 class="ttt"><strong>지하철</strong> 이용안내</h3>
								<dl class="sect">
									<dt><span class="icon blue">1</span> 호선</dt>
									<dd class="r1"><span class="a"><strong class="color-blue">종각역</strong> 하차 →</span> <strong class="color-black">1번 출구</strong>로 나와서 광화문 방향 350M 지점</dd>
								</dl>
								
								<dl class="sect">
									<dt><span class="icon bg-orange">3</span> 호선</dt>
									<dd class="r2"><span class="a"><strong class="color-orange">경복궁역</strong> 하차 →</span> <strong class="color-black">6번 출구에</strong>서 세종대로 방향</dd>
								</dl>
								
								<dl class="sect">
									<dt><span class="icon bg-purple4">5</span> 호선</dt>
									<dd class="r3"><span class="a"><strong class="color-purple2">광화문역</strong> 하차→</span> <strong class="color-black">1, 8번 출구<br>
									7번 출구</strong>로 나와서 광화문 방향으로 200M 지점</dd>
								</dl>
								
							</li>
						</ul>
						</div>
					</div>
				</div>
			</article>
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

	</body>
</html>