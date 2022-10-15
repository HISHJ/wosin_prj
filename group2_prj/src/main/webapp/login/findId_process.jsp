<%@page import="kr.co.sist.vo.MemberVO"%>
<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 <%  //로그인 되어있는 경우, 메인페이지로 이동
 if(session.getAttribute("memberId") != null){
response.sendRedirect("http://localhost/group2_prj/main/index.jsp");
}  
%>  
<!DOCTYPE HTML>

<html>
	<head>
		<title>아이디 찾기</title>
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
		<script>
		$(function(){
			$("input:checkbox[name='save_id']").prop("checked", true);
		});

		</script>
	<style>
section#header {
	background:url("http://localhost/group2_prj/images/subvisual-common.jpg") no-repeat;
	background-size: 100%;
	background-attachment: fixed;
}

#nav {
	margin-right: 130px;
}
</style>
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">
	    <!-- header -->
		<c:import url="http://localhost/group2_prj/common/user_subpage_header.jsp"/>
		<!-- header -->

						<!--❤️여기에 서브제목 입력하세욮 ex) 공연일정-->
						<div id="sut-t_wrap">
						<h2 id="sub-t">
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">아이디 찾기</strong>
						</h2>
					  </div>
					</section>

						<!--------------------------------------위까지가 헤더----------------------------------------->

				
				 </section>

	    <!-- 로그인 영역 nav -->			
		<c:import url="http://localhost/group2_prj/login/user_subpage_header2_login.jsp"/>
		<!-- 로그인 영역 nav 끝  -->

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
						
				
				
				
				
				<script src="http://localhost/group2_prj//static/commons/js/validUtil.js"></script>
			
				
				 <style>
				.tabs-st1,.tabs-st2{display: none;}
				</style>
		
							
</body>

					<%request.setCharacterEncoding("UTF-8");%>
				
				<%
							/* phone값 합치기  */
									String tel1=request.getParameter("tel1");
									String tel2=request.getParameter("tel2");
									String tel3=request.getParameter("tel3");
									
									String phone=tel1+"-"+tel2+"-"+tel3;%>
			
			
				<jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="session"/>
				<jsp:setProperty property="name" name="mbVO"/>
				<jsp:setProperty property="phone" name="mbVO" value="<%=phone %>"/>
				<jsp:setProperty property = "memberId" name="mbVO"/>
				<jsp:setProperty property="mdate" name="mbVO"/>		
			
					
		<% 		
				MemberDAO mbrDAO =MemberDAO.getInstance();
			 	mbVO = mbrDAO.selectMemberId(mbVO);
				
				if(mbVO.getMemberId()==null){%>
					<script>
						alert("존재하지 않은 계정입니다.");
						location.href="find_id.jsp"
					</script>
				
				<%}else{ %>
						
					<%} %> 
				
					
<article class="find_confirm inner member_com">
	<h3 class="tit-st4">아이디 찾기 결과 </h3>
	<div class="box">
		<h4 class="t">${param.name }님이 가입하신 아이디는 다음과 같습니다.</h4>
		<div class="bg">
			<ul class="select f18">
						<li><label for="id1">아이디명 : <%=mbVO.getMemberId() %> </label></li>
						<li><label for="id1">가입일: <%=mbVO.getMdate() %> </label></li>
						 
						
					
				
			</ul>
		</div>
	</div>

	<div class="bbs-btn clearfix tac">
		<a href="login.jsp" class="bbs-btn-st2 bg-purple3">로그인</a>
		<a href="find_password.jsp" class="bbs-btn-st2 bg-black_r">비밀번호찾기</a>
	</div>

</article>
		</div>
	</div>
				
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