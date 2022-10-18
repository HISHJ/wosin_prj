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
//세션 넘겨받기 검증 완료 //2022-10-16 13:05 유설빈
String memberId = (String)session.getAttribute("memberId");
%>
<%
    if(request.getParameter("showId")==null){
        response.sendRedirect("http://localhost/group2_prj/main/index.jsp");
        return;
    }
    String swId = request.getParameter("showId");

    session.setMaxInactiveInterval(60*30);
    
    session.setAttribute("showId",swId); // 세션에 공연코드 올리기
    
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
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/main.css" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/reset.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/subheader.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/headerFooter.css">
		
		
		<!-- 공연상세페이지만을 위한 css -->
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/perform.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/tab.css">
		
		
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		
		<!--제이쿼리--> <!--  이놈 빌런이다 조심해 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		

<%if (memberId == null) { //2022-10-16 13:05 유설빈%>
<style>
#nav {
	margin-right: 130px;
}
</style>
<%}%>

<style>
/*로그인하고나면 css가 적용이 안된다..파일을못읽는다..=>해결 :쿠키삭제해서 갱신된 css를 읽게해야 함*/
/*2022-10-17 유설빈*/
input[type="button"].alt{
 padding:15px 25px;
 border-radius:2px;
}
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
				<!-- //2022-10-16 13:05 유설빈  -->
        <c:import  url="http://localhost/group2_prj/common/user_subpage_header.jsp" > 
    	<c:param name="memberId" value="<%= memberId %>"></c:param> 
    	</c:import>
					
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
										<a class="image featured"><img src="http://localhost/group2_prj/admin/img/<%=sVO.getThImg() %>" ></a>
										<header>
											<h3 class="h3" style="width:270px;white-space:normal;" title="<%=sVO.getName() %>"><%=sVO.getName() %></h3>
											
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
							<a class="image featured">
								<img src="http://localhost/group2_prj/admin/img/<%=sVO.getInfoImg() %>" style="width:670px;" >
							</a>
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