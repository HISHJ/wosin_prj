<%@page import="kr.co.sist.dao.AdminShowDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.vo.AdminShowVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="scriptlet의 사용"%>

    
    
    <!-- 문제 -->
    <!-- 버튼클릭시 페이지 이동 안함 (함수) -->
<%
AdminShowVO asVO= new AdminShowVO();
AdminShowDAO asDAO=AdminShowDAO.getInstance();
List<AdminShowVO> list=asDAO.selectShow(asVO);  
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>공연관리-메인</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!--제이쿼리-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script type="text/javascript">

		$(function(){
    	
	    	//추가버튼 클릭시 페이지 이동
	    	$("#addBtn").click(function(){
				location.href = "showAdd.jsp"; //안가는데 ? 제이쿼리 js 안받아서 그랬던것
			});
    	
	    	
	    	$("input[name='status']:radio").click(function () {
	            //라디오 버튼 값을 가져온다.
	            var status = this.value;
	            var url="http://localhost/jsp_prj/design%20intergration/showBoard.jsp";
	            url =url+"?status="+status;
	            
	           //alert(url);

	            //radio 버튼이 도망? 가고 url은 바뀌는데 select되는 애는 변함없음 
	            location.href=url;
	            console.log(url); 
	                            
	    	});
	    	
	    	//검색버튼2.상태 >>>>>>>얘는 alert도 안뜸;
	    	$(document).on('click', '#showSatusSearchBtn', function(){
	    		e.preventDefault();
	    		var url = "http://localhost/jsp_prj/design%20intergration/showBoard.jsp";
	    		url = url + "?status=" + $('#status').val();
	    		
	    		alert(url);
	    		/* location.href = url;
	    		console.log(url); */
	    	});
	    	
   		});//ready
		   	

        </script>
      
        
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
                        <!-- 팝업기능 -->
                        <!-- <li><a class="dropdown-item" href="passwordchange.html" onclick="window.open(this.href, '_blank', 'width=800, height=500'); return false;">정보변경</a></li>  -->
                        <li><a class="dropdown-item" href="passwordchange.html">정보변경</a></li>
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
                        <h1 class="mt-4">공연관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">show mamgement board</li>
                        </ol>
                        <form name="frm" id="frm">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                공연 리스트
                            </div>
                            <div class="card-body">
                               
                               <!-- 뭐 추가하면 템플릿 양식을 깨트림;;; -->
                               <!-- 해결 </table> 바로 밑에 버튼 만들면 됨 -->
                           
                           	 <div class="dataTable-top"></div>
                               <div>
                                <label>장르　</label>
                                <select name="genreType" class="dataTable-selector" aria-label="Default select example">
								  <%String[] genreArr={"G1","G2","G3","G4","G5","G6"}; %>
								  <%for(int i=0; i<genreArr.length; i++){ %>
								  <option><%=genreArr[i] %></option>
								  <%} %>
								</select><input type="button" id="genreSearchBtn" name="genreSearchBtn" value="검색">
                               </div>
                               
                           
                                <div class="dataTable-top"></div>
                                <label>상태　</label>
                               	 <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="status" id="inlineRadio1" value="option1" 
                                    		checked="checked">
                                    <label class="form-check-label" for="inlineRadio1">전체</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="status" id="inlineRadio2" value="공연중">
                                    <label class="form-check-label" for="inlineRadio2">공연중</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="status" id="inlineRadio2" value="공연예정">
                                    <label class="form-check-label" for="inlineRadio2">공연예정</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="status" id="inlineRadio2" value="공연종료">
                                    <label class="form-check-label" for="inlineRadio2">공연종료</label>
                                  </div>
                                  <input type="button" id="statusSearchBtn" name="statusSearchBtn" value="검색">
                           	 </div>
                            </div>
                            </form>
                       
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>공연코드</th>
                                            <th>공연명</th>
                                            <th>장르</th>
                                            <th>금액</th>
                                            <th>관람등급</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tfoot> 
                                        <!-- 이게 뭐하는건지 모르겠음 foot -->
                                        
                                        <tr>
                                            <th>공연코드</th>
                                            <th>공연명</th>
                                            <th>장르</th>
                                            <th>금액</th>
                                            <th>관람등급</th>
                                            <th>관리</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <%for(int i=0; i<list.size();i++){ %>
                                        <tr>
                                            <td><%=list.get(i).getShowId() %></td>
                                            <td><%=list.get(i).getName() %></td>
                                            <td><%=list.get(i).getGenreId() %></td>
                                            <td><%=list.get(i).getPrice() %>원</td>
                                            <td><%=list.get(i).getRatingId() %></td>
                                            <td><a href="showDetail.jsp?showId=<%=list.get(i).getShowId() %>"><input type="button" value="상세보기" class="showDetailBtn"></a></td>
                                        </tr>
                                       <%} %>
                                    </tbody>
                                </table>
                            <div><a href="showAdd.jsp"><button id="addBtn" type="button" class="btn btn-outline-secondary">공연추가</button></a></div>
                            </div>
                        </div>
                    </div>
                </main>
                <!--  -->
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
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
