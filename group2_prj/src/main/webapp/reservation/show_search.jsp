<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="kr.co.sist.vo.ShowVO"%>
<%@page import="kr.co.sist.dao.ShowDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<%
//세션 넘겨받기 검증 완료 //2022-10-16 13:05 유설빈
String memberId = (String)session.getAttribute("memberId");
%>
   
    <%
    //ShowVO sVO= new ShowVO();//<select할떄 필요할까 > 아닐듯? > 
    String sdate = request.getParameter("sdate"); 
    String edate = request.getParameter("edate"); 
    String toDate = request.getParameter("totaldate");
    String genreId = request.getParameter("genreId");
    String name = request.getParameter("name");
    
    ShowVO sVO=new ShowVO();
    sVO.setSdate(sdate);
    sVO.setEdate(edate);
    sVO.setGenreId(genreId);
    sVO.setName(name);
    ShowDAO sDAO=ShowDAO.getInstance();
    List<ShowVO> showList=sDAO.selectSearch(sVO); 
    
    //값 받아지는지 테스트중 - 시작일 끝일은 버튼 눌렀을 때 값전송 자체가 안됨 (유) (fn_search 때문이었음 ajax배우면 될 것 같긴 함)
    /* System.out.println("장르 "+genreId);
    System.out.println("시작일 "+sdate);
    System.out.println("끝일 "+edate); */
    
    %>   
    
   
    
