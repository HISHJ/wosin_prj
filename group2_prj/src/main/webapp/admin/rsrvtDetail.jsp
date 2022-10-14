<%@page import="kr.co.sist.vo.AdminRsrvtInfoVO"%>
<%@page import="kr.co.sist.dao.AdminRsrvtDAO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="예매관리 상세내역" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>예매관리-예매상세내역</title>
        <link href="http://localhost/group2_prj/admin/css/styles.css" rel="stylesheet" />
        <style type="text/css">
        
        body{background-color : #fff;}
        
        .readonly{

		color: #d9d9d9; 

		}
        
        </style>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<!--JQuery Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<%
String rsrvtId = request.getParameter("rsrvtId");
System.out.println(rsrvtId);

AdminRsrvtDAO aDAO = AdminRsrvtDAO.getInstance();
AdminRsrvtInfoVO voList = aDAO.selectRsrvtDetail(rsrvtId);
%>
   <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                           
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header navy bg-dark"><h3 class="text-start text-white font-weight-light my-4 " style="font-weight: bold;">예매 상세정보</h3></div>
                                    <div class="card-body">
                                       
                                 <!--  // <form method="post" id="r_detailBtn" name="r_detailBtn">" -->
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-3"><b>예매번호</b></div>
                                             <div class="col-6"><%= voList.getRsrvtId() %></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-3"><b>예매공연</b></div> 
                                            <div class="col-6"><%=voList.getShowName() %></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-3"><b>이름</b></div> 
                                            <div class="col-6"><%=voList.getUserName() %></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-3"><b>아이디</b></div> 
                                            <div class="col-6"><%=voList.getUserId() %></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-3"><b>예매인원</b></div> 
                                            <div class="col-6"><%=voList.getRsrvtCnt() %></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-3"><b>좌석번호</b></div>
                                             <div class="col-6"><%=voList.getSeatId() %></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-3"><b>예매일자</b></div> 
                                            <div class="col-6"><%= voList.getRsrvtInputDate() %></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-3"><b>휴대전화</b></div>
                                             <div class="col-6"><%= voList.getPhone() %></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-3"><b>이메일</b></div> 
                                            <div class="col-6"><%= voList.getEmail() %></div>
                                        </div>
                                        
                                        <div class="dataTable-top"></div>
                                      
                                       <div class="row">
                                            <div class="col-3"><b>처리현황</b></div> 
                                            <div class="col-4">
                                                <select id="status_sel" name="ge_type" class="dataTable-dropdown dataTable-selector" class="readonly"> 
                                                
                                                  <%
                                                  String[] statusArr = {"예매완료","예매취소"}; 
                                                  AdminRsrvtInfoVO arVO = new AdminRsrvtInfoVO();  
                                                  
                                                  for(int i=0;i<statusArr.length;i++){%>
                                                  <option value="<%=statusArr[i] %>"<%=(statusArr[i].equals(voList.getRsrvtStatus()))? " selected='selected'":""%> >
                                                       <%=statusArr[i] %>
                                                  </option ><%}%> 
                                                  
                                                </select>
                                            </div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-3"><b>총 예매금액</b></div> 
                                             <div class="col-6"><%= voList.getTotalPrice() %></div>
                                        </div>
                                     
                                        <div class="mt-4 mb-0">
                                            <div class="col text-center">
                                                <button class="btn btn-secondary btn-sm" id="change_btn">변경</button>
                                                <button class="btn btn-default btn-sm" id="can_btn" onclick="javascript:history.back();">취소</button>
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
        <script src="http://localhost/group2_prj/admin/js/scripts.js"></script>
    </body>
</html>
