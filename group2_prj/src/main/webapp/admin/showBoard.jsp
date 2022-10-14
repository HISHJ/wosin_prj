<%@page import="kr.co.sist.dao.AdminShowDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.vo.AdminShowVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>


<%-- <%
//selectShow(asVO)꺼
AdminShowVO asVO= new AdminShowVO();
AdminShowDAO asDAO=AdminShowDAO.getInstance(); //dao객체 선언
List<AdminShowVO> list=asDAO.selectShow(asVO); //select method 호출 
%> --%>

<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String genreId = request.getParameter("genreId");
String status = request.getParameter("status");
AdminShowDAO asDAO=AdminShowDAO.getInstance(); 
List<AdminShowVO> list=asDAO.selectShow(name,genreId,status);
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
    		
			//추가버튼 클릭
	    	$("#addBtn").click(function(){
				location.href = "showAdd.jsp"; //안가는데 ? 제이쿼리 js 안받아서 그랬던것
			});
    	
			//공연명 검색
	    	$("#nameSearchBtn").click(function() {
	    		$("#nameFrm").submit();
			});
			
	    	//장르 검색
	    	$("#genreSearchBtn").click(function() {
	    		$("#genreFrm").submit();
			});
			
	    	//상태 검색
	    	$("#statusSearchBtn").click(function() {
	    		$("#statusFrm").submit();
	    	});
	    	
	    	
	    	
	    	
   		});//ready
		   	

        </script>
      
        
    </head>
    <body class="sb-nav-fixed">
  <!-- 여기서부터 <nav>-->
<jsp:include page="admin_common_header.jsp"/>      
<!-- -여기까지 <div id="layoutSidenav_content"> 전  -->
            <div id="layoutSidenav_content">
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">공연관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">show mamgement board</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                공연 리스트
                            </div>
                            <div class="card-body">
                               
                               <!-- 뭐 추가하면 템플릿 양식을 깨트림;;; -->
                               <!-- 해결 </table> 바로 밑에 버튼 만들면 됨 -->
                           
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
								  <%String[] genreArr={"G1","G2","G3","G4","G5","G6"}; %>
								  <%for(int i=0; i<genreArr.length; i++){ %>
								  <option><%=genreArr[i] %></option>
								  <%} %>
								</select><input type="button" id="genreSearchBtn" name="genreSearchBtn" value="검색">
                               </div>
                              </form>
                           
                        	 <form name="statusFrm" id="statusFrm">
                                <div class="dataTable-top"></div>
                                <label>상태　　</label>
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
                           		</form>
                              <a href="http://localhost/group2_prj/admin/showBoard.jsp"><button id="addBtn" type="button" class="btn btn-outline-dark float-end mx-md-4" >전체보기</button></a>
                           	 </div>
                           </div>
                            
                       
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>공연코드</th>
                                            <th>공연명</th>
                                            <th>장르</th>
                                            <th>금액</th>
                                            <th>상태</th>
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
                                            <th>상태</th>
                                            <th>관리</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <%for(AdminShowVO asVO : list){ %>
                                        <tr>
                                            <td><%=asVO.getShowId() %></td>
                                            <td><%=asVO.getName() %></td>
                                            <td><%=asVO.getGenreId() %></td>
                                            <td><%=asVO.getPrice()%>원</td>
                                            <td><%=asVO.getStatus() %></td>
                                            <td><a href="http://localhost/group2_prj/admin/showDetail.jsp?showId=<%=asVO.getShowId() %>"><input type="button" value="상세보기" class="showDetailBtn"></a></td>
                                        </tr>
                                       <%} %>
                                    </tbody>
                                </table>
                            <div><a href="http://localhost/group2_prj/admin/showAdd.jsp"><button id="addBtn" type="button" class="btn btn-dark">공연추가</button></a></div>
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
