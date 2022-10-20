<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@page import="kr.co.sist.vo.ScheduleVO"%>
<%@page import="kr.co.sist.dao.CalendarDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.dao.ScheduleDAO"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=" Calendar 만들기 "%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
//세션 넘겨받기 검증 완료
String memberId = (String) session.getAttribute("memberId");
//System.out.println("여기여기"+memberId);
%>


<%
request.setCharacterEncoding("UTF-8");
String showId = request.getParameter("showId");
String name = request.getParameter("name");
String startDate = request.getParameter("startDate");
String endDate = request.getParameter("endDate");

LocalDate now = LocalDate.now();

String sYear = request.getParameter("year");
String sMonth = request.getParameter("month");
if (sYear == null || sMonth == null) {
	sYear = String.valueOf(now.getYear());
	sMonth = String.valueOf(now.getMonthValue());
	System.out.println(sMonth);
%>
<script>
	/*alert("이미 예약된 좌석이 있습니다. 다시 선택해주세요."); */
	/* console.log("ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ"); */
	//location.href="show_rsrvt3_process_exception.jsp";
	location.href = "http://localhost/group2_prj/reservation/calendar.jsp?year="
			+
<%=sYear%>
	+ "&month=" +
<%=sMonth%>
	;
</script>
<%
}
// System.out.println("sYear : "+sYear);
//System.out.println("sMonth : "+sMonth);
if (sMonth.length() == 1) {
sMonth = "0" + sMonth;
}

request.setCharacterEncoding("UTF-8");
Enumeration rp = request.getParameterNames();
while (rp.hasMoreElements()) {
String getrp = rp.nextElement() + "";
System.out.println("show_rsrvt4.jsp @@@@request : " + getrp + ":" + request.getParameter(getrp)); // values안하니까 좌석 하나만 나옴 ㅇㅇ
}
/* 
 ScheduleDAO sDAO = ScheduleDAO.getInstance();
 List<ScheduleShowVO> list=sDAO.selectSchedule(showId); */
ScheduleDAO cDAO = ScheduleDAO.getInstance();
System.out.println(sYear + "/" + sMonth);
List<ScheduleVO> list = cDAO.selectTest(sYear, sMonth);
System.out.println("list의 사이즈 : " + list.size());

HashMap<String, ScheduleVO> mapTest = null;
List<HashMap<String, ScheduleVO>> resultList = new ArrayList<HashMap<String, ScheduleVO>>();

if (list != null) {
for (ScheduleVO vo : list) {
	mapTest = new HashMap<String, ScheduleVO>();
	//System.out.print(vo.getIl()+"/");
	//System.out.println(vo.getName());
	mapTest.put(vo.getIl(), vo);

	resultList.add(mapTest);

}
System.out.println("----------------");
//	if(mapTest!=null){
//for(Entry<String,ScheduleVO> entrySet : mapTest.entrySet()){
//	 System.out.println(entrySet.getKey()+"/"+entrySet.getValue());
//만약에 위의 반복문을 돌리는데 map안에있는 String이 맞는다면
// VO의 getter를 써서 값을 뿌려주면되겠지
//	}
// }
}

// 아ㅣ제발자래ㅏㅈㅁㄷ게ㅐ랴험ㄱㅈ댫 10-20 00:24
for (int i = 0; i < resultList.size(); i++) {
System.out.println("여ㅑ기여기" + resultList.get(i).toString());
}

/* System.out.println();
 HashMap map = new HashMap();  //DB에서 가져온 목록중 1개의 로우 (모델) 이라고 생각하세요. 
 map.put("START_DATE",20100305);  //첫번째 로우값에 시작일 대입
 map.put("END_DATE",20100306);  //첫번째 로우값에 종료일 대입
 map.put("CONTENT","청소");  //첫번째 로우값에 내용 추가
 //list.add(map);   //목록에 추가
 map = new HashMap();
 map.put("START_DATE",20100315);  //두번째 로우값에 시작일 대입
 map.put("END_DATE",20100316);  //두번째 로우값에 종료일 대입
 map.put("CONTENT","청소");  //두번째 로우값에 내용 추가
 //list.add(map); 
 map = new HashMap();
 map.put("START_DATE",20100318);  //세번째 로우값에 시작일 대입
 map.put("END_DATE",20100319);  //세번째 로우값에 종료일 대입
 map.put("CONTENT","청소");  //세번째 로우값에 내용 추가
 //list.add(map); 
 map = new HashMap();
 map.put("START_DATE",20100325);  //네번째 로우값에 시작일 대입
 map.put("END_DATE",20100326);  //네번째 로우값에 종료일 대입
 map.put("CONTENT","청소");  //네번째 로우값에 내용 추가
 //list.add(map);  */

