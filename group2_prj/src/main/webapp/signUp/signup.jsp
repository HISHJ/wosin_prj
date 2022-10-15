<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!--
	Dopetrope by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>회원가입</title>
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
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\signup.css">
	
	 <link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static/portal/css/sub_new.css">
   <link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static/portal/css/style.css">
   <link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static/portal/css/layout_new.css">
	 <link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static/portal/css/bbs_new.css">
	 
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<!--제이쿼리-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<!-- 우편번호API -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
		<script>
		$(function(){
			$("input:checkbox[name='save_id']").prop("checked", true);
		});


		</script>
		<style>
			section#header{
      /* background-image:  url("../../images/subvisual-200001.jpg"); */
      background: url("http://localhost/group2_prj/images/subvisual-common.jpg") no-repeat ; 
      background-size: 100%; 
      background-attachment: fixed;

  
      }


			li.item_birth{
			
				display: flex;
				align-items:center;
			}



			input#password,
			input#repassword
			{
				border-radius: 5px !important;;
			}

			.member_join .item {
    	display: table !important;
    	width: 100%;
    	padding: 1em;
    	border-bottom: 1px solid #000;
    	min-height: 5.813em;
    }
    

		.t{
			/* s */
			padding:0px;
		}

	

		div.tel_cont {
    display: flex;
    flex-direction: row !important;
}

#nav{
	margin-right:120px;
}
input[type="date"]::-webkit-clear-button, input[type="date"]::-webkit-inner-spin-button { 
 display: none; 
} 

