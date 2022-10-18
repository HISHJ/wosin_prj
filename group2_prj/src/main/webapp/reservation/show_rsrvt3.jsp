<%@page import="java.util.Enumeration"%>
<%@page import="kr.co.sist.vo.RsrvtInfoVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.dao.RsrvtDAO"%>
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
//로그인 되어있지 않은 경우, 로그인페이지로 이동
if( session.getAttribute("memberId") == null){
response.sendRedirect("http://localhost/group2_prj/login/login.jsp");
return;
} 


if(session.getAttribute("showId")==null){
    response.sendRedirect("http://localhost/group2_prj/main/index.jsp");
    return;
}
%>    
    
    
<%
	String swId = (String)session.getAttribute("showId");
	MainDAO mDAO = MainDAO.getInstance();
	ShowVO sVO = mDAO.selectShowMain(swId); // 다주는 메서드 10-15 주석처리후
	
	pageContext.setAttribute("sVO", sVO); // 10-15 주석처리
	
	String schId = (String)session.getAttribute("schTest");
	
	RsrvtDAO rDAO = RsrvtDAO.getInstance();
	
	
	String[] selectedArr = request.getParameterValues("seat");
	session.setAttribute("selectedSeats", selectedArr);
	
	RsrvtInfoVO rsrvtVO = rDAO.selectRsrvtInfo(schId,selectedArr.length);
	
	Enumeration se = session.getAttributeNames();
	
	while(se.hasMoreElements()){
		
		String getse = se.nextElement()+"";
		System.out.println("show_rsrvt3.jsp @@@@session : "+getse+":"+session.getAttribute(getse));
	
	}
	
%>    
<!DOCTYPE HTML>

<html>
	<head>
		<title>예매하기 | 내역</title>
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
<%if (memberId == null) { //2022-10-16 13:05 유설빈%>
<style>
#nav {
	margin-right: 150px;
}
</style>
<%}%>
<style>
input[type="button"]{
padding:0.65em 1.5em 0.65em 1.5em;
border:1px solid #555555 !important;
font-weight:700 !important;
margin-right:20px;
border-radius:3px;
}

.btn_wrap{
 position:relative;
 height:100px;
 bottom:300px;
}

.btn_wrap input[type="button"]{
 position:absolute;
 right:-5px;
}

.preBtn{
 /* border:2px solid #555555 !important; */
 color:#555555 !important;
 padding-left:43px !important;
 padding-right:43px !important;
 margin-left:-20px !important;
 
}
</style>

		<!-- Scripts -->
		<script src="http://localhost/group2_prj/assets/js/jquery.min.js"></script>
		<script src="http://localhost/group2_prj/assets/js/jquery.dropotron.min.js"></script>
		<script src="http://localhost/group2_prj/assets/js/browser.min.js"></script>
		<script src="http://localhost/group2_prj/assets/js/breakpoints.min.js"></script>
		<script src="http://localhost/group2_prj/assets/js/util.js"></script>
		<script src="http://localhost/group2_prj/assets/js/main.js"></script>
			
		<!-- tap관련 추가한거 -->
		<script src="http://localhost/group2_prj/assets/js/tab.js"></script>
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

			<!-- //2022-10-16 13:05 유설빈  -->
		<c:import url="http://localhost/group2_prj/common/user_subpage_header.jsp">
			<c:param name="memberId" value="<%=memberId%>"></c:param>
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
				<form id="rsrvtInfoChkFrm" method="post" action="http://localhost/group2_prj/reservation/show_rsrvt3_process.jsp">	
						<div class="container">
	
	
							<div class="col-12">
	
								<!-- Blog -->
									<section>
									
										<div class="row">
											<div class="col-4 col-12-small">
												<section class="box" style="margin-bottom: 30px;">
													<a class="image featured"><img src="http://localhost/group2_prj/admin/img/<%=sVO.getThImg() %>" ></a>
													<header>
													<h3 class="h3" style="width:270px; white-space:pre-line;" title="<%=sVO.getName() %>"><%=sVO.getName() %></h3>
														<%-- <h1><input type="text" name="showName" value="<%=rsrvtVO.getShowName() %>" readonly="readonly" title="<%=rsrvtVO.getShowName() %>"
																		style="border:none; display:inline; color:#555555; padding:0px;font-size:20px; font-weight: 900; ">
																		
														</h1> --%>
														<!-- 10-16 showName 히든처리로 넘기도록 수정 -->
														<input type="hidden" name="showName" value="<%=rsrvtVO.getShowName() %>" >
																		
																		
														
														
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
							    <div class="btn_wrap">
								<input class="preBtn" onClick="javascript:history.back();" type="button" value="이전" id="rsrvtBtnOk2" style="background-color:#fff;color:#555555 !important;margin-right:155px !important;">
								<input type="button" value="예매하기" id="rsrvtBtnOk" style="background-color:#555555;padding-left:30px;padding-right:30px;">
								</div>
							
						</div>
				</form>
				</section>
		

				<!----------------------------------------------여기서부터 끝까지 footer-------------------------------------------->

			<!-- Footer  -->
			<c:import url="http://localhost/group2_prj/common/user_allPage_footer.jsp"/> 
	    	<!-- End footer -->

		

	</body>
</html>