//날짜  JSP
int year;
int month;
Calendar today = Calendar.getInstance();
Calendar cal = new GregorianCalendar();
year = (request.getParameter("year") == null)
		? today.get(Calendar.YEAR)
		: Integer.parseInt(request.getParameter("year").trim());
month = (request.getParameter("month") == null)
		? today.get(Calendar.MONTH) + 1
		: Integer.parseInt(request.getParameter("month").trim());
if (month <= 0) {
month = 12;
year = (year - 1);
} else if (month >= 13) {

month = 1;
year = (year + 1);
}
cal.set(Calendar.YEAR, year);
cal.set(Calendar.MONTH, (month - 1));
cal.set(Calendar.DATE, 1);
%>
<!DOCTYPE HTML>

<html>
<head>
<title>전체일정</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="apple-touch-icon" sizes="180x180"
	href="../static/commons/img/favicon_180.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="../static/commons/img/favicon_32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="../static/commons/img/favicon_16.png">
<link rel="stylesheet"
	href="http://localhost/group2_prj/assets/css/main.css" />
<link rel="stylesheet"
	href="http://localhost/group2_prj/assets/css/reset.css">
<link rel="stylesheet"
	href="http://localhost/group2_prj/assets/css/subheader.css">
<link rel="stylesheet"
	href="http://localhost/group2_prj/assets/css/headerFooter.css">
<link rel="stylesheet"
	href="http://localhost/group2_prj/assets/css/login.css">

<link rel="stylesheet"
	href="http://localhost/group2_prj/assets/css/calendar.css">
<!-- 공연상세페이지만을 위한 css -->
<link rel="stylesheet"
	href="http://localhost/group2_prj/assets/css/perform.css">
<link rel="stylesheet"
	href="http://localhost/group2_prj/assets/css/tab.css">
<!--제이쿼리-->
<!--  이놈 빌런이다 조심해 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!--google icons-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<!--google fonts-->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<style>
section#header {
	background:
		url("http://localhost/group2_prj/images/subvisual-common.jpg")
		no-repeat;
	background-size: 100%;
	background-attachment: fixed;
}

#nav {
	margin-right: 130px;
}

.performanceCalendar_table tbody td:last-child {
	/*border-width:1px 0;*/
	border-width: 1px 1px 1px 0 !important
}

.performanceCalendar__table tbody td:not(:last-child) {
	border-width: 1px 1px 1px 0 !important;
}

.performanceCalendar__table tbody td {
	padding: 20px;
	vertical-align: top;
	height: 250px;
	border-style: solid;
	border-color: #e2e2e2;
}

ul {
	padding-inline-start: 0px !important;
}

a {
	font-size: 13px !important;
}

.performanceCalendar__table .item li.m::before {
	content: 'S';
	color: #01010;
	background: #ffe800;
}

.performanceCalendar__table .item li::before {
	display: flex;
	min-width: 25px;
	height: 25px;
	border-radius: 100%;
	justify-content: center;
	align-items: center;
	font-size: 14px;
	font-weight: 500;
	margin-right: 10px;
}
</style>

<%
if (memberId != null) {
%>
<style>
#nav {
	margin-right: 0px;
}
</style>
<%
}
%>


