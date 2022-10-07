<%@page import="kr.co.sist.vo.MemberVO"%>
<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    

<!DOCTYPE HTML>
<!--
	Dopetrope by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>아이디 찾기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="apple-touch-icon" sizes="180x180" href="/static/commons/img/favicon_180.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/static/commons/img/favicon_32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/static/commons/img/favicon_16.png">
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets\css\reset.css">
		<link rel="stylesheet" href="assets\css\subheader.css">
		<link rel="stylesheet" href="assets\css\headerFooter.css">
		<link rel="stylesheet" href="assets\css\login.css">
	
	 <link rel="stylesheet" type="text/css" href="static/portal/css/sub_new.css">
   <link rel="stylesheet" type="text/css" href="static/portal/css/style.css">
   <link rel="stylesheet" type="text/css" href="static/portal/css/layout_new.css">
		<!-- 부트스트랩 -->
		<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<!--제이쿼리-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script>
		$(function(){
			$("input:checkbox[name='save_id']").prop("checked", true);
		});

		</script>
	<style>
     section#header{
 		 /* background-image:  url("../../images/subvisual-200001.jpg"); */
  	background: url("images/subvisual-common.jpg") no-repeat ; 
  	background-size: 100%; 
  	background-attachment: fixed;
  
	}

		#nav{
			margin-right: 130px;
		}
	</style>
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
						<a href="page9.html">고객센터</a>
						<ul>
							<li><a href="page9.html">FAQ</a></li>
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
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">아이디 찾기</strong>
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
										<span>통합회원서비스</span>
									</a>
									<!-- display:none -->
									<ul class="depth" >
										<li>
											<a href="page1.html">공연정보</a>
										</li>
										<li>
											<a href="subpage-ticketmethod.html">예매정보</a>
										</li>
										<li>
											<a href="page9.html">고객센터</a>
										</li>
										<li>
											<a href="subpage-way.html">오시는길</a>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<li>
									<div class="rel">
									<a href="find_id.html"><span>아이디 찾기</span></a>
									<ul class="depth">
									<li><a href="login.html" ><span>로그인</span></a></li>
									<li><a href="signup.html" ><span>회원가입</span></a></li>
									<li><a href="find_id.html" ><span>아이디 찾기</span></a></li>
									<li><a href="find_password.html" ><span>패스워드 찾기</span></a></li>
									
									</ul>
									</div>
								</li>
							
							</li>
						</ul>
					</div>

				</div>

				<!-- 여기까지는 공통 영역 -->
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
						
				
				
				
				
				<script src="http://localhost/group2_prj/assets/js/validUtil.js"></script>
			
				
				 <style>
				.tabs-st1,.tabs-st2{display: none;}
				</style>
		
							
