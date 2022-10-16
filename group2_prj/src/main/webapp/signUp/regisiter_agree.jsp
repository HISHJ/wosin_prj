<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//세션 넘겨받기 검증 완료
String memberId = (String)session.getAttribute("memberId");
%> 
<%  //로그인 되어있는 경우, 메인페이지로 이동
 if( session.getAttribute("memberId") != null){
response.sendRedirect("http://localhost/group2_prj/main/index.jsp");
}  
%>       
<!DOCTYPE HTML>

<html>
	<head>
		<title>회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="apple-touch-icon" sizes="180x180" href="http://localhost/group2_prj/common/favicon_180.png">
    <link rel="icon" type="image/png" sizes="32x32" href="http://localhost/group2_prj/common/favicon_32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="http://localhost/group2_prj/common/favicon_16.png">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/main.css" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/reset.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/subheader.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/headerFooter.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/login.css">
	
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
		<!-- Scripts -->
			<script src="http://localhost/group2_prj/assets/js/jquery.min.js"></script>
			<script src="https://localhost/group2_prj/assets/js/jquery.dropotron.min.js"></script>
			<script src="https://localhost/group2_prj/assets/js/browser.min.js"></script>
			<script src="https://assets/js/breakpoints.min.js"></script>
			<script src="https://assets/js/util.js"></script>
			<script src="https://assets/js/main.js"></script>
	
	<%if(memberId == null){%>
	<style>
	#nav {
	margin-right: 130px;
	}
	</style>
	<%} %>
	<style>

	section#header{
    background: url("http://localhost/group2_prj/images/subvisual-200001.jpg") no-repeat ; 
    background-size: 100%; 
    background-attachment: fixed;
	 
	 }
 
    join_agree label {
    margin-left: 30px !important;
    }

   .join_agree .group .ck {
    position: absolute;
    right: 0;
    top: .3em;
    font-weight: 400;
    }
    span.ck {
    
    margin-top: 10px;
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
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">약관동의</strong>
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
									<a href="#">
										<span>회원서비스</span>
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
											<a href="subpage-FAQ1.html">고객센터</a>
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
									<a href="http://localhost/group2_prj/signUp/signup.jsp" ><span>회원가입</span></a>
									<ul class="depth">
									<li><a href="http://localhost/group2_prj/login/login.jsp" ><span>로그인</span></a></li>
									<li><a href="http://localhost/group2_prj/signUp/signup.jsp" ><span>회원가입</span></a></li>
									<li><a href="http://localhost/group2_prj/login/find_id.jsp" ><span>아이디 찾기</span></a></li>
									<li><a href="http://localhost/group2_prj/login/find_password.jsp" ><span>패스워드 찾기</span></a></li>
									
									</ul>
									</div>
								</li>
							
							
						</ul>
					</div>

				</div>
					<!-- 로그인 영역끝 -->
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
						
				
				
				
				
				 <style>
				.sub-t,.tabs-st1,.tabs-st2{display: none;}
				</style>
				
				
				<script>
				$(function() {
					$( '.check-all' ).click( function() {
							$( '.input_check' ).prop( 'checked', this.checked );
					} );
				});
				
				function fn_agree() {
					if (!$("input[id='agree1']").is(":checked")) {
						alert("우신문화회관 회원 약관에 동의하셔야 가입이 가능합니다.");
						$("input[id='agree1']").focus();
						return;
					}
					if (!$("input[id='agree2']").is(":checked")) {
						alert("개인정보 수집 및 이용안내 약관에 동의하셔야 가입이 가능합니다.");
						$("input[id='agree2']").focus();
						return;
					}
					if (!$("input[id='agree3']").is(":checked")) {
						alert("개인정보 취급위탁 약관에 동의하셔야 가입이 가능합니다.");
						$("input[id='agree3']").focus();
						return;
					}
					$("input[name='agree']").val("Y");
					document.f.submit();
				}
				</script>
				<form name="f" method="post" action="http://localhost/group2_prj/signUp/signup.jsp">
					<input type="hidden" name="joinType" id="joinType" />
					<input type="hidden" name="agree" />
					<input type="hidden" name="authGubun" value="A00008" />
					<input type="hidden" name="encData" value="" />
					<input type="hidden" name="memberCel" id="memberCel" value="" />
					<input type="hidden" name="memberType" id="memberType" value="1" />
					<input type="hidden" name="siteType" id="siteType" value="" />
				
				
					<article class="join_agree inner member_com">
						<header class="tit">
							<h2 class="t">아래 내용에 동의해주세요.</h2>
							<p class="f38">원활한 서비스 제공을 위해 이용 약관 등의 내용에 동의해 주세요.</p>
				
							<div class="ck">
								<div class="ck_inner">
								<input type="checkbox" name="" id="agree_all" class="check-all"/> 
								<label for="agree_all">우신문화회관 약관 전체 동의  </label>
							</div>
							</div>
						</header>
				
						<div class="group_w">
				
							<div class="group">
								<h3 class="t">우신문화회관 회원 약관(필수)</h3>
								<span class="ck"><input type="checkbox" name="agree1" id="agree1" class="input_check" /> <label for="agree1">개인정보처리방침에 동의합니다.  </label></span>
				
								<div class="box" tabindex="0">
									
				제1장 총칙
				<br><br>
				제1조 (목적)<br>
				이 약관은 우신문화회관(이하 “회관”이라 함)이 운영하는 우신문화회관 회원(이하“회원”이라 함) 가입과 회원 자격, 혜택 등의(이하“서비스”라 함) 이용조건 및 절차에 관하여 우신문화회관과 회원 간의 권리, 의무 및 책임사항의 규정을 목적으로 합니다.
				<br><br>
				제2조 (약관의 효력 및 개정)<br>
				1. 이 약관은 회관이 지면 또는 인터넷 홈페이지 화면에 게시하거나 기타의 방법으로 이용자에게 공지함으로써 효력이 발생합니다.<br>
				2. 회관은 필요에 따라 이 약관을 개정할 수 있으며 변경된 약관은 1항과 같은 방법으로 공지함으로써 효력이 발생합니다.<br>
				3. 변경된 약관의 효력발생일 이후의 계속적인 서비스 이용은 변경 약관에 동의한 것으로 간주 합니다.
				<br><br>
				제3조 (약관 외 준칙)<br>
				1. 본 약관은 회관이 제공하는 서비스에 관한 이용규정 및 별도 약관과 함께 적용됩니다.
				<br>
				2. 본 약관에 명시되지 않은 사항은 관계 법령의 규정에 의합니다.
				<br><br>
				제4조 (용어의 정의)<br>
				본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
				1. “이용자”란 약관에 따라 회관이 제공하는 서비스를 받는 고객을 말합니다.<br>
				2. “가입”이란 회관이 제공하는 회원가입 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위를 말합니다.<br>
				3. “일반회원”이란 본 약관을 인지하고, 회관에 개인정보를 제공하여 회원으로 등록하여 아이디와 회원번호를 부여 받은 자로서, 정상적으로 우신문화회관 서비스를 이용할 수 있는 권한을 부여 받은 고객을 말합니다. <br>
				4. “기부회원”이란 회관에 개인정보를 제공하고 기부금을 납부하여 회관이 제공하는 예우 서비스를 받는 고객을 말합니다.<br>
				5. “기획공연”이란 공연의 주최가 회관이 되며 공연에 따른 모든 권한과 책임을 회관이 소유하는 공연을 말합니다.(전시의 경우도 동일함)<br>
				6. “공동 주최 공연”이란 회관이 기획사 또는 공연단체와 공동 명의로 시행하는 공연을 말하며, 회관과 공동주최의 별도 약정에 의해 공연에 따른 책임과 권한의 범위가 제한적인 공연을 말합니다.(전시의 경우도 동일함)<br>
				7. “대관 공연”이란 회관은 공연 장소만 제공하고, 장소를 임대한 공연 단체나 기획사에서 공연에 따른 모든 책임과 권한을 소유하는 공연을 말합니다.(전시의 경우도 동일함)<br>
				8. “인터넷 ID”란 회원식별과 회원의 서비스 이용을 위하여 회원이 신청하고 회관이 승인하는 문자 및 숫자의 조합을 말합니다.<br>
				9. “비밀번호”란 이용자와 인터넷 ID가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자 자신이 선정한 문자와 숫자의 조합을 말합니다.<br>
				10. “탈퇴” 란 회원이 이용계약을 종료시키는 행위를 말합니다.<br>
				11. 본 약관에서 정의하지 않은 용어는 개별서비스에 대한 별도의 약관 및 이용 규정에서 정의합니다.
				 <br><br>
				
				제2장 서비스의 이용계약, 회원 혜택 및 이용
				<br><br>
				제5조 (이용계약의 성립)<br>
				1. 이용계약은 신청자가 온라인 또는 오프라인으로 회관 소정의 가입신청 양식에서 요구하는 사항을 기록하여 가입을 완료 하는 것으로 성립됩니다.<br>
				2. 회관은 다음 각 호에 해당하는 이용계약에 대하여는 가입을 취소할 수 있습니다.<br>
					가. 다른 사람의 명의를 사용하여 신청하였을 때<br>
					나. 이용계약 신청서의 내용을 허위로 기재하였을 때<br>
					다. 사회의 안녕 질서 혹은 미풍양속을 저해할 목적으로 신청하였을 때<br>
					라. 다른 사람의 회관서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 때<br>
					마. 회관 사이트를 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우<br>
					바. 타인의 비방 및 음해를 목적으로 사이트를 이용하는 경우<br>
					사. 기타 회관이 정한 이용신청요건이 미비 되었을 경우<br>
					아. 회관이 추구하는 정책방향에 위배되는 경우<br>
				3. 회관은 다음 각 항에 해당하는 경우 그 사유가 해소될 때까지 이용계약 성립을 유보할 수 있습니다.<br>
					가. 서비스 관련 제반 용량이 부족한 경우<br>
					나. 기술상 장애 사유가 있는 경우
				<br><br>
				제6조 (회원의 종류 및 회비) <br>
				가. 일반회원은 별도의 비용을 지불하지 않고, 회관이 지정한 혜택을 받을 수 있는 회원을 말합니다.<br>
				나. 기부회원은 소정의 기부금액을 지불하며, 금액에 따라 회관이 정한 혜택을 제공받는 회원을 말합니다.<br>
				<br><br>
				제7조 (회원의 유효기간)<br>
				1. 일반회원의 유효기간은 회원탈퇴시까지입니다.<br>
				2. 기부회원의 유효기간은 기부 시작일로부터 기부를 중단하는 해당 월까지입니다.  <br>
				<br><br>
				제8조 (회원의 등급)<br>
				1. 일반회원의 등급은 웰컴(Welcome), 스타트(Start), 스페셜(Special), 시그니처(Signature) 총 4단계로 분류합니다.<br>
				2. 회원 가입과 동시에 웰컴 등급이 부여됩니다.<br>
				3. 회원의 등급의 유지 및 승급에는 회관이 규정한 조건을 충족해야합니다.<br>
				4. 회관은 회원의 1년 간 이용실적을 산출하여 다음의 기준에 따라 회원 등급을 조정하며 그 기준은 아래 각 호와 같습니다.<br>
					가. 회원등급 기준 및 운영<br>
						1) 회원 등급 조정은 아래의 조정 기준인 연간 적립 포인트 및 이용횟수를 동시에 충족하는 경우 해당 등급으로 조정합니다.<br>
						<table class="tbl-st1" style="margin: 1.5em 0;">
								<caption>포인트, 이용횟수로 구분된 회원등급 테이블</caption>
								<thead>
									<tr>
										<th scope="col" class="first"></th>
										<th scope="col">웰컴</th>
										<th scope="col">스타트</th>
										<th scope="col">스페셜</th>
										<th scope="col">시그니처</th>
									</tr>
								</thead>
									<tbody>
										<tr>
											<td>우신ⓢ포인트</td>
											<td rowspan='2'>회원가입</td>
												<td>3,000ⓢ 이상</td>
											<td>6,000ⓢ 이상</td>
											<td>10,000ⓢ 이상</td>
										</tr>
										<tr>
											<td>이용횟수</td>
												<td>2회 이상</td>
											<td>4회 이상</td>
											<td>7회 이상</td>
										</tr>
									</tbody>
								</table>
						2) 회관은 당해년도 1월 1일 ~ 12월 31일까지 적립된 포인트 및 이용횟수를 조합 산출하여 차년도 1월 중에 회원 등급을 부여하고 12월 31일까지 등급별 혜택을 제공합니다.<br>
						3) 회관은 1월 1일 ~ 6월 30일까지 적립된 포인트 및 이용횟수가 상위 등급 기준을 충족한 회원에 한하여 7월 중에 중간 승급을 실시하고 차년도 12월 31일까지 해당 등급 및 혜택을 제공합니다.<br>
						 4) 회원 등급 기준은 회관 내부 방침에 따라 임의로 변경될 수 있습니다.<br>
					나. 포인트 및 이용횟수<br>
						1) 공연/전시/강좌 결제 금액 100원 당 1ⓢ(우신포인트)가 해당 아이디(회원번호)에 적립됩니다.<br>
						2) 우신포인트는 기타 할인 금액을 제외한 결제금액에 대하여 적립됩니다.<br>
						3) 이용횟수 적립은 다음 각 호와 같이 적립됩니다.<br>
							3-1) 공연/전시 : <u><B>1회차 당 1회</B></u> 이용 적립<br>
							3-2) 강좌 : <u><B>1강좌 당 1회</B></u> 이용 적립<br>
						4) 포인트 및 이용횟수 적립은 홈페이지 회원 가입하여 아이디(회원번호)가 생성된 후, 회원을 식별할 수 있는 정보를 제공하여야만 적립이 가능합니다. <br>
						5) 포인트 및 이용횟수는 공연/전시는 관람일, 강좌는 강의 종료일로부터 1일 이후에 적립됩니다.<br>
						6) 패키지 상품 구매의 경우 적립되지 않으며, 일부 행사의 경우 적립이 되지 않거나 별도의 적립률이 적용될 수 있습니다.<br>
						7) 포인트는 현금처럼 사용할 수 없으며, 등급 산정의 기준으로 활용됩니다.<br>
						8) 회원은 포인트 및 이용횟수를 타인에게 양도하거나 대여할 수 없으며, 아이디간 합산할 수 없습니다.<br>
						9) 포인트 및 이용횟수 적립에 대한 기준은 회관 내부 방침에 따라 임의로 변경될 수 있습니다.<br><br>
				
				제9조 (일반회원의 서비스)<br>
				1. 회관은 일반회원에게 아래와 같은 혜택을 부여 합니다.<br>
					가. 공연 정보 E-mail/SMS 제공 (수신 동의 시)<br>
					나. 홈페이지 이벤트 참여기회 부여<br>
					다. 기타 회원을 위한 특별행사 초대<br>
					라. 우신문화회관 홈페이지, 현장, 전화 예매 시 예매수수료 면제<br>
					마. 등급별 제공혜택은 다음과 같습니다.<br>
				<table class="tbl-st1" style="margin: 1.5em 0;">
								<caption>회원등급별 할인혜택 테이블</caption>
								<thead>
									<tr>
										<th scope="col" class="first"></th>
										<th scope="col">웰컴</th>
										<th scope="col">스타트</th>
										<th scope="col">스페셜</th>
										<th scope="col">시그니처</th>
									</tr>
								</thead>
									<tbody>
										<tr>
											<td>예매수수료 무료</td>
											<td>O</td>
												<td>O</td>
											<td>O</td>
											<td>O</td>
										</tr>
										<tr>
											<td>공연/전시 할인</td>
												<td>X</td>
											<td>15~20%<br>1인 2매</td>
											<td>20~30%<br>1인 4매</td>
											<td>30~35%<br>1인 6매</td>
										</tr>
										<tr>
											<td>선예매</td>
												<td>X</td>
											<td>O</td>
											<td>O</td>
											<td>O</td>
										</tr>
										<tr>
											<td>아카데미 강좌할인</td>
												<td>X</td>
											<td>5%</td>
											<td>10%</td>
											<td>10%</td>
										</tr>
										<tr>
											<td>초대이벤트</td>
												<td>X</td>
											<td>공연/전시 중<br>연간 최대 1회</td>
											<td>공연/전시/워크샵 중<br>연간 최대 2회</td>
											<td>공연/전시/워크샵 중<br>연간 최대 3회</td>
										</tr>
									</tbody>
								</table>
						1) 예매 수수료 면제 서비스는 모든 등급의 회원에게 제공됩니다.<br>
						2) 공연/전시 할인 : 동일공연 예매시 등급별 할인율 및 매수 제한이 있습니다. 공연은 회관이 지정하는 공연 및 전시에 한하며 할인이 제공되며, 할인 제공 여부 및 할인 정책은 각 행사 상세페이지에서 확인할 수 있습니다. “공동 주최 공연(전시)”, “대관 공연(전시)”은 좌석 등급과 입장권 구입일시에 따라 할인율이 변동될 수 있으며, 경우에 따라서는 할인되지 않을 수도 있습니다.<br>
						3) 선예매 : 회관이 지정하는 공연에 한하여 제공됩니다.<br>
						4) 아카데미 강좌 할인 : 회관이 지정 강좌에 한하며 할인 제공 여부 및 할인 정책은 각 행사 상세페이지에서 확인할 수 있습니다. <br>
						5) 초대이벤트는 선착순 및 추첨으로 운영되며 개인별 참여횟수를 보장하지 않습니다.<br>
						6) 등급별 혜택 내용은 회관 내부 방침에 따라 임의로 변경될 수 있습니다.<br>
						7) 회관은 필요할 경우 본인 확인을 요청할 수 있으며 회원은 이에 협조하여야 합니다. 회원가입자가 아닌 제3자가 회원카드를 무단 사용하거나 회원카드를 지참하지 않은 경우 회관은 회원혜택을 제공하지 않으며 이로 인해 발생한 손해는 회관이 책임지지 않습니다. 또한 경우에 따라서 회원의 효력을 상실할 수 있습니다.<br><br>
				
				제10조 (약관 및 회원정보 사용에 대한 동의)<br>
				1. 회관의 회원 정보는 다음과 같이 수집, 관리, 보호됩니다.<br>
					가. 개인정보의 수집 : 회관은 귀하의 회관 회원 가입 시 귀하가 제공하는 정보, 커뮤니티 활용을 위하여 귀하가 제공하는 정보, 각종 이벤트 참가를 위하여 귀하가 제공하는 정보, 광고나 경품 취득을 위하여 귀하가 제공하는 정보 등을 통하여 귀하에 관한 정보를 수집합니다.<br>
					나. 개인정보의 이용 : 회관은 회원 서비스 제공과 관련해서 수집된 회원의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 단, 일반회원의 입장권 예매 등을 위해 회관이 지정한 입장권 판매 대행사에 최소한의 정보를 공개 또는 제공하며, 관련 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 관련 기관의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우에는 그러하지 않습니다.
				일반회원의 입장권 예매 등을 위해 회관이 지정한 입장권 판매 대행사에 최소한의 정보를 공개 또는 제공하는 경우 회관은 귀하가 홈페이지 가입 시 또는 약관 변경 시 개인정보 취급위탁 동의를 사전에 받고 있습니다.<br>
					다. 개인정보의 관리 : 귀하는 개인정보의 보호 및 관리를 위하여 서비스의 개인정보관리에서 수시로 귀하의 개인 정보를 수정/삭제할 수 있습니다. 수신되는 정보 중 불필요하다고 생각되는 부분도 변경 조정할 수 있습니다.<br>
					라. 개인정보의 보호 : 귀하의 개인정보는 오직 귀하만이 열람/수정/삭제 할 수 있으며, 이는 전적으로 귀하의 인터넷 ID와 비밀번호에 의해 관리되고 있습니다. 따라서 ID, 비밀번호를 타인에게 알려주어서는 아니 됩니다.<br>
					마. 기타 : 게시판이나 온라인 상에서 귀하가 자발적으로 제공하는 개인정보는 다른 사람들이 수집하여 사용할 수 있음을 인지하시기 바랍니다. 공개적인 공간에 게재되는 개인정보로 인해 원하지 않은 상황이 발생할 수도 있습니다. 개인정보에 대한 비밀을 유지할 책임은 귀하에게 있으며, 이때 회관은 개인정보 유출로 인해 발생한 결과에 대하여 어떠한 책임도 부담하지 아니합니다.<br>
				2. 회원이 회관에 본 약관에 따라 이용신청을 하는 것은 회관이 본 약관에 따라 신청서에 기재된 회원정보를 수집, 활용 및 제공하는 것에 동의하는 것으로 간주합니다.
				<br><br>
				제11조 (사용자의 정보 보안)<br>
				1. 가입 신청자가 회관 서비스 가입 절차를 완료하는 순간부터 귀하는 입력한 정보의 비밀을 유지할 책임이 있으며, 회원의 인터넷 ID와 비밀번호를 사용하여 발생하는 모든 결과에 대한 책임은 회원 본인에게 있습니다.  <br>
				2. 인터넷 ID 와 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 인터넷 ID나 비밀번호가 부정하게 사용되었다는 사실을 발견한 경우에는 즉시 회관에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게 있습니다.  
				<br><br>
				제12조 (서비스 이용시간) <br>
				1. 서비스 이용시간은 회관의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간을 원칙으로 합니다.  <br>
				2. 제1항의 이용시간은 정기점검 등의 필요로 인하여 회관이 정한 날 또는 시간은 예외로 합니다.  
				<br><br>
				제13조 (서비스의 중지 및 정보의 저장과 사용) <br>
				1. 귀하는 회관 서비스에 보관되거나 전송된 메시지 등의 내용이 국가의 비상사태, 정전, 회관의 관리범위 외의 서비스 설비 장애 및 기타 불가항력에 의하여 보관되지 못하였거나 삭제된 경우, 전송되지 못한 경우 및 기타 통신 데이터의 손실이 있을 경우에 회관은 관련 책임을 부담하지 아니합니다.  <br>
				2. 회관이 정상적인 서비스 제공의 어려움으로 인하여 일시적으로 서비스를 중지하여야 할 경우에는 서비스 중지 1주일 전의 고지 후 서비스를 중지할 수 있으며, 이 기간 동안 귀하가 고지내용을 인지하지 못한데 대하여 회관은 책임을 부담하지 아니합니다. 부득이한 사정이 있을 경우 위 사전 고지기간은 감축되거나 생략될 수 있습니다. 또한 위 서비스 중지에 의하여 본 서비스에 보관되거나 전송된 메시지 등의 내용이 보관되지 못하였거나 삭제된 경우, 전송되지 못한 경우 및 기타 통신 데이터의 손실이 있을 경우에 대하여도 회관은 책임을 부담하지 아니합니다.<br>  
				3. 회관은 사전 고지 후 서비스를 일시적으로 수정, 변경 및 중단할 수 있습니다. <br>
				4. 회관은 이용자가 본 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스 사용을 제한 및 중지 할 수 있습니다. 
				<br><br>
				제14조 (서비스의 변경 및 해지) <br>
				1. 회관은 귀하가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.  <br>
				2. 회관은 서비스 이용과 관련하여 회원에게 발생한 손해 중 가입자의 고의, 과실에 의한 손해에 대하여 책임을 부담하지 아니합니다.
				<br><br> 
				제15조 (회관에 제출된 게시물의 저작권) <br>
				1. 귀하가 회관 게시판을 이용해 게시한 게시물의 내용에 대한 권리는 귀하에게 있습니다.  <br>
				2. 회관은 게시된 내용을 사전 통지 없이 편집, 이동 할 수 있는 권리를 보유하며, 다음의 경우 사전 통지 없이 삭제 할 수 있습니다.  <br>
					가. 본 서비스 약관에 위배되거나 상용 또는 불법, 음란, 저속하다고 판단되는 게시물을 게시한 경우  <br>
					나. 다른 회원 또는 제 3자나 단체 비방하거나 중상 모략으로 명예를 손상시키는 내용인 경우  <br>
					다. 공공질서 및 미풍양속에 위반되는 내용인 경우  <br>
					라. 범죄적 행위에 결부된다고 인정되는 내용일 경우  <br>
					마. 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우  <br>
					바. 기타 관계 법령에 위배되는 경우  <br>
					사. 회관이 추구하는 정책에 위배되는 경우<br>
				3. 귀하의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 귀하가 부담하여야 합니다.  
				<br><br>
				제16조 (회원 행동규범 및 서비스 이용제한)  <br>
				1. 귀하가 제공하는 정보의 내용이 허위(차명, 비실명 등)인 것으로 판명되거나, 그러하다고 의심할 만한 합리적인 사유가 발생할 경우 회관은 귀하의 본 서비스 사용을 일부 또는 전부 중지할 수 있으며, 이로 인해 발생하는 불이익에 대해 책임을 부담하지 아니합니다.  <br>
				2. 귀하가 회관 서비스를 통하여 게시, 전송, 입수하였거나 전자메일 기타 다른 수단에 의하여 게시, 전송 또는 입수한 모든 형태의 정보에 대하여는 귀하가 모든 책임을 부담하며 회관은 어떠한 책임도 부담하지 아니합니다.  <br>
				3. 귀하는 본 서비스를 통하여 다음과 같은 행동을 하지 않는데 동의한 것으로 간주합니다.<br>
					가. 타인의 인터넷 ID와 비밀번호, 주민번호를 도용하는 행위  <br>
					나. 저속, 음란, 모욕적, 위협적이거나 타인의 프라이버시를 침해할 수 있는 내용을 전송, 게시, 게재,  전자 메일 또는 기타의 방법으로 전송하는 행위  <br>
					다. 법률, 계약에 의하여 이용할 수 없는 내용을 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위  <br>
					라. 타인의 특허, 상표, 영업비밀, 저작권, 기타 지적재산권을 침해하는 내용을 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위  <br>
					마. 회관의 승인을 받지 아니한 광고, 판촉물, 정크, 스팸, 행운의 편지, 기타 다른 형태의 권유를 게시, 게재 또는 기타의 방법으로 전송하는 행위.  <br>
					바. 다른 사용자의 개인정보를 수집 또는 저장하는 행위  <br>
				4. 회관은 회원이 본 약관을 위배했다고 판단되면 서비스와 관련된 모든 정보를 이용자의 동의 없이 삭제할 수 있습니다.
				<br><br>
				
				제3장 의무 및 책임
				<br><br>
				제17조 (회관의무)<br>
				1. 회관은 법령과 본 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적, 안정적으로 서비스를 제공하기 위해 노력할 의무가 있습니다.  <br>
				2. 회관은 특별한 사정이 없는 한 이용자가 신청한 서비스 제공 개시일에 서비스를 이용할 수 있도록 합니다.  <br>
				3. 회관은 회원의 개인 신상 정보를 본인의 승낙 없이 타인에게 누설, 배포하지 않습니다. 다만, 전기통신관련법령 등 관계법령에 의하여 관계 국가기관 등의 요구가 있는 경우에는 그러하지 아니합니다.  <br>
				4. 회관은 이용자가 안전하게 회관서비스를 이용할 수 있도록 이용자의 개인정보보호를 위한 보안시스템을 갖추어야 합니다.  <br>
				5. 회관은 이용자의 귀책사유로 인한 서비스 이용 장애에 대하여 책임을 지지 않습니다.  
				<br><br>
				제18조 (회원의 의무)<br>
				1. 회원 가입 시에 요구되는 정보는 정확하게 기입하여야 합니다. 또한 이미 제공된 귀하에 대한 정보가 정확한 정보가 되도록 유지, 갱신하여야 하며, 회원은 자신의 인터넷 ID 및 비밀번호를 제3자가 이용하게 해서는 안됩니다.  <br>
				2. 회원은 회관의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다.  <br>
				3. 회원은 회관 서비스를 이용하여 얻은 정보를 회관의 사전승낙 없이 복사, 복제, 변경, 번역, 출판, 방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없습니다.  <br>
				4. 자신의 회원카드 및 회원번호에 관한 관리책임은 회원에게 있습니다. 관리소홀, 부정사용으로 인한 모든 결과에 대한 책임은 회원에게 있습니다.<br>
				5. 회원은 자신의 회원카드 및 회원번호를 제3자에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다<br>
				6. 자신의 회원카드 및 회원번호가 부정하게 사용된 경우 회원은 반드시 회관에 그 사실을 통보해야 합니다.<br>
				7. 회원은 회관 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다.  <br>
					가. 다른 회원의 인터넷 ID를 부정 사용하는 행위<br>
					나. 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위<br>
					다. 선량한 풍속, 기타 사회질서를 해하는 행위  <br>
					라. 타인의 명예를 훼손하거나 모욕하는 행위  <br>
					마. 타인의 지적재산권 등의 권리를 침해하는 행위  <br>
					바. 해킹행위 또는 컴퓨터바이러스의 유포행위  <br>
					사. 타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송하는 행위  <br>
					아. 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위  <br>
					자. 회관 사이트에 게시된 정보의 변경.  <br>
					차. 기타 법령에 위배되는 행위
				<br><br>
				
				제4장 결제에 관한 규정
				<br><br>
				제19조 (사용가능한 결제 수단)<br>
				1. 회원이 사용할 수 있는 결제수단에는 신용카드, 가상계좌 등이 있으며, 사용할 수 있는 결제 수단은 상황에 따라 달라질 수 있습니다.<br>
				2. 신용카드는 승인시 필요한 사항을 입력하되 회원의 동의가 있어야만 합니다.<br>  
				<br><br>
				
				제5장 기 타 
				<br><br>
				제20조 (회관의 소유권) <br>
				1. 회관이 제공하는 서비스, 그에 필요한 소프트웨어, 이미지, 마크, 로고, 디자인, 서비스명칭, 정보 및 상표 등과 관련된 지적재산권 및 기타 권리는 회관에게 소유권이 있습니다.  <br>
				2. 귀하는 회관이 명시적으로 승인한 경우를 제외하고는 전항의 소정의 각 재산에 대한 전부 또는 일부의 수정, 대여, 대출, 판매, 배포, 제작, 양도, 재라이센스, 담보권 설정 행위, 상업적 이용 행위를 할 수 없으며, 제3자로 하여금 이와 같은 행위를 하도록 허락할 수 없습니다.  
				<br><br>
				제21조 (양도금지) <br>
				회원이 서비스의 이용권한을 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.  
				<br><br>
				제22조 (손해배상) <br>
				회관은 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 회관이 고의로 행한 범죄행위를 제외하고 이에 대하여 책임을 부담하지 아니합니다.
				<br><br>
				제23조 (면책조항) <br>
				1. 회관은 서비스에 표출된 어떠한 의견이나 정보에 대해 확신이나 대표할 의무가 없으며 회원이나 제3자에 의해 표출된 의견을 승인하거나 반대하거나 수정하지 않습니다. 회관은 어떠한 경우라도 회원이 서비스에 담긴 정보에 의존해 잃은 이득이나 입은 해에 대해 책임이 없습니다. <br>
				2. 회관은 회원간 또는 회원과 제3자간에 서비스를 매개로 하여 물품거래 혹은 금전적 거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다.  
				<br><br>
				제24조 (관할법원) <br>
				본 서비스 이용과 관련하여 발생한 분쟁에 대해 소송이 제기될 경우 서울지방법원 본원을 전속적 관할 법원으로 합니다.  
				<br><br><br><br><br>
				
				
				
				
				부 칙
				<br><br>
				1. 약관 2007년 1월 1일 수정<br>
				2. 약관 2008년 8월 16일 수정<br>
				3. 약관 2011년 7월 18일 수정<br>
				4. 약관 2013년 12월 3일 수정<br>
				5. 약관 2014년 8월 1일 수정<br>
				6. 약관 2015년 7월 1일 수정<br>
				7. 약관 2017년 3월 16일 수정<br>
				8. 약관 2020년 5월 18일 수정<br>
				9. 본약관 2021년 3월 29일부터 적용
								</div>
							</div>
				
							<div class="group">
								<h3 class="t">개인정보수집 및 활용 동의(필수)  </h3>
								<span class="ck"><input type="checkbox" name="agree2" id="agree2"  class="input_check" /> <label for="agree2">개인정보수집 및 활용에 동의합니다. </label></span>
				
								<div class="box" tabindex="0">
									
				재단법인 우신문화회관은 사용자의 개인정보를 소중하게 생각하고 있습니다.
				<br><br>
				아래에 동의하시면 우신문화회관이 제공하는 서비스를 편리하게 이용하실 수 있습니다.
				
				<table class="tbl-st1" style="margin: 1.5em 0;">
								<caption>구분, 목적, 항목, 보유기간으로 구성된 개인정보의 처리 보유기간 테이블</caption>
								<thead>
									<tr>
										<th scope="col" class="first">구분</th>
										<th scope="col">목적</th>
										<th scope="col">항목</th>
										<th scope="col">보유기간</th>
									</tr>
								</thead>
								<tbody>
									</tbody><tbody>
										<tr>
											<td>홈페이지</td>
											<td>홈페이지 <br>회원가입 및 관리</td>
											<td>
												<ul class="bul-dot tal">
													<li>필수항목<br>  - 성명, 생년월일, 아이디, 비밀번호, 주소, 휴대폰번호, 전화번호, 성별, 이메일</li>
													<li>선택항목<br> - 결혼여부, 결혼기념일, 자녀수, 자녀생년월일, 관심분야, 관심예술단</li>
												</ul>
											</td>
											<td rowspan="3">탈퇴시까지</td>
										</tr>
										<tr>
											<td>대관시스템</td>
											<td>대관신청단체 관리</td>
											<td>
												<ul class="bul-dot tal">
													<li>필수항목<br>  - 신청인명, 휴대폰, 이메일, 휴대폰번호, 전화번호, 대표자성명, 사업자등록번호(주민등록번호), 주소</li>
																													 <li>• 선택항목  - 팩스번호</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>연동판매시스템</td>
											<td>판매사 관리</td>
											<td class="tal">이름, 아이디, 비밀번호, 이메일, 휴대폰번호, 전화번호, 회사명, 대표자명, 업체(법인)명, 업종, 업태, 사업장주소, 사업장 전화번호, 팩스번호</td>
										</tr>
										<tr>
											<td>채용시스템</td>
											<td>채용 지원자 관리</td>
											<td class="tal">아이디, 비밀번호, 이름, 생년월일, 성별, 연락처, 이메일, 채용시 필요한 서류 (이력서, 경력기술서, 자기소개서 등)</td>
											<td>
												<ul class="bul-dot tal">
													<li>합격자 영구</li>
													<li>불합격자 6개월</li>
												</ul>
										</td></tr>
									</tbody>
								
								</table>
								
								더 자세한 내용에 대해서는 우신문화회관 개인정보 처리 방침을 참고하시기 바랍니다.
								</div>
							</div>
				
							<div class="group">
								<h3 class="t">개인정보 취급위탁 동의(필수)</h3>
								<span class="ck"><input type="checkbox" name="agree3" id="agree3"  class="input_check"/> <label for="agree3">개인정보 취급위탁에 동의합니다. </label></span>
				
								<div class="box" tabindex="0">
									
				재단법인 우신문화회관 웹사이트는 아래의 경우 개인정보의 취급 위탁을 하고 있습니다.<br>
				① 재단법인 우신문화회관은 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다. 
				<br><br>
					1. 우신문화티켓 운영<br>
					 가. 위탁받는 자 (수탁자) : ㈜인터파크<br>
					 나. 대표자 : 강동화, 김양선 <br>
					 다. 위탁하는 업무의 내용 : 티켓예매, 발권 등 티켓 업무 일체
				<br><br>
					2. 콜센터 운영<br>
					 가. 위탁받는 자 (수탁자) : 코리아휴먼리스오스시스템(주)<br>
					 나. 대표자 : 오민환<br>
					 다. 위탁하는 업무의 내용 : 전화상담 응대, 티켓 전화예매, 예매내역 확인 등
				<br><br>
					3. 홈페이지 운영 <br>
					 가. 위탁받는 자 (수탁자) : ㈜오케이토마토<br>
					 나. 대표자 : 이영호<br>
					 다. 위탁하는 업무의 내용 : 홈페이지 운영 및 유지보수
				<br><br>
					4. 공연장통합운영시스템 운영<br>
					 가. 위탁받는 자 (수탁자) : ㈜클락소프트<br>
					 나. 대표자 : 임중창<br>
					 다. 위탁하는 업무의 내용 : 공연장통합운영시스템 운영 및 유지보수
				<br><br>
				 5.기부페이지 운영<br>
					 가. 위탁받는 자 (수탁자) : (주)크레비스파트너스<br>
					 나. 대표자 : 김재현<br>
					 다. 위탁하는 업무의 내용 : 기부페이지를 통한 기부금 관리 및 기부 내역 등
				<br><br>
				 ② 회관 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다. 
				<br><br>
				 ③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다. 
				<br><br>
				3. 정보주체는 개인정보 취급위탁 동의를 거부할 수 있으며, 동의하지 않더라도 우신문화회관 웹사이트에 회원가입은 할 수 있습니다. 다만 비동의 가입자는 재단법인 우신문화회관 웹사이트에서 제공하는 예매 관련 서비스를 이용할 수 없습니다. (회원가입 후 동의 시 예매 서비스 이용 가능)
				<br><br>
				더 자세한 내용에 대해서는 우신문화회관 개인정보 처리 방침을 참고하시기 바랍니다.
								</div>
							</div>
						</div>
				
						<div class="bbs-btn tac">
							<a href="javascript:fn_agree();" class="bbs-btn-st2 bg-purple3">다음</a>
							<a href="#" class="bbs-btn-st2 bg-black_r">이전</a>
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