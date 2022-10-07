<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.vo.AdminShowVO"%>
<%@page import="kr.co.sist.dao.AdminShowDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="showAdd"%>
    
<!-- alert만 뜨고 추가 안됨; DAO다시보기... -->
    
<%
request.setCharacterEncoding("UTF-8");
AdminShowDAO asDAO=AdminShowDAO.getInstance();
AdminShowVO asVO= new AdminShowVO(); 
%>


    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>공연관리-공연추가</title>
        <link href="css/styles.css" rel="stylesheet" />
        <style type="text/css">
        body{background-color : #fff;}
        </style>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!--제이쿼리-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    	<script type="text/javascript">
    	
    	
    	//if로 입력안된 값들 처리하기
    	function addBtn() {
			$("#frm").submit();
			//location.href="show_insert.jsp";
		}//aadBtn
    	
    	</script>
    
    </head>
    <body>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <!-- col lg 5 - 크기 조정 -->
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header navy bg-dark"><h3 class="text-start text-white font-weight-light my-4 " style="font-weight: bold;">공연추가</h3></div>
                                    <div class="card-body">
                                       
                                       <!-- 추가안되면 close form위치 바꾸기  -->
                                     <form id="frm" name="frm" action="show_insert.jsp">
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-4"><img src="E:\dev\workspace\html_prj\src\main\webapp\2ndProject\poster\rj.jpeg" class="img-thumbnail" alt="썸네일이미지"></div>
                                        </div>  
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>공연명</b></div> <div class="col-6"><input name="showId" type="text" class="dataTable-input" value="제발돼라" placeholder="공연명을 입력해주세요"></div>
                                           
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>장르</b></div> 
                                            <div class="col-4">
                                                <select name="genreId" class="dataTable-dropdown dataTable-selector">
                                                  <%String[] genreArr={"G1","G2","G3","G4","G5","G6"}; %>
												  <%for(int i=0; i<genreArr.length; i++){ %>
												  <option><%=genreArr[i] %></option>
												  <%} %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>시작일</b></div> <div class="col-4"><input type="date" class="dataTable-input"  name="startDate"></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>종료일</b></div> <div class="col-4"><input type="date" class="dataTable-input"  name="endDate"></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>관람시간</b></div> 
                                            <div class="col-4">
                                                <select name="runningTime" class="dataTable-dropdown dataTable-selector">
                                                    <%String[] runningtimeArr={"60분","70분","80분","90분","100분","110분","120분","130분","140분","150분","160분","170분","180분"}; %>
												  <%for(int i=0; i<runningtimeArr.length; i++){ %>
												  <option><%=runningtimeArr[i] %></option>
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
												  <option><%=ratingArr[i] %></option>
												  <%} %>
                                                </select>
                                            </div>


                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>금액</b></div> <div class="col-6"><input type="text" name="price" class="dataTable-input" placeholder="숫자만 입력해주세요(한글,특수문자 제외)"></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>썸네일이미지</b></div> <div class="col-4"><input type="file" name="thImg" value="파일선택"></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>메인이미지</b></div> <div class="col-4"><input type="file" name="mImg" value="파일선택"></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>작품소개</b></div> 
                                            <div class="col-4">
                                                <input type="file" name="infoImg" value="파일선택">
                                            </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>공연상태</b></div> 
                                            <div class="col-4">
                                                <select name="status" class="dataTable-dropdown dataTable-selector" disabled="disabled">
                                                    <option value="70">공연예정</option>
                                                    <option value="90">공연중</option>
                                                    <option value="90">공연취소</option>
                                                    <option value="100">공연종료</option>
                                                    </select>
                                                </div>
                                        </div>
                                        </div>
                                        
                                        
                                        
                                            
                                            
                                                <div class="mt-4 mb-0">
                                                    <div class="col text-center">
                                                        <a onclick="addBtn()" class="btn btn-secondary btn-sm">추가</a>
                                                        <a class="btn btn-default btn-sm" href="showBoard.jsp">취소</a>
                                                    </div>
                                                </div>
                                          </form>  
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