<!DOCTYPE HTML>
<html>
   <head>
      <title>공연일정|검색</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      
      <!-- 부트스트랩 -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      
      <link rel="stylesheet" href="http://localhost/group2_prj/assets/css/main.css" />
      <link rel="stylesheet" href="http://localhost/group2_prj/assets/css/reset.css">
      <link rel="stylesheet" href="http://localhost/group2_prj/assets/css/headerFooter.css">
      <link rel="stylesheet" href="http://localhost/group2_prj/assets/css/subheader.css">
      
      <!-- 공연상세페이지만을 위한 css -->
      <link rel="stylesheet" href="http://localhost/group2_prj/assets/css/NewFile.css">
      <link rel="stylesheet" href="http://localhost/group2_prj/assets/css/perform.css">
      
      <!--google icons-->
      <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
      <!--google fonts-->
      <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
      
      <!--제이쿼리--> <!--  이놈 빌런이다 조심해 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
   	<%if(memberId == null){  //2022-10-16 13:05 유설빈%>
	<style>
	#nav {
	margin-right: 130px;
	}
	</style>
	<%} %>

   <style>
  
   
   .txtColor{color: #111111;}
   a:hover{color: #111111;}
   </style>
   <script type="text/javascript">
   
   $(function(){
      //장르 클릭
      $("#genreId").change(function() {
         $("#genreFrm").submit();
         //fn_search('1');
      });
      
      //공연명 검색
      $("#nameSearchBtn").click(function() {
         var name=$("#name").val();
         //alert(name);
         
         $("#nameFrm").submit();
         
      });
      
      // 날짜검색 버튼
      $('[name="schRange"]').on('click', function(){
         var today=new Date();
         var year=today.getFullYear();
         var month=("0" + (1 + today.getMonth())).slice(-2);
         var date=("0" + today.getDate()).slice(-2); //문제시 date 두개 쓴 이부분
         var sdate=year+"-"+month+"-"+date;
         
         //var sdate = "2022-10-12";
         var date = new Date(sdate);
         var schRange = $(this).val();
         
         
          if(schRange == 1){ // 오늘
         }else if(schRange == 2){ // 7일
            date.setDate(date.getDate() + 7);
         }else if(schRange == 3){ // 1개월
            date.setMonth(date.getMonth() + 1);
         }else if(schRange == 4){ // 3개월
            date.setMonth(date.getMonth() + 3);
         }else if(schRange == 5){ // 12개월
            var yearData = parseInt($("#yearData").text());
            sdate = new Date(sdate);
   
            sdate.setFullYear(yearData ,0,1);
            date.setFullYear(yearData ,11,31);
            
            sdate = dateFormat(sdate);
         }
         
         $("#period1").val(sdate);
         $("#period2").val(dateFormat(date));
         $(".datepickerRange").val(sdate + " ~ " + dateFormat(date));
         //fn_search2('1');
         
         $("#dateFrm").submit(); //2022-10-12 유설빈
         
      });
      
      
      //년도 < 버튼
      $('.prev').on('click', function(){
         var yearData = parseInt($("#yearData").text());
         var sdate = new Date($("#period1").val());
         var edate = new Date($("#period2").val());
         sdate.setFullYear(yearData - 1,0,1);
         edate.setFullYear(yearData - 1,11,31);
         
         sdate = dateFormat(sdate);
         edate = dateFormat(edate);
         
         $("#yearData").html(yearData - 1);
         $("#period1").val(sdate);
         $("#period2").val(edate);
         $(".datepickerRange").val(sdate + " - " + edate);
         $('#range5').prop('checked', true);
         //fn_search(1);
      });
      
      //년도 > 버튼
      $('.next').on('click', function(){
         var yearData = parseInt($("#yearData").text());
         var sdate = new Date($("#period1").val());
         var edate = new Date($("#period2").val());
         sdate.setFullYear(yearData + 1,0,1);
         edate.setFullYear(yearData + 1,11,31);
         
         sdate = dateFormat(sdate);
         edate = dateFormat(edate);
         $("#yearData").html(yearData + 1);
         $("#period1").val(sdate);
         $("#period2").val(edate);
         $(".datepickerRange").val(sdate + " - " + edate);
         $('#range5').prop('checked', true);
         //fn_search(1);
      });
      
   }); //ready 
   
   function dateFormat(date) {
       var year = date.getFullYear();
       var month = ("0" + (1 + date.getMonth())).slice(-2);
       var day = ("0" + date.getDate()).slice(-2);
       return year + "-" + month + "-" + day;
   }//dateFormat
   
    function fn_search(pageNo) {
         
         if (pageNo != null || pageNo != undefined ) {
            document.frm.pageIndex.value = pageNo;
         }
         var data = $("#dateFrm").serialize();
         var url = "http://localhost/group2_prj/reservation/show_search_process.jsp";
         $.ajax({
            type: 'post',
            url: url,
            data: data ,
            dataType: "html",
            cache: false,
            success: function(data) {
               $("#performList").html(data);
              }
         });
      } 
   
   
   
   </script>
   </head>
   <body class="homepage is-preload">
      <div id="page-wrapper">

		<!-- //2022-10-16 13:05 유설빈  -->
       <c:import  url="http://localhost/group2_prj/common/user_subpage_header.jsp" > 
    	<c:param name="memberId" value="<%= memberId %>"></c:param> 
    	</c:import>
   		

                  <!--❤️여기에 서브제목 입력하세욮 ex) 공연일정-->
                  <div id="sut-t_wrap">
                  <h2 id="sub-t">
                     <strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">공연일정</strong>
                  </h2>
               </div>
               
               </section>
            </div>

                  <!--------------------------------------위까지가 헤더----------------------------------------->
<!-- Main -->
<section id="main">
   <div class="container">

                  <!-- Content -->
                  <!-- 2022 10 12 23:44  유설빈 수정중(hidden 값 받아오기)  -hidden에 따로 form추가-->
   <article class="box post bbs-today_w">   
      <form name="dateFrm" id="dateFrm" method="get">
         <input type="hidden" name="pageIndex" value="">
         <input type="hidden" name="menuNo" value="200004">
         <input type="hidden" name="searchPackage" value="">
         <input type="hidden" name="searchSort" id="searchSort" value="1">
         <input type="hidden" name="nowCheck" value="">
         
         <div class="schedule__date">
            <div class="item" style="height: 80px">
               <input type="radio" name="schRange" id="range1" value="1" />
               <input type="radio" name="schRange" id="range1" value="1" style="display:none;"/>
               <label for="range1">오늘</label>
               <input type="radio" name="schRange" id="range2" value="2" />
               <input type="radio" name="schRange" id="range1" value="1" style="display:none;"/>
               <label for="range2">1주</label> 
               <input type="radio" name="schRange" id="range3" value="3" checked/>
               <input type="radio" name="schRange" id="range1" value="1" style="display:none;"/>
               <label for="range3">1개월</label>
               <input type="radio" name="schRange" id="range4" value="4" />
               <input type="radio" name="schRange" id="range1" value="1" style="display:none;"/>
               <label for="range4">3개월</label>
               <input type="radio" name="schRange" id="range5" value="5" />
               <input type="radio" name="schRange" id="range1" value="1" style="display:none;"/>
               <label for="range5">전체</label>
            </div>
            <a href="javascript:void(0);" class="arrow prev">이전</a>
            
            <p class="txt" id="yearData">2022</p>
            <a href="javascript:void(0);" class="arrow next">다음</a>
         </div>
      
         
         <!-- <form id="hidfrm" name="hidfrm" method="get"> -->
         <div class="schedule_w item5">
            <ul class="clearfix">
               <li class="item s1" tabindex="0">
                  <div class="cont rangeArrow">
                     <input type="hidden" name="sdate" class="sdate" id="period1" />
                     <input type="hidden" name="edate" class="edate" id="period2" />
                     <input type="text" id="totaldate" name="totaldate" class="datepickerRange" />
                  </div>
               </li>
         <!-- </form>    -->   
            </form>
      
               
               <li class="item s2" tabindex="0">
               <form name="genreFrm" id="genreFrm">
                  <div class="cont rangeArrow">
                     <select name="genreId" id="genreId">
                          <option value="">장르보기</option>
                          <option value="G1">국악</option>
                          <option value="G2">연극</option>
                          <option value="G6">무용</option>
                          <option value="G3">오페라</option>
                          <option value="G4">뮤지컬</option>
                          <option value="G5">클래식</option>
                     </select>
                  </div>
               </form>
               </li>
               <li class="item s4" tabindex="0">
               <form name="nameFrm" id="nameFrm" method="get">
                  <label for=name class="hide">공연명은?</label>
                  <div class="cont">
                     <input type="hidden" name="searchCnd" value="1" />
                     <input type="text" name="name" id="name" placeholder="공연명을 입력하세요."/>
                     <button type="button" name="nameSearchBtn" id="nameSearchBtn" value="검색">검색</button>
                  </div>
                  </form>
               </li>
            </ul>
         </div>
         <div class="top clearfix">
            <div class="category">
               <span class="active">
                  <a href="page1.jsp" onfocus="this.blur()" >전체보기</a> <!-- 링크클릭시 border 없앰 -->
               </span>
            </div>
         </div>
            
         
      <!-- css 글자 영역 삐져나오는 것 수정 / 리스트 나열 고르게 수정 2022-10-16 유설빈 -->
      <!-- p에 있는 텍스트 마우스오버시 색상 안바뀌게, 이미지 배열 >> 수정완료-->
        <div id="performList" class="poster_wrap bbs-today_thumb clearfix">
           <div class="row row_flex" style="margin-left: 0.1px" >
            <%for(int i=0; i<showList.size(); i++){ %>
                 <div class="col set" style="display:flex;flex-wrap:wrap;justify-content:space-between;"  >
               <div class="card" style="width: 19rem;margin-bottom:20px;">
                  <a href="http://localhost/group2_prj/reservation/show_info.jsp?showId=<%=showList.get(i).getShowId() %>">
                  <img src="http://localhost/group2_prj/admin/img/<%=showList.get(i).getThImg() %>" class="card-img-top" alt="...">
                   <div class="card-body" style="white-space: normal;">
                   <h5 class="card-title h3"><%=showList.get(i).getName() %></h5>
                   <p class="card-text txtColor"><%=showList.get(i).getStartDate() %> ~ <%=showList.get(i).getEndDate() %></p>                    
                   <p class="card-text txtColor"><%=showList.get(i).getGenreId() %></p>
                   </div>
                    </a>
               </div>
             </div>
             <%} %>
          </div>
         </div>
      
                  <!-- 따온거 끝  -->
      </article>
   </div>
</section>
            

            <!----------------------------------------------여기서부터 끝까지 footer-------------------------------------------->

       <!-- Footer -->
			
			<c:import url="http://localhost/group2_prj/common/user_allPage_footer.jsp"/> 
			
			<!-- End footer -->
      <!-- </div> -->

      <!-- Scripts -->
         <script src="../assets/js/jquery.min.js"></script>
         <script src="../assets/js/jquery.dropotron.min.js"></script>
         <script src="../assets/js/browser.min.js"></script>
         <script src="../assets/js/breakpoints.min.js"></script>
         <script src="../assets/js/util.js"></script>
         <script src="../assets/js/main.js"></script>
         
         <!-- 추가한거 -->
         <script src="../assets/js/tab.js"></script>

   </body>
</html>