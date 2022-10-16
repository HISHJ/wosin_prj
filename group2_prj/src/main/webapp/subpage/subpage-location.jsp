<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="scriptlet의 사용"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
//검증완료
String memberId= (String)session.getAttribute("memberId");
%>    
<!DOCTYPE HTML>

<html>
		<title>오시는길</title>
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

		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/navtab.css">
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
		
		margin-right:180px;
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
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">공연장 위치 안내</strong>
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
									<a href="http://localhost/group2_prj/subpage/subpage-location.jsp"><span>공연장 위치 안내</span></a>
									</div>
							</li>
						
						</li>
						</ul>
					</div>
	
				</div>
			<script>
				$(window).resize(function(){
					if ( $(window).width() > 800 ){
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
				<script>
					var loc = $("#depth_w > div > ul > li").length - 1;
					$("#depth_w .dep1").addClass("li"+loc);
			
					var len = $(".tabs-st1 li").length;
					$(".tabs-st1").addClass("li"+len);
					</script>
					<div id="cont">
								
										<div class="sub_page">
										
								<article class="location">
								<style>
								#sub_page{background: #f1f1f1;}
								/* .tabs-st1,#loc{display: none;} */
								</style>
								<div class="bg">
									<div class="tit inner">
										<div class="t">
											<ul class="loc_tabs clearfix">
												<li class="loc1 active"><a href="http://localhost/group2_prj/subpage/subpage-location.jsp"><span>공연장 위치 안내</span></a></li>
												
												<li class="loc2"><a href="http://localhost/group2_prj/subpage/subpage-transport.jsp"><span>대중교통 이용시</span></a></li>
											</ul>
											<dl>
												<dt class="color-navy">공연장 <span>위치안내</span></dt>
												<dd class="add">서울특별시 종로구 세종대로 175 (세종로)<span> 우신문화회관 (우)03172</span></dd>
												<dd class="tel">02-399-1000(오전 9시 ~ 오후 8시)</dd>
												<dd class="link clearfix">
																		<font color="red"><B><p class="bul-mark2 b">세종로 공영주차장 입차 70분 후부터 공연시간(4시간 한정/유료전시 2시간) 이내에 사전 정산을 하시면 
																													공연 종료 후 출차 시 혼잡으로 인한 서비스 시간을 적용 받으실 수 있습니다. <span>광화문광장 공사 및 외부 
																													교통 신호등에 의해 차량 정체가 빈번히 발생하오니 가급적 대중교통을 이용해 주시기 바랍니다. 
																													</span> </p></B></font>																												
													
													
												</dd>
											</dl>
										</div>
										<ul class="area" id="area">
											<li class="active m1" tabindex="0"><img style="height: 500px; width: auto;" src="http://localhost/group2_prj/images/1.jpg" alt="지도API사용"> <a href="#tabs" class="sc hide"></a></li>
										</ul>
									</div>
								</div>
							</article>
										</div>
									<!-- </div> -->
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