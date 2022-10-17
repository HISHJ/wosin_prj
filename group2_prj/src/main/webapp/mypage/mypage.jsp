<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.Calendar"%>
<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//세션 넘겨받기 검증 완료
String memberId = (String)session.getAttribute("memberId");
//System.out.println("여기여기"+memberId);
%>
<%
if(memberId == null){
	response.sendRedirect("http://localhost/group2_prj/main/index.jsp");
}
%>


<!DOCTYPE HTML>

<html>
	<head>
		<title>회원정보 수정</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="apple-touch-icon" sizes="180x180" href="http://localhost/group2_prj/static/commons/img/favicon_180.png">
        <link rel="icon" type="image/png" sizes="32x32" href="http://localhost/group2_prj/static/commons/img/favicon_32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="http://localhost/group2_prj/static/commons/img/favicon_16.png">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/main.css" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\reset.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\subheader.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\headerFooter.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\login.css">
	
	    <link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static/portal/css/layout_new.css">
	    <link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static/portal/css/sub_new.css">
        <link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static/portal/css/style.css">
   


		<!-- 부트스트랩 -->
		<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<!--제이쿼리-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<!-- 우편번호API -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<!-- Scripts -->
			<script src="http://localhost/group2_prj/assets/js/jquery.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/jquery.dropotron.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/browser.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/breakpoints.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/util.js"></script>
			<script src="http://localhost/group2_prj/assets/js/main.js"></script>
		
		
