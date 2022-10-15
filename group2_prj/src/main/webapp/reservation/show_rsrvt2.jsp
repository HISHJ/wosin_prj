<%@page import="java.util.Enumeration"%>
<%@page import="kr.co.sist.vo.ShowVO"%>
<%@page import="kr.co.sist.dao.MainDAO"%>
<%@page import="kr.co.sist.vo.RsrvtInfoVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.dao.RsrvtDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    
<%  /* 여기서는 select 말고 상영일정이랑, 시간을 뿌려줘야되는데 무슨DAO쓰더라 */
	/* String swId = request.getParameter("showId"); */
 	String swId = (String)session.getAttribute("showId");
	MainDAO mDAO = MainDAO.getInstance();
	ShowVO sVO = mDAO.selectShowMain(swId); // 다주는 메서드
	
	pageContext.setAttribute("sVO", sVO);
	//System.out.println(swId);
	//System.out.println(sVO.getName());
	
	
	
	//String schId = (String)session.getAttribute("schtest");
	String schId = request.getParameter("schtest");
	session.setAttribute("schTest", schId);
	
	RsrvtDAO rDAO = RsrvtDAO.getInstance();
	List<String> seatList = rDAO.selectSeat(schId);
	
	pageContext.setAttribute("seatList",seatList);
	
	//System.out.println(seatList.size());
	//System.out.println(schId);
	
	
%>

<%
request.setCharacterEncoding("UTF-8");
Enumeration rp = request.getParameterNames();
while(rp.hasMoreElements()){
	String getrp = rp.nextElement()+"";
	System.out.println("show_rsrvt2.jsp @@@@request : "+getrp+":"+request.getParameter(getrp)); // values안하니까 좌석 하나만 나옴 ㅇㅇ
}
Enumeration se = session.getAttributeNames();
while(se.hasMoreElements()){
	String getse = se.nextElement()+"";
	System.out.println("show_rsrvt2.jsp @@@@session : "+getse+":"+session.getAttribute(getse));
}