</body>
			<script >
				
				//아이디찾기 유효성검사
				
				$(function(){ 
					$("#btnId").click(function(){
							check();
				
					});//click
						
				});//ready'
				
				
				
				function check(){
					
					var name=$("#name").val();
					if(name.trim()==""){
						alert("이름을 입력해주세요.")
						$("#name").focus();
						return false;
					}//name
					
					var phone2=$("#tel2").val();
					if(phone2.trim()==""){
						alert("휴대폰 중간번호를 입력해주세요.");
						$("#tel2").focus();
						return false ;
					}//phone
					
					var phone3=$("#tel3").val();
					if(phone3.trim()==""){
						alert("휴대폰 끝번호를 입력해주세요.");
						$("#tel3").focus();
						return false ;
					}//phone
					$("#findFrm").submit();
					
				}//check
						
			</script>			
							
		
			
					

			<form name ="findFrm" id="findFrm" method="post" action="http://localhost/group2_prj/login/findId_process.jsp">
				<article class="find_member inner member_com">
					<div class="group">
						<h3 class="tit-st4">아이디 찾기</h3>
						<div class="box">
							<div class="top top_find" id="ck_input">
								<span><input type="radio" name="find1" id="find1_1" checked="checked"/> 
									<label for="find1_1">회원정보에 등록한 휴대전화로 인증</label></span>
								<!-- <span><input type="radio" name="find1" id="find1_2" /> <label for="find1_2">본인확인 이메일로 인증</label></span> -->
							</div>
							<div id="ck_cont">
								<div class="form_w form1">
									<h4 class="t">회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 아이디를 찾을 수 있습니다.</h4>
									<ul class="form">
										<li>
											<label for="name" class="tt">이름</label>
											<div class="cont">
												<input type="text" name="name" id="name" />
											</div>
										</li>
										<li>
											<span class="tt">휴대전화</span>
											<div class="cont">
												<div class="tel_w">
												<ul class="clearfix tel">
												<li>
														<label for="tel1" class="hide">휴대폰 앞</label>
														<select name="tel1" id="tel1">
															
																<option value="010">010</option>
															
																<option value="011">011</option>
															
																<option value="016">016</option>
															
																<option value="017">017</option>
															
																<option value="018">018</option>
															
																<option value="019">019</option>
															
														</select>
													</li>
													<li>
														<label for="tel2" class="hide">휴대폰 중간</label>
														<input type="text" name="tel2" id="tel2" class="small numberOnly" maxlength="4"/>
													</li>
													<li>
														<label for="tel3" class="hide">휴대폰 끝</label>
														<input type="text" name="tel3" id="tel3" class="small numberOnly" maxlength="4"/>
													</li>
												</ul>
												<button type="button" class="bg-black"  id="btnId"  >아이디 <span class="block-t">찾기</span></button>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					</article>
				</form>
				
				
				<form method="post" name="authForm">
					<input type="hidden" name="serverAuth" id="serverAuth" />
				</form>
				
				<form method="post" name="smsForm" id="smsForm" action="/portal/member/user/findIdResut.do?menuNo=200146">
					<input type="hidden" name="userId" id="userId" value="" />
					<input type="hidden" name="userName" id="userName"  />
					<input type="hidden" name="userDi" id="userDi"  />
					<input type="hidden" name="phone" id="phone"  />
					<input type="hidden" name="type" id="type" />
					<input type="hidden" name="userEmail" id="userEmail" />
				</form>
				
				<form name="form_chk" method="post">
				<input type="hidden" name="m" value="checkplusSerivce">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
				<input type="hidden" name="EncodeData" value="AgAFRzY2OTndoTyXpZuDakK0gC0mIvGulgFrJrX4TJgIJ6OLkzJf30GBS6kaH0geIGMa2q9CDDCTXGOxZ9e14WVJQFZLRNW3qLeSSQ4EmiSdbQUd/2+TtXfilO6vviqtgSI4TPFdAhyRAcUC7LO2AQbMbAGoRupdDxbcd140ZOMhSluvtfUA/hzOLNZ/NRR7rGVnt7XgElYNE0qhpYKHrMWurM5yaGq5uhSoIRf623vMIXXA5s9TAc+rbRDmIHGru2f+l8oavSFW6gg1xJP5U/jUcBuPemXMoV/q1zMl7h7x59bbJlp0GhQayLNmG2R75CyiR2GemOFCq4y5Cg8r7XAcoyalqSzlyq62jnhlDDRMFfWlLbtWNOrEg1FdyOzet9VTRtJ0gZKY3Hdl5nK4TgcFx250gt5MEwO0bi8WECWQVsvKgwPWUhii5awggG7S9x1IQjuEL2Rjou+6pxbBi+Cvqm535BoAJ2WHgo5M0ehfXrcpnYtU9Q==">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
				</form>
			
						</div>
					</div>
				
				</div><!-- #cont -->
				
				
				<!-- 만족도 조사 -->
				
				<!-- //만족도 조사 -->

			

	

				<!----------------------------------------------여기서부터 끝까지 footer-------------------------------------------->

			<!-- Footer -->
				<section id="footer">
					<div class="footer_line"></div>
					<div class="container">
						<div class="row">
							<div class="col-8 col-12-medium">
								<section>
									<header>
										<h2>
											<a href="index.html">
												<img class="footer_logo" src="common\logo_white.png" alt="우신문화회관">
											</a>
										</h2>
										<div class="l">
											<address>
												재단법인 우신문화회관 서울특별시 쌍용구 우신대로 175 (우신로) (우)03172
											  <br/>
											  대표자 : 최정민 유원준 정선홍 하지윤 유설빈 사업자등록번호 : 101-12-12345
												<br/>
												통신판매업신고 : 서울쌍용-0988호
											</address>
											<p class="copyright">
												COPYRIGHT(C) WOOSHIN CENTER FOR THE PERFORMING ARTS. ALL RIGHTS RESERVED</p>
											</p>
										</div>

							</div>
						</div>
					</div>
				</section>

		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>