<%-- <%  //로그인되어있지 않은 경우 로그인페이지로 이동
if( session.getAttribute("memberId") == null){%>
    <script type="text/javascript">
    $(function(){
	 alert("인증이 필요한 페이지입니다. 로그인페이지로 이동합니다.");
	 location.href="http://localhost/group2_prj/login/login.jsp";
    });//ready
	 </script>
<% 	
} 
%> --%>
		
		
	
	<%if(memberId == null){%>
	<style>
	#nav {
	margin-right: 130px;
	}
	</style>
	<%} %>
	<style>	
		
	<style>
        section#header{
 		 /* background-image:  url("../../images/subvisual-200001.jpg"); */
  	background: url("http://localhost/group2_prj/images/subvisual-common.jpg") no-repeat ; 
  	background-size: 100%; 
  	background-attachment: fixed;
  
	}

 	.member_join .add .a2 > span:first-child{float: left; width: 57.5%}
	.member_join .add .a2 .r{width:37.5%} 
	.member_join input[type="text"]:read-only{border:1px solid #000; padding: 0}
	</style>
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">
		
			<c:import  url="http://localhost/group2_prj/common/user_subpage_header.jsp" > 
    		<c:param name="memberId" value="<%= memberId %>"></c:param> 
    	   </c:import>
			

						<!--❤️여기에 서브제목 입력하세욮 ex) 공연일정-->
						<div id="sut-t_wrap">
						<h2 id="sub-t">
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">회원정보 수정</strong>
						</h2>
					</div>
					</section>

						<!--------------------------------------위까지가 헤더----------------------------------------->

				
				</section>

					<!-- 로그인 영역 -->
					<div id="depth_w">
						<div class="inner">
							<ul class="clrearfox dot dep1 li2">
								<li class="home">
									<span>
										<span>HOME</span>
									</span>
								</li>
								<li>
									<div class="rel">
										<a href="memberMng.html">
											<span>마이페이지</span>
										</a>
										<!-- display:none -->
										<ul class="depth" >
											<li>
												<a href="memberMng.html">
													<span>마이페이지</span>
												</a>
											</li>
											<li>
												<a href="page1.html">공연정보</a>
											</li>
											<li>
												<a href="subpage-ticketmethod.html">예매정보</a>
											</li>
											<li>
												<a href="page9.html">고객센터</a>
											</li>
											<li>
												<a href="subpage-way.html">오시는길</a>
											</li>
										</ul>
									</div>
								</li>
								<li>
									<li>
									<div class="rel">
									<a href="http://localhost/group2_prj/mypage/mypage.jsp" ><span>회원정보 수정</span></a>
									<ul class="depth">
									<li><a href="http://localhost/group2_prj/mypage/memberMng.jsp" ><span>개인화서비스</span></a></li>
									<li><a href="http://localhost/group2_prj/mypage/passModify.jsp" ><span>비밀번호변경</span></a></li>
									<li><a href="http://localhost/group2_prj/mypage/mypage.jsp" ><span>회원정보 수정</span></a></li>
									<li><a href="http://localhost/group2_prj/reservation/ticket_page.jsp" ><span>예매내역 확인·취소</span></a></li>
									</ul>
									</div>
									</li>
								
								</li>
							</ul>
						</div>
						
						</div>


				<script>
					$(window).resize(function(){
						if ( $(window).width() > 1024 ){
							$("#depth_w .rel").hover(function(){
								$(this).closest("#depth_w").addClass("on")
								$(this).find(".depth").show();
							},function(){
								$(this).closest("#depth_w").removeClass("on")
								$(this).find(".depth").hide();
							})
							$("#depth_w .rel > a").focus(function(){
								$(this).closest("#depth_w").addClass("on")
								$(this).next(".depth").show();
							})
							$("#depth_w .depth > li:last-child a").focusout(function(){
								$(this).closest("#depth_w").removeClass("on")
								$("#depth_w .depth").stop(true,true).slideUp(150);
							})
						}else {
							$("#depth_w .rel").click(function(){
								$(this).closest("#depth_w").toggleClass("on")
								$(this).find(".depth").toggle();
							})
						}
					}).resize();
					</script>
				<div id="cont">
					<div id="sub_page">
						<div class="inner">
							
						</div>
				
						<script>
						var loc = $("#depth_w > div > ul > li").length - 1;
						$("#depth_w .dep1").addClass("li"+loc);
				
						var len = $(".tabs-st1 li").length;
						$(".tabs-st1").addClass("li"+len);
				</script>
			 	<!-- 유효성검사 -->
			<script>	
				/* 유효성검사 */
					$(function(){
						$("#btnModify").click(function(){
								check();
										});//click
										
							});//ready
				
			
					
				
					function check(){
						var name=$("#memberName").val();
						if(name.trim()==""){
							alert("이름을 입력해주세요.")
							$("#memberName").focus();
							return false;
						}//name
						
						/* 생년월일 생각하기*/
						
					
						
						
						var gender=$("#genderFlag").val();
						if(gender.trim()==""){
							alert("성별을 선택해주세요.");
							$("#genderFlag").focus();
							return false ;
						}//gender
						
						var addr2=$("#memberAddr2").val();
						if(addr2.trim()==""){
							alert("상세주소를 입력해주세요..");
							$("#memberAddr2").focus();
							return false ;
						}//addr2
						
						var email1=$("#memberEmail1").val();
						var email2=$("#memberEmail2").val();
						if(email1.trim()==""){
							alert("이메일을 입력해주세요.");
							$("#memberEmail1").focus();
							return false ;
						}//email
						
						
					
						
						if(email2.trim()==""){
							alert("도메인을 입력해주세요.");
							$("#memberEmail2").focus();
							return false ;
						}//email
							
						var phone=$("#phone").val();
						if(phone.trim()==""){
							alert("휴대폰 번호를 입력해주세요.");
							$("#phone").focus();
							return false ;
						}//phone
						

						var mailChk =$(':radio[name=mailChk]:checked' );
						if(mailChk.length<1){
							alert("메일수신여부를 체크해주세요.");
							return false;
							
						}//mailChk
						
						var smsChk =$(':radio[name=smsChk]:checked' );
						if(smsChk.length<1){
							alert("SMS수신여부를 체크해주세요.");
							return false;
							
						}//smsChk
						
					 	if(confirm("수정하시겠습니까?")){
					 		 $("#mypageboard").submit();  
						}//confirm 
						
					}//check				
					
	
				
							/* 우편번호시작 API */
							 function execDaumPostcode() {
							        new daum.Postcode({
							            oncomplete: function(data) {
							                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							
							                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							                var roadAddr = data.roadAddress; // 도로명 주소 변수
							                var extraRoadAddr = ''; // 참고 항목 변수
							
							                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
							                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							                    extraRoadAddr += data.bname;
							                }
							                // 건물명이 있고, 공동주택일 경우 추가한다.
							                if(data.buildingName !== '' && data.apartment === 'Y'){
							                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							                }
							                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							                if(extraRoadAddr !== ''){
							                    extraRoadAddr = ' (' + extraRoadAddr + ')';
							                }
							
							                // 우편번호와 주소 정보를 해당 필드에 넣는다.
							                document.getElementById("memberZipCd").value = data.zonecode;
							                document.getElementById("memberAddr1").value = roadAddr
							                //커서를 상세주소로 이동
							                document.getElementById("memberAddr2").focus();
							     
							
							            }
							        }).open();
							    }//execDaumPostcode() 
							    
							    /* 하이픈 추가 */
			
			/* 전화번호 하이픈추가  */
				function PhoneNumber(obj) {

				    var number = obj.value.replace(/[^0-9]/g, "");
				    var phone = "";
				    
			if(number.substr(0,2)==02){
				    if(number.length < 3) {
				        return number;
				    } else if(number.length < 6) {
				        phone += number.substr(0, 2);
				        phone += "-";
				        phone += number.substr(2);
				        
				    } else if(number.length < 10) {
				        phone += number.substr(0, 2);
				        phone += "-";
				        phone += number.substr(2, 3);
				        phone += "-";
				        phone += number.substr(5);
				        
				     
				    } else {
				        phone += number.substr(0, 2);
				        phone += "-";
				        phone += number.substr(2, 4);
				        phone += "-";
				        phone += number.substr(6,4);
				        
				        
				    }
			}else{
				if(number.length < 4) {
			        return number;
			    } else if(number.length < 7) {
			        phone += number.substr(0, 3);
			        phone += "-";
			        phone += number.substr(3);
			        
			
			        
			    } else if(number.length < 11) {
			        phone += number.substr(0, 3);
			        phone += "-";
			        phone += number.substr(3, 3);
			        phone += "-";
			        phone += number.substr(6);
			        
			       
			        
			    } else {
			        phone += number.substr(0, 3);
			        phone += "-";
			        phone += number.substr(3, 4);
			        phone += "-";
			        phone += number.substr(7);
			        
			      
			    }
				
			}//else
				    obj.value = phone;
					return false;
				}//PhoneNumber
		
				//이메일 select값 넘기기
				function EmailDomain(domain){
					$("#memberEmail2").val(domain);
					}		    

							    
			    
			</script>	 
				
				
						<div class="sub_page">
			
				
				
	<!-- 			<script src="/static/jslibrary/miya_validator.js"></script> -->
				<!-- JSP부분 -->
				<jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="session"/>
				<jsp:setProperty property="*" name="mbVO"/>
				<%
				request.setCharacterEncoding("UTF-8");
				
		
				//key가져오기
				  ServletContext sc = getServletContext();
				  String plainText = sc.getInitParameter("keyU"); 
				//복호화 : 암호화된 문자열을 원본문자열로 변경 
				 DataDecrypt dd= new DataDecrypt(DataEncrypt.messageDigest("MD5", plainText));
				
				MemberDAO mbrDAO = MemberDAO.getInstance();
				
				mbVO=mbrDAO.selectMember(mbVO.getMemberId()); %>
			
			
				
			<form name="board" id="mypageboard" method="post"  action="http://localhost/group2_prj/mypage/mypage_process.jsp">
				<input type="hidden" id="menuNo" name="menuNo" value="200168" />
				<article class="member_join inner mypage_inner">
					<div class="group">
						<h3 class="tit-st4 rel">기본정보입력 <span class="ab f16 color-purple">* 필수 입력 값</span></h3>
						<ul class="sect">
							<li class="item">
								<label for="name" class="t">이름 <span class="color-purple">*</span></label>
								<div class="cont">
									<div class="btn-member_w dib">
										<input type="text" value=<%=mbVO.getName()%> name="name" id="memberName"  />
										
									</div>
								</div>
							</li>
							<li class="item">
								<label for="id" class="t">ID <span class="color-purple">*</span></label>
								<div class="cont">
									<input type="text" value=<%=dd.decryption(mbVO.getMemberId())%> name="memberId" id="id" readonly />
								</div>
							</li>
							<%		
								Calendar cal=Calendar.getInstance();
									session.setAttribute("year", Calendar.getInstance().get(Calendar.YEAR));
									session.setAttribute("month", Calendar.getInstance().get(Calendar.MONTH+1));
									session.setAttribute("lastDay", Calendar.getInstance().getActualMaximum(Calendar.DATE));
									session.setAttribute("day", Calendar.getInstance().get(Calendar.DAY_OF_MONTH));
									
									/* 생일 년 월 일 3등분하기 */
									String birth = mbVO.getBirth();
									String birth1=birth.substring(0,birth.indexOf("-"));
									String birth2=birth.substring(birth.indexOf("-")+1,birth.lastIndexOf("-"));
									String birth3=birth.substring(birth.lastIndexOf("-")+1,birth.length());
								
									/* el사용하기위해서 넣기 */
									pageContext.setAttribute("bYear", birth1);
									pageContext.setAttribute("bMonth", birth2);
									pageContext.setAttribute("bDay", birth3);
									
									
									
									
							%>
							
							
							
							<li class="item">
								<label class="t">생년월일 <span class="color-purple">*</span></label>
								<!-- <strong class="t">생년월일  <span class="color-purple">*</span></strong> -->
								<div class="cont birth_cont">
									<div class="birth_w clearfix">
				
									 
										<ul class="clearfix birth">
											<li>
												<label for="birthdayYear" class="hide">연도 선택</label>
												<select name="birthdayYear" id="birthdayYear">
													 <c:forEach var="year" begin="1950" end="${year }" step="1">
 															<option value="${year}" ${ year eq bYear?" selected='selected'":"" } ><c:out value="${year}"/></option>
													</c:forEach>
												</select>
												<span>년</span>
											</li>
											<li>
												<label for="birthdayMonth" class="hide">월 선택</label>
												<select name="birthdayMonth" id="birthdayMonth" readonly>
													 <c:forEach var="month" begin="1" end="12" step="1">
														 <option value="${month}"${ month eq bMonth?" selected='selected'":"" }><c:out value="${month}"/></option>
															
													</c:forEach>
												</select>
												<span>월</span>
											</li>
											<li>
												<label for="birthdayDay" class="hide">일 선택</label>
												<select name="birthdayDay" id="birthdayDay">
													<c:forEach var="day" begin="1" end="${lastDay}" step="1">
														<option value="${day }" ${ day eq bDay?" selected='selected'":"" }><c:out value="${day}"/></option>
													</c:forEach>
												</select>
												<span>일</span>
											</li>
										</ul>
										<input type="hidden" name="birthDay" id="birthDay" value="19970103" />
										<input type="hidden" name="birthMonth" id="birthMonth" value="0103" />

									</div>
								</div>
							</li>
							<li class="item">
								<label for="genderFlag" class="t">성별 <span class="color-purple">*</span></label>
								<div class="cont">
									<select name="gender" id="genderFlag" class="small" >
										<option value="남자" 
										<%if(mbVO.getGender().equals("남자")){%>selected="selected"<%}%>>남자</option>
										<option value="여자" 
											<%if(mbVO.getGender().equals("여자")){%>selected="selected"<%}%> >여자</option>
									</select>
								</div>
							</li>
							<li class="item">
								<label class="t">주소 <span class="color-purple">*</span></label>
								<div class="cont">
									<ul class="add">
										<li class="clearfix a1">
											<div class="zipcode">
												<label for="memberZipCd" class="hide">우편번호</label>
												<input type="text" name="zipcode" id="memberZipCd" value="<%=mbVO.getZipcode() %>"  readonly /> <button id="addrBtn" type="button" class="bg-black"  onclick="execDaumPostcode()">우편번호 찾기</button>
												
											</div>
											<!-- <div class="select ck_com">
												<input type="radio" name="defaultContact" id="defaultContact1" value="P" checked="checked" /> <label for="defaultContact1">자택 </label>
												<input type="radio" name="defaultContact" id="defaultContact2" value="C"   /> <label for="defaultContact2">직장</label>
											</div> -->
										</li>
										<li class="clearfix a2"><!--login.css 수정 -->
											<span class="l">
												<label for="memberAddr1" class="hide">주소</label>
												<input type="text"  value="<%=mbVO.getAddr1()%>" name="addr1" id="memberAddr1"/>
											</span>
											<span class="r">
												<label for="memberAddr2" class="hide">나머지 주소</label>
												<input type="text" name="addr2" id="memberAddr2" value="<%=dd.decryption(mbVO.getAddr2())%>" class="long" />
											</span>
										</li>
									</ul>
								</div>
							</li>
							<li class="item">
								<% 
									String email=dd.decryption(mbVO.getEmail());
									 String email1=email.substring(0,email.indexOf("@"));
									 String email2=email.substring(email.indexOf("@")+1,email.length());
									 
									 
								%>
								
							
							
								<label class="t">이메일<span class="color-purple">*</span></label>
								<div class="cont">
									<ul class="email clearfix">
										<li class="e1"><label for="memberEmail1" class="hide">이메일 아이디</label><input type="text" name="email1" id="memberEmail1" value="<%=email1 %>" /></li>
										<li class="dash">@</li>
										<li class="e2"><label for="memberEmail2" class="hide">이메일 주소</label><input type="text" name="email2" id="memberEmail2" value="<%=email2 %>" class="long" /></li>
										<li class="e3"><label for="email3" class="hide">이메일 주소 선택</label>
										
										<%String emailData="naver.com,hanmail.net,gmail.com,yahoo.com,nate.com,hotmail.com,korea.com"; 
												pageContext.setAttribute("emailData", emailData);%>
										<select name="emailDomain" id="emailDomain"  onclick="EmailDomain(this.value);">
											<option value="">직접입력</option>
												 <c:forTokens var="data" items="${emailData}"  delims=" ,">
												<option value="${data}" >
												<c:out value="${data}"/>
												</option>
											</c:forTokens>
										</select>
										<input type="hidden" name="memberEmail" id="memberEmail" value="seb103@naver.com" />
										
										</li>
									</ul>
				
								</div>
							</li>
							<li class="item">
								<label class="t">휴대폰 <span class="color-purple">*</span></label>
								<div class="cont">
									<div class="tel_w">
									
				
									<ul class="clearfix tel">	
									<li>
										<label for="tel3" class="hide">휴대폰</label>
										<input type="text" value=<%=dd.decryption(mbVO.getPhone())%> onkeyup="PhoneNumber(this)" id="phone" name="phone" class="small"  maxlength="13" style="width:320px;"  />
									</li>
										
									</ul>
								
									</div>
									<input type="hidden" name="memberCel" id="memberCel" value="010-4807-1274" />
									<input type="hidden" name="memberCelOri" id="memberCelOri" value="010-4807-1274" />
									<input type="hidden" name="changeCel" id="changeCel" value="0" />
							
								</div>
							</li>
							

							<!--------------------------------------------------------------------------------------->

						<!------------------------------------------------------------------------------------------>
					</div>
				
					<div class="agree_w f18">
						<dl>
							<dt class="bul-dot b">우신문화회관에서 제공하는 정보를 메일로 받아보시겠습니까?</dt>
							<dd class="ck_com">
								<input type="radio" name="mailChk" id="emailFlag1" value="Y" 
								<%if(mbVO.getMailChk().equals("Y")){%>checked="checked"<%}%>/><label for="emailFlag1">예</label>
								<input type="radio" name="mailChk" id="emailFlag2" value="N"
								<%if(mbVO.getMailChk().equals("N")){%>checked="checked"<%}%> /> <label for="emailFlag2">아니오</label>
							</dd>
						</dl>
						<dl>
							<dt class="bul-dot b">우신문화회관에서 제공하는 정보를 SMS 서비스로 받아보시겠습니까? </dt>
							<dd class="ck_com">
								<input type="radio" name="smsChk" id="smsFlag1" value="Y" 
								<%if(mbVO.getSmsChk().equals("Y")){%>checked="checked"<%}%>
								 /> <label for="smsFlag1">예</label>
								<input type="radio" name="smsChk" id="smsFlag2" value="N" 
								<%if(mbVO.getMailChk().equals("N")){%>checked="checked"<%}%>
									 /> <label for="smsFlag2">아니오</label>
							</dd>
						</dl>
					</div>
				
					<div class="bbs-btn_w clearfix tac flr mt">
						<span class="fl">
						<a href="http://localhost/group2_prj/mypage/quitmember.jsp" alt="회원탈퇴">	
						<button type="button" class="bbs-btn-st2 bg-black_r" id="memberX">회원탈퇴</button>
					  </a>
						</span>
				
						<span class="fr">
						<button type="button" class="bbs-btn-st2 bg-purple3" id="btnModify">수정</button>
						<button type="button" class="bbs-btn-st2 bg-black_r"  id="btnCancel">취소</button>
						
					
						</span>
					</div>
				</article>
				</form>
				

					
				<form name="form_chk" method="post">
					<input type="hidden" name="m" value="checkplusSerivce">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
					<input type="hidden" name="EncodeData" value="AgAFRzY2OTkxiUeD2IqBlWxs7T6Hd/93lQkcpPK5ydWZzOh9NfhWsEGBS6kaH0geIGMa2q9CDDCTXGOxZ9e14WVJQFZLRNW3iHW2irARFS7GL+GDpZ7FIyBA2Yhtpuk9Ub+Pjmg+PeCztSSPCZr8k82c6WlpIuxrQDHOHMrxsCzVaQ4S8pXbQI60nwqYGcPnMqtx4EzDLUMfTAYuNaRQHU2CMtCaRtDaD1am4tl7uRbQ+222GbzMtHGFLkU9ZprWiYTWFUkO9zvJsfCljUH3UpAyDoDMdoVFq9s6tSzFAwQ/RDvGuywNH+Ao4iUQn50VuCsFie5lwbXSuNmU19mEb2B3TpRVIUFfTu+9aEhr/Xzx8lYY+1v6KBkPEHWvHYPlY9lQIogpwhCoIRA6nxqPi9uMaUBnGq+JDQxvRurU6mIHucMgxsTADPfJlxz0vxZpv6Itbxc95t8BiCIp9/ky8QxCWQD6TRPRnFEPlNLPMkgoSXvgfjQ3Hw==">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
				</form>
				<input type="hidden" id="memberNo" value="2220278572">
				<input type="hidden" id="userId" value="seb103">
				
			
						</div>
					</div>
				
				</div><!-- #cont -->

				<!----------------------------------------------여기서부터 끝까지 footer-------------------------------------------->

			
			<!-- Footer -->
			
			<c:import url="http://localhost/group2_prj/common/user_allPage_footer.jsp"/> 
			
			



	</body>
</html>