%>        
<!DOCTYPE HTML>
<html>
	<head>
		<title>예매하기 | 좌석선택</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<link rel="stylesheet" href="../assets\css\reset.css">
		<link rel="stylesheet" href="../assets\css\headerFooter.css">
		<link rel="stylesheet" href="../assets\css\subheader.css">
		
		<!-- 공연상세페이지만을 위한 css -->
		<link rel="stylesheet" href="../assets\css\perform.css">
		<link rel="stylesheet" href="../assets\css\tab.css">
		
		
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<!-- Scripts -->
		<script src="../assets/js/jquery.min.js"></script>
		<script src="../assets/js/jquery.dropotron.min.js"></script>
		<script src="../assets/js/browser.min.js"></script>
		<script src="../assets/js/breakpoints.min.js"></script>
		<script src="../assets/js/util.js"></script>
		<script src="../assets/js/main.js"></script>
		
		<!-- tap관련 추가한거 -->
		<script src="../assets/js/tab.js"></script>
		<style>
			#nav{
				margin-right:150px;
			}
		</style>
		<script>
		////////////////////////////////////////////
		$(function(){
			$("#rsrvtBtn").click(function(){
				// 유효성검증코드들 추가필요 
				var obj = document.getElementById("rsrvtInfoFrm");
				var seats = obj.seat;
				// alert(seats.length); 16
				
				if($("[name='seat']:checked").length==0){
					alert("좌석을 선택해주세요.")
					return;
				};
				
				$("#rsrvtInfoFrm").submit();
			});
		});
		
		function seatChk(seatNum){
			oTbl = document.getElementById("chkSeatNum");
			/* test(seatNum); */
			if(seatNum.checked == true){ // check할때
				/* alert(seatNum.value); */
				/* alert(oTbl); */
				// oRow 테스트 Ocell없애고 td에 아이디주기
				var oRow = oTbl.insertRow();
				oRow.onmouseover = function(){oTbl.clickedRowIndex=this.rowIndex};
				var oCell = oRow.insertCell();
				
				//var frmTag = "<td name='chkRow' id='chk_"+seatNum.value+"' value='chk_"+seatNum.value+"'><input type='text'  name='selectedSeat' style='width:50px; height:30px;' readonly='readonly' value='"+seatNum.value+"'>";
				//frmTag += "<input type='button' value='삭제' onclick='removeRow("+seatNum.value+")' style='cursor:hand; color:#555555; background-color:#555555; margin-left:10px;'></td>";
				var frmTag = "<td name='chkRow' id='chk_"+seatNum.value+"' value='chk_"+seatNum.value+"'>"+seatNum.value;
				frmTag += "<input type='button' value='삭제' onclick='removeRow("+seatNum.value+")' style='cursor:hand; color:#555555; background-color:#555555; margin-left:10px;'></td>";
				
				oRow.innerHTML = frmTag;
				
				
			}else{ // check풀때         10-09 버그발견 : check박스 풀 때 계속 제일 위의열이 없어짐.
				//alert(seatNum.value);
				
				////////////////////
				//체크박스를 해제할경우 oTbl의 deleteRow를 하는데
				//몇번째인덱스인지 구해야한다
				var selectedRows = document.getElementsByName("chkRow");
					//alert("row : "+selectedRows.length);
					//alert("row : "+selectedRows[0]);
				for(var i=0;i<selectedRows.length;i++){
					if(selectedRows[i].innerText==seatNum.value){
						//alert("innerText:"+selectedRows[i].innerText+", seatNum.value:"+seatNum.value);
						//alert(i);
						oTbl.deleteRow(i);
						
					}
					//alert("row : "+selectedRows[i].innerText);
					/*if("chk_"+seatNum.value==selectedRows[i]){
						alert(i);
					}*/
					//alert("chk_"+seatNum.value);
				}
				//oTbl.deleteRow(oTbl.clickedRowIndex);
				
				//String ppqq = document.getElementById("chk_"+seatNum.value);
				//alert(ppqq);
				
//				oTbl.deleteRow(oTbl.clickedRowIndex);
				//alert(oTbl.clickedRowIndex+seatNum.value);
				//oTbl.deleteRow(oTbl.clickedRowIndex);
				/////////////////////
				
			}
			// 삭제를 누르면 체크박스도 해제되어야하고      삭제를 누른다는건 ? removeRow
			// 체크박스를 해제하면 아래 좌석번호도 삭제되어야한다.    체크박스를 해제한다는건? else
			rowCnt();
			
		};
		/* function test(seatNum){
			alert(seatNum.value);
		} */
		function removeRow(s){ // 10-09 removeRow는 잘 되는데..
			alert(s);
			oTbl.deleteRow(oTbl.clickedRowIndex);
			document.getElementById("st_"+s).checked = false;
			/* seatNum.checked=false; */
			rowCnt();
		}
		
		function rowCnt(){
			var rows = document.getElementById("chkSeatNum").getElementsByTagName("tr");
			/* alert(rows.length); */
			document.getElementById("totalSeat").value = rows.length;
		}
		</script>
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
										<li><a href="subpage-manner.html">관람예절</a></li>				
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
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">예매하기</strong>
						</h2>
					</div>
					</section>

						<!--------------------------------------위까지가 헤더----------------------------------------->
				<!-- Main -->
				<section id="main">
				<!-- <form id="rsrvtInfoFrm" method="post" action="show_rsrvt3.jsp"> -->
					<div class="container">
						<div class="row">
							<div class="col-4 col-12-medium">

								<!-- Sidebar -->
									<section class="box">
										<a class="image featured"><img src="poster/rj.jpeg" alt="" /></a>
										<header>
											<h3 class="h3"><%=sVO.getName() %></h3>
										</header>
									</section>
									<section class="box">
										<ul class="divided">
											<li>기간　　<%=sVO.getStartDate() %> ~ <%=sVO.getEndDate() %></li>
											<li>장소　　우신문화회관 대극장</li>
											<li>연령　　<%=sVO.getRatingId() %></li>
											<li>티켓　　<%=sVO.getPrice() %>원</li>
											<li>공연시간　　<%=sVO.getRunningTime() %></li>
										</ul>
									</section>

							</div>
							<div class="col-4 col-12-medium">

								<!-- Sidebar -->
									<section class="box" style="margin-bottom: 30px; height: 470px; background-color: #fafafa">
										<header>
											<h3 class="h3">날짜선택</h3>
										</header>
										<footer>
										<input type="date" name="서버가 인식할값" value="서버에 전송할값" readonly="readonly">
										<p>programmer93.tistory.com/5</p>
										<p>참조해서</p>
										<p>시간되면 캘린더 꾸며주기</p>
										
										</footer>
									</section>
									<section class="box"; style="background-color: #fafafa">
										<header>
											<h3 class="h3">시간선택</h3>
										</header>
										<ul class="divided">
											<li>15:00</li>
										</ul>
									</section>
									
							</div>
							<div class="col-4 col-12-medium">

								<!-- Sidebar -->
									<section class="box" style="margin-bottom: 30px">
										<header>
											<h3 class="h3">좌석선택</h3>
										</header>
										<form id="rsrvtInfoFrm" method="post" action="show_rsrvt3.jsp">
										<footer>
											<%-- <c:forEach var="seat" begin="1" end="16" step="1">
												<c:if test="${fn:length(seatList)==0}">
													<input type="checkbox" value="${seat}">
												</c:if>
											</c:forEach> --%>
										
											<%
											for(int i=1;i<17;i++){
												String dis="";%>
												
												<%--테스트용 <%if(seatList.size()>0){System.out.println(seatList.get(0));} %> --%>
												
												
												<%for(int j=0;j<seatList.size();j++){
													if(seatList.get(j).equals(String.valueOf(i))){
														dis = "disabled";
													}
													//if(seatList.get(j)==String.valueOf(i)){
														//System.out.println(i+":"+seatList.get(j).equals(String.valueOf(i)));	
														//System.out.print(String.valueOf(i)+",");	
														//System.out.println(seatList.get(j));	
														//System.out.println(seatList.get(j).equals(Integer.toString(i)));	
														//System.out.println(seatList.get(j).equals(String.valueOf(i)));	
													//}
												}%>
												<input type="checkbox" name="seat" value="<%=i%>" id="st_<%=i%>"
												<%-- style="appearance:checkbox; " onclick="seatChk('<%=i %>')" <%=dis %>> --%>
												style="appearance:checkbox; " onclick="seatChk(this)" <%=dis %>>
												
												<%if(i%4==0){%>
												<br>
												<%} %>
											<%} %>
										</footer>
										</form>
									</section>
									<section class="box" style="margin-bottom: 30px">
										<header>
											<h3 class="h3">선택한 좌석 정보</h3>
										</header>
										<table id="chkSeatNum">
										</table>
										<!-- <ul class="divided">
											<li>1A
												<button type="button" class="xbutton" onclick="deleteSeat()" title="취소">
													<img src="https://flexfile.sejongpac.or.kr/Flex/Rsv/102103/img/pop/btn-del.png" alt="좌석취소버튼">
												</button>
											</li>
										</ul> -->
									</section>
									<section class="box" style="margin-bottom: 30px">
										<header>
											<h3 class="h3">선택한 총 좌석수</h3>
										</header>
										
										<ul class="divided">
											<li><input type="text" id="totalSeat" value="0" name="seatCnt" id="seatCnt"  readonly="readonly" style="border:none; width:30px;" />개</li>
										</ul>
									</section>
								<a href="javascript:history.back();">이전</a>
								<input type="button" value="다음" id="rsrvtBtn" style="background-color:#555555;">
							</div>
						</div>
					</div>
				<!-- </form> -->
				</section>
		

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
												<img class="footer_logo" src="common\logo_white.png" alt="우신문화회관">
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

		
			
	</body>
</html>