<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="서브페이지 header" %>
<% 
//값 넘김 검증 완료(각 페이지에서 값 전달받음)
String memberId= request.getParameter("memberId");

%>    

			<!-- Header -->
				<section id="header">
			
					<!-- Logo -->
						
					<!-- Nav -->
						<nav id="nav">
							<!-- left -->
							<ul id="header_left">
								<li class="current">
									<a href="#">공연정보</a>
									<ul>
										<li><a href="http://localhost/group2_prj/reservation/show_search.jsp">공연일정</a></li>
										<!-- <li><a href="calendar.html">일정조회</a></li> -->
										<!-- <li><a href="#">예매</a></li> -->
										<!-- <li><a href="http://localhost/group2_prj/reservation/show_info.jsp">공연정보상세보기</a></li> -->
										<li><a href="http://localhost/group2_prj/subpage/subpage-seatMap.jsp">좌석배치도</a></li>
									</ul>
								</li>
								<li>
									<a href="#">예매정보</a>
									<ul>
										<li><a href="http://localhost/group2_prj/subpage/subpage-ticketMethod.jsp">티켓구입방법</a></li>
										<li><a href="http://localhost/group2_prj/subpage/subpage-ticketReceive.jsp">티켓수령방법</a></li>
										<li><a href="http://localhost/group2_prj/subpage/subpage-ticketCancel.jsp">예매취소,변경안내</a></li>
										<li><a href="http://localhost/group2_prj/subpage/subpage-ticketProvision.jsp">예매약관</a></li>					
									</ul>
								</li>
								<li>
									<a href="#">고객센터</a>
									<ul>
										<li><a href="http://localhost/group2_prj/subpage/subpage-FAQ1.jsp">FAQ</a></li>
										<li><a href="http://localhost/group2_prj/subpage/subpage-manner.jsp">관람예절</a></li>				
									</ul>
								</li>
								<li><a href="http://localhost/group2_prj/subpage/subpage-location.jsp">오시는 길</a></li>
								
								
							</ul>
	
							<ul id="header_center">
								<h1 id="logo">
									<a href="http://localhost/group2_prj/main/index.jsp">
									우신문화회관
									</a>
									</h1>	
								
							</ul>
	
							<!--right  -->
							<ul id="header_right">
								<li class="current">
								<% if(memberId != null && memberId != "" ){%>
								<a href="http://localhost/group2_prj/mypage/password_mypage.jsp">
								<%="MYPAGE" %>
								</a>
								<%}else{%>
								<a href="http://localhost/group2_prj/login/login.jsp">
								<%="LOGIN" %>
								</a>
								<%}%>
								</li>
								
								<% if(memberId != null && memberId != ""){%>
								<li>
								<a href="http://localhost/group2_prj/login/logout_process.jsp">
								<%="LOGOUT" %>
								</a>
								</li>
								<%}%>
								<li><a href="http://localhost/group2_prj/reservation/ticket_page.jsp">티켓</a></li>
								<li class="calender">
									<a href="http://localhost/group2_prj/reservation/calendar.jsp">
										<span class="material-symbols-outlined md_20">
											calendar_month
											</span>
								 </a>
								</li>
								<li  id="search_btn" class="search_icon"><a href="#">
									<span class="material-symbols-outlined md_20">
										search
										</span>
								</a></li>
							</ul>
						</nav>

				