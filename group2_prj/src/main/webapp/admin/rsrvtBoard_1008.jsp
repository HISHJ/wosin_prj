<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="adminVO.AdminRsrvtInfoVO"%>
<%@page import="java.util.List"%>
<%@page import="adminDAO.AdminRsrvtDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="scriptlet의 사용" %>
<!DOCTYPE html>
<html>
<head>
  <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>예매관리-메인</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<!--JQuery Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
   
</head>
<body class="sb-nav-fixed">
<%
//예매번호 담을 리스트
List<String> rIdList = new ArrayList<String>();
//기본예매내역조회
AdminRsrvtDAO aDAO = AdminRsrvtDAO.getInstance();
List<AdminRsrvtInfoVO> voList = aDAO.selectRsrvt();

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String date = null;  
String rsrvtid = ""; //vo 예매번호 담을 변수
String rsId=""; //세션담을변수
%>
<script type="text/javascript">

 function getHiddenVal(rid){
    $("#rsrvtId").val(rid);
	$("#resultFrm").submit(); 
 }
</script>
 
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
                        <h1 class="mt-4">예매관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">reservation management board</li>
                        </ol>
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                예매 리스트
                            </div>
                            <div class="card-body">
                               
                               <!-- 다 검색으로 조회가능 하지만 우선 만듬 -->
                               <div class="dataTable-top"></div>
                               <div>
                                <label>예매일자　</label>
                                   <input type="date" name="가입일자1" class="dataTable-selector">
                                   <label> ~ </label>
                                   <input type="date" name="가입일자1" class="dataTable-selector">
                                   <input type="button" name="signDateSearchBtn" value="검색">
                               </div>
                           
                                <div class="dataTable-top"></div>
                                <label>예매상태　</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                        <label class="form-check-label" for="inlineRadio1">전체</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                        <label class="form-check-label" for="inlineRadio2">예매완료</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                        <label class="form-check-label" for="inlineRadio2">예매취소</label>
                                    </div>
                                    <input type="button" name="showSatusSearchBtn" value="검색">
                                </div>
                            </div>
                            
                         <form id="hidFrm" name="hidFrm" action="rsrvtDetail.jsp" method="get">
                           
                         </form>   
                               
                           <form id="resultFrm" name="resultFrm" action="rsrvtDetail.jsp" method="post"> 
                   		  <input type="hidden" name="rsrvtId" id="rsrvtId">
		 				   
                                <table id="datatablesSimple">
                               
                                    <thead>
                                        <tr>
                                            <th>예매코드</th>
                                            <th>이름</th>
                                            <th>아이디</th>
                                            <th>예매일자</th>
                                            <th>예매상태</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tfoot>                                         
                                        <tr>
                                            <th>예매코드</th>
                                            <th>이름</th>
                                            <th>아이디</th>
                                            <th>예매일자</th>
                                            <th>예매상태</th>
                                            <th>관리</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>

                                 <%
                                 for(AdminRsrvtInfoVO asVO :  voList ){
                                	 rsrvtid =asVO.getRsrvtId();
                                	 session.setAttribute("rId",  rsrvtid );
                                	 rsId = (String)session.getAttribute("rId");                                 	 
                                	 if(asVO.getRsrvtInputDate() != null) {
                     				   date = sdf.format(asVO.getRsrvtInputDate());                     					
                     				}//end if
                                   %>
                              			<tr>
                                            <td><%= rsrvtid %></td>
                                            <td><%=asVO.getUserName() %></td>
                                            <td><%=asVO.getUserId() %></td>
                                            <td><%= date %></td>
                                            <td><%=asVO.getRsrvtStatus() %></td>                                          
                                            <td><input type="button" value="상세보기" onClick="getHiddenVal('<%=rsId%>')"></td> 
                                        </tr>
                                       
                                        <% } %>                                 
                                    </tbody>                                    
                                </table>
                                 
                                  </form>
                            </div>
                            </main>
                        </div>
                    </div>

                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="dataTable-top"></div>
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
