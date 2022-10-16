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
    
<%  //2022 -10 -16
/*정민님 rsvt1에서 다음 버튼 누르면 여기로 안넘어오고 메인으로 리다이렉트 되는데 아마 값을 못받는게 아닌가싶네요...? 확인해주세요 - 설빈
		> 해결.. 여기에는 리다이렉트 설정하면 안되나..? 리다이렉트 주석처리하니까 되네요
		*/
%>    
<% 
//값 넘김 검증 완료(각 페이지에서 값 전달받음)
String memberId= request.getParameter("memberId");

%>        
<%
//로그인 되어있지 않은 경우, 로그인페이지로 이동
if( session.getAttribute("memberId") == null){
response.sendRedirect("http://localhost/group2_prj/login/login.jsp");
return;
} 

if(session.getAttribute("showId")==null){
	response.sendRedirect("http://localhost/group2_prj/main/index.jsp");
	 return;
}

%>     
<%  
	// String swId = request.getParameter("showId"); 
 	String swId = (String)session.getAttribute("showId");
	

	
	
	MainDAO mDAO = MainDAO.getInstance();
	ShowVO sVO = mDAO.selectShowMain(swId); // 다주는 메서드
	
	pageContext.setAttribute("sVO", sVO);
	//System.out.println(swId);
	//System.out.println(sVO.getName());

				
	RsrvtDAO rDAO = RsrvtDAO.getInstance();
	
	
	//String schId = (String)session.getAttribute("schtest");
	String schId = request.getParameter("schtest");
	session.setAttribute("schTest", schId);
	System.out.println("위치확인용"+schId);
	
	//////10-15 schtest 상영일정코드로 
	RsrvtInfoVO schInfo = rDAO.selectSchInfo(schId);	
	//System.out.println(schInfo.getSchDate());
	//System.out.println(schInfo.getSchTime());
	//System.out.println(schInfo.getSchDay());
	
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
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/main.css" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/reset.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/subheader.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/headerFooter.css">
		<!-- 공연상세페이지만을 위한 css -->
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/perform.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/tab.css">
		
		
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<!-- Scripts -->
		<script src="http://localhost/group2_prj/assets/js/jquery.min.js"></script>
		<script src="http://localhost/group2_prj/assets/js/jquery.dropotron.min.js"></script>
		<script src="http://localhost/group2_prj/assets/js/browser.min.js"></script>
		<script src="http://localhost/group2_prj/assets/js/breakpoints.min.js"></script>
		<script src="http://localhost/group2_prj/assets/js/util.js"></script>
		<script src="http://localhost/group2_prj/assets/js/main.js"></script>
			
		<!-- tap관련 추가한거 -->
		<script src="http://localhost/group2_prj/assets/js/tab.js"></script>
		
<%if (memberId == null) {%>
<style>
#nav {
	margin-right: 150px;
}
</style>
<%}%>
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
				
				// 2022-10-15 좌석5개초과불가능 유효성검증 테스트 시작 /////////////////////////////////////////
				//alert($("[name='seat']:checked").length);
				if($("[name='seat']:checked").length>5){
					alert("좌석은 최대 5좌석까지 선택가능 합니다.");
					document.getElementById("st_"+seatNum.value).checked = false;
					//seatNum.attr("checked",false);
					return;
				}
				
				// 2022-10-15 좌석5개초과불가능 유효성검증 테스트 끝 /////////////////////////////////////////
				
				
				// oRow 테스트 Ocell없애고 td에 아이디주기
				var oRow = oTbl.insertRow();
				oRow.onmouseover = function(){oTbl.clickedRowIndex=this.rowIndex};
				var oCell = oRow.insertCell();
				
				//var frmTag = "<td name='chkRow' id='chk_"+seatNum.value+"' value='chk_"+seatNum.value+"'><input type='text'  name='selectedSeat' style='width:50px; height:30px;' readonly='readonly' value='"+seatNum.value+"'>";
				//frmTag += "<input type='button' value='삭제' onclick='removeRow("+seatNum.value+")' style='cursor:hand; color:#555555; background-color:#555555; margin-left:10px;'></td>";
				var frmTag = "<td name='chkRow' id='chk_"+seatNum.value+"' value='chk_"+seatNum.value+"'>"+seatNum.value;
				frmTag += "<input type='button' value='삭제' onclick='removeRow("+seatNum.value+")' style='cursor:hand; color:#555555; background-color:#555555; margin-left:10px;'></td>";
				
				oRow.innerHTML = frmTag;
				
				
			}else{ // check풀때         10-09 버그발견 : check박스 풀 때 계속 제일 위의열이 없어짐. 해결함
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
		function removeRow(s){ // 10-09 
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

		
			<c:import  url="http://localhost/group2_prj/common/user_subpage_header.jsp" > 
    		<c:param name="memberId" value="<%= memberId %>"></c:param> 
    		</c:import>

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

								<section class="box" style="margin-bottom: 30px; height: 470px;">
										<header>
										
											<h3 class="h3">선택하신 상영일정</h3>
										</header>
										<footer>
										<!-- <input type="date" name="서버가 인식할값" value="서버에 전송할값"><br> -->
										<input type="text" class="h3" readonly="readonly" value="<%=schInfo.getSchDate()%> (<%=schInfo.getSchDay()%>) / <%=schInfo.getSchTime()%>"style="width:100%;height:50px;font-size:20px; font-weight:700; text-align: center;">
										<%-- <ul class="divided">
											<li><%=schInfo.getSchDate()%>(<%=schInfo.getSchDay()%>) / <%=schInfo.getSchTime()%></li>
										</ul> --%>
										
										</footer>
									</section>
									
							</div>
							<div class="col-4 col-12-medium">

								<!-- Sidebar -->
									<section class="box" style="margin-bottom: 30px">
										<header>
											<h3 class="h3">좌석선택</h3>
										</header>
										<form id="rsrvtInfoFrm" method="post" action="http://localhost/group2_prj/reservation/show_rsrvt3.jsp">
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

			<!-- Footer  -->
			<c:import url="http://localhost/group2_prj/common/user_allPage_footer.jsp"/> 
	    	<!-- End footer -->
		
			
	</body>
</html>