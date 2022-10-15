<%@page import="kr.co.sist.dao.RsrvtDAO"%>
<%@page import="kr.co.sist.vo.RsrvtInfoVO"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="예매내역,상세내역조회페이지 (비동기처리가 필요해보임)" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//세션 넘겨받기 검증 완료
String memberId = (String)session.getAttribute("memberId");
//System.out.println("여기여기"+memberId);
%>

<!DOCTYPE html>
<html>
<head>
		<title>예매내역 확인 · 취소</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="apple-touch-icon" sizes="180x180" href="/static/commons/img/favicon_180.png">
        <link rel="icon" type="image/png" sizes="32x32" href="/static/commons/img/favicon_32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="/static/commons/img/favicon_16.png">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/main.css" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/reset.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/subheader.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/headerFooter.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/login.css">

	<!-- popup플러그인 0923 16:06 test 62라인 2.2.4 순서때문이었나 -->
	<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/popup.css">
	
	
	<!-- jQuery -->
	 <script type="text/javascript"
		src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
	<script type="text/javascript"
		src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" 
		src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.js"></script>
	

	<style>
     		
    section#header{
 	background: url("http://localhost/group2_prj/images/subvisual-common.jpg") no-repeat ; 
  	background-size: 100%; 
  	background-attachment: fixed; 
	}
	
	table{
	 width:100%;
	}
	
	.disable{
	  pointer-event:none;
	}
	
	#nav {
	margin-right: 150px;
	}

	#caution_btn {
	transition: all 0.3s;
	}

	#caution_btn:hover {
	background-color: whitesmoke;
	border: 2px solid #4682b4;
	color: #4682b4 !important;
	transition: all 0.3s;
	}
	
	</style>

<script>
	$(function() {
		$("input:checkbox[name='save_id']").prop("checked", true);

		//주의사항팝업창
		$("#caution_btn").click(function() {
			$('#cautionPopup_wrap').bPopup();
		})

		$("#ok_close").click(function() {
			window.location.reload();
		})

	});//end ready		

	function addZero(param) {

		if (param < 10) { //숫자가 한자리라면
			param = "0" + param; //앞에 0을 더한다.
		}
		return param;

	}// addZero

	function setDate1() {

		let frYear = $("#frYear").val();
		let frMonth = $("#frMonth").val();
		let frDay = $("#frDay").val();
		let toYear = $("#toYear").val();
		let toMonth = $("#toMonth").val();
		let toDay = $("#toDay").val();
		prom_StartDate = addZero(frYear) + "-" + addZero(frMonth) + "-"
				+ addZero(frDay);
		prom_EndDate = addZero(toYear) + "-" + addZero(toMonth) + "-"
				+ addZero(toDay);
		$("#findStartDate").val(prom_StartDate); //값 합쳐서 전송
		$("#findEndDate").val(prom_EndDate);
		$("#ReserveForm").submit(); //날짜 월에 따른 '일'변경
		$("#hidResFrm").submit(); //hiddenform의 값을 '본인' 페이지로 전송 (action생략하면 됨)

	}//end setDate1()

	function detailPopup() {
		$('#viewDatail_Popup_wrap').bPopup();
	}//detailPopup()

	function closePopup() {

		setDate1();

	}//closePopup
</script>
<%  //로그인되어있지 않은 경우 로그인페이지로 이동
if( session.getAttribute("memberId") == null){%>
    <script type="text/javascript">
    $(function(){
	 alert("인증이 필요한 페이지입니다. 로그인페이지로 이동합니다.");
    });//ready
	 </script>
<% 	 response.sendRedirect("http://localhost/group2_prj/login/login.jsp");
} 
%>



   <link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static/portal/css/sub_new.css">
   <link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static/portal/css/style.css">
   <link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static/portal/css/layout_new.css">
	
	<!--google icons-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<!--google fonts-->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body class="homepage is-preload">
<%

%>

