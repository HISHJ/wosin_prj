<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.sist.vo.AdminShowVO"%>
<%@page import="kr.co.sist.dao.AdminScheduleDAO"%>
<%@page import="kr.co.sist.vo.AdminScheduleVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%
request.setCharacterEncoding("UTF-8");

String showId = request.getParameter("showId");

System.out.println( showId );

AdminScheduleVO sch = new AdminScheduleVO();
AdminScheduleDAO aschDAO= AdminScheduleDAO.getInstance();
AdminScheduleVO sel= aschDAO.selectShow(showId);
 
System.out.println( sel.toString());



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
    	
    	
    
    		 
    		  $(function() { 
    	   
    	      	$("#addBtn").click(function() {
    	      		
    	      		
    	      		var schDate=$("#schDate").val();
    	      		if(schDate==""){
    	      			alert("상영일정을 입력해주세요.");
    	      			return;
    	      		}//end if
    	      		
    	      		var startDate=$("#startDate").val();
    	      		var endDate=$("#endDate").val();
    	      		var schDate=$("#schDate").val();
						if(startDate > schDate){
							alert("해당 공연의 기간은 "+startDate+" ~ "+endDate+"입니다."+" 해당 공연기간 사이에 상영일정을 등록해주세요.");
							return;
						}//end if
						
					var startDate=$("#startDate").val();	
					var endDate=$("#endDate").val();
					var schDate=$("#schDate").val();
					if(endDate < schDate){
						alert("해당 공연의 기간은 "+startDate+" ~ "+endDate+"입니다."+" 해당 공연기간 사이에 상영일정을 등록해주세요.");
						return;
					}//end if
    	      	
    	      		alert("상영일정이 추가되었습니다.");
    	      			$("#frm").submit();
    	      		
    	      			
    	      			
    	      		
    	  		 });
    	    }); 
    		 
    	    	
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
    	                                    <form id="frm" name="frm" action="schedule_insert.jsp?showId=<%=showId %>" method="post">
    	                      				<input type="hidden" name="hid" id="hid" value=<%=sel.getShowId()%>>
    	                      				<input type="hidden" name="startDate" id="startDate" value=<%=sel.getStartDate()%>>
    	                      				<input type="hidden" name="endDate" id="endDate" value=<%=sel.getEndDate()%>>
    	                      				
    	                      				  
    	                                        <div class="dataTable-top"></div>
    	                                        <div class="row">
    	                                            <div class="col-6"><img src="img/<%=sel.getThImg() %>"class="img-thumbnail" alt="썸네일이미지"></div>
    	                                            <div><%=sel.getName() %></div>
    	                                        </div> 
    	                                        <div class="dataTable-top"></div>
    	                                        <div class="row">
    	                                            <div class="col-4"><b>상영일정</b></div> <div class="col-6"><input type="date" class="dataTable-input"  id="schDate" name="schDate" value="<%=sel.getSchDate()%>"></div>
    	                                        </div> 
    	                                        <div class="dataTable-top"></div>
    	                                        <div class="row">
    	                                            <div class="col-4"><b>시작시간</b></div> 
    	                                            <div class="col-6">
    	                                            
    	                                            <% 
    	                                           
    	                                        	String schTime = sel.getSchTime();
    	                                      /*   	String schTime1 = schTime.substring(0, 1);
    	                                        	String schTime2 = schTime.substring(0, 1); */
    	                                   			  String schTime1= sel.getSchTime();
    	                                        	String schTime2= sel.getSchTime();
    	                                            %>
    	                                            
    	                                            
    	                                                <select name="schTime1"  id="schTime1" class="dataTable-dropdown dataTable-selector" id="schTime">
    	                                                <%String[] runing_timeArr={"10","11","12","13","14","15","16","17","18","19","20","21","22"}; %>
    	                                                  <%for(int i=0; i<runing_timeArr.length; i++){ %>
    	                                                    <option <%=runing_timeArr[i].equals(schTime1)?" selected='selected'":"" %>><%=runing_timeArr[i] %></option>
    	                                                   <%} %>
    	                                          
    	                                                </select>
    	                                                <label> 시</label>
    	                                                <select name="schTime2" id="schTime2" class="dataTable-dropdown dataTable-selector" id="schTime">
    	                                                    <%String[] runing_timeArr2={"00","30"};%>
    	                                                    <%for(int i=0; i<runing_timeArr2.length; i++){ %>
    														 <option <%=runing_timeArr[i].equals(schTime2)?" selected='selected'":"" %>><%=runing_timeArr2[i] %></option>
    	     
    	                                                    <%} %>
    	                                                </select>
    	                                                <label> 분</label>
    	                                            </div>
    	                                        </div> 
    	                                        
    	                                        
    	                                            
    	                                                <div class="mt-4 mb-0">
    	                                                    <div class="col text-center">
    	                                                    
    	                                                    
    	                                                    <a class="btn btn-secondary btn-sm" id="addBtn" >추가</a>
    	                   <%--  <a href="schedule_insert.jsp?showId=<%=swId%>"><a class="btn btn-secondary btn-sm" onclick="addBtn()">추가</a></a> --%>
    	                                                        <a class="btn btn-default btn-sm" href="schedule_Add-1.jsp">닫기</a>
    	                                                        
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

