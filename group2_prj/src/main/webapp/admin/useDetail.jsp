<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="kr.co.sist.dao.AdminMemberDAO"%>
<%@page import="kr.co.sist.vo.AdminMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="회원관리 상세내역"%>
    


    
  <!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>회원관리-상세보기</title>
        <link href="css/styles.css" rel="stylesheet" />
        <style type="text/css">
        
        body{background-color : #fff;}
        
        </style>
        
               <!--제이쿼리-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
      <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
      <script type="text/javascript">
      $(function(){
    	 $("#btnClose").click(function(){
    		 	location.href="http://localhost/group2_prj/admin/useBoard.jsp";
    	 });//click
    	 
    	 $("#btnDelete").click(function(){
    		 	if(confirm("삭제하시겠습니까?")){
			 		 $("#userDetail").submit();  
				}//confirm 
				
    		 
    	 });//click
    	 
      });//ready
      
      
      </script>
      
    </head>
    <body>
     
    <jsp:useBean id="admVO" class="kr.co.sist.vo.AdminMemberVO" scope="page"/>
	<jsp:useBean id="aqmVO" class="kr.co.sist.vo.AdminQuitMemberVO" scope="page"/>

    <%
    
    String id=request.getParameter("memberId");
    		
    System.out.println(id);

    

  	AdminMemberDAO admDAO= AdminMemberDAO.getInstance();
 	admVO= admDAO.selectMemberDetail(id);
 	aqmVO = admDAO.selectReason(id);
	
 	
 

 //key가져오기
	  ServletContext sc = getServletContext();
	  String plainText = sc.getInitParameter("keyU"); 
	//복호화 : 암호화된 문자열을 원본문자열로 변경 
	DataDecrypt dd= new DataDecrypt(plainText);
 	String zipcode=admVO.getZipcode();
 	String addr1 = admVO.getAddr1();
 	String addr2= dd.decryption(admVO.getAddr2());
 	
 	String Addr = zipcode+" "+addr1+" "+addr2;
  
 	session.setAttribute("status", admVO.getStatus());
%>
	    
    <jsp:setProperty property="*" name="admVO"/> 
     
     
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
               <form name="userDetail" id="userDetail" method="post" action="http://localhost/group2_prj/admin/useDetail_process.jsp">
                    <div class="container">
                        <div class="row justify-content-center">
                            <!-- col lg 5 - 크기 조정 -->
                            <div class="col-lg-10">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header navy bg-dark "><h3 class="text-start text-white font-weight-light my-4" style="font-weight: bold;">회원정보 상세</h3></div>
                                    <div class="card-body">

                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>이름</b></div> <div class="col-4"><%=admVO.getName() %></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>아이디</b></div> <div class="col-4"><%=dd.decryption(admVO.getMemberId())%></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>이메일</b></div> <div class="col-4"><%=dd.decryption(admVO.getEmail())%></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>휴대전화</b></div> <div class="col-4"><%=dd.decryption(admVO.getPhone())%></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>주소</b></div> <div class="col-4"><%=Addr %></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>생년월일</b></div> <div class="col-4"><%=admVO.getBirth() %></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>성별</b></div> <div class="col-4"><%=admVO.getGender() %></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>상태</b></div> <div class="col-4"><%=admVO.getStatus() %></div>
                                            <%if(admVO.getStatus().equals("N")){ %> 
                                            <div class="col-2"><b>탈퇴이유</b></div> <div class="col-4"><%=aqmVO.getReason() %></div>
                                            <%} %>
                                        </div>												
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>이메일수신</b></div>
                                             <div class="col-4">
                                             <input type="radio" name="emailAgree" value="Y" 
                                             <%if(admVO.getMailChk().equals("Y")){%>checked="checked"<%}%>
                                              disabled> 예 
                                             <input type="radio" name="emailAgree" value="N"
                                             <%if(admVO.getMailChk().equals("N")){%>checked="checked"<%}%>
                                              disabled> 아니오
                                           </div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>SMS수신</b></div> 
                                            <div class="col-4">
                                            <input type="radio" name="smsAgree"  value="Y"
                                             <%if(admVO.getSmsChk().equals("Y")){%>checked="checked"<%}%>
                                            disabled> 예 
                                            <input type="radio" name="smsAgree"  value="N"
                                             <%if(admVO.getSmsChk().equals("N")){%>checked="checked"<%}%> 
                                           disabled> 아니오
                                            </div>
                                        </div>
                                        
                                      
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>회원삭제</b></div> <div class="col-4"><input type="button" name="userDeleteBtn" id="btnDelete" value="회원삭제"></div>
                                        </div>
								
                                        <!-- 삭제버튼 클릭시) 팝업창 만들기 힘드니까 ... alert처리하면 안될까  -->
                                        
                                        
                                        
                                            
                                            
                                                <div class="mt-4 mb-0">
                                                    <div class="col text-center">
                                                        <button type="button" class="btn btn-secondary btn-sm"  id ="btnClose">닫기</button>
                                                   
                                                </div>
                                            </div>
                                    
                                                
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                  </form> 
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