<%
request.setCharacterEncoding("UTF-8");
String findStartDate=request.getParameter("findStartDate");//본인페이지에서 전송된 값을 String에 담기
String findEndDate=request.getParameter("findEndDate"); //본인페이지에서 전송된 값을 String에 담기

//세션에 담기
session.setAttribute("findStartDate", findStartDate);
session.setAttribute("findEndDate",findEndDate);
session.setAttribute("id", memberId);


String id = (String)session.getAttribute("id");
String findSDate = (String) session.getAttribute("findStartDate");
String findEDate = (String) session.getAttribute("findEndDate");

RsrvtInfoVO rVO = new RsrvtInfoVO();
rVO.setMemberId(id);
rVO.setFindStartDate(findSDate);
rVO.setFindEndDate(findEDate);

RsrvtDAO rDAO = RsrvtDAO.getInstance();
//예매내역조회
List<RsrvtInfoVO> RList = rDAO.selectRsrvt(rVO);
String rsId="";
String status = ""; 
String rId ="";//세션 넣을 변수(예약번호)
//세션 넣을 리스트
RsrvtInfoVO rVOList= null;
String[] staArr ={"예매완료","예매취소"}; 
%>   

		<div id="page-wrapper">
		
		<c:import url="http://localhost/group2_prj/common/user_subpage_header.jsp"/> 
   		
   		



		<!-- 서브제목 ex) 공연일정   -->
		<div id="sut-t_wrap">
			<h2 id="sub-t">
				<strong
					style="opacity: 1; font-family: 'Noto Sans KR', sans-serif; font-weight: 700;"
					class="ani">예매내역 확인 · 취소</strong>
			</h2>
		</div>
		</section>

		<!-- ------------------------------------위까지가 헤더-------------------------------------->


		</section>

		<c:import url="http://localhost/group2_prj/common/user_subpage_header2.jsp"/> 
   		 

			 
				<!-----------------------------------------------------------------------------------------------  -->
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
					
					


							<style>
							.tabs-st1,.tabs-st2{display: none;}
							</style>
							
							<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
							<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
					
							
							
								<section id="wrap" >
								<form id="ReserveForm" name="ReserveForm" method="post" >
								<!-- 검색일자를 합치는 용도 -->
								<input type="hidden" name="findStartDate" id="findStartDate" />
								<input type="hidden" name="findEndDate" id="findEndDate" />						
								<!-- 예약번호 -->
								<input type="hidden" name="rId" id="rId" />
								<!-- 예매상태 -->
								<input type="hidden" name="rStatus" id="rStatus"/>
								
								<article class="pop_w pop_ok" id="cancel_pop" >
									<div class="in pop-st1 pop_width">
										<div class="tit-st2">
											<h2>예매확인 · 취소</h2>
									
										</div>
										<div class="cont rsvt_cont">
											
											<p class="bul-dot b dot">최근 1년 동안의 예매확인 및 취소내역을 조회할 수 있습니다.(예매날짜를 기준으로 조회하여 주시기 바랍니다.)</p>
											<div class="period_w dot">
												
												<h3 class="t">조회기간 선택 </h3>
												<%
												 session.setAttribute("year", Calendar.getInstance().get(Calendar.YEAR));
												 session.setAttribute("month", Calendar.getInstance().get(Calendar.MONTH)+1);
												 session.setAttribute("lastday",  Calendar.getInstance().getActualMaximum(Calendar.DAY_OF_MONTH));
												 session.setAttribute("day",  Calendar.getInstance().get(Calendar.DAY_OF_MONTH));
												
												
												Calendar cal = Calendar.getInstance(); // 시스템(서버)의 현재 날짜
												//선택한 날짜로 설정하여 변경 (EL방식이 아닌 기존 코드 필요)
												//년 월에 대한 '일'을 바꿈(년,월에 대한 파라미터를 받음)
												String paramYear = request.getParameter("frYear");
												String paramMonth = request.getParameter("frMonth");
												String paramEYear = request.getParameter("toYear");
												String paramEMonth = request.getParameter("toMonth");
												//String paramEMonth = request.getParameter("toMonth");
												
												if(paramMonth != null){ //값이 있다면(월이 있다면)
													  cal.set(Calendar.YEAR, Integer.parseInt(paramYear)); //(변경하고 싶은 필ㄹ드, 년)	\
													  //선택한 년으로 달력객체가 설정
													  cal.set(Calendar.MONTH,Integer.parseInt(paramMonth)-1); //0부터 시작해서 -1을 빼줘야 함
														
												}//end if
												
												if(paramEMonth != null){
													 cal.set(Calendar.YEAR, Integer.parseInt(paramEYear));
													 cal.set(Calendar.MONTH,Integer.parseInt(paramEMonth)-1);
												}
												
												//변경된 년과 월로 마지막 일자를 얻음 
												int selectYear = cal.get(Calendar.YEAR);
												int selectMonth = cal.get(Calendar.MONTH)+1;
												int lastDay_ = cal.getActualMaximum(Calendar.DATE);
												
												pageContext.setAttribute("sYear", selectYear);
												pageContext.setAttribute("sMonth", selectMonth);
												pageContext.setAttribute("sDay", lastDay_);
												
												%>
												<select name="frYear" id="frYear" class="year">
												
													<c:forEach var="year" begin="2015" end="${sessionScope.year}" step="1">
													<option value="${year}"${year eq param.frYear?" selected='selected'" :""}><c:out value="${year}"/></option>
													</c:forEach>
																													
																		
												</select>
												<label for="frYear">년</label>
												
												<select name="frMonth" id="frMonth" onchange="javascrit:fn_changeFrLastDay();">
												<c:forEach var="month" begin="1" end="12" step="1">

												<option value="${month}"${month eq param.frMonth?" selected='selected'" :""}><c:out value="${month}"/></option>
  	
												</c:forEach>
																						
																			
												</select><label for="frMonth">월</label>
												
												<select name="frDay" id="frDay" >
													<c:forEach var="day" begin="1" end="${lastday}" step="1">
													<option value="${day}"${day eq param.frDay?" selected='selected'" :""}><c:out value="${day}"/></option>
													</c:forEach>					
																		
																		
												</select> <label for="frDay">일</label>
												
												<span class="dash">~</span>
												<select name="toYear" id="toYear" class="year">
													<c:forEach var="year" begin="2015" end="${sessionScope.year}" step="1">
													<option value="${year}"${year eq sYear?" selected='selected'" :""}><c:out value="${year}"/></option>
													</c:forEach>
															
												</select> <label for="enYear">년</label>
												<select name="toMonth" id="toMonth" onchange="javascrit:fn_changeToLastDay(this);">
																		
											    <c:forEach var="month" begin="1" end="12" step="1">

												<option value="${month}"${month eq sMonth?" selected='selected'" :""}><c:out value="${month}"/></option>
  	
												</c:forEach>
																
												</select> <label for="toMonth">월</label> 
												<select name="toDay" id="toDay">
																									
													<c:forEach var="day" begin="1" end="${lastday}" step="1">
													<option value="${day}"${day eq sDay?" selected='selected'" :""}><c:out value="${day}"/></option>
													</c:forEach>	
												</select> <label for="toDay">일 </label>
												<button type="button" id="date_btn" class="bg-purple sel" onclick="setDate1()">조회</button>
											
											</div>
										
											<div class="pop-state">
												<div class="state_top clearfix dot">
													<div class="r">
														<button type="button" class="btn-blue_s btn_blue_o" id="caution_btn">주의사항 꼭 읽어보세요.</button>
														
														 <label for="sort" class="hide">정렬방법</label>
														<select name="SORT_DATE_TYPE" id="SORT_DATE_TYPE" onChange="fn_search_1();">
															<option value="SORT_TRAN" selected>예매일순</option>															
														</select> 
													</div>
												</div>
												
												
												<div style="width:100%;">
												
												<%
												
												
												if(findStartDate != null){ //값이 존재할 때만 조회
													// DB에조회 
												
											    %>
												
											  <table class="tbl-st1 dot f13" style="width:100%;" >
													<caption>
														예매일, 예매번호, 프로그램, 이용일시 및 장소, 매수, 수령방법, 결제금액, 상태, 비고로 구성된 관람 전 내역 테이블
													</caption>
													<thead>
														<tr>
															<th scope="col" style="width:80px">예매일</th>
															<th scope="col" style="width:88px">예매번호</th>
															<th scope="col">프로그램</th>
															<th scope="col" style="width:230px">이용일시</th>
															<th scope="col" style="width:116px">매수</th>
															<th scope="col" style="width:83px">결제금액</th>
															<th scope="col" style="width:90px">상태</th>
														</tr>
													</thead>
													<tbody>
														
												
														 <%
  															
   													     if(RList.isEmpty()){%>
   													    	<span>조회결과가 없습니다.</span>  
   													    <%}
   														 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  														 String date = null;
  														
  														 for(RsrvtInfoVO rsVO : RList){
  															if (rsVO.getRsrvtInputDate() != null) { 
  																date = sdf.format(rsVO.getRsrvtInputDate()); 
  															} // end if
  													 	 rsId = rsVO.getRsrvtId();
  													 	 status = rsVO.getRsrvtStatus();
  													 	 session.setAttribute("rsId", rsId);
  													 	 session.setAttribute("rStatus", status);
  														 rId = (String) session.getAttribute("rsId");
  														 String rStatus = (String) session.getAttribute("rStatus");														 
  														 %>												
														<tr>
															<td><%=date%></td>
															<td><%= rId %><br/>  
															<button type="button" id="datail_btn" class="bg-black2 btn-st3 bg_can" onclick="viewDetail_pop('<%= rId %>');"
															<%=rStatus.equals(staArr[1]) ? "style='background-color:grey;' disabled='disabled' " : "" %>
															>상세내역</button> 
															</td>
															<td class="tal" style="text-align:center !important;"><%=rsVO.getShowName()%></td>
															<td class="tal" style="text-align:center !important;"><%=rsVO.getShowDate()%><br />
																</td>
															<td>
																<%=rsVO.getRsrvtTotalCnt()%>매<br />
															</td>
															<td><%=rsVO.getTotalPrice()%>
															</td>
															<td>															  
															  <%=rsVO.getRsrvtStatus() %><br />
															<button type="submit" id="rsvt_c_btn" class="bg-black2 btn-st3 bg_can" formaction="http://localhost/group2_prj/reservation/ticket_cancel_process.jsp"  
															 onclick="modiRsrvt('<%=rId%>','<%=rStatus%>');"<%=rStatus.equals(staArr[1]) ?  "disabled='disabled' style='background-color:grey;'" : ""%>>
															 <%=rStatus.equals(staArr[1]) ? "변경불가" : "예매취소"%>
															 </button>
															 </td>
														</tr>
														  <%
														 date="";
														}%>  
													</tbody>
												</table>
												<%}//end if %>
												</div>
												<ul class="paging"><li class="active"><a href="#">1</a></li></ul>
											</div>
											</div>
										</article>
										</form>
									</section>
		
							
