<%@page import="javax.websocket.Session"%>
<%@page import="kr.co.sist.vo.AdminMemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.dao.AdminMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>/
    
    
    
<jsp:useBean id="admVO" class="kr.co.sist.vo.AdminMemberVO" scope="session"/>
<%
  request.setCharacterEncoding("UTF-8");
  String id=request.getParameter("memberId");
  String mailchk=request.getParameter("mailChk");
  String smschk=request.getParameter("smsChk");
  String status=request.getParameter("status");
	AdminMemberDAO admDAO = AdminMemberDAO.getInstance();
	
 List<AdminMemberVO> Mlist =admDAO.selectMember(id,mailchk,smschk,status);  


  
  %> 
  <%
 //로그인되어있지 않은 경우 로그인페이지로 이동
if( session.getAttribute("adminId") == null){
   response.sendRedirect("admingLogin.jsp");
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
        <title>회원관리-메인</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        
      
         <!--제이쿼리-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			
		   	$("#idSearchBtn").click(function() {
	    		$("#idFrm").submit();
			});//아이디 검색
			
	    	$("#ChkSearchBtn").click(function() {
	    		$("#chkFrm").submit();
			});// 수신동의검색
			
	    	$("#statusSearchBtn").click(function() {
	    		$("#statusFrm").submit();
	    	});//상태 검색
	    	
	    	
   		});//ready
			
	
	</script>
    </head>
    <body class="sb-nav-fixed">
    
     <!-- 여기서부터 <nav>-->
<jsp:include page="admin_common_header.jsp"/>      
<!-- -여기까지 <div id="layoutSidenav_content"> 전  -->
    
    <!-- 
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            Navbar Brand
            <a class="navbar-brand ps-3" href="dashBoard.html">C&nbsp;M&nbsp;S&nbsp;</a>
            Sidebar Toggle
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            Navbar Search
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
           
                <div class="input-group" style="color:#FFFFFF">
                하지윤님
                </div>
            </form>
            Navbar
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="javascript:passwordChange()" target="_parent">정보변경</a></li>
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
                        <img src="/img/logo_white.png" style="width:200px;height:60px"/>
                    </div>
                </nav>
            </div> -->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">회원관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">user management board</li>
                        </ol>
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                회원 리스트
                            </div>
                            <div class="card-body">
                           <form name="idFrm" id="idFrm">
                           	<div class="dataTable-top"></div>
                                <label>아이디　</label>
                           	  	<input type="text"  name="memberId" class="dataTable-input" style="width: auto; display: inline-block;"> 
                                <input type="button" id="idSearchBtn" name="memberId" value="검색">
                             </form>
                           
                           
                           
                           <form name="chkFrm" id="chkFrm">
                                <div class="dataTable-top"></div>
                                <label>수신동의　</label>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name="emailChk"
                                    value="Y">
                                    <label class="form-check-label" for="inlineCheckbox1">이메일</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox2" name="smsChk"
                                    value="Y">
                                    <label class="form-check-label" for="inlineCheckbox2">SMS</label>
                                </div>
                                <input type="button" id="ChkSearchBtn" value="검색">
                            </form>
                            
							<form name="statusFrm" id="statusFrm">
                                <div class="dataTable-top"></div>
                                <label>회원상태　</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" >
                                        <label class="form-check-label" for="inlineRadio1">전체</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="status" id="inlineRadio2" value="Y">
                                        <label class="form-check-label" for="inlineRadio2">Y</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="status" id="inlineRadio2" value="N">
                                        <label class="form-check-label" for="inlineRadio2">N</label>
                                    </div>
                                    <input type="button"  id="statusSearchBtn" name="showSatusSearchBtn" value="검색">
                                 </form>   
                                <a href="useBoard.jsp"><button id="addBtn" type="button" class="btn btn-outline-dark float-end mx-md-4" >전체보기</button></a>
                                </div>
                            </div>
                        
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>이름</th>
                                            <th>아이디</th>
                                            <th>가입일</th>
                                            <th>메일수신상테</th>
                                            <th>SMS수신상태</th>
                                            <th>상태</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                            <th>이름</th>
                                            <th>아이디</th>
                                            <th>가입일</th>
                                            <th>메일수신상테</th>
                                            <th>SMS수신상태</th>
                                            <th>상태</th>
                                            <th>관리</th>
                                        </tr>
                                        </tfoot>
                                     <tbody>
                                     <%for(AdminMemberVO admVO1 : Mlist){%>
                                        <tr>
                                            <td><%=admVO1.getName()%></td>
                                            <td><%=admVO1.getMemberId()%></td>
                                            <td><%=admVO1.getMdate()%></td>
                                            <td><%=admVO1.getMailChk()%></td>
                                            <td><%=admVO1.getSmsChk()%></td>
                                            <td><%=admVO1.getStatus()%></td>
                                            <td><a href="useDetail.jsp?memberId=<%=admVO1.getMemberId()%>">
                                            <input type="button" value="상세보기" class="useDetailBtn"/></a></td>
                                        </tr>
                                   <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <!--  -->
                <jsp:include page="admin_common_footer.jsp"/>
                
               <!--  <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
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
    -->