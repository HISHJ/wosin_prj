<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- session -->
<!DOCTYPE HTML>
<html>
	<head>
		<title>비밀번호 찾기</title>
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
		
		
	
		
		
	<style>
    section#header{
 	background: url("http://localhost/group2_prj/images/subvisual-common.jpg") no-repeat ; 
  	background-size: 100%; 
  	background-attachment: fixed;
  
	}

	</style>
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">
		<!-- //2022-10-16 13:30 유설빈  -->
		<c:import
			url="http://localhost/group2_prj/common/user_subpage_header.jsp">
			
		</c:import>

		<!--❤️여기에 서브제목 입력하세욮 ex) 공연일정-->
		<div id="sut-t_wrap">
			<h2 id="sub-t">
				<strong style="opacity: 1; font-family: 'Noto Sans KR', sans-serif; font-weight: 700;" class="ani">비밀번호 찾기</strong>
			</h2>
		</div>
		</section>

		<!--------------------------------------위까지가 헤더----------------------------------------->

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
									<a href="http://localhost/group2_prj/login/login.jsp" >
										<span>통합회원서비스</span>
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
									<a href="http://localhost/group2_prj/login/find_password.jsp" ><span>패스워드 찾기</span></a>
									<ul class="depth">
									<li><a href="http://localhost/group2_prj/login/login.jsp" ><span>로그인</span></a></li>
									<li><a href="http://localhost/group2_prj/signUp/signup.jsp" ><span>회원가입</span></a></li>
									<li><a href="http://localhost/group2_prj/login/find_id.jsp" ><span>아이디 찾기</span></a></li>
									<li><a href="http://localhost/group2_prj/login/find_password.jsp" ><span>패스워드 찾기</span></a></li>
									
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


	<script>
		$(function(){
						$("#btnpwChk").click(function(){
							check()
				
									});
						});
						
		
		function check(){
			/* 비밀번호찾기 유효성검사 */
			var id=$("#memberId").val();	
				if(id.trim()==""){
					alert("아이디를 입력해주세요.");
					$("#memberId").focus();
					return;
				}

				//아이디 특수문자 제외 영문,숫자 4~20자이내+중복검사 필수
				 if(!id.match('^[a-zA-Z0-9]{4,20}$')) {
						 alert('아이디는 특수문자를 제외한 영문, 숫자 조합 4~20자로 입력해주세요.');
						$('#memberId').focus();
						 return;
					 }//idcheck
				
						var name=$("#memberName").val();
						if(name.trim()==""){
							alert("이름을 입력해주세요.")
							$("#memberName").focus();
							return;
						}//name
						
						var phone2=$("#tel2").val();
						var phone3=$("#tel3").val();
						if(phone2.trim()==""){
							alert("휴대폰 중간번호를 입력해주세요.");
							$("#tel2").focus();
							return  ;
						}//phone
						
						if(phone3.trim()==""){
							alert("휴대폰 중간번호를 입력해주세요.");
							$("#tel3").focus();
							return  ;
						}//phone
						
						 	$("#pwFrm").submit(); 
				
						}//check
			
	</script>


						<div class="sub_page">
						
				
				
				
				
				<script src="http://localhost/group2_prj/static/commons/js/validUtil.js"></script>
				
				 <style>
				.tabs-st1,.tabs-st2{display: none;}
				</style>
			<form id="pwFrm" name="pwFrm" method="post" action="http://localhost/group2_prj/login/findpw_process.jsp">
				<article class="find_member inner member_com">
					<div class="group">
						<h3 class="tit-st4">비밀번호 찾기</h3>
						<div class="box">
							<div class="top top_find" id="ck_input">
								<span><input type="radio" name="find1" id="find1_1" checked="checked"/> 
									<label for="find1_1">회원정보에 등록한 휴대전화로 인증</label></span>

							</div>
							<div id="ck_cont">
								<div class="form_w form1">
									<h4 class="t">회원정보에 등록한 아이디와 이름, 휴대전화번호가 일치해야 비밀번호를 변경할 수 있습니다. </h4>
									<ul class="form">
										<li>
											<label for="name" class="tt">아이디</label>
											<div class="cont">
												<input type="text" name="memberId" id="memberId" />
											</div>
										</li>
										<li>
											<label for="name" class="tt">이름</label>
											<div class="cont">
												<input type="text" name="name" id="memberName" />
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
												<!-- js처리 -->
												<button type="button" class="bg-black" id="btnpwChk" >비밀번호 <span class="block-t">찾기</span></button>
												</div>
											
											</div>
										</li>
									</ul>
								</div>
							
							</div>
						</div>
					</div><!-- .group -->
			</article>
		</form>		
				


								
								<!-- <div class="find_info find_id">
									<!-- ✔️값 받아와야하는 영역  : 회원 테이블 - 아이디, 가입일?-
									<span class="find_id_inner">아이디명: 아이디명</span>
									<span >가입일 : 가입날짜</span>

								</div> -->
								<!-- <button class="bg-black btn-form" type="button" onclick="checkPlusPopup();" >확인</button> -->
							</div>
						</div>
					</div>
				</article>
				
				<form method="post" name="authForm">
					<input type="hidden" name="serverAuth" id="serverAuth" />
				</form>
				
				<form method="post" name="smsForm" id="smsForm" action="/portal/member/user/findIdResut.do?menuNo=200146">
					<input type="hidden" name="userId" id="userId" value="" />
					<input type="hidden" name="userName" id="userName"  />
					<input type="hidden" name="userDi" id="userDi"  />
					<input type="hidden" name="userTel" id="userTel"  />
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