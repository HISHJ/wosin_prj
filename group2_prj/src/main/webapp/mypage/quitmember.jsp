<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="회원탈퇴"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
   
<%
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
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<!--제이쿼리-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.dropotron.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
		<style>
			section#header{
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

		<c:import  url="http://localhost/group2_prj/common/user_subpage_header.jsp" > 
    	<c:param name="memberId" value="<%= memberId %>"></c:param> 
    	</c:import>
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
										<a href="http://localhost/group2_prj/mypage/memberMng.jsp">
											<span>개인화서비스</span>
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
									<a href="http://localhost/group2_prj/mypage/mypage.jsp" ><span>회원정보 수정</span></a>
									<ul class="depth">
									<li><a href="http://localhost/group2_prj/mypage/memberMng.jsp" ><span>개인화서비스</span></a></li>
									<li><a href="http://localhost/group2_prj/mypage/passModify.jsp" ><span>비밀번호변경</span></a></li>
									<li><a href="http://localhost/group2_prj/mypage/mypage.jsp" ><span>회원정보 수정</span></a></li>
									<li><a href="http://localhost/group2_prj/reservation/ticket_page.jsp" ><span>예매내역 확인·취소</span></a></li>
									</ul>
									</div>
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
			
			<c:import url="http://localhost/group2_prj/common/user_allPage_footer.jsp"/> 
			
			<!-- End footer -->



	</body>
</html>