<!-- 주의사항 FORM -->
<article id="cautionPopup_wrap">
	<div class="in pop-st1 pop-ex caution" >
		<div class="tit-st2 tit_pop">
			<h2>주의사항 꼭 읽어보세요</h2>
		</div>

			<ul class="bul-dot dot">
				<li><strong>티켓 취소 가능 시간</strong> </li>
				<ul class="bul-dot2">
				<li class="bul_dot_inner">공연 관람 1일전 오후 5시까지 (공연 당일 취소 및 변경 불가)</li>
				</ul>	
				<li><strong>티켓의 환불 및 변경</strong>
					<ul class="bul-dot2">
						<li>티켓환불은 해당 공연일을 기준으로 10일 전까지는 별도의 수수료없이 전액 환급되며, 해당 공연일
							9일 전부터 하루 전 17시 까지는 환불할 티켓 금액의 10%를 수수료로 공제 후 환불이 가능합니다.</li>
						<li>공연 당일은 환불이 되지 않습니다.</li>
						<li>예매당일 취소 시 공연일로부터 3일전까지는 취소수수료 없음, 공연일 3일 이내 취소시 10% 취소수수료가 부과 됩니다.</li>
					</ul>
				</li>
			</ul>
			
			<div class="ok_c_btn">
				<button type="button" class="btn-st1 bg-purple" id="ok_close">확인</button>
			</div>
		</div>
