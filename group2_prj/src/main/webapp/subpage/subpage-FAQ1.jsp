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
		<title>FAQ-공연</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/main.css" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/reset.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/subheader.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/headerFooter.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/login.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/cvs&FAQ.css">
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
<%if(memberId == null){%>
	<style>
	#nav {
	margin-right: 150px;
	}
	</style>
	<%} %>

	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">

			<!-- 헤더 -->
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

						<!-- navi bar -->
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
									<a href="#"><span>FAQ</span></a>
									<ul class="depth">
										<li><a href="http://localhost/group2_prj/subpage/subpage-FAQ1.jsp">FAQ</a></li>
										<li><a href="http://localhost/group2_prj/subpage/subpage-manner.jsp">관람예절</a></li>				
									</ul>
									</div>
								</li>
							
						</ul>
					</div>

				</div>
				




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
					<!-- 	<form name="frm" id="frm" method="post" action="/portal/singl/faq/list.do?menuNo=200052">  -->
							<input type="hidden" name="bbsId">
							<input type="hidden" name="pageIndex" value="1">
							<div class="bbs-category clearfix select btn_w">
								<label for="searchfaqGbnCd" class="hide">분류 선택</label>
								<select name="searchfaqGbnCd" id="searchfaqGbnCd" onchange="location.href=this.value">
									
											<option value="http://localhost/group2_prj/subpage/subpage-FAQ1.jsp">공연</option>
								   
										   <option value="http://localhost/group2_prj/subpage/subpage-FAQ2.jsp" >예매</option>
								   
										   <option value="http://localhost/group2_prj/subpage/subpage-FAQ3.jsp">좌석</option>
								   
										   <option value="http://localhost/group2_prj/subpage/subpage-FAQ4.jsp">관람</option>
								   
										   <option value="http://localhost/group2_prj/subpage/subpage-FAQ5.jsp">회원</option>
										  
								   
								</select>
						
							
							</div>
						<!-- 	</form> -->
							<ul class="bbs-faq">
								
								<li class="item">
									<div class="q">
										<span class="num">6.</span>
										<span class="sort">공연</span>
										<span class="t"><a href="#1" title="답변 열기">공연 영상자료(VIDEO, DVD)를 구할 수 있나요?</a></span>
									</div>
									<div class="a" id="#1">
									
										<html><head></head><body spellcheck="false"><p style="line-height: 120%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 14pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;="" 19.2px;=""><span style="line-height: 14pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 19.2px;="">공연별 주최측에 문의하시기 바랍니다.</span></span></p><p style="line-height: 120%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 14pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 19.2px;=""><br></span></p><p style="line-height: 120%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 14pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 19.2px;="">주최측 문의 전화번호는 각 공연정보를 참고하시기 바랍니다.</span></p><p style="line-height: 120%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 14pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 19.2px;=""><br></span></p><p style="line-height: 120%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 14pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;="" 19.2px;=""><span style="line-height: 14pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 19.2px;="">
						<br/>(각 공연정보는 공연명을 아실 경우 홈페이지 상단의 검색창을 통해 검색하시거나,</span></span><br style="font-size: 12pt;"><span style="line-height: 14pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;="" 19.2px;=""><span style="line-height: 14pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 19.2px;="">
						<br/></span></span></p><p style="line-height: 120%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun=""><span style="line-height: 14pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;="" 19.2px;=""><span style="line-height: 14pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 19.2px;=""><span style="line-height: 14pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;="" 19.2px;=""><span style="line-height: 14pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 19.2px;="">공연 날짜를 아실 경우 공연/전시 메뉴에서 캘린더를 통해 검색하시면 됩니다.)</span></span></span></span></p></body></html>
									</div>
								</li>
								
								
								<li class="item">
									<div class="q">
										<span class="num">5.</span>
										<span class="sort">공연</span>
										<span class="t"><a href="#1" title="답변 열기">무료로 관람할 수 있는 공연이 있나요?</a></span>
									</div>
									<div class="a" id="#1">
									
										<html><head></head><body spellcheck="false"><p style="line-height: 150%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" gothic";="" malgun="" 16px;"=""><span style="line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><span style="line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;="">비정기적으로 전석초대공연을 하는 경우도 있으며, 이는 각 공연별로 주최측이 다르기때문에 별도로 문의가 필요합니다. </span></span></p><p style="line-height: 150%; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" gothic";="" malgun="" 16px;"=""><span style="line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;=""><br style="font-size: 12pt;"><span style="line-height: 18pt; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" gothic";="" malgun="" 24px;="">세종문화회관에 회원으로&nbsp;가입하신 후 뉴스레터 구독에 동의하시면, 공연정보안내를 매월 받아보실 수 있습니다.</span></span></p></body></html>
									</div>
								</li>
								
								
								<li class="item">
									<div class="q">
										<span class="num">4.</span>
										<span class="sort">공연</span>
										<span class="t"><a href="#1" title="답변 열기">공연팜플렛을 구입할 수 있을까요?</a></span>
									</div>
									<div class="a" id="#1">
									
										<html><head></head><body spellcheck="false"><p style="font-family: 'Malgun Gothic'; font-size: 16px; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">공연당일은 공연장 로비에서 팜플렛을 구입하실 수 있습니다.</span></p><p style="font-family: 'Malgun Gothic'; font-size: 16px; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
						<br/>공연일이 지난 경우에는 공연주최측에 문의하시기 바랍니다.</span><br style="font-size: 12pt;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
						<br/>주최측 문의전화는 각 공연정보를 참고하시기 바랍니다.</span><br style="font-size: 12pt;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
						<br/>(각 공연정보는 공연명을 아실 경우 홈페이지 상단의 검색창을 통해 검색하시거나,</span><br style="font-size: 12pt;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
						<br/>&nbsp;공연 날짜를 아실 경우 공연/전시 메뉴에서 캘린더를 통해 검색하시면 됩니다.)</span></p></body></html>
									</div>
								</li>
								
								
								<li class="item">
									<div class="q">
										<span class="num">3.</span>
										<span class="sort">공연</span>
										<span class="t"><a href="#1" title="답변 열기">최근 공연, 전시정보를 알고 싶습니다.</a></span>
									</div>
									<div class="a" id="#1">
									
										<html><head></head><body spellcheck="false"><p style="line-height: 150%; font-family: 'Malgun Gothic'; font-size: 16px; margin-top: 0px; margin-bottom: 0px;" malgun="" gothic";="" font-size:="" 16px;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" 12pt;=""><span malgun="" gothic";="" line-height:="" 24px;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: 24px; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: 'Malgun Gothic'; line-height: 24px; margin-top: 0px; margin-bottom: 0px;">홈페이지, 서비스플라자, 콜센터(02-399-1000, 오전 10시부터 오후 8시까지 연중무휴)를 통해 공연, 전시정보를 접하실 수 있습니다</span></span></p></body></html>
									</div>
								</li>
								
								
								<li class="item">
									<div class="q">
										<span class="num">2.</span>
										<span class="sort">공연</span>
										<span class="t"><a href="#1" title="답변 열기">메일을 통해 공연정보를 받고 싶어요.</a></span>
									</div>
									<div class="a" id="#1">
									
										<html><head></head><body spellcheck="false"><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun="" normal;="">세종문화회관 홈페이지에 가입을 하신후</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun="" normal;="">&nbsp;</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun="" normal;=""><span style="color: rgb(0, 0, 255); line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun="" normal;="">메일링 수신 동의 체크를 해주시면</span>, 매월 최신 공연 정보를 이메일을 통해 받아보실 수 있습니다.</p><p style="line-height: normal; font-family: Times New Roman; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;" 0px;"="" 0px;="" 16px;="" gothic";="" malgun="" normal;=""><br>
						<br/>회원가입시 메일 주소를 정확히 입력하여 주시기 바랍니다.</p></body></html>
									</div>
								</li>
								
								
								<li class="item">
									<div class="q">
										<span class="num">1.</span>
										<span class="sort">공연</span>
										<span class="t"><a href="#1" title="답변 열기">지난 공연, 전시정보를 알고 싶어요.</a></span>
									</div>
									<div class="a" id="#1">
									
										<html><head></head><body spellcheck="false"><p style="line-height: normal; font-family: 'Malgun Gothic'; font-size: 16px; margin-top: 0px; margin-bottom: 0px;" times="" new="" roman";="" margin-top:="" 0px;="" margin-bottom:="" font-size:="" 16px;"=""><span style="font-family: NanumGothic; font-size: 16px; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="line-height: normal; font-size: 12pt; font-family: NanumGothic; margin-top: 0px; margin-bottom: 0px;" times="" new="" roman";="" margin-top:="" 0px;="" margin-bottom:="" font-size:="" 12pt;"=""><span times="" new="" roman";="" line-height:="" normal;="" margin-top:="" 0px;="" margin-bottom:="" 0px;"="" style="font-size: 12pt; font-family: NanumGothic; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-size: 12pt; font-family: NanumGothic; line-height: normal; margin-top: 0px; margin-bottom: 0px;">지난 공연/전시자료를 검색하시고자 할 경우에는 홈페이지 상단의 검색창에 공연/전시명을 입력하시면 쉽고 빠르게 검색하실 수 있습니다.</span></span></span></span></p></body></html>
									</div>
								</li>
								
								
							</ul>
							
								<div class='paginationSet'><ul class='pagination pagination-centered'><li class='i first disabled'><a title='처음 목록' href='/portal/singl/faq/list.do?menuNo=200052&searchWrd=&searchfaqGbnCd=33&searchCnd=1&amp;pageIndex=1' onclick='return false;'><span class='s'><span>처음 <span class='t'>목록</span></span></span></a></li><li class='i prev disabled'><a title='이전 목록' href='/portal/singl/faq/list.do?menuNo=200052&searchWrd=&searchfaqGbnCd=33&searchCnd=1&amp;pageIndex=0' onclick='return false;'><span class='s'><span>이전 <span class='t'>목록</span></span></span></a></li><li class='active'><span><em title='현재목록'><span>1</span></em></span></li><li class='i next disabled'><a title='다음 목록' href='/portal/singl/faq/list.do?menuNo=200052&searchWrd=&searchfaqGbnCd=33&searchCnd=1&amp;pageIndex=11' onclick='return false;'><span class='s'><span>다음 <span class='t'>목록</span></span></span></a></li><li class='i end disabled'><a title='마지막 목록' href='/portal/singl/faq/list.do?menuNo=200052&searchWrd=&searchfaqGbnCd=33&searchCnd=1&amp;pageIndex=1' onclick='return false;' data-endpage='1'><span class='s'><span>끝 <span class='t'>목록</span></span></span></a></li></ul></div>
							
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
			
			<!-- tap관련 추가한거 -->
			<script src="http://localhost/group2_prj/assets/js/tab.js"></script>

	</body>
</html>