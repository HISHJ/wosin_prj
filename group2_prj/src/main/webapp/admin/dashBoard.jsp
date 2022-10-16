<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="kr.co.sist.common.dao.DbConnection"%>
<%@page import="kr.co.sist.dao.DashBoardDAO"%>
<%@page import="kr.co.sist.vo.DashBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
	<%! DashBoardDAO dbDAO = null;%>
	<%! DashBoardVO show = null;%>
	<%! DashBoardVO member = null;%>
	<%! List<DashBoardVO> rsrvtByShow = null;%>
	<%! List<DashBoardVO> dailySales = null;%>
	<%
	/* SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(new Date()); */
	dbDAO = DashBoardDAO.getInstance();
	
	show = dbDAO.selectDashBoardShow(); 
	member = dbDAO.selectDashBoardMember();
	rsrvtByShow = dbDAO.selectRsrvtCntByShow();
	
	dailySales = dbDAO.selectDailySales();
	
	%>
	   <%
 
    //로그인되어있지 않은 경우 로그인페이지로 이동
    if( session.getAttribute("adminId") == null){
   	 response.sendRedirect("http://localhost/group2_prj/admin/admingLogin.jsp");
    }
   //값검증완료
    String aId = (String)session.getAttribute("adminId");
    %>  
   

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>대시보드는 공사중</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- /////////////////// -->
        <script>
        var ss = window.sessionStorage;
         
        
        
        </script>
    </head>
    <body class="sb-nav-fixed">
		<%for(int i=0;i<rsrvtByShow.size();i++){%>
		
		<input type="hidden" value="<%=rsrvtByShow.get(i).getShowName()%>" id="show_<%=i+1%>">
		<input type="hidden" value="<%=rsrvtByShow.get(i).getRsrvtCnt()%>" id="cnt_<%=i+1%>">
		
		<%};  %> 
		
		<%for(int i=0;i<dailySales.size();i++){%>
			<input type="hidden" value="<%=dailySales.get(i).getDailyDay() %>" id="date_<%=i+1%>">
			<input type="hidden" value="<%=dailySales.get(i).getTotalSales() %>" id="sale_<%=i+1%>">
        <%} %>
        
        
           <!--include로 parameter값 전달  -->
   <jsp:include page="admin_common_header.jsp">
   <jsp:param name="adminId" value="<%= aId%>"/>
   </jsp:include> 
	
    
       <!--  <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
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
                             <a class="nav-link" href="#">
                                 <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                 Dashboard
                             </a>
                             <hr>
                             <a class="nav-link collapsed" href="userBoard.jsp">
                                 <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                 회원관리   
                             </a>
                             <hr>
                             <a class="nav-link" href="showBoard.jsp">
                                 <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                 공연관리
                             </a>
                            <hr>
                            <a class="nav-link" href="schedule_Board.jsp">
                                 <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                 상영관리
                             </a>
                             <hr>
                             <a class="nav-link" href="rsrvtBoard.jsp">
                                 <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                 예매관리
                             </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                       
                        <img src="img/logo_white.png" style="width:200px;height:60px"/>
                    </div>
                </nav>
            </div> -->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">대시보드</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                       
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        공연현황 
                                    </div>
                                    <div class="card-body" style=" height:150px;">
                                        
                                        <h6 class="fw-bold">공연 예정작 수</h6>
                                        <%= show.getStandByShow() %>
                                        <div class="dataTable-top"></div>
                                        <div class="dataTable-top"></div>
                                        <h6 class="fw-bold">현재 공연작 수</h6>
                                        <%= show.getOnTheShow() %>
                                        
                                    </div>   
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        회원현황
                                    </div>
                                    <div class="card-body" style=" height:150px;">
                                        <h6 class="fw-bold">금일 가입회원 수</h6>
                                        <%= member.getSignUpMember() %>
                                        <div class="dataTable-top"></div>
                                        <div class="dataTable-top"></div>
                                        <h6 class="fw-bold">금일 탈퇴회원 수</h6>
                                        <%= member.getQuitMember() %>
                                        
                                    </div>   
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4" >
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        공연별 예매건수
                                    </div>
                                    <div class="card-body">
                                    <%-- <input type="hidden" value="<%= rsrvtByShow.get(0).getShowName() %>" id="test1011"> --%>
                                        <canvas id="myPieChart" width="100%" height="50">
                                        </canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                       일별매출
                                    </div>
                                    <div class="card-body">
                                        
                                        
                                        <canvas id="myAreaChart" width="100%" height="50px"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>




                    </div>
                </main>
                <!--  -->
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <!-- <script src="../js/scripts.js"></script> -->
        <script src="http://localhost/group2_prj/js/scripts.js"></script>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <!-- <script src="../js/chart-area-demo.js"></script> -->
        <script src="http://localhost/group2_prj/js/chart-area-demo.js"></script>
        <!-- <script src="../js/chart-pie-demo.js"></script> -->
        <script src="http://localhost/group2_prj/js/chart-pie-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <!-- <script src="../js/datatables-simple-demo.js"></script> -->
        <script src="http://localhost/group2_prj/js/datatables-simple-demo.js"></script>
    </body>
</html>
