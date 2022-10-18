<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<title>비밀번호 변경</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="apple-touch-icon" sizes="180x180" href="http://localhost/group2_prj/static\commons\img\favicon_180.png">
    <link rel="icon" type="image/png" sizes="32x32" href="http://localhost/group2_prj/static\commons\img\favicon_32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="http://localhost/group2_prj/static\commons\img\favicon_16.png">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\main.css" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\reset.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\subheader.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\headerFooter.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\login.css">
	
	    <link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static\portal\css\sub_new.css">
        <link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static\portal\css\style.css">
        <link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static\portal\css\layout_new.css">
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<!--제이쿼리-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<!-- Scripts -->
			<script src="http://localhost/group2_prjassets/js/jquery.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/jquery.dropotron.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/browser.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/breakpoints.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/util.js"></script>
			<script src="http://localhost/group2_prj/assets/js/main.js"></script>
		
		<style>
	 section#header{
 	 background: url("http://localhost/group2_prj/images/subvisual-common.jpg") no-repeat ; 
  	 background-size: 100%; 
  	 background-attachment: fixed;
	 }
		</style>
		<script>
		$(function(){
			$("input:checkbox[name='save_id']").prop("checked", true);
		});

		</script>
	
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">

			<c:import  url="http://localhost/group2_prj/common/user_subpage_header.jsp" > 
    		<c:param name="memberId" value="<%= memberId %>"></c:param> 
    		</c:import>

						<!--❤️여기에 서브제목 입력하세욮 ex) 공연일정-->
						<div id="sut-t_wrap">
						<h2 id="sub-t">
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">비밀번호 변경</strong>
						</h2>
					</div>
					</section>
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
									<a href="http://localhost/group2_prj/mypage/passModify.jsp" ><span>비밀번호변경</span></a>
									<ul class="depth">
									<li><a href="http://localhost/group2_prj/mypage/memberMng.jsp" ><span>개인화서비스</span></a></li>
									<li><a href="http://localhost/group2_prj/mypage/passModify.jsp" ><span>비밀번호변경</span></a></li>
									<li><a href="http://localhost/group2_prj/mypage/mypage.jsp" ><span>회원정보 수정</span></a></li>
									<li><a href="http://localhost/group2_prj/reservation/ticket_page.jsp" ><span>예매내역 확인·취소</span></a></li>
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
							$("#pwChange").click(function(){
									pwChk();
								
							});//click
							
							
							
						});//ready
						
						
					function pwChk(){
						
						var pass=$("#password").val();
						var pass2=$("#repassword").val();
						
						if(pass.trim()==""){
							alert("비밀번호를 입력해주세요.");
							$("#password").focus();
							return false;
						}
						 var num = pass.search(/[0-9]/);
						 var eng = pass.search(/[a-zA-Z]/);
						 var spe= pass.search(/[~!@#$%^&*()_+|<>?:{}]/); 
							//비밀번호 유효성 검사 :영문, 숫자, 특수문자 중 2종류 이상 8~12자 이내
							if(pass.length < 7 || pass.length > 13){
									  alert("8자리 ~ 12자리 이내로 입력해주세요.");
									  $("#password").focus();
									  return;
								}
						 if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
									  alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
									  $("#password").focus();
									  return;
								}
						 
						 if(pass2!=pass){
							 alert("비밀번호를 다시 확인해주세요.")
							$("#repassword").focus();
							 return ;
						 }
						if(pass2.trim()==""){
							alert("비밀번호를 한번 더 확인해주세요.")
							$("#repassword").focus();
							
							return;
						}//pass
						$("#pmFrm").submit();
					
					}//pwChk
						</script>

				
						<div class="sub_page">
						
				
				
				
				
				
				 <style>
				.tabs-st1,.tabs-st2{display: none;}
				</style>
				
				<!-- 세션 값 받아오기 useBean : scope="session"사용하면 필요없을듯! -->
			<%-- 	<%String id=(String)session.getAttribute("memberId"); %> --%>
			<form id="pmFrm" name="pmFrm" method="post" action="http://localhost/group2_prj/mypage/pm_process2.jsp">
				<article class="find_member inner member_com">
						<div class="group">
						<h3 class="tit-st4">비밀번호 변경</h3>
						<div class="box box_2">
						
							<div class="form_w">
								<h4 class="t">변경하실 비밀번호를 입력해주세요.</h4>
									<ul class="sect sect2">
										<li class="item item2">
											<label for="password" class="t">새 비밀번호 </label>
											<div class="cont">
												<input type="password" name="pwd" id="password" style="width:300px; height:50px;" maxlength="20"/>
												<span class="txt ml">영문, 숫자, 특수문자 중 2종류 이상 8자 ~ 12자 이내</span>
											</div>
										</li>
										<li class="item  item2">
											<label for="repassword" class="t">비밀번호 확인  </label>
											<div class="cont">
												<input type="password" name="repassword" id="repassword"  style="width:300px; height:50px;" maxlength="20"/>
												<span class="txt ml">안전한 비밀번호 변경을 위해 다시 한번 입력해주시길 바랍니다.</span>
											</div>
										</li>

									</ul>
									<div class="bbs-btn_w clearfix tac">
										<button type="button" id="pwChange" class="bbs-btn-st2 bg-purple3"  >변경</button>
										<button type="button" class="bbs-btn-st2 bg-black_r">취소</button>
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
	
			
				<!----------------------------------------------여기서부터 끝까지 footer-------------------------------------------->

			<!-- Footer -->
			
			<c:import url="http://localhost/group2_prj/common/user_allPage_footer.jsp"/> 
			
			<!-- End footer -->


	</body>
</html>