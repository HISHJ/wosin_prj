
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="javax.websocket.Session"%>
<%@page import="kr.co.sist.vo.AdminMemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.dao.AdminMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    
    
    
<jsp:useBean id="admVO" class="kr.co.sist.vo.AdminMemberVO" scope="session"/>
<%
  request.setCharacterEncoding("UTF-8");

  String id=request.getParameter("memberId");
  String mailchk=request.getParameter("mailChk");
  String smschk=request.getParameter("smsChk");
  String status=request.getParameter("status");
  String memberId=null;
//key가져오기
ServletContext sc = getServletContext();
String key = sc.getInitParameter("keyU");  

//키 생성
//복호화 : 암호화된 문자열을 원본문자열로 변경 
DataEncrypt de= new DataEncrypt(key);
DataDecrypt dd= new DataDecrypt(key);

//아이디 암호화



AdminMemberDAO admDAO = AdminMemberDAO.getInstance();
List<AdminMemberVO> Mlist =null;


 if(id!=null){
 Mlist =admDAO.selectMember(de.encryption(id),mailchk,smschk,status);  
}else{
Mlist =admDAO.selectMember(id,mailchk,smschk,status);   
} 
  
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
	    	function HiddenVal(Id){
	    		$("#memberId").val(Id);
	    		$("#userFrm").submit();
	    	}
	    	
			
	
	</script>
    </head>
    <body class="sb-nav-fixed">
    
     <!-- 여기서부터 <nav>-->
<jsp:include page="admin_common_header.jsp"/>      
<!-- -여기까지 <div id="layoutSidenav_content"> 전  -->
 
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
                        	<form id="userFrm" name="userFrm" action="useDetail.jsp" method="post">
                               <input type="hidden" name="memberId" id="memberId">
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
                                     <%for(AdminMemberVO admVO1 : Mlist){
                                     	memberId=admVO1.getMemberId();
                                     	session.setAttribute("Id",memberId);
                                     	String memberid=(String)session.getAttribute("Id");
                                     %>
                                        <tr>
                                            <td><%=admVO1.getName()%></td>
                                            <td><%=dd.decryption(admVO1.getMemberId())%></td>
                                            <td><%=admVO1.getMdate()%></td>
                                            <td><%=admVO1.getMailChk()%></td>
                                            <td><%=admVO1.getSmsChk()%></td>
                                            <td><%=admVO1.getStatus()%></td>
                                            <td><input type="button" value="상세보기" onclick="HiddenVal('<%=memberid%>')"></td>
                                        </tr>
                                   <%}%>
                                    </tbody>
                                </table>
                              </form>
                            </div>
                        </div>
                    </div>
                </main>
                <!--  -->
                <jsp:include page="admin_common_footer.jsp"/>
                
             