input[type="date"] { 
		display: table !important;
    	width: 100%;
    	padding: 1em;
    	border-bottom: 1px solid #000;
    	min-height: 3.75em;
    	border-radius: 5px ;
}
.member_join input[type="text"]:read-only{border:1px solid #000; padding: 0}
 	 .member_join .add .a2 > span:first-child{float: left; width: 57.5%}
	.member_join .add .a2 .r{width:37.5%} 

		</style>
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">

			<!-- Header -->
			<section id="header">
			
				<!-- Logo -->
					
				<!-- Nav -->
					<nav id="nav">
						<!-- left -->
						<ul id="header_left">
							<li class="current">
								<a href="page1.html">공연정보</a>
								<ul>
									<li><a href="page1.html">공연일정</a></li>
									<!-- <li><a href="calendar.html">일정조회</a></li> -->
									<!-- <li><a href="#">예매</a></li> -->
									<li><a href="page2.html">공연정보상세보기</a></li>
									<li><a href="page7.html">좌석배치도</a></li>
								</ul>
							</li>
							<li>
								<a href="">예매정보</a>
								<ul>
									<li><a href="subpage-ticketmethod.html">티켓구입방법</a></li>
									<li><a href="subpage-ticketreceive.html">티켓수령방법</a></li>
									<li><a href="subpage-ticketcancel.html">예매취소,변경안내</a></li>
									<li><a href="subpage-ticketprovision .html">예매약관</a></li>					
								</ul>
							</li>
							<li>
								<a href="page9.html">고객센터</a>
								<ul>
									<li><a href="page9.html">FAQ</a></li>
									<li><a href="#">관람예절</a></li>				
								</ul>
							</li>
							<li><a href="subpage-way.html">오시는 길</a></li>
							
							
						</ul>

						<ul id="header_center">
							<h1 id="logo">
								<a href="index.html">
								우신문화회관
								</a>
								</h1>	
							
						</ul>

						<!--right  -->
						<ul id="header_right">
							<li class="current"><a href="login.html">LOGIN</a></li>
							<li><a href="ticket.html">티켓</a></li>
							<li class="calender">
								<a href="calendar.html">
									<span class="material-symbols-outlined md_20">
										calendar_month
										</span>
							 </a>
							</li>
							<li class="search_icon"><a href="#">
								<span class="material-symbols-outlined md_20">
									search
									</span>
							</a></li>
						</ul>
					</nav>


						<!--❤️여기에 서브제목 입력하세욮 ex) 공연일정-->
						<div id="sut-t_wrap">
						<h2 id="sub-t">
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">회원가입</strong>
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
							<a href="#">
								<span>회원서비스</span>
							</a>
							<!-- display:none -->
							<ul class="depth" >
								<li>
									<a href="page1.html">공연정보</a>
								</li>
								<li>
									<a href="subpage-ticketmethod.html">예매정보</a>
								</li>
								<li>
									<a href="subpage-FAQ1.html">고객센터</a>
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
							<a href="signup.html"><span>회원가입</span></a>
							<ul class="depth">
							<li><a href="login.html" ><span>로그인</span></a></li>
							<li><a href="signup.html" ><span>회원가입</span></a></li>
							<li><a href="find_id.html" ><span>아이디 찾기</span></a></li>
							<li><a href="find_password.html" ><span>패스워드 찾기</span></a></li>
						
							</ul>
							</div>
						</li>
					
					</li>
				</ul>
			</div>

		</div>
			<!-- 로그인 영역끝 -->
				
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
				
						<div class="sub_page">
						
				
		
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
			
					<div class="sub_page">
					
			
			
			
			
			
			
			<script src="http://localhost/group2_prj/static/commons/js/validUtil.js"></script>
			
			
			
				
			
			
			
			<script src="http://localhost/group2_prj/static/jslibrary/miya_validator.js"></script>
		<script type="text/javascript">

			/* 회원가입 유효성 검사 */
			$(function(){
				$("#btnSignup").click(function(){
					$("#board").submit(); 
						/* check();  */
						
					
				});//click
				
				
				
				$("#repassword").focusout(function(){
					//비밀번호와 비밀번호 확인의 값이 같은지를 비교
					chkPass();
				});//pass
				
				//ID중복검사1
				$("#btnDup").click(function(){
					window.open("id_dup.jsp","id_dup","width=510,height=310");
				});
				
			
				
				
			});//ready
			
			function chkPass(){
				var pass1=$("#password").val();
				var pass2=$("#repassword").val();
				
				var flag=false;
				if(pass1 != pass2){
					flag=true;
					$("#passMsg").html("비밀번호와 비밀번호확인 일치하지 않습니다.");
					for(var i= 0 ; i < 5 ; i++){
						$("#passMsg").fadeIn(500).fadeOut(500);
					}//end for
	
					$("#password").focus();
				}//end if
				return flag;
			}//chkPass
			
			
			/*회원가입 유효성 검사  */
		 function check(){
				
				 frm=document.board;
				var name=$("#memberName").val();
				if(name.trim()==""){
					alert("이름을 입력해주세요.")
					$("#memberName").focus();
					return false;
				}//name
				
				var id=$("#memberId").val();	
				if(id.trim()==""){
					alert("아이디를 입력해주세요.");
					$("#memberId").focus();
					return false;
				}

		
				
				//아이디 특수문자 제외 영문,숫자 4~20자이내+중복검사 필수
				 if(!id.match('^[a-zA-Z0-9]{4,20}$')) {
						 alert('아이디는 특수문자를 제외한 영문, 숫자 조합 4~20자로 사용 가능합니다.');
						$('#memberId').focus();
						 return false;
					 }//idcheck
				
				var pass=$("#password").val();
				var pass2=$("#repassword").val();
				
				if(pass.trim()==""){
					alert("비밀번호를 입력해주세요.");
					$("#password").focus();
					return false;
				}
				 var num = pass.search(/[0-9]/);
				 var eng = pass.search(/[a-zA-Z]/);
				 var spe= pass.search(/[~!@#$%^&*()_+|<>?:{}]/); 
					//비밀번호 유효성 검사 :영문, 숫자, 특수문자 중 2종류 이상 8~12자 이내
					if(pass.length < 7 || pass.length >12){
							  alert("8자리 ~ 21자리 이내로 입력해주세요.");
							  $("#password").focus();
							  return false;
						}else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
							  alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
							  $("#password").focus();
							  return false;
						}
				 
				 if(pass2!=pass){
					 alert("비밀번호를 다시 확인해주세요.")
					$("#repassword").focus();
					 return false;
				 }
				 
				if(pass2.trim()==""){
					alert("비밀번호를 한번 더 확인해주세요.")
					$("#repassword").focus();
					
					return false;
				}//pass2
			
				
			var birth=$("#datepicker").val();	
				if(birth.trim()==""){
					alert("생년월일을 입력해주세요.");
					$("#datepicker").focus();
					return false ;
				}//
				
			var gender=$("#genderFlag").val();
			if(gender.trim()==""){
				alert("성별을 입력해주세요.");
				$("#genderFlag").focus();
				return false ;
			}//gender
			

			var addr2=$("#memberAddr2").val();
			if(addr2.trim()==""){
				alert("주소를 입력해주세요..");
				$("#memberAddr2").focus();
				return false ;
			}//addr2
			
			var email=$("#memberEmail").val();
			if(email.trim()==""){
				alert("이메일을 입력해주세요.");
				$("#memberEmail").focus();
				return false ;
			}//email
				
			var phone=$("#phone").val();
			if(phone.trim()==""){
				alert("휴대폰 번호를 입력해주세요.");
				$("#phone").focus();
				return false ;
			}//phone
			
			var hPhone=$("#hPhone").val();
			if(hPhone.trim()==""){
				alert("전화번호를 입력해주세요.");
				$("#hPhone").focus();
				return false ;
			}//hPhone
			
		
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
			if(confirm("등록하시겠습니까?")){
				$("#board").submit();
				
			}//confirm
				
			}//check
			
			
			/* 아이디 중복검사 */
		/* 		function idCheck(memberId){
					frm=document.board;
				if(memberId==""){
					alert("아이디를 입력해주세요.");
					$("#memberId").focus();
					
					return false;
				}
				
				url="http://localhost/group2_prj/signUp/idCheck.jsp?memberId="+memberId;
				window.open(url,"http://localhost/group2_prj/signUp/idCheck.jsp", "width=300, height=150")
				$("#chkmemberIdYN").val("Y");
				
			}//idCheck */
			
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
			    
			/* 휴대전화 하이폰 추가  */  
			function PhoneNumber(obj) {

				    var number = obj.value.replace(/[^0-9]/g, "");
				    var phone = "";
			
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
				    obj.value = phone;
				    return false;
				}//PhoneNumber
		
			/* 전화번호 하이픈추가  */
				function hPhoneNumber(obj) {

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

			
			
			<!-- action="http://localhost/jsp_prj/design%20final%20intergration/signup_process.jsp" -->
			<form name="board" id="board" method="post" action="http://localhost/group2_prj/signUp/signup_process.jsp" >
			<!-- {(joinExtCode,K)(joinExtID,1234528163)(joinExtEmail,hojin0703@nate.com)(joinExtName,김호진)(joinExtBirthDay,)(joinExtGender,)} -->
					<input type="hidden" id="menuNo" name="menuNo" value="200144" />
					<input type="hidden" name="extId" id="extId" value="" />
					<input type="hidden" name="extCode" id="extCode" value="" />
			
					<input type="hidden" id="stipulationType" name="stipulation_type" value="" />
					<input type="hidden" id="effectiveDate" name="effective_date" value="" />
			
					<input type="hidden" id="parentName" name="parentName" value="" />
					<input type="hidden" id="parentDupinfo" name="parentDupinfo" value="" />
					<input type="hidden" id="parentBirthday" name="parentBirthday" value="" />
					<input type="hidden" id="parentAuthGubun" name="parentAuthGubun" value="" />
			
					<input type="hidden" id="joinType" name="joinType" value="" />
			
					<input type="hidden" name="regIdCheckFl" value="N" />
					<input type="hidden" name="joinTypeCode" value="0001" />
					<input type="hidden" name="receiveSms" value="" />
					<input type="hidden" name="receivmemberEmail" value="" />
			
					<input type="hidden" name="regNoDate" id="regNoDate" value="" />
					<input type="hidden" name="dupinfo" id="dupinfo" value="" />
					<input type="hidden" name="siteType" id="siteType" value="" />
					
			<article class="member_join inner member_com">
				<div class="group">
					<h3 class="tit-st4 rel">기본정보입력 <span class="ab f16 color-purple">* 필수 입력 값</span></h3>
					<ul class="sect">
						<li class="item">
							<label for="memberName" class="t">이름 <span class="color-purple">*</span></label>
							<div class="cont">
								<input type="text" name="name" id="memberName" value="" />
								<span class="txt ml">예매 등 서비스의 원활한 이용을 위해서 반드시 본명을 입력해주시기 바랍니다.</span>
							</div>
						</li>
						<li class="item">
							<label for="memberId" class="t">ID <span class="color-purple">*</span></label>
							<div class="cont ck_id">
								<input type="text" name="memberId" id="memberId" value=""  readonly/>
							<!-- 	<input type="hidden" name="chkmemberIdYN" id="chkmemberIdYN" value="N" /> -->
								<button type="button" class="bg-black chkmemberId" id="btnDup">중복확인</button>
								<span class="txt ml">특수문자를 제외한 영문, 숫자 8~21자 이내</span>
							</div>
						</li>
				
						<li class="item">
							<label for="password" class="t">비밀번호<span class="color-purple">*</span></label>
							<div class="cont">
								<input type="password" name="pwd" id="password" />
								
								<span class="txt ml">영문, 숫자, 특수문자 중 2종류 이상 8~12자 이내</span>
							</div>
						</li>
						<li class="item">
							<label for="repassword" class="t">비밀번호 확인  <span class="color-purple">*</span></label>
							<div class="cont">
								<input type="password" name="repassword" id="repassword" />
								<span class="txt ml">확인을 위해 한번 더 입력하시기 바랍니다.</span>
								<span id="passMsg" style="color:#FF0000"></span>
							</div>
						</li>
						<li class="item item_birth" >
							<label  class="t">생년월일  <span class="color-purple">*</span></label>
							<!-- <strong class="t">생년월일  <span class="color-purple">*</span></strong> -->
							<div class="cont">
								<div class="birth_w clearfix">
									<ul class="clearfix birth">
											<li>
											<p><input type="date" name="birth" id="datepicker"  style="width:320px;" /></p>
											</li>
									</ul>
			
								</div>
							</div>
			
						</li>
						<!-- <li class="item manAgeSet" style="display: none">
							<label for="parent" class="t">부모님동의 <span class="color-purple">*</span></label>
							<div class="cont">
								<span class="txt">만 14세 미만의 어린이는 보호자 동의가 필요합니다.</span>
								<button type="button" class="bg-black" onclick="javascript:checkPlusPopup();return false;">부모님 휴대전화 인증</button>
							</div>
						</li> -->
						<li class="item">
							<label for="genderFlag" class="t">성별 <span class="color-purple">*</span></label>
							<div class="cont">
								<select name="gender" id="genderFlag" class="small">
									<option value="">성별</option>
									<option value="남자" >남자</option>
									<option value="여자" >여자</option>
								</select>
							</div>
						</li>
						<li class="item">
							<label class="t">주소 <span class="color-purple">*</span></label>
							<!-- <strong class="t">주소 <span class="color-purple">*</span></strong> -->
							<div class="cont">
								<ul class="add">
									<li class="clearfix a1">
										<div class="zipcode">
											<label for="memberZipCd" class="hide">우편번호</label>
											<input type="text" name="zipcode" id="memberZipCd" /> 
											<button id="addrBtn" type="button" class="bg-black" title="새창으로 열립니다." onclick="execDaumPostcode()">우편번호 찾기</button>
											
										</div>
									</li>
									<li class="clearfix a2">
										<span class="l">
											<label for="memberAddr1" class="hide">주소</label>
											<input type="text" name="addr1" id="memberAddr1"  />
										</span>
										<span class="r">
											<label for="memberAddr2" class="hide">나머지 주소</label>
											<input type="text" name="addr2" id="memberAddr2" value="" class="long" />
										</span>
									</li>
								</ul>
							</div>
						</li>
						<li class="item">
								<label class="t">이메일<span class="color-purple">*</span></label>
								<div class="cont">
									<ul class="email clearfix">
										<li class="e1"><label for="memberEmail1" class="hide">이메일 아이디</label><input type="text" name="email1" id="memberEmail1"  /></li>
										<li class="dash">@</li>
										<li class="e2"><label for="memberEmail2" class="hide">이메일 주소</label><input type="text" name="email2" id=memberEmail2  class="long" /></li>
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
						<!-- 	<label class="t">이메일<span class="color-purple">*</span></label>
							<strong class="t">이메일 <span class="color-purple">*</span></strong>
							<div class="cont">
								<ul class="memberEmail clearfix">
									<li class="e1"><label for="memberEmail" class="hide">이메일 </label>
										
										
											<input type="text" name="email" id="memberEmail" value="" />
										
			
									</li>
								</ul>
							</div> -->
						</li>
						<li class="item">
							<label class="t">휴대폰<span class="color-purple">*</span></strong></label>
							<!-- <strong class="t">휴대폰  <span class="color-purple">*</span></strong> -->
							<div class="cont tel_cont">
								<div class="tel_w">
								<ul class="clearfix tel">
									<li>
										<label for="tel3" class="hide">휴대폰</label>
										<input type="text" onkeyup="PhoneNumber(this)" id="phone" name="phone" class="small"  maxlength="13" style="width:320px;"  />
									</li>
								</ul>
								
								<input type="hidden" name="memberCel" id="memberCel" value="">
								</div>
								<!-- <div class="tel_confirm" style="margin-top:10px;">
									<label for="smsAuthNumber" class="hide">인증번호 입력</label>
									<input type="text" name="smsAuthNumber" id="smsAuthNumber" placeholder="인증번호 6자리 숫자 입력" maxlength="6"/>
									<input type="hidden" name="serverAuth" id="serverAuth" />
								</div> -->
							</div>
						</li>
						<li class="item">
							<label class="t">전화번호<span class="color-purple">*</span></label>
							<div class="cont">
								<ul class="clearfix tel">
									
									<li>
										<label for="memberTel3" class="hide">전화번호</label>
										<input type="text" onkeyup="hPhoneNumber(this)" name="hPhone" id="hPhone" class="small" value=""  maxlength="13" style="width:320px;" />
									</li>
								</ul>
								<input type="hidden" name="memberTel" id="memberTel" value="" />
							</div>
						</li>
						
					</ul>
					<div class="agree_w f18">
						<dl>
							<dt class="bul-dot b">우신문화회관에서 제공하는 정보를 메일로 받아보시겠습니까?</dt>
							<dd class="ck_com">
							
								<input type="radio" name="mailChk" id="agree1"  value="Y" />
								 <label for="agree1" class="radio_lab lab_left lab_w">예</label>
							
								<input type="radio" name="mailChk" id="agree2"  value="N" />
								 <label for="agree2" class="radio_lab">아니오</label>
								 
							</dd>
						</dl>
						<dl>
							<dt class="bul-dot b">우신문화회관에서 제공하는 정보를 SMS 서비스로 받아보시겠습니까? </dt>
							<dd class="ck_com">
								<input type="radio" name="smsChk" id="agreeSms1"  value="Y" /> 
								<label for="agreeSms1" class="radio_lab lab_left">예</label>
								<input type="radio" name="smsChk" id="agreeSms2"  value="N" /> 
								<label for="agreeSms2" class="radio_lab">아니오</label>
							</dd>
						</dl>
					</div>
				
					<div class="bbs-btn_w clearfix tac">
						<button type="button" class="bbs-btn-st2 bg-purple3"id="btnSignup" >등록</button>
						<button type="button" class="bbs-btn-st2 bg-black_r" id="btnSignupC">취소</button>
						
					</div>

				</div>	
				</article>
				
				</form>

				
			
			
			<form name="form_chk" method="post">
				<input type="hidden" name="m" value="checkplusSerivce">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
				<input type="hidden" name="EncodeData" value="AgAFRzY2OTlecEucLY2x581zMvmVX/R9ejFU7qHruF5GRJQ6lDw2qEGBS6kaH0geIGMa2q9CDDCTXGOxZ9e14WVJQFZLRNW3IIiTjXqIBrbFgHSBQk/n7Obw4eGFPegyMxnjcR4cf1YSkT0CXRsreRN6wIFG9k+8BXYrk3jjCWzZB0TQc22KP0s6cBn66cQY+LmhWxlAYFFxqp+EgqwAKXZ++D67/zSJ3nt7r9gcyuyVrrKHByQLY4arAKr1kOrYLSxdyxgBPi+lN3+L50sz0CaMIXuIM0kOB+Tp9Y83cpK/WFb6DbEcZKFJ5rYEeJczS+heVlyM9NaUX+qqaNQ/8O66htABY3NOSLYDbvRQ2klwY/RJ9dqYIm5ck14r+VnB5+X1AOrY0t1vv3se0dVydB+XcbgCbwVcWU1cJ+xLX0Kj6oS65Rr2Ni6cCmrb6sJFJEys7ypnHrykqz7SzpGzjpNUXohHhALSrwOE7eOkA78yFTeiPSSDOw==">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
			</form>
			

			
					</div>
				</div>
			
			</div><!-- #cont -->

				<!----------------------------------------------여기서부터 끝까지 footer-------------------------------------------->

			<!-- Footer -->
				<section id="footer">
					<div class="footer_line"></div>
					<div class="container">
						<div class="row">
							<div class="col-8 col-12-medium">
								<section>
									<header>
										<h2>
											<a href="index.html">
												<img class="footer_logo" src="http://localhost/group2_prj/common\logo_white.png" alt="우신문화회관">
											</a>
										</h2>
										<div class="l">
											<address>
												재단법인 우신문화회관 서울특별시 쌍용구 우신대로 175 (우신로) (우)03172
											  <br/>
											  대표자 : 최정민 유원준 정선홍 하지윤 유설빈 사업자등록번호 : 101-12-12345
												<br/>
												통신판매업신고 : 서울쌍용-0988호
											</address>
											<p class="copyright">
												COPYRIGHT(C) WOOSHIN CENTER FOR THE PERFORMING ARTS. ALL RIGHTS RESERVED</p>
											</p>
										</div>

							</div>
						</div>
					</div>
				</section>

		</div>

		<!-- Scripts -->
			<script src="http://localhost/group2_prj/assets/js/jquery.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/jquery.dropotron.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/browser.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/breakpoints.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/util.js"></script>
			<script src="http://localhost/group2_prj/assets/js/main.js"></script>

	</body>
</html>