<%@page import="java.util.Enumeration"%>
<%@page import="kr.co.sist.vo.RsrvtInfoVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.dao.RsrvtDAO"%>
<%@page import="kr.co.sist.vo.ShowVO"%>
<%@page import="kr.co.sist.dao.MainDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    
    
    
<%
	String swId = (String)session.getAttribute("showId");
	MainDAO mDAO = MainDAO.getInstance();
	ShowVO sVO = mDAO.selectShowMain(swId); // 다주는 메서드
	
	pageContext.setAttribute("sVO", sVO);
	
	String schId = (String)session.getAttribute("schTest");
	
	RsrvtDAO rDAO = RsrvtDAO.getInstance();
	
	
	String[] selectedArr = request.getParameterValues("seat");
	session.setAttribute("selectedSeats", selectedArr);
	
	RsrvtInfoVO rsrvtVO = rDAO.selectRsrvtInfo(schId,selectedArr.length);
	
	Enumeration se = session.getAttributeNames();
	
	while(se.hasMoreElements()){
		
		String getse = se.nextElement()+"";
		System.out.println("@@@@session : "+getse+":"+session.getAttribute(getse));
	
	}
	
%>    
<!DOCTYPE HTML>
<!--
	Dopetrope by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>예매하기 | 내역</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<link rel="stylesheet" href="../assets\css\reset.css">
		<link rel="stylesheet" href="../assets\css\headerFooter.css">
		<link rel="stylesheet" href="../assets\css\subheader.css">
		
		<!-- 공연상세페이지만을 위한 css -->
		<link rel="stylesheet" href="../assets\css\perform.css">
		<link rel="stylesheet" href="../assets\css\tab.css">
		
		
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<style>
			#nav{
				margin-right:150px;
			}
		</style>
		<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.dropotron.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
			
			<!-- tap관련 추가한거 -->
			<script src="../assets/js/tab.js"></script>
		<!-- //////////////////////////////////////////// -->
		<script>
		$(function(){
			
			$("#rsrvtBtnOk").click(function(){
				/* 유효성검증 할거 뭐있지 */
				$("#rsrvtInfoChkFrm").submit();			
			});
		})
		</script>
		<!-- /////////////////////////////////////////////// -->
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
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">예매하기</strong>
						</h2>
					</div>
					</section>

						<!--------------------------------------위까지가 헤더----------------------------------------->
				<!-- Main -->
				<section id="main">
				<form id="rsrvtInfoChkFrm" method="post" action="show_rsrvt3_process.jsp">	
						<div class="container">
	
	
							<div class="col-12">
	
								<!-- Blog -->
									<section>
									
										<div class="row">
											<div class="col-4 col-12-small">
												<section class="box" style="margin-bottom: 30px;">
													<a class="image featured"><!-- 사진수정 --><img src="poster/rj.jpeg" alt="포스터" /></a>
													<header>
														<%-- <h3><%=rsrvtVO.getShowName() %></h3> --%>
														<h1><input type="text" name="showName" value="<%=rsrvtVO.getShowName() %>" readonly="readonly"
																		style="border:none; display:inline; color:#555555; padding:0px;font-size:20px; font-weight: 900">
														</h1>
														
													</header>
												</section>
											</div>
											<div class="col-8 col-12-small">
												<section class="box" style="margin-bottom: 30px;">
													<header>
													
														<ul class="divided">
															<%-- <li>날짜　　<%=rsrvtVO.getSchDate() %></li> --%>
															<li>날짜　　<input type="text" name="date" value="<%=rsrvtVO.getSchDate() %>" readonly="readonly"
																		style="border:none; width:150px; margin-left:0px; display:inline; color:#555555; padding:0px; font-weight: 900">
															</li>
															
															<li>장소　　우신문화회관 대극장</li>
															
															<%-- <li>시간　　<%=rsrvtVO.getSchTime() %></li> --%>
															<li>시간　　<input type="text" name="time" value="<%=rsrvtVO.getSchTime() %>" readonly="readonly"
																		style="border:none; width:150px; margin-left:0px; display:inline; color:#555555; padding:0px; font-weight: 900">
															</li>
															
															<li>좌석  
															<%if(selectedArr.length>0){
																for(int i=0;i<selectedArr.length;i++){%>
																	<%-- <%= selectedArr[i]%> --%>
																	<input type="text" name="seats" value="<%= selectedArr[i]%>" readonly="readonly"
																		style="border:none; width:25px; margin-left:30px; display:inline; color:#555555; padding:0px; font-weight: 900">번
																<%}
															
															
															}
																/* out.println("선택한좌석이 없습니다. 근데 이전에 짤라야지 여기까지오면안되지"); */
															%></li>
															<%-- <li>금액　　<%=rsrvtVO.getTotalPrice() %>원</li> --%>
															<li>금액　 <input type="text" name="totalPrice" value="<%= rsrvtVO.getTotalPrice()%>" readonly="readonly"
															style="border:none; width:70px; display:inline; color:#555555; padding:0px;margin-left:10px; font-weight: 900">원
															</li>
															
														</ul>
													</header>
												</section>
											</div>
										</div>
									
									
									</section>
	
							</div>
	
								<a href="javascript:history.back();">이전</a>
								<input type="button" value="예매하기" id="rsrvtBtnOk" style="background-color:#555555;">
							
						</div>
				</form>
				</section>
		

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

		

	</body>
</html>