</head>
<body class="homepage is-preload">
	<div id="page-wrapper">

		<c:import
			url="http://localhost/group2_prj/common/user_subpage_header.jsp">
			<c:param name="memberId" value="<%=memberId%>"></c:param>
		</c:import>


		<!--❤️여기에 서브제목 입력하세욮 ex) 공연일정-->
		<div id="sut-t_wrap">
			<h2 id="sub-t">
				<strong
					style="opacity: 1; font-family: 'Noto Sans KR', sans-serif; font-weight: 700;"
					class="ani">전체일정</strong>
			</h2>
		</div>
		</section>
		</section>

		<!--------------------------------------위까지가 헤더----------------------------------------->

		<script>
			$(window).resize(function() {
				if ($(window).width() > 1024) {
					$("#depth_w .rel").hover(function() {
						$(this).closest("#depth_w").addClass("on")
						$(this).find(".depth").show();
					}, function() {
						$(this).closest("#depth_w").removeClass("on")
						$(this).find(".depth").hide();
					})
					$("#depth_w .rel > a").focus(function() {
						$(this).closest("#depth_w").addClass("on")
						$(this).next(".depth").show();
					})
					$("#depth_w .depth > li:last-child a").focusout(function() {
						$(this).closest("#depth_w").removeClass("on")
						$("#depth_w .depth").stop(true, true).slideUp(150);
					})
				} else {
					$("#depth_w .rel").click(function() {
						$(this).closest("#depth_w").toggleClass("on")
						$(this).find(".depth").toggle();
					})
				}
			}).resize();
		</script>

		<div id="cont">
			<div id="sub_page">
				<div class="inner"></div>

				<script>
					var loc = $("#depth_w > div > ul > li").length - 1;
					$("#depth_w .dep1").addClass("li" + loc);

					var len = $(".tabs-st1 li").length;
					$(".tabs-st1").addClass("li" + len);
				</script>

				<div class="sub_page">
					<!-- 컨텐츠 내용 -->
					<div class="performanceCalendar inner">




						<p class="table-bottom-deco color-reddish-purple mobile-txt">※해당일을
							클릭하면 하단에 공연/전시 목록이 표시됩니다.</p>

						<div class="performanceCalendar__item">
							<div class="performanceCalendar__info">
								<a
									href="calendar.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH) + 1) - 1)%>">
									<button type="button" class="prev">이전달</button>
								</a>

								<!-- 년도 ?? -->
								<form
									action="http://localhost/group2_prj/reservation/calendar.jsp"
									id="selectDateForm">
									<select id="year" id="year_sel" name="year"
										style="float: left; width: 120px;">
										<%-- <option value="<%=cal.get(Calendar.YEAR)-1%>"><%=cal.get(Calendar.YEAR)-1%>년</option>
													<option value="<%=cal.get(Calendar.YEAR)+1%>"><%=cal.get(Calendar.YEAR)+1%>년</option> --%>
										<option value="<%=cal.get(Calendar.YEAR)%>"
											selected="selected"><%=cal.get(Calendar.YEAR)%>년
										</option>
									</select> <select id="month" id="monthBtn" name="month"
										style="float: left;">
										<%
										for (int i = 0; i < 12; i++) {
											if (i + 1 == cal.get(Calendar.MONTH) + 1) {
										%>
										<option value="<%=i + 1%>" selected="selected"><%=i + 1%>월
										</option>

										<%
										} else {
										%>
										<option value="<%=i + 1%>"><%=i + 1%>월
										</option>
										<%
										}

										}
										%>
										<%-- <option value="1"><%=(cal.get(Calendar.MONTH)+1)+1%>월</option>
													<option value="1"><%=(cal.get(Calendar.MONTH)+1)+2%>월</option> --%>

									</select>
								</form>
								<a
									href='calendar.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH) + 1) + 1)%>'>
									<button type="button" class="next">다음달</button>
								</a>
							</div>
							<!-- ✨ -->
							<table class="performanceCalendar__table">
								<thead>
									<tr>
										<th>일</th>
										<th>월</th>
										<th>화</th>
										<th>수</th>
										<th>목</th>
										<th>금</th>
										<th>토</th>
									</tr>
								</thead>
								<tbody>


									<%
									cal.set(year, month - 1, 1);
									int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
									%>
									<tr>
										<%
										for (int i = 1; i < dayOfWeek; i++) {
										%>
										<td>&nbsp;</td>
										<%
										}
										int temp = 0;
										String nowYear = Integer.toString(cal.get(Calendar.YEAR));
										String nowMonth = Integer.toString(cal.get(Calendar.MONTH) + 1).length() == 1
												? "0" + Integer.toString(cal.get(Calendar.MONTH) + 1)
												: Integer.toString(cal.get(Calendar.MONTH) + 1);
										String printStr = "";

										String contentW = ""; //설빈
										//a : for (int i=1; i<= cal.getActualMaximum(Calendar.DAY_OF_MONTH);i++) {
										//list : for (int g=0; g < list.size(); g++) {
										int testCnt = 0;
										for (int i = 1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++) {
										//for (HashMap<String,ScheduleVO> schMap : resultList) {
										//for(Entry<String,ScheduleVO> entrySet : mapTest.entrySet()){
										//list : for(HashMap<String,ScheduleVO> schMap : resultList){
										printStr = Integer.toString(i);
										// System.out.println("경계선 ==================================");

										Set<String> setTest = null; // 10-20 01:17

										// 컨텐트를 여기에 올리면 하나만나오는건아니고 각 일자별로 하나씩은 나옴; 10-20 01:41
										String content = "";

										list : for (int j = 0; j < resultList.size(); j++) {

											printStr = Integer.toString(i); // 일자받음
											if (printStr.length() == 1) {
												printStr = "0" + printStr;
											}

											for (Entry<String, ScheduleVO> schMap : resultList.get(j).entrySet()) {

												setTest = new HashSet<String>(); // 하루에 여러상영일자있을경우에 대한 뭐뭐뭐

												if (schMap.getValue() != null) {
											setTest.add(schMap.getValue().getName());
												}

												if (printStr.equals(schMap.getKey())) {
											//content += "<div class=\"content\" >"+schMap.getValue().getName()+ "</div>"; 그나마 되는코드..
											//되는코드		 content += "<div class=\"content\" ><a href='http://localhost/group2_prj/reservation/show_info.jsp?showId="+schMap.getValue().getShowId()+"'>"
											// 		 +schMap.getValue().getName()+ "</a></div>";

											/*  content += "<div class=\"content\" style='overflow:hidden; text-overflow:ellipsis;' title='"+schMap.getValue().getName()+"'><a  href='http://localhost/group2_prj/reservation/show_info.jsp?showId="+schMap.getValue().getShowId()+"'>"
												 +schMap.getValue().getName()+ "</a></div> </div>"; */
											//설빈 : 여기 쪼매 바꿨습니다,,,
											content += "<li class='m'><div class=\"content\" style='overflow:hidden; text-overflow:ellipsis;' title='"
													+ schMap.getValue().getName()
													+ "'><a  href='http://localhost/group2_prj/reservation/show_info.jsp?showId="
													+ schMap.getValue().getShowId() + "'>" + schMap.getValue().getName() + "</a></div> </div><li/>";

											//			   	 content += "<input type='text' maxlength='6' value='"+schMap.getValue().getName()+"' onclick='http://localhost/group2_prj/reservation/show_info.jsp?showId="+schMap.getValue().getShowId()+"'>"
											//			   	 +"</input><br>";
											//	onclick=\"location.href=\"http://localhost/group2_prj/reservation/show_info.jsp?showId="+schMap.getValue().getShowId()+
											//content += schMap.getValue().getName()+System.lineSeparator();
											// 여기서 showId도 받아와서 주소에 넣어서 show_info로 보내면되지만 일단 그게중요한게아니잖아
												}

												//   String nowDay = Integer.toString(i).length() == 1 ? "0" + Integer.toString(i) : Integer.toString(i);
												//   String nextDay = Integer.toString(i + 1).length() == 1 ? "0" + Integer.toString(i + 1) : Integer.toString(i + 1);

												//   String nowDate = nowYear + nowMonth + nowDay; //for문을 돌고 있는 지금 날짜
												//   String nextDate = nowYear + nowMonth + nextDay; //for문을 돌고 있는 지금 날짜의 다음날짜 즉 + 1 day   
												//if (content != null  && Integer.parseInt(nowDate) == dataBaseNowDate ) { //내용이 널이아닌경우는 있다는 증거

												//	   System.out.println("content : "+content);
												if (content != null && !content.isEmpty()) { //내용이 널이아닌경우는 있다는 증거
											//if (Integer.parseInt(nowDate) == dataBaseNowDate && Integer.parseInt(nextDate) == dataBaseNextDate) {
											//00:57	    if (nowDay.equals(printStr) ) {
											//출력하는 날짜들과 데이터베이스에 조회해서 나온날짜들을 비교하여 일치한다면// 아래와같은 형식을 만들어서 뿌려줌~
											//	      System.out.println("if탔음"+printStr);
											// printStr = printStr + "<div class=\"content\">"  + content + "</div>";

											//printStr = printStr +"<br>"+ content;
											contentW = content; //여어기도..

											//break list; //for문의 list를 빠져나옴.
											// break를 쓰면 공연이 하나밖에 안나오고
											// 안쓰면 list의 마지막이 null이 아닌거만 즉, 하나만 들어가네?

											//00:57	  }
												} else {
											//printStr = printStr + "<div class=\"content\"></div>";
											contentW = "<li><div class=\"content\"></div></li>"; //여어기도,,
												}
												//}	
											}
											// for 일자수*listsize*list에들어있는 값 ㅇㅇ 만큼 반복하는 for문
										} //for : list 일자수*listsize만큼 반복하는 for문
											//System.out.println("printStr : "+printStr);
											//for
											//else if (content != null ) { //현재날짜와 데이터베이스의 날짜가 같지않을때
											//else if (content != null  && Integer.parseInt(nowDate) != dataBaseNowDate) { //현재날짜와 데이터베이스의 날짜가 같지않을때
											//즉 위의 시작날짜에는 청소를 찍었으나 다음날짜도 찍어여하므로 아래 조건문이 맞아야 청소가 찍힌다.
											//				    String preDate = nowYear + nowMonth +  (Integer.toString((i - 1)).length() == 1 ? "0" + Integer.toString((i - 1)) : Integer.toString((i - 1))); //현재날짜의 이전날짜
											//				    if (Integer.parseInt(preDate) == dataBaseNowDate && Integer.parseInt(nowDate) == dataBaseNextDate) { 
											//				     printStr = printStr + "<div class=\"content\">" + content + "</div>";
											//				     break list;
											//				    }
											//}//else
											// }
											//}
										%>

										<td>
											<p class="day"><%=printStr%></p>

											<ul class="item">

												<%=contentW%>
												<!-- </li> -->
											</ul>
											<div class="itemLayer"></div>
										</td>

										<%
										//System.out.print((dayOfWeek-1+i)%7+"/");
										temp = (dayOfWeek - 1 + i) % 7;
										if ((dayOfWeek - 1 + i) % 7 == 0) {
										%>

									</tr>
									<tr>
										<%
										} // if
										}
										//System.out.println(temp);//for 
										//System.out.println(2%7);
										if (temp != 0) {
										//for(int m=1;m<8-temp;m++){
										for (int m = 0; m < 7 - temp; m++) {
										%>
										<td></td>
										<%
										}
										}
										%>


									</tr>


									<!-- <td></td> -->
									<!-- <form name="dataFrm" id="dataFrm" action=""></form>
														<input type="hidden" id="searchYear" value="2022">
														<input type="hidden" id="searchMonth" value="8">
														<input type="hidden" id="searchSMonth" value="9"> -->

									<!-- </tr> -->
								</tbody>
								<script></script>
							</table>
							<!-- ✨ -->
						</div>

						<ul class="performanceCalendar__list"></ul>
					</div>

					<input type="hidden" id="searchCatePlaceData"
						value="1001,1002,1008,1006" />

				</div>
			</div>

		</div>
		<!-- #cont -->

		<!----------------------------------------------여기서부터 끝까지 footer-------------------------------------------->

		<!-- Footer -->

		<c:import
			url="http://localhost/group2_prj/common/user_allPage_footer.jsp" />

		<!-- End footer -->
		<script>
			$(function() {
				$("#year").change(function() {
					$("#selectDateForm").submit();
				})
				$("#month").change(function() {
					$("#selectDateForm").submit();
				})
			})
		</script>
		<!-- Scripts -->
		<script src="http://localhost/group2_prj/assets/js/jquery.min.js"></script>
		<script
			src="http://localhost/group2_prj/assets/js/jquery.dropotron.min.js"></script>
		<script src="http://localhost/group2_prj/assets/js/browser.min.js"></script>
		<script src="http://localhost/group2_prj/assets/js/breakpoints.min.js"></script>
		<script src="http://localhost/group2_prj/assets/js/util.js"></script>
		<script src="http://localhost/group2_prj/assets/js/main.js"></script>
		<!-- tap관련 추가한거 -->
		<script src="http://localhost/group2_prj/assets/js/tab.js"></script>
</body>
</html>


<!-- 2022-10-19 23:19 -->