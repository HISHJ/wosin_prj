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
		<title>FAQ-좌석</title>
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

			<div class="accordian">
				<ul class="bbs-faq">
					<li class="item">
						<div class="q">
							<span class="num">3.</span>
							<span class="sort">좌석</span>
							<span class="t"><a href="#1" title="답변 열기">휠체어 이용자의 관람구역은 어디인가요?</a></span>
						</div>
						<div class="a" id="#1" style="display:none;" >
						
							<html><head></head><body spellcheck="false"><p style="font-family: 'Malgun Gothic'; font-size: 16px; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-family: NanumGothic; font-size: 16px; line-height: normal; margin-top: 0px; margin-bottom: 0px;">휠체어 관람구역은 공연장 마다 조금씩 다릅니다.</span></p><p style="font-family: 'Malgun Gothic'; font-size: 16px; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-family: NanumGothic; font-size: 16px; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
			<br/>대극장은 1층과 2층 객석 뒷편에&nbsp;20석 <br>
			<br/>세종 M씨어터는 1층 객석 중간에 7석<br>
			<br/>세종 체임버홀은 1층 객석 제일 앞에&nbsp;5석이 마련되어 있습니다.</span></p></body></html>
						</div>
					</li>
					
					
					<li class="item">
						<div class="q">
							<span class="num">2.</span>
							<span class="sort">좌석</span>
							<span class="t"><a href="#1" title="답변 열기">잔여석 정보에 대해서 알고 싶어요.</a></span>
						</div>
						<div class="a" id="#1">
						
							<html><head></head><body spellcheck="false"><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" gothic";="" malgun="" 16px;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" gothic";="" malgun="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="">각 공연 상세페이지의 예매버튼 하단에 잔여석정보를 보실 수 있는 버튼이 있으며,</span></span><br style="font-size: 12pt;"></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" gothic";="" malgun="" 16px;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" gothic";="" malgun="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun=""><br></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" gothic";="" malgun="" 16px;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" gothic";="" malgun="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="">해당 버튼을 클릭하시면 공연일자별, 회차별 잔여석 수를 확인하실 수 있습니다.</span></span><br style="font-size: 12pt;"></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" gothic";="" malgun="" 16px;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" gothic";="" malgun="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun=""><br></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" gothic";="" malgun="" 16px;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;="" gothic";="" malgun="" 12pt;"=""><span style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" normal;="" gothic";="" malgun="">단, 예매상황에 따라 잔여석 수가 변동될 수 있으니 정확한 잔여석정보는 예매창에서 확인해 주시기 바랍니다.</span></span></p></body></html>
						</div>
					</li>
					
					
					<li class="item">
						<div class="q">
							<span class="num">1.</span>
							<span class="sort">좌석</span>
							<span class="t"><a href="#1" title="답변 열기">제가 예매한 혹은 예매할 자리가 궁금합니다.</a></span>
						</div>
						<div class="a" id="#1">
						
							<html><head></head><body spellcheck="false"><p  style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" gothic";="" malgun="" 16px;"=""><span style="line-height: normal; font-family: NanumGothic; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"><span style="line-height: normal; font-family: NanumGothic; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><span style="line-height: normal; font-family: NanumGothic; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">예매한 좌석을 다시 확인하실 경우</span></span><span style="line-height: normal; font-family: NanumGothic; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><span style="line-height: normal; font-family: NanumGothic; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">는 마이페이지에서 예매확인/취소를 클릭하시면 고객분께서 예매하신 내역을 보실 수 있습니다.</span></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" gothic";="" malgun="" 16px;"=""><span style="line-height: normal; font-family: NanumGothic; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"><span style="line-height: normal; font-family: NanumGothic; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><span style="line-height: normal; font-family: NanumGothic; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><br></span></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" gothic";="" malgun="" 16px;"=""><span style="line-height: normal; font-family: NanumGothic; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"><span style="line-height: normal; font-family: NanumGothic; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><span style="line-height: normal; font-family: NanumGothic; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">이때&nbsp;예매번호 하단의 상세내역을 클릭하시면 좌석번호를 확인하실 수 있습니다.</span></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" gothic";="" malgun="" 16px;"=""><span style="line-height: normal; font-family: NanumGothic; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"><span style="line-height: normal; font-family: NanumGothic; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><span style="line-height: normal; font-family: NanumGothic; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><br></span></span></span></p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" gothic";="" malgun="" 16px;"=""><span style="line-height: normal; font-family: NanumGothic; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"><span style="line-height: normal; font-family: NanumGothic; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><span style="line-height: normal; font-family: NanumGothic; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">또한 홈페이지 </span></span><a title="" style="color: rgb(0, 85, 255); font-size: 12pt;" href="https://www.sejongpac.or.kr/portal/main/contents.do?menuNo=200094" target="_blank"><span style="color: rgb(0, 85, 255); line-height: normal; font-family: NanumGothic; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><span style="color: rgb(0, 85, 255); line-height: normal; font-family: NanumGothic; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><span style="color: rgb(0, 85, 255); line-height: normal; font-family: NanumGothic; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">좌석배치도</span></span></span></a><span style="line-height: normal; font-family: NanumGothic; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;"><span style="line-height: normal; font-family: NanumGothic; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">를 참고하시면 됩니다. 예매할 자리는 인터넷예매를 하실 경우 직접 좌석을 선택하실 수 있는 장점이 있습니다.</span></span></span></p></body></html>
						</div>
					</li>
					
					
				</ul>
			</div>
					<div class='paginationSet'><ul class='pagination pagination-centered'><li class='i first disabled'><a title='처음 목록' href='/portal/singl/faq/list.do?menuNo=200052&searchWrd=&searchfaqGbnCd=35&searchCnd=1&amp;pageIndex=1' onclick='return false;'><span class='s'><span>처음 <span class='t'>목록</span></span></span></a></li><li class='i prev disabled'><a title='이전 목록' href='/portal/singl/faq/list.do?menuNo=200052&searchWrd=&searchfaqGbnCd=35&searchCnd=1&amp;pageIndex=0' onclick='return false;'><span class='s'><span>이전 <span class='t'>목록</span></span></span></a></li><li class='active'><span><em title='현재목록'><span>1</span></em></span></li><li class='i next disabled'><a title='다음 목록' href='/portal/singl/faq/list.do?menuNo=200052&searchWrd=&searchfaqGbnCd=35&searchCnd=1&amp;pageIndex=11' onclick='return false;'><span class='s'><span>다음 <span class='t'>목록</span></span></span></a></li><li class='i end disabled'><a title='마지막 목록' href='/portal/singl/faq/list.do?menuNo=200052&searchWrd=&searchfaqGbnCd=35&searchCnd=1&amp;pageIndex=1' onclick='return false;' data-endpage='1'><span class='s'><span>끝 <span class='t'>목록</span></span></span></a></li></ul></div>
				
			</article>
			<script>
				// $(function(){
        		// 	$("").click(function(){
        		// 	$(this).next("p").slideToggle(200);
       			// 	 $(this).parent("li").siblings("li").children("p").slideUp(200);
        		// 				});
      			// 			});

				//   $('.q').click(function(){
				// 		$('#1').slideUp();
							
				// 	});


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