</article>

<!-- 상세보기 팝업 -->
<script type="text/javascript">
function viewDetail_pop(r_num) { // 버튼을 클릭하면 상세보기 팝업이 아니라, 값을 가져와야 함(조회된 날짜)
 $("#rId").val(r_num);//조회하려는 번호(예매번호)
		setDate1(); // 선택한 날짜 	
}// viewDetail_pop
</script>
<% 
String reserNum=request.getParameter("rId"); //예약번호(hidden을 통해 전송된 값을 가져옴)
if(reserNum != null && !"".equals(reserNum)){%> 
 <%
//상세내역 조회
rVOList = rDAO.selectRsrvtDetail(reserNum);	
 %>
  <article id="viewDatail_Popup_wrap">
	<div class="in pop-st1 pop-ex caution" >
		<div class="tit-st2 tit_pop">
			<h2>상세내역</h2>
			<button type="button" class="close-st1"> CLOSE</button>
		</div>
			<table class="detail_tabl bul-dot" border="none">
				<tr>
					<th>예매코드</th>
					<th><%= rVOList.getRsrvtId() %></th>
					
					<th>좌석번호</th>
					<td><%=rVOList.getSeatId() %></td>
				</tr>
				<tr>
					<th>공연코드</th>
					<td><%=rVOList.getShowId() %></td>
					<th>예매자</th>
					<td><%=rVOList.getMemberName() %></td>
				</tr>
				<tr>
					<th>관람일자 및 시간</th>
					<td><%=rVOList.getShowDate() %></td>
					<th>인원수 </th>
					<td><%=rVOList.getRsrvtTotalCnt() %></td>
				</tr>
				<tr>
					<th>공연명</th>
					<td><%=rVOList.getShowName() %></td>
					<th>총 결제내역 </th>
					<td><%=rVOList.getTotalPrice() %></td>
				</tr>
			</table>
			<button type="button" class="btn-st1 bg-purple btn_close close_btn" id="close_btn" onClick="closePopup();">닫기</button>
		</div>
</article>
 <script type="text/javascript">
  detailPopup(); //상세내역 팝업 function
 </script> 
<%} %>
<!--상세보기 팝업끝-->


<script type="text/javascript">
function modiRsrvt(r_num,status){
	 $("#rId").val(r_num);//조회하려는 번호(예매번호)
	 $("#rStatus").val(status);//예매상태
	 setDate1();  // 선택한 날짜 
	$("#ReserveForm").attr("action", "http://localhost/group2_prj/reservation/ticket_cancel_process.jsp");
}//modiRsrvt(r_num,status)
</script> 

						
				<!----------------------------------------------여기서부터 끝까지 footer-------------------------------------------->

			<!-- Footer -->
			
			<c:import url="http://localhost/group2_prj/common/user_allPage_footer.jsp"/> 
			
			<!-- End footer -->
				
	
		<!-- Scripts -->
		<!-- 	<script src="assets/js/jquery.dropotron.min.js"></script> -->
		    <script src="http://localhost/group2_prj/assets/js/jquery.dropotron.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/browser.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/breakpoints.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/util.js"></script>
			<script src="http://localhost/group2_prj/assets/js/main.js"></script>

	</body>
</html>