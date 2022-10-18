
<%@page import="kr.co.sist.vo.ShowVO"%>
<%@page import="kr.co.sist.dao.ShowDAO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="scriptlet의 사용" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

String memberId = (String)session.getAttribute("memberId");
%>
<!DOCTYPE html>
<html>
<head>
		<title>공연검색결과</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		
		<!-- 부트스트랩 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/main.css" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/reset.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/headerFooter.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/subheader.css">
		
		<!-- 공연상세페이지만을 위한 css -->
      <link rel="stylesheet" href="http://localhost/group2_prj/assets/css/NewFile.css">
      <link rel="stylesheet" href="http://localhost/group2_prj/assets/css/perform.css">
		 <script type="text/javascript"
		src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<%if(memberId == null){%>
<style>
#nav {
	margin-right: 130px;
}
</style>
<%}%>
<style>
.search_wrap{
display: flex;
align-items: center;
margin-bottom:30px;

}

.kwd_input{
  width:90% !important;
  height:60px;
 
  border:2px solid #000 !important;
}

.search_btn{
    /* position: absolute;
    right: 0;
    top: 0; */
    width: 120px;
    height:60px;
    background: #ffe800 url("http://localhost/group2_prj/common/btn-sch_b.png") center center no-repeat;
    background-size: 1.438em;
    display: block;
    white-space: nowrap;
    overflow: hidden;
    text-indent: -999px;
    border: 2px solid #000;
    border-left: 0;

}


</style>
<script type="text/javascript">
$(function(){
 $("#kwd").focus(function(){
	 $("#kwd").val("");
 })	//focuse()
 
 $("#search_btn").click(function(){
	 
	 $("#searchFrm").submit();
 })
})//ready
 
</script>
</head>
	<body class="homepage is-preload">
	
<%
request.setCharacterEncoding("UTF-8");
String showName = request.getParameter("kwd"); //값 잘 받아와짐

ShowDAO sDAO = ShowDAO.getInstance();
List<ShowVO> shoList = sDAO.selectMainShow(showName);


if(showName == null){
	response.sendRedirect("http://localhost/group2_prj/main/index.jsp");
}
%>	
	
		<div id="page-wrapper">

					
		<c:import  url="http://localhost/group2_prj/common/user_subpage_header.jsp" > 
    	<c:param name="memberId" value="<%= memberId %>"></c:param> 
    	</c:import>

						<!--❤️여기에 서브제목 입력하세욮 ex) 공연일정-->
						<div id="sut-t_wrap">
						<h2 id="sub-t">
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">공연검색결과</strong>
						</h2>
					</div>
					</section>

						<!--------------------------------------위까지가 헤더----------------------------------------->
<!-- Main -->
<section id="main">
	<div class="container">

						<!-- Content -->
	<article class="box post">
		   <form id="searchFrm" name="searchFrm" method="get">
		  <div class="search_wrap">  
		    
	         <label for="word" class="hide">검색어</label>
			<input type="text" name="kwd" id="kwd" class="kwd_input" value="<%=showName%>" placeholder="공연명을 입력해주세요." />
			<button type="button" id="search_btn" class="btn search_btn">검색</button>
		 
		 </div>
		  </form>	
 
		
		<% if(shoList != null && !shoList.isEmpty()){%>
	
		<!-- p에 있는 텍스트 마우스오버시 색상 안바뀌게, 이미지 배열 -->
		  <div class="poster_wrap">
        	<div class="row row_flex " >
           		<div class="col set" style="display:flex;flex-wrap:wrap;justify-content:space-between;">
		<%for(ShowVO shVO : shoList){%>
					<div class="card" style="width: 18rem;margin-bottom:20px;">
					<a href="http://localhost/group2_prj/reservation/show_info.jsp?showId=<%=shVO.getShowId()%>">
					<img src="http://localhost/group2_prj/admin/img/<%=shVO.getThImg() %>" class="card-img-top" alt="<%= shVO.getName() %>">
						<!-- <a href="page2.html"><img src="poster/rj.jpeg" class="card-img-top" alt="..."> -->
					 	<div class="card-body">
					    <h5 class="card-title h3" style="white-space: normal;"><%= shVO.getName() %></h5>
					    <p class="card-text datail1"  style="color: #111111;"><%=shVO.getTotalDate() %></p>
					    <p class="card-text datail2"><%= shVO.getGenreType() %></p>
		 				</div>
		  				</a>
					</div>
			<%} %>
				</div>
			</div>
			<%} %>
       
			
			</div> 
		
					
		</article>
	</div>
</section>

				<!----------------------------------------------여기서부터 끝까지 footer-------------------------------------------->

			<!-- Footer -->
			<c:import url="http://localhost/group2_prj/common/user_allPage_footer.jsp"/> 
			<!-- End footer -->

		     <!-- Scripts -->
			<script src="http://localhost/group2_prj/assets/js/jquery.dropotron.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/browser.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/breakpoints.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/util.js"></script>
			<script src="http://localhost/group2_prj/assets/js/main.js"></script>
			<!-- 추가한거 -->
			<script src="http://localhost/group2_prj/assets/js/tab.js"></script>

	</body>
</html>