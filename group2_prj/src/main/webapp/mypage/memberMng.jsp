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
		<title>회원관리</title>
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

		ul.clearfix{
			display: flex;
			align-items: center;
			justify-content: center;
		}

		</style>
	
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<!-- Header -->
				<section id="header">
			
					<!-- Logo -->
						
					<!-- Nav -->
						<nav id="nav" >
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
										<li><a href="page9.html">FAQ</a></li>
										<li><a href="subpage-manner.html">관람예절</a></li>				
									</ul>
								</li>
								<li><a href="right-sidebar.html">오시는 길</a></li>
								
								
							</ul>
	
							<ul id="header_center">
								<h1 id="logo">
									<a href="index.html">
									우신문화회관
									</a>
									</h1>	
								
							</ul>
	
							<!--right  -->
							<ul id="header_right" style="margin-right: 130px;">
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
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">회원관리</strong>
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
										<a href="memberMng.html">
											<span>마이페이지</span>
										</a>
										<li>
											<a href="page1.html">공연정보</a>
										</li>
										<li>
											<a href="subpage-ticketmethod.html">예매정보</a>
										</li>
										<li>
											<a href="subpage-FAQ1.html">고객센터</a>
										</li>
										<li>
											<a href="subpage-way.html">오시는길</a>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="rel">
									<a href="memberMng.html"><span>개인화서비스</span></a>
									<ul class="depth">
									<li><a href="memberMng.html" ><span>개인화서비스</span></a></li>
									<li><a href="subpage-FAQ1.html" ><span>FAQ</span></a></li>
									<li><a href="mypage.html" ><span>회원정보 수정</span></a></li>
									<li><a href="find_password.html" ><span>예매내역 확인·취소</span></a></li>
									
							
									</ul>
									</div>
							
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
						
				
				<jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="session"/>
				
				<%=mbVO %>
				<!-- 로그인 안했을때 로그인페이지로 돌려보내기 -->
				<%if(mbVO.getMemberId()==null){%>
					<script>
					alert("로그인 후 사용해 주세요.");
					location.href="http://localhost/prj2/design%20final%20intergration/login.jsp ";
					</script><%}%>
				
				<article class="mypage_confirm inner f18">
					<ul class="bul-dot">
						<li>반드시 티켓 예매처를 확인하시고 하단의 <strong class="color-purple">[예매내역 확인/취소]</strong> 버튼을 클릭하기 바랍니다.</li>
						<li>우신문화회관 홈페이지를 통해 <strong class="color-black">예매 시 예매 수수료</strong>가 면제됩니다.</li>
					</ul>
					<ul class="clearfix section">
						<li class="item l">
							<span class="f38">회원정보 수정</span>
							<a href="http://localhost/group2_prj/mypage/mypage.jsp" type="button" class="bg-black pop">바로가기</a>
						</li>
						<li class="item r">
							<span class="f38">예매내역확인·취소</span>
							<a href="ticket.html" class="bg-black pop">바로가기</a>
						</li>
						<li class="item r">
							<span class="f38">비밀번호 변경</span>
							<a href="passModify.jsp" class="bg-black pop">바로가기</a>
						</li>
					</ul>
				</article>
				
				<form name="FlashReservationForm" method="post" target="flash_iframe" action="#">
					<input type="hidden" name="performIdx"/>
				</form>
				<form name="sesf" id="sesf" method="post" action="">
					<input type="hidden" name="sesAgree" id="sesAgree" value="Y" />
				</form>
				
				<script src="/static/ticket/js/ticket.js"></script>
				<!-- /*<script>
				$(".mypage_confirm .pop").click(function(){
					var callBack = $(this).attr('href');
					$(this).closest("li").append('<div class="allmenu_bg"></div>');
					$(".allmenu_bg").append('<div class="modal_w wide2"></div>')
				
					$.ajax({
						url: "/portal/myPage/reservation/confirm.do?viewType=CONTBODY",
						success: function(result){
						$(".modal_w").html(result);
						modalH = $(".modal_w").outerHeight()
						$(".modal_w").attr("tabindex", "0").show().focus().css({"margin-top":-(modalH/2)});
				
							$(".layerClose").click(function(){
								$(".modal_w").removeAttr("tabindex").remove();
								$(".allmenu_bg").remove();
								location.href= callBack;
								return false;
							});
						}
					});
					return false;
				})
				
				function confirmTms(f) {
								var mAgree = $('#sesAgree').val();
						if (mAgree !='Y' ) {
									 if (!confirm("개인정보 취급위탁약관에 동의하지 않았습니다.\n동의 하시겠습니까?")) return;
									 var data = $("#frm").serialize();
								 $.post("/portal/myPage/reservation/agreeUpdate.json",
								 data,
								 function(data) {
									if( data.resultCode == 'success' ){
										alert("개인정보 취급위탁약관에 동의 하셨습니다.\n예매를 이용하실 수 있습니다.");
									$('#sesAgree').val('Y');
									showPerformListPop();
									}else{
										alert('작업에 실패하였습니다.');
									}
									return false;
								 });
				
							/* var reserForm = document.FlashReservationForm;
							reserForm.performIdx.value = "";
							reserForm.action="http://www.sejongpac.or.kr/member/mypage/myinfo/ticketCheck.asp";
							reserForm.target="flash_iframe";
							reserForm.submit(); */
							
								 showPerformListPop();
						} else {
							showPerformListPop();
						}
						}
				
				function inquiryPackageTicket(){
					showPackageListPop();
					/* var action = "http://flex.sejongpac.or.kr/ireser.jsp?ccode=102103&locale=ko_KR&pac=Y&rlist=Y&ticketcode=&pac=&memberid=&user_member_info1=&user_member_info2=&wurl=www.sejongpac.or.kr&wext=asp&ssl=N";
					$("#flash_iframe").attr("src", action);
					$('#div_flash, #overlay').show(); */
				}
				</script>*/ -->
				
				
				<div id="div_flash">
					<iframe name="flash_iframe" id="flash_iframe" width="0" height="0" frameborder="0" scrolling="no" src="" title="예매프레임"></iframe>
				</div>
				<div id="overlay"></div>
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