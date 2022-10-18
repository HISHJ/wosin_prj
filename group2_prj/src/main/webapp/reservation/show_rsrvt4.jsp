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


if(session.getAttribute("showId")==null){
    response.sendRedirect("http://localhost/group2_prj/main/index.jsp");
    return;
}
%>
   
<%
// 공연코드랑, swId랑, 좌석이름, 좌석아이디??는어떻게받더라?
	String swId = (String)session.getAttribute("showId");
	MainDAO mDAO = MainDAO.getInstance();
	ShowVO sVO = mDAO.selectShowMain(swId); // 다주는 메서드
	
	pageContext.setAttribute("sVO", sVO);
	//System.out.println(swId);
	//System.out.println(sVO.getName());
	
	String schId = (String)session.getAttribute("schTest");
	System.out.println(schId);
	System.out.println(swId); // ㅇㅇ 둘다 잘 받아졌음 
	RsrvtDAO rDAO = RsrvtDAO.getInstance();
	////////////////////////////////////////////////
	
	//받아온값을 다 활용해서 RsrvtInfoVO에 넣고 그 VO를 script에서 버튼눌리면 VO를 넣는다?? 되나?되겠지뭐
	
	request.setCharacterEncoding("UTF-8");
	Enumeration rp = request.getParameterNames();
	while(rp.hasMoreElements()){
		String getrp = rp.nextElement()+"";
		System.out.println("show_rsrvt4.jsp @@@@request : "+getrp+":"+request.getParameter(getrp)); // values안하니까 좌석 하나만 나옴 ㅇㅇ
	}
	Enumeration se = session.getAttributeNames();
	while(se.hasMoreElements()){
		String getse = se.nextElement()+"";
		System.out.println("show_rsrvt4.jsp @@@@session : "+getse+":"+session.getAttribute(getse));
	}
	
	
	RsrvtInfoVO rVO = (RsrvtInfoVO)request.getAttribute("req_rVO");
	System.out.println("show_rsrvt4.jsp에서 받음 ㅇㅇ"+rVO.toString());
	
	String[] selectedSeats = (String[])session.getAttribute("selectedSeats");
	for(String str : selectedSeats){
		System.out.print(str+",");
	}
	
	
	//******************* rsrvtInfoVO 를 만들고 거기에 값을 다 넣고 이 VO로 쿼리문을 실행해야지?
%>    
<!DOCTYPE HTML>

<html>
	<head>
		<title>예매하기 | 예매완료</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/main.css" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/reset.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/subheader.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/headerFooter.css">
		<!-- 공연상세페이지만을 위한 css -->
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/perform.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/tab.css">
	
		<!-- Scripts -->
		<script src="http://localhost/group2_prj/assets/js/jquery.min.js"></script>
		<script src="http://localhost/group2_prj/assets/js/jquery.dropotron.min.js"></script>
		<script src="http://localhost/group2_prj/assets/js/browser.min.js"></script>
		<script src="http://localhost/group2_prj/assets/js/breakpoints.min.js"></script>
		<script src="http://localhost/group2_prj/assets/js/util.js"></script>
		<script src="http://localhost/group2_prj/assets/js/main.js"></script>
			
		<!-- tap관련 추가한거 -->
		<script src="http://localhost/group2_prj/assets/js/tab.js"></script>
		
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<%if(memberId == null){%>
	<style>
	#nav {
	margin-right: 150px;
	}
	</style>
	<%} %>
		<style>
input[type="button"].alt {
	margin-bottom: 200px;
	position:absolute;
	right:0px;
	padding-top:10px;
	padding-bottom:10px;
	border-radius: 3px;
	
}

.btn_wrap {
	margin-top: -145px;
	height:100px;
	position:relative;
}

.empty_container{
  height:70px;
}
</style>
		<script>
		$(function(){
			$("#rsrvt_test_ok").click(function(){
				<%
				// 세션값지우기
				session.removeAttribute("selectedSeats");
				session.removeAttribute("showId");
				session.removeAttribute("schTest");
				
				// session iinvalidate는 아이디는 세션에있어야하니까 사용하지않고? ㅇㅇ
				%>
				
				/* location.href="show_rsrvt5_testtesttesttesttest.jsp"; 세션값확인 테스트용 */
				location.href="http://localhost/group2_prj/main/index.jsp";
			})
		})
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
				<form>
					<div class="container">


						<div class="col-12">

							<!-- Blog -->
								<section>
									<div class="row">
										<div class="col-4 col-12-small">
											<section class="box" style="margin-bottom: 100px;">
												<a class="image featured"><img src="http://localhost/group2_prj/admin/img/<%=sVO.getThImg() %>" ></a>
												<header>
													<h3 class="h3" style="width:270px;white-space: pre-line;" title="<%=rVO.getShowName() %>"><%=sVO.getName() %></h3>
													
												</header>
											</section>
										</div>
										<div class="col-8 col-12-small">
											<section class="box" style="margin-bottom: 30px;">
												<header>
													<ul class="divided">
														<li class="h3">예매완료</li>
														<li>날짜　　<%=rVO.getSchDate() %></li>
														<li>장소　　우신문화회관 대극장</li>
														<li>시간　　<%= rVO.getSchTime() %></li>
														<li>좌석  
															<%if(selectedSeats.length>0){
																for(int i=0;i<selectedSeats.length;i++){%>
																	<input type="text" name="seats" value="<%= selectedSeats[i]%>" readonly="readonly"
																		style="border:none; width:25px; margin-left:30px; display:inline; color:#555555; padding:0px; font-weight: 900">번
																<%}
															}%></li>
														<li>예매번호　　<%=rVO.getRsrvtId() %></li>
														
													</ul>
												</header>
											</section>
										</div>
									</div>
								</section>

							<div class="btn_wrap">	
							<input type="button" id="rsrvt_test_ok" class="button alt button_minNext" value="메인으로">
						   </div>
						</div>

					</div>
					<!-- 디자인때문에 필요한 div입니다.지우지 마세요 -->
					<div class="empty_container"></div>
				</form>					
				</section>
		

				<!----------------------------------------------여기서부터 끝까지 footer-------------------------------------------->

			<!-- Footer  -->
			<c:import url="http://localhost/group2_prj/common/user_allPage_footer.jsp"/> 
	    	<!-- End footer -->
		

	</body>
</html>