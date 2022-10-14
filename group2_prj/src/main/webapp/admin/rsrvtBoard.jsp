<%@page import="kr.co.sist.dao.AdminRsrvtDAO"%>
<%@page import="kr.co.sist.vo.AdminRsrvtInfoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="scriptlet의 사용" %>
<!DOCTYPE html>
<html lang="en">
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


    </head>
<body class="sb-nav-fixed">
<%
 //로그인되어있지 않은 경우 로그인페이지로 이동
if( session.getAttribute("adminId") == null){
   response.sendRedirect("admingLogin.jsp");
}
%>
<%
//날짜가져오기
String firstDate = request.getParameter("firstDate");
String endDate = request.getParameter("endDate");
//상태 가져오기
String status = request.getParameter("status");


//기본예매내역조회
AdminRsrvtInfoVO asRVO = new AdminRsrvtInfoVO();
asRVO.setFindStartDate(firstDate);
asRVO.setFindEndDate(endDate);
asRVO.setRsrvtStatus(status);
AdminRsrvtDAO aDAO = AdminRsrvtDAO.getInstance();
List<AdminRsrvtInfoVO> voList = aDAO.selectRsrvt(asRVO);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String date = null;  
String rsrvtid = ""; //vo 예매번호 담을 변수
String rsId=""; //세션담을변수

//예매 검색 조회

%>
<script type="text/javascript">
$(function(){
	$("#signDateSearchBtn").click(function(){
		$("#rsrvtDate").submit();
	})//end get date parameter
	
	$("#showSatusSearchBtn").click(function(){
		$("#rsrvtStatus").submit();
	})//end get status parameter
})//ready
 
 function getHiddenVal(rid){
    $("#rsrvtId").val(rid);
	$("#resultFrm").submit(); 
 }//getHiddenVal(rid)(상세내역을 위한)
</script>

 <!-- 여기서부터 <nav>-->
<jsp:include page="admin_common_header.jsp"/>      
<!-- -여기까지 <div id="layoutSidenav_content"> 전  -->


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
                               <form id="rsrvtDate" name="rsrvtDate" method="get">
                               <div>
                                <label>예매일자　</label>
                                   <input type="date" name="firstDate" id="firstDate"  class="dataTable-selector">
                                   <label> ~ </label>
                                   <input type="date" name="endDate" id="endDate" class="dataTable-selector">
                                   <input type="button" id="signDateSearchBtn" name="signDateSearchBtn" value="검색">
                               </div>
                           	  </form>
                           
                                <div class="dataTable-top"></div>
                               <form id="rsrvtStatus" name="rsrvtStatus"  method="get"> 
                                <label>예매상태　</label>
                                     <div class="form-check form-check-inline">
                                        <!--다시 전체보기로 돌아가고 싶다면 name을 없애서 parameter전송과 무관하게 만들면 되지 않을까: 맞다!  -->
                                        <input class="form-check-input" type="radio" id="inlineRadio1" value="">
                                        <label class="form-check-label" for="inlineRadio1">전체</label>
                                    </div> 
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="status" id="inlineRadio2" value="예매완료">
                                        <label class="form-check-label" for="inlineRadio2">예매완료</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="status" id="inlineRadio2" value="예매취소">
                                        <label class="form-check-label" for="inlineRadio2">예매취소</label>
                                    </div>
                                    <input type="button" id="showSatusSearchBtn" name="showSatusSearchBtn" value="검색">
                           	 </form>
                                </div>
                            </div>
                        
                               
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
<!-- 여기서부터<footer -->
              <jsp:include page="admin_common_footer.jsp"/>
<!-- 요기까지</html> -->
