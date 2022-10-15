

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="scriptlet의 사용" %>
<!DOCTYPE html>
<html>
  <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자-로그인</title>
        <link href="css/styles.css" rel="stylesheet" />
      <style type="text/css">
  	
  	body { background: navy !important; } /* Adding !important forces the browser to overwrite the default style applied by Bootstrap */
</style>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!--제이쿼리-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
   	
    </head>
    <body class="bg-dark">
    <%
//로그인되어있는 경우 메인페이지로 이동
if(session.getAttribute("adminId") != null){%>
	 <script type="text/javascript">
	 $(function(){
		 alert("이미 로그인되어있습니다. 메인페이지로 이동합니다.");
		 location.href="http://localhost/group2_prj/admin/dashBoard.jsp";
	 })
	 </script>
	
<%} %>
 
<script type="text/javascript">
$(function(){
	//아이디 키코드
	$('#adminId').keydown(function(evt){
		if(evt.which == 13){
		chkNull()
		};//end if
	});//keydown
	//비밀번호키코드
	$('#adminPassword').keydown(function(evt){
		if(evt.which ==13){
		chkNull()
		};//end if
		
	});//keydown
	//로그인버튼 클릭
	$('#lobinBtn').click(function(){
		chkNull()
	});//click
})//end ready

function chkNull(){
//아이디 입력값 얻기
let id=$("#adminId").val();
if(id.trim() == ""){
	alert("아이디를 입력해주세요.")
	$("#adminId").val(""); //초기화
	$("#adminId").focus(); //아이디 입력안하면 아이디 입력란으로 focus
	return false; //submit안함
}else{
	//아이디값 넣으면 비밀번호 입력칸으로 focus
	$("#adminPassword").focus(); 
}
//비밀번호 입력값 얻기
let pass = $("#lobinBtn").val();
if(pass.trim() == ""){
	alert("비밀번호를 입력해주세요.");
	$("#lobinBtn").val("");//초기화	
	return false; //submit안함
}//endif
//데이터 전송(일단 다 입력했으니 값 전송(값에 대한 유효성 검증은 다음jsp에서))
$("#adminLoginFrm").submit();
	
}

//null 유효성 검사 함수
</script>
  
        <div id="layoutAuthentication" >
            <div id="layoutAuthentication_content" >
                <main style="display:flex;justify-content: center;margin-top:10%;">
                    <div class="container" >
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <!-- <div class="card-header"></div> -->
                                    <div class="card-body">
                                     	<h1 class="text-center text-info fw-bold my-4 font_header " >C&nbsp;M&nbsp;S&nbsp;</h1>
                                    	<h6 class="text-center fw-bold my-4 ">관리자계정입니다.</h6>
                                        <form id="adminLoginFrm" name="adminLoginFrm" action="adminLogin_process.jsp" method="get">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="adminId" name="adminId" type="text" placeholder="name@example.com" autofocus="autofocus"/>
                                                <label for="inputEmail">ID</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="adminPassword" name="adminPassword" type="password" placeholder="Password" />
                                                <label for="inputPassword">Password</label>
                                            </div>
                                          
                                            
                                 

                                                <div class="d-grid">
                                                <input type="button" class="btn btn-secondary btn-block" id="lobinBtn" value="로그인" style="padding:13px 0px;font-size:18px;font-weight:bold;" >                  
                                                </div>
                                           
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3 text-white bg-footer" >
                                        <div class="big"> 아이디/비밀번호 분실 및 로그인 관련 문의는<br/>
                                         담당부서 전산정보실 담당자 홍길동 연락처 02-0000-0000<br/>
                                        이메일 admin@000.co.kr로 문의하시기 바랍니다.</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
