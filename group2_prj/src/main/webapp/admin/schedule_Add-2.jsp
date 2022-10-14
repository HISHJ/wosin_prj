<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="project.dao.AdminScheduleDAO"%>
<%@page import="project.vo.AdminScheduleVO"%>
<%@page import="project.vo.AdminShowVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%
request.setCharacterEncoding("UTF-8");

String showId = request.getParameter("showId");
String startDate=request.getParameter("startDate"); 
String endDate=request.getParameter("endDate");
String thimg=request.getParameter("thImg"); 

AdminScheduleVO aschVO =new AdminScheduleVO();
AdminScheduleDAO aschDAO= AdminScheduleDAO.getInstance();
/* AdminScheduleVO select = aschDAO.selectshow(showId); */

// aschVO = aschDAO.selectshow(shId); 

System.out.println( request.getParameter("showId") );
System.out.println( request.getParameter("startDate") );
System.out.println( request.getParameter("endDate") );
System.out.println( request.getParameter("thImg") );

%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>상영관리-상영일정추가(2/2)</title>
        <link href="css/styles.css" rel="stylesheet" />
        <style type="text/css">
        
        body{background-color : #fff;}
        
        </style>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!--제이쿼리-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    	<script type="text/javascript">
    	
    	
    	function addBtn() {
    		
    	
				alert("공연이 추가되었습니다"); 
				$("#frm").submit();	
			
		}//추가하기버튼
	
    	
    	</script>
        
    </head>
    <body>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <!-- col lg 5 - 크기 조정 -->
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header navy bg-dark"><h3 class="text-start text-white font-weight-light my-4 " style="font-weight: bold;">상영일정 추가</h3></div>
                                    <div class="card-body">
                                       <!-- **insert form 태그 위치**  -->
                                    <form id="frm" name="frm" action="2show_insert.jsp?showId=<%=aschVO.getShowId() %>" method="post">
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-6"><img src=<%=aschVO.getThImg() %>class="img-thumbnail" alt="썸네일이미지"></div>
                                        </div> 
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-4"><b>상영일정</b></div> <div class="col-6"><input type="date" class="dataTable-input"  id="schDate" name="schDate" value="<%=aschVO.getSchDate()%>"></div>
                                        </div> 
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-4"><b>시작시간</b></div> 
                                            <div class="col-6">
                                                <select name="schTime" class="dataTable-dropdown dataTable-selector" id="schTime">
                                                <%String[] runing_timeArr={"10","11","12","13","14","15","16","17","18","19","20","21","22"}; %>
                                                  <%for(int i=0; i<runing_timeArr.length; i++){ %>
                                                    <option <%=runing_timeArr[i].equals(aschVO.getSchTime())?" selected='selected'":"" %>><%=runing_timeArr[i] %></option>
                                                   <%} %>
                                          
                                                </select>
                                                <label> 시</label>
                                                <select name="schTime" class="dataTable-dropdown dataTable-selector" id="schTime">
                                                    <%String[] runing_timeArr2={"00","30"};%>
                                                    <%for(int i=0; i<runing_timeArr2.length; i++){ %>
													 <option <%=runing_timeArr[i].equals(aschVO.getSchTime())?" selected='selected'":"" %>><%=runing_timeArr2[i] %></option>
     
                                                    <%} %>
                                                </select>
                                                <label> 분</label>
                                            </div>
                                        </div> 
                                        
                                        
                                            
                                                <div class="mt-4 mb-0">
                                                    <div class="col text-center">
                                                        <a class="btn btn-secondary btn-sm" onclick="addBtn()">추가</a>
                                                        <a class="btn btn-default btn-sm" href="2showINGAdd-1.jsp">닫기</a>
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                    </form>  

                                                
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
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
    </body>
</html>