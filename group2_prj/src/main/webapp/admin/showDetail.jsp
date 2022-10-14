<%@page import="java.util.List"%>
<%@page import="kr.co.sist.dao.AdminShowDAO"%>
<%@page import="kr.co.sist.vo.AdminShowVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="showDetail.jsp"%>
 

 <!-- 문제야 -->
 <!-- 1.공연 종료일이 안받아와지는 애들이 몇 있음. 데이터는 있는데  -->
 <!-- 2. selected 하고싶은애들 scriptlet으로 해결 안되나?  >> 걍 쓰면됐었다 ...ㅎㅎ 해결완-->
    
<%
request.setCharacterEncoding("UTF-8");
String showId=request.getParameter("showId"); 
AdminShowVO asVO= new AdminShowVO(); //<<문제시 얘가 범인
AdminShowDAO asDAO=AdminShowDAO.getInstance();
AdminShowVO showDetail=asDAO.selectShowDetail(showId); 
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>공연관리-공연상세내역</title>
        <link href="css/styles.css" rel="stylesheet" />
        <style type="text/css">
        
        body{background-color : #fff;}
        
        </style>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!--제이쿼리-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script type="text/javascript">
       
       
		function thImgSet(input) {
			  if (input.files && input.files[0]) {
			    var reader = new FileReader();
			    reader.onload = function(e) {
			      document.getElementById('thImgPreview').src = e.target.result;
			    };
			    reader.readAsDataURL(input.files[0]);
			  } else {
			    document.getElementById('thImgPreview').src = "";
			  }
		}//썸네일이미지 미리보기 
		
		
        $(function() {
        	$("#removeBtn").click(function() {
        		var name=$("#name").val();
        		var delMsg=confirm("공연을 삭제하시겠습니까?");
        		
    			if(delMsg){
    				alert("'"+name+"'가 삭제되었습니다");
    				$("#deleteFrm").submit();	
    			}else{
    				return;
    			}
				
			});//삭제
        	
			
        	$("#modifyBtn").click(function() {
        		
        		var edit=confirm("공연을 수정하시겠습니까?");
        		if(edit){
        			$("#updateFrm").submit();
        		}else{
        			return;
        		} 
			});//변경
			
			
			$("#cancelBtn").click(function() {
				location.href="showBoard.jsp";
			});//취소
			
		});//ready
		
		
		
        
        
        </script>
        
    </head>
    <body>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <!-- col lg 5 - 크기 조정 -->
                            <div class="col-lg-8">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header navyv bg-dark"><h3 class="text-start text-white font-weight-light my-4 " style="font-weight: bold;">공연 상세정보</h3></div>
                                    <div class="card-body">
                                       
                                    <form id="updateFrm" action="show_update.jsp">
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-4"><img id="thImgPreview" class="img-thumbnail" alt="썸네일이미지" src="img/<%=showDetail.getThImg()%>"></div>
                                        </div> 
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>공연코드</b></div>
                                            <div class="col-3"><input type="text" id="showId" name="showId" class="dataTable-input" 
                                            value="<%=showDetail.getShowId() %>" readonly="readonly"></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>공연명</b></div> <div class="col-6"><input type="text" id="name" name="name" class="dataTable-input" value="<%=showDetail.getName() %>" placeholder="공연명을 입력해주세요"></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>장르</b></div> 
                                            <div class="col-4">
                                                <select name="genreId" class="dataTable-dropdown dataTable-selector" >
												 <%String[] genreArr={"G1","G2","G3","G4","G5","G6"}; %>
												  <%for(int i=0; i<genreArr.length; i++){ %>
												  <option<%=genreArr[i].equals(showDetail.getGenreId())?" selected='selected'":"" %>><%=genreArr[i] %></option>
												  <%} %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>시작일</b></div> <div class="col-4"><input type="date" class="dataTable-input"  name="startDate" value="<%=showDetail.getStartDate() %>"></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>종료일</b></div> <div class="col-4"><input type="date" class="dataTable-input"  name="endDate" value="<%=showDetail.getEndDate()%>"></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>관람시간</b></div> 
                                            <div class="col-4">
                                                <select name="runningTime" class="dataTable-dropdown dataTable-selector">
												  <%String[] runningtimeArr={"60분","70분","80분","90분","100분","110분","120분","130분","140분","150분","160분","170분","180분"}; %>
												  <%for(int i=0; i<runningtimeArr.length; i++){ %>
												  <option<%=runningtimeArr[i].equals(showDetail.getRunningTime())?" selected='selected'":"" %>><%=runningtimeArr[i] %></option>
												  <%} %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>관람등급</b></div> 
                                            <div class="col-4">
                                                <select name="ratingId" class="dataTable-dropdown dataTable-selector">
												  <%String[] ratingArr={"R0","R1","R2","R3"}; %>
												  <%for(int i=0; i<ratingArr.length; i++){ %>
												  <option<%=ratingArr[i].equals(showDetail.getRatingId())?" selected='selected'":"" %>><%=ratingArr[i] %></option>
												  <%} %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>금액</b></div> <div class="col-3"><input type="text" name="price" class="dataTable-input" value="<%=showDetail.getPrice()%>" placeholder="숫자만 입력해주세요"></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                           <div class="col-2"><b>공연상태</b></div> 
                                            <div class="col-4">
                                                <select name="status" class="dataTable-dropdown dataTable-selector">
                                                  <%String[] statusArr={"공연예정","공연중","공연취소","공연종료"}; %>
												  <%for(int i=0; i<statusArr.length; i++){ %>
												  <option<%=statusArr[i].equals(showDetail.getStatus())?" selected='selected'":"" %>><%=statusArr[i] %></option>
												  <%} %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>썸네일이미지</b></div> <div class="col-4"><input type="file" name="thImg" value="파일선택" ></div>
                                            <div class="col-2 my-1"><b>원본파일</b></div><div class="col-4 my-1"><%=showDetail.getThImg() %></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>메인이미지</b></div> <div class="col-4"><input type="file" name="mImg" value="파일선택"></div>
                                            <div class="col-2 my-1"><b>원본파일</b></div><div class="col-4 my-1"><%=showDetail.getmImg() %></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>소개이미지</b></div><div class="col-4"><input type="file" name="infoImg" value="파일선택"></div>
                                            <div class="col-2 my-1"><b>원본파일</b></div><div class="col-4 my-1"><%=showDetail.getInfoImg() %></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"></div><div class="col-8">※jpg,jpeg,png,bmp,do 파일만 등록할 수 있습니다</div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                        	<div class="col-2"><b>공연추가일</b></div> <div class="col-6"><%=showDetail.getInputDate() %></div>
                                        </div>
                                   	</form>  
                                   	
                                   	
                                   	<form id="deleteFrm" action="show_remove.jsp">
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>공연삭제</b></div> <div class="col-4">
                                            <input type="button" id="removeBtn" value="삭제하기"></div>
                                            <input type="hidden" id="showId" name="showId" value="<%=showDetail.getShowId() %>">
                                        </div>
                                     </form>
                                        
                                        
                                         <div class="mt-4 mb-0">
                                            <div class="col text-center">
                                                <input type="button" class="btn btn-secondary btn-sm" id="modifyBtn"  value="변경">
                                                <input type="button" class="btn btn-default btn-sm" id="cancelBtn"  value="취소">
                                            </div>
                                          </div>
                                       </div>

                                                
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
