<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.vo.AdminShowVO"%>
<%@page import="kr.co.sist.dao.AdminShowDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="showAdd"%>
    
    
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
    	
    	//썸네일이미지 미리보기
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
		}
    	
    	//추가하기버튼
    	function addBtn() {
    		
    		//유효성 검증 
    		var name=$("#name").val();
			if(name.trim()==""){ //null 아니라 ""로 처리
				alert("공연명을 입력해주세요");
				$("#name").focus();	
				return;
			}
			
			var startDate=$("#startDate").val();
			if(startDate==""){
				alert("시작일을 입력해주세요");
				$("#startDate").focus();
				return;
			}
			
			var endDate=$("#").val();
			if(endDate==""){
				alert("종료일을 입력해주세요");
				$("#endDate").focus();
				return;
			}
			
			if(startDate!=null||endDate!=null){//이거 방법 찾기 > 이거는 안됨
				var startDate = new Date(startDate);
				var endDate = new Date(endDate);
				if(startDate>endDate){
					alert("종료일은 시작일보다 클 수 없습니다");
					$("#endDate").focus();
					return;
				}
					
			}
			
			var price=$("#price").val();
			if(price.trim()==""){
				alert("금액을 입력해주세요");
				$("#price").focus();	
				return;
			}
			
			
			//파일은 focus 안됨
			var thImg=$("#thImg").val();
			var mImg=$("#mImg").val();
			var infoImg=$("#infoImg").val();
			
			if(thImg==""||mImg==""||infoImg==""){
				alert("업로드할 파일을 선택해주세요");
				return;
			}
			
			
			//이미지 파일 확장자 제한
			var blockExt="jpg,jpeg,png,bmp,do".split(",");
			var flag=false;
			
			var thImgExt=thImg.substring(thImg.lastIndexOf(".")+1);
			var mImgExt=mImg.substring(mImg.lastIndexOf(".")+1);
			var infoImgExt=infoImg.substring(infoImg.lastIndexOf(".")+1);
			for(var i=0; i<blockExt.length; i++){
				if(blockExt[i]==thImgExt && blockExt[i]==mImgExt && blockExt[i]==infoImgExt ){
					flag=true;
				}
			}
			
			if(!flag){
				alert("※파일 형식을 다시 확인해주세요");
				return flag;
			}
			
			if(confirm("공연을 추가하시겠습니까?")){
				$("#frm").submit();
			}
				
			
			
			
		}//addBtn
		
    	
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
                                            <div class="col-4"><img id="thImgPreview" class="img-thumbnail" alt="썸네일이미지"></div>
                                        </div>  
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>공연명</b></div> <div class="col-6"><input id="name" name="name" type="text" class="dataTable-input" value="제발돼라" placeholder="공연명을 입력해주세요"></div>
                                           
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
                                            <div class="col-2"><b>시작일</b></div> <div class="col-4"><input type="date" class="dataTable-input"  name="startDate" id="startDate"></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>종료일</b></div> <div class="col-4"><input type="date" class="dataTable-input"  name="endDate" id="endDate"></div>
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
                                            <div class="col-2"><b>금액</b></div> <div class="col-6"><input type="text" name="price" id="price" class="dataTable-input" placeholder="숫자만 입력해주세요(한글,특수문자 제외)"></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>공연상태</b></div> 
                                            <div class="col-4">
                                                <select name="status" class="dataTable-dropdown dataTable-selector"  >
                                                    <option value="공연예정" >공연예정</option>
                                                </select>
                                                </div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>썸네일이미지</b></div> <div class="col-4">
                                            	<input type="file" name="thImg" id="thImg" onchange="thImgSet(this);" value="파일선택"></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>메인이미지</b></div> <div class="col-4">
                                            	<input type="file" name="mImg" id="mImg" value="파일선택"></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>소개이미지</b></div><div class="col-4">
                                                <input type="file" name="infoImg" id="infoImg" value="파일선택">
                                            </div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"></div><div class="col-8">※jpg,jpeg,png,bmp,do 파일만 등록할 수 있습니다</div>
                                        </div>
                                    </form>
                                    
                                        
                                             <div class="mt-4 mb-0">
                                                 <div class="col text-center">
                                                     <a class="btn btn-secondary btn-sm" onclick="addBtn()" >추가</a>
                                                     <a class="btn btn-default btn-sm" href="showBoard.jsp">취소</a>
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
