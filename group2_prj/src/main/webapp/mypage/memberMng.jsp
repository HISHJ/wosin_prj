<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
//세션 넘겨받기 검증 완료
String memberId = (String)session.getAttribute("memberId");

%> 
<%
if(memberId == null){
	response.sendRedirect("http://localhost/group2_prj/main/index.jsp");
}
%>   

 <!DOCTYPE HTML>

<html>
	<head>
		<title>회원관리</title>
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

		ul.clearfix{
			display: flex;
			align-items: center;
			justify-content: center;
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
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">개인화 서비스</strong>
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
									<li><a href="subpage-FAQ1.html" ><span>비밀번호변경</span></a></li>
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
				
		
				<%-- <!-- 로그인 안했을때 로그인페이지로 돌려보내기 -->
				<%if(mbVO.getMemberId()==null){%>
					<script>
					alert("로그인 후 사용해 주세요.");
					location.href="http://localhost/group2_prj/login/login.jsp ";
					</script><%}%>
				 --%>
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
							<a href="http://localhost/group2_prj/reservation/ticket_page.jsp" class="bg-black pop">바로가기</a>
						</li>
						<li class="item r">
							<span class="f38">비밀번호 변경</span>
							<a href="http://localhost/group2_prj/mypage/passModify.jsp" class="bg-black pop">바로가기</a>
						</li>
					</ul>
				</article>
				
				<form name="FlashReservationForm" method="post" target="flash_iframe" action="#">
					<input type="hidden" name="performIdx"/>
				</form>
				<form name="sesf" id="sesf" method="post" action="">
					<input type="hidden" name="sesAgree" id="sesAgree" value="Y" />
				</form>
				
				<script src="http://localhost/group2_prj/static/ticket/js/ticket.js"></script>
		
				
				<div id="div_flash">
					<iframe name="flash_iframe" id="flash_iframe" width="0" height="0" frameborder="0" scrolling="no" src="" title="예매프레임"></iframe>
				</div>
				<div id="overlay"></div>
						</div>
					</div>
				
				</div><!-- #cont -->
				
				
			
			

	

				<!----------------------------------------------여기서부터 끝까지 footer-------------------------------------------->

			
			<!-- Footer -->
			
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