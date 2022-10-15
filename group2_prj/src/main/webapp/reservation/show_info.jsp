<%@page import="kr.co.sist.dao.RsrvtDAO"%>
<%@page import="kr.co.sist.vo.RsrvtInfoVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Enumeration"%>
<%@page import="kr.co.sist.vo.ShowVO"%>
<%@page import="kr.co.sist.dao.MainDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
  //로그인 되어있지 않은 경우, 로그인페이지로 이동
if( session.getAttribute("memberId") == null){
response.sendRedirect("http://localhost/group2_prj/login/login.jsp");
return;
}  
%>      
<%
    if(request.getParameter("showId")==null){
        response.sendRedirect("http://localhost/group2_prj/main/index.jsp");
        return;
    }
    String swId = request.getParameter("showId");

    session.setMaxInactiveInterval(60*30);
    session.setAttribute("showId",swId);
    MainDAO mDAO = MainDAO.getInstance();
    ShowVO sVO = mDAO.selectShowMain(swId);
%>


<%
request.setCharacterEncoding("UTF-8");
Enumeration rp = request.getParameterNames();
while(rp.hasMoreElements()){
	String getrp = rp.nextElement()+"";
	System.out.println("show_info.jsp @@@@request : "+getrp+":"+request.getParameter(getrp)); // values안하니까 좌석 하나만 나옴 ㅇㅇ
}
Enumeration se = session.getAttributeNames();
while(se.hasMoreElements()){
	String getse = se.nextElement()+"";
	System.out.println("show_info.jsp @@@@session : "+getse+":"+session.getAttribute(getse));
}
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>공연일정 | 상세보기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<link rel="stylesheet" href="../assets/css/reset.css">
		<link rel="stylesheet" href="../assets/css/headerFooter.css">
		<link rel="stylesheet" href="../assets/css/subheader.css">
		
		<!-- 공연상세페이지만을 위한 css -->
		<link rel="stylesheet" href="../assets/css/perform.css">
		<link rel="stylesheet" href="../assets/css/tab.css">
		
		
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.dropotron.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
			
			<!-- tap관련 추가한거 -->
			<script src="../assets/js/tab.js"></script>
			
		<style>
			#nav{margin-right: 150px;}
		</style>
		<script type="text/javascript">
		$(function(){
			$("#rsrvtBtn").click(function(){
				<%
				RsrvtDAO rDAO = RsrvtDAO.getInstance();
				List<RsrvtInfoVO> listRVO = rDAO.selectShowSch(swId);
				if(listRVO.size()==0){%>
				
					alert("해당 공연에 대한 상영일정이 없습니다.");
					return;
					
				<%}else{%>
				
					location.href="show_rsrvt1.jsp?showId=<%=swId%>";
					
				<%}%>
			});
		});
		</script>		
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">
			<!-- header -->
			<c:import url="http://localhost/group2_prj/common/user_subpage_header.jsp"/> 
			<!-- header -->	
					
						<!--❤️여기에 서브제목 입력하세욮 ex) 공연일정-->
						<div id="sut-t_wrap">
						<h2 id="sub-t">
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">공연일정</strong>
						</h2>
					</div>
					</section>

						<!--------------------------------------위까지가 헤더----------------------------------------->
				<!-- Main -->
				<section id="main">
					<div class="container">
						<div class="row">
							<div class="col-4 col-12-medium">

								<!-- Sidebar -->
									<section class="box">
										<a class="image featured"><img src="poster/rj.jpeg" alt="" /></a>
																	<!-- 여기도 경로수정해야하는데 -->
										<header>
											<h3 class="h3"><%=sVO.getName() %></h3>
										</header>
										<footer>
											<!-- <a href="page3.html" class="button alt button_long">예매하기</a> -->

											<input type="button" id="rsrvtBtn" value="예매하기" class="button alt button_long">
											<!-- 10-15 테스트 -->
											<%-- <a href="show_rsrvt1.jsp?showid=<%=sVO.getShowId() %>">예매하기</a> --%>
										</footer>
									</section>
									<section class="box">
										<ul class="divided">
											<li>기간　　<%=sVO.getStartDate() %>~<%=sVO.getEndDate() %></li>
											<li>장소　　우신문화회관 대극장</li>
											<li>연령　　<%=sVO.getRatingId() %></li>
											<li>티켓　　<%=sVO.getPrice() %></li>
											<li>공연시간　　<%=sVO.getRunningTime() %></li>
										</ul>
									</section>
							</div>
							<div class="col-8 col-12-medium imp-medium tap">
							<!-- Content -->
							<!-- 탭 메뉴 만들기 분석 ...하기... -->
							<article class="box post tabnav">
							<a class="image featured"><img src="poster/rj2.jpg" alt="" /></a>
															<!-- 여기도 경로수정해야하는데 -->
						   		 </article>

								

							</div>
						</div>
					</div>
				</section>
		

				<!----------------------------------------------여기서부터 끝까지 footer-------------------------------------------->
		
			<!-- Footer  -->
			<c:import url="http://localhost/group2_prj/common/user_allPage_footer.jsp"/> 
	    	<!-- End footer -->

		</div>

		

	</body>
</html>