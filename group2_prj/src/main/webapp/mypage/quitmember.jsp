<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="회원탈퇴"%>

    
    <!DOCTYPE HTML>
<!--
	Dopetrope by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>회원정보 수정</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="apple-touch-icon" sizes="180x180" href="http://localhost/group2_prj/static/commons/img/favicon_180.png">
    <link rel="icon" type="image/png" sizes="32x32" href="http://localhost/group2_prj/static/commons/img/favicon_32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="http://localhost/group2_prj/static/commons/img/favicon_16.png">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/main.css" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\reset.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\subheader.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\headerFooter.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\login.css">
	
	 <link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static/portal/css/sub_new.css">
   <link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static/portal/css/style.css">
   <link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static/portal/css/layout_new.css">
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
		 background: url("http://localhost/group2_prj/images/subvisual-common.jpg") no-repeat ; 
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
									<li><a href="#">관람예절</a></li>				
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
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">회원탈퇴</strong>
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
										<span>마이페이지</span>
									</a>
									<!-- display:none -->
									<ul class="depth" >
										<li>
											<a href="memberMng.html">
												<span>마이페이지</span>
											</a>
										</li>
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
									<a href="#"><span>회원정보 수정</span></a>
									<ul class="depth">
									<li><a href="memberMng.html" ><span>개인화서비스</span></a></li>
									<li><a href="subpage-FAQ1.html" ><span>FAQ</span></a></li>
									<li><a href="mypage.html" ><span>회원정보 수정</span></a></li>
									<li><a href="find_password.html" ><span>예매내역 확인·취소</span></a></li>
									
							
									</ul>
									</div>
								</li>
							
							</li>
						</ul>
					</div>
					
					</div>
				</div>
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
				
						<script type="text/javaScript">
						var loc = $("#depth_w > div > ul > li").length - 1;
						$("#depth_w .dep1").addClass("li"+loc);
				
						var len = $(".tabs-st1 li").length;
						$(".tabs-st1").addClass("li"+len);
						
						
						$(function(){
							$("#btnQuit").click(function(){
									Quitcheck();
						
							})//click
						});//ready
						
						
						function Quitcheck(){
							
							var reason=$("#reason").val();
							if(reason.trim()==""){
								alert("탈퇴사유를 입력해주세요.")
								$("#reason").focus();
								return;
							}//name
							
							var pass=$("#pwd").val();
					
							
							if(pass.trim()==""){
								alert("비밀번호를 입력해주세요.");
								$("#pawd").focus();
								return;
							}
							 var num = pass.search(/[0-9]/);
							 var eng = pass.search(/[a-zA-Z]/);
							 var spe= pass.search(/[~!@#$%^&*()_+|<>?:{}]/); 
								//비밀번호 유효성 검사 :영문, 숫자, 특수문자 중 2종류 이상 8~12자 이내
								if(pass.length < 7 || pass.length >12){
										  alert("8자리 ~ 21자리 이내로 입력해주세요.");
										  $("#pwd").focus();
										  return ;
									}else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
										  alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
										  $("#pwd").focus();
										  return;
									}
							
							
							$("#Quitboard").submit();
						}//Quitcheck
						
						</script>
				
						<div class="sub_page">
						
				
				
				
				
				
				
				
				
				<jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="session"/>
				<jsp:useBean id="qmVO" class="kr.co.sist.vo.QuitMemberVO" scope="session"/>
			
				
				<script src="http://localhost/group2_prj/static/jslibrary/miya_validator.js"></script>
				
				<form name="board" id="Quitboard" method="post" action="http://localhost/group2_prj/mypage/quit_process.jsp">
				<input type="hidden" id="menuNo" name="menuNo" value="200168" />
				<article class="drop_out inner">
					<h3 class="tit-st4">그동안 우신문화회관을 이용해 주셔서 감사합니다.</h3>
					<ul class="bul-dot f18 quit">
						<li>회원 탈퇴 시 회원정보는 바로 삭제가 됩니다. (단, 회원 서비스 내역이나 기재하신 게시글은 유지됩니다.)</li>
						<li>탈퇴 후 언제든 재 가입이 가능합니다.</li>
					</ul>
				
				<div class="member_join">
					<ul class="sect">
						<li class="item">
							<label for="reason" class="t">회원탈퇴 사유 <span class="color-purple">*</span></label>
							<div class="cont">
								<input type="text" name="reason" id="reason" placeholder="탈퇴사유를 입력해주세요" />
							</div>
						</li>
						<li class="item">
							<label for="pw" class="t">비밀번호  <span class="color-purple">*</span></label>
							<div class="cont">
								<input type="password" name="pwd" id="pwd" />
								<span class="txt ml">영문, 숫자, 특수문자 중 2종류 이상 8자 ~ 12자 이내</span>
							</div>
						</li>
						
						</ul>
						
						<div class="bbs-btn_w clearfix tac mt flr">
							<button type="button" class="bbs-btn-st2 bg-purple3" id="btnCancel" >취소</button>
							<button type="button" class="bbs-btn-st2 bg-black_r" id="btnQuit">회원탈퇴</button>
						</div>
					</div>
				
				</article>
				</form>
				


				
				
				
		
						</div>
					</div>
				
				</div><!-- #cont -->
				

			

	

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