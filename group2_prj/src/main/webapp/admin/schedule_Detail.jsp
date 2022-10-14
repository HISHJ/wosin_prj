<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@page import="project.dao.AdminScheduleDAO"%>
<%@page import="project.vo.AdminScheduleVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>



<%

request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String genreId = request.getParameter("genreId");
AdminScheduleDAO aschDAO=AdminScheduleDAO.getInstance();
List<AdminScheduleVO> list=aschDAO.selectSchedule(name,genreId);



for(int i=0; i < list.size(); i++){
	
	System.out.println(list.get(i).toString()); 
	
}
%>



<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>상영관리-메인</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!--제이쿼리-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script type="text/javascript">
        
      
        
        

		$(function(){
    	
	    	$("#scbtn").click(function(){
				$("#Frm").submit();
			});//상영일자추가

	    	$("#nameSearchBtn").click(function() {
	    		$("#nameFrm").submit();
			});//공연명 검색
			
	    	$("#genreSearchBtn").click(function() {
	    		$("#genreFrm").submit();
			});//장르 검색
	    	
		});//ready

        </script>
      
        <!-- 팝업창 띄우는 script ..실패...alert창으로 띄워 -->
        <!-- <script>
            function passwordChange(){
                var url="http://localhost/html_prj/admin_dashboard/passwordchange.html";
                var name="passwordchange popup"
                var option= "width=500, height=500, top = 100, left = 200, location = no"
                
                window.open(url, name, option);
            }
        </script> -->

        <!-- //지윤님 오류에 뜬 css파일들 새로 연결해주셔야 할 것 같ㅇ ? 파일들 다 어디..?
        //저 portal로 되어있는 부분들은 다 우신문화회관에 있는 파일들이에요
        //찾아서 넣으시면 돼ㅛ! 넵  -->


    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">C&nbsp;M&nbsp;S&nbsp;</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
           
                <div class="input-group" style="color:#FFFFFF">
                하지윤님
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <!-- <li><a class="dropdown-item" href="javascript:passwordChange()" target="_parent">정보변경</a></li> -->
                        <li><a class="dropdown-item" href="passwordchange.html" target="_parent">정보변경</a></li>
                        <li><a class="dropdown-item" href="#!">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Menu</div>
                             <a class="nav-link" href="dashBoard.html">
                                 <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                 Dashboard
                             </a>
                             <hr>
                             <a class="nav-link collapsed" href="userBoard.html">
                                 <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                 회원관리   
                             </a>
                             <hr>
                             <a class="nav-link" href="showBoard.html">
                                 <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                 공연관리
                             </a>
                            <hr>
                            <a class="nav-link" href="showINGBoard.html">
                                 <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                 상영관리
                             </a>
                             <hr>
                             <a class="nav-link" href="rsrvtBoard.html">
                                 <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                 예매관리
                             </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <img src="img/logo_white.png" style="width:200px;height:60px"/>
                    </div>
                </nav>
            </div>


            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">상영관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">show mamgement (in detail) board</li>
                        </ol>
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                공연 리스트
                            </div>
                            <div class="card-body">
                               
                               <!-- 다 검색으로 조회가능 하지만 우선 raadio 만듬 -->
                               
                           
                                <!-- <div class="dataTable-top"></div>
                                <label>상태　</label>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                    <label class="form-check-label" for="inlineRadio1">전체</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                    <label class="form-check-label" for="inlineRadio2">공연중</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                    <label class="form-check-label" for="inlineRadio2">공연예정</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                    <label class="form-check-label" for="inlineRadio2">공연종료</label>
                                  </div>
                                  <input type="button" name="showSatusSearchBtn" value="검색">
                            </div>  -->
                            
                            <form name="nameFrm" id="nameFrm">
                           	 <div class="dataTable-top"></div>
                                <label>공연명　</label>
                           	  	<input type="text"  name="name" class="dataTable-input" style="width: auto; display: inline-block;"> 
                                <input type="button" id="nameSearchBtn" name="nameSearchBtn" value="검색">
                             </form>
                              
                        	<form name="genreFrm" id="genreFrm">
                           	 <div class="dataTable-top"></div>
                               <div>
                                <label>장르　　</label>
                                <select name="genreId" class="dataTable-selector" aria-label="Default select example">
								  <%String[] genreArr={"국악","연극","오페라","뮤지컬","클래식","무용"}; %>
								  <%for(int i=0; i<genreArr.length; i++){ %>
								  <option><%=genreArr[i] %></option>
								  <%} %>
								</select><input type="button" id="genreSearchBtn" name="genreSearchBtn" value="검색">
                               </div>
                              </form>
                           <div>
                            <a href="showINGBoard.jsp"><button id="addBtn" type="button" class="btn btn-outline-dark float-end mx-md-4" >전체보기</button></a>
                           </div>
                           
                           <!-- form  action-->
                       <form action="showINGDetail.jsp" method="post" id="Frm" name="Frm" >
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>공연코드</th>
                                            <th>공연명</th>
                                            <th>상영일</th>
                                            <th>장르</th>
                                            <th>시간</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tfoot> 
                                        <!-- 이게 뭐하는건지 모르겠음 foot -->
                                        <!-- 관람등급 뭐뭐있는지 -->
                                        <tr>
                                            <th>공연코드</th>
                                            <th>공연명</th>
                                            <th>상영일</th>
                                            <th>장르</th>
                                            <th>시간</th>
                                            <th>관리</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <%for(AdminScheduleVO aschVO: list){ %>
                                        <tr>
                                            <td><%=aschVO.getShowId() %></td>
                                            <td><%=aschVO.getName() %></td>
                                            <td><%=aschVO.getSchDate() %></td>
                                            <td><%=aschVO.getGenreId() %></td>
                                            <td><%=aschVO.getSchTime() %></td>
                                            <td><a href="showINGDetail.jsp?schId=<%=aschVO.getSchId() %>"><input type="button" value="상세보기" id="scbtn" ></a></td>
                                        </tr>
                                        <%} %>
                              
                                        
                                    </tbody>
                                    
                                </table>
                         </form>
                            </div>
                        </div>
                    </div>
                </main>
                <!--  -->
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div><a href="2showINGAdd-1.jsp"><button id="addBtn" type="button" class="btn btn-outline-secondary">상영일자추가</button></a></div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>