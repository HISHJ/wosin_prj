<%@page import="java.util.Enumeration"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.dao.RsrvtDAO"%>
<%@page import="kr.co.sist.vo.RsrvtInfoVO"%>
<%@page import="kr.co.sist.vo.ShowVO"%>
<%@page import="kr.co.sist.dao.MainDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
//세션 넘겨받기 검증 완료
String memberId = (String)session.getAttribute("memberId");
//System.out.println("여기여기"+memberId);
%>
<%
  //로그인 되어있지 않은 경우, 로그인페이지로 이동
if( session.getAttribute("memberId") == null){
response.sendRedirect("http://localhost/group2_prj/login/login.jsp");
return;
}  

/* if(request.getParameter("showId")==null){ */
if(session.getAttribute("showId")==null){
 response.sendRedirect("http://localhost/group2_prj/main/index.jsp");
  return;
}
%>      
<%  /* 여기서는 select 말고 상영일정이랑, 시간을 뿌려줘야되는데 무슨DAO쓰더라 */
	/* String swId = request.getParameter("showId");  session에있는데 굳이 request는 필요없지*/
	String swId = (String)session.getAttribute("showId");
	MainDAO mDAO = MainDAO.getInstance();
	ShowVO sVO = mDAO.selectShowMain(swId);
	
	RsrvtDAO rDAO = RsrvtDAO.getInstance();
	List<RsrvtInfoVO> listRVO = rDAO.selectShowSch(swId);
	
	
%>    
<%
request.setCharacterEncoding("UTF-8");
Enumeration rp = request.getParameterNames();
while(rp.hasMoreElements()){
	String getrp = rp.nextElement()+"";
	System.out.println("show_rsrvt1.jsp @@@@request : "+getrp+":"+request.getParameter(getrp)); // values안하니까 좌석 하나만 나옴 ㅇㅇ
}
Enumeration se = session.getAttributeNames();
while(se.hasMoreElements()){
	String getse = se.nextElement()+"";
	System.out.println("show_rsrvt1.jsp @@@@session : "+getse+":"+session.getAttribute(getse));
}
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>예매하기</title>
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
		<!-- Scripts -->
		<script src="http://localhost/group2_prj/assets/js/jquery.min.js"></script>
		<script src="http://localhost/group2_prj/assets/js/jquery.dropotron.min.js"></script>
		<script src="http://localhost/group2_prj/assets/js/browser.min.js"></script>
		<script src="http://localhost/group2_prj/assets/js/breakpoints.min.js"></script>
		<script src="http://localhost/group2_prj/assets/js/util.js"></script>
		<script src="http://localhost/group2_prj/assets/js/main.js"></script>
			
		<!-- tap관련 추가한거 -->
		<script src="http://localhost/group2_prj/assets/js/tab.js"></script>

	
	<%if(memberId == null){%>
	<style>
	#nav {
	margin-right: 150px;
	}
	</style>
	<%} %>
<script type="text/javascript">
			$(function(){
				$("#nextBtn").click(function(){
					
					$("#testSchFrm").submit();
				});
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
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">예매하기</strong>
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
											<h3 class="h3" style="width:270px; overflow:hidden; text-overflow:ellipsis;" title="<%=sVO.getName() %>"><%=sVO.getName() %></h3>
										</header>
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
							<div class="col-4 col-12-medium">
							<!-- /////////////////////////////////////////////////// -->
							<form action="http://localhost/group2_prj/reservation/show_rsrvt2.jsp" method="get" id="testSchFrm">
								<!-- Sidebar -->
									<section class="box" style="margin-bottom: 30px; height: 470px;">
										<header>
										
											<h3 class="h3">상영일정 선택</h3>
										</header>
										<footer>
										<!-- <input type="date" name="서버가 인식할값" value="서버에 전송할값"><br> -->

										<select name="schtest" id="schtest">
										<% for(RsrvtInfoVO rVO : listRVO){ %>
											<option value="<%=rVO.getSchId()%>"><%=rVO.getSchDate()%>(<%=rVO.getSchDay()%>) / <%=rVO.getSchTime()%>	</option>
										<%} %>
										</select>
										
										
										</footer>
									</section>
								<a href="javascript:history.back();" class="button alt button_minBack" style="background: #c5c5c3;">이전</a>
								<!-- <a href="show_rsrvt2.jsp" class="button alt button_minNext">다음</a> -->
								<!-- 10-15 버튼변경 -->
								<input type="button" value="다음" class="button alt button_minNext" id="nextBtn">
							</form>	
							<!-- /////////////////////////////////////////////////// -->
							</div>
						</div>
					</div>
				</section>
		

				<!----------------------------------------------여기서부터 끝까지 footer-------------------------------------------->

			<!-- Footer  -->
			<c:import url="http://localhost/group2_prj/common/user_allPage_footer.jsp"/> 
	    	<!-- End footer -->

		

	</body>
</html>