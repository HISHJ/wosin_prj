<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.co.sist.dao.AdminShowDAO"%>
<%@page import="kr.co.sist.vo.AdminShowVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="scriptlet의 사용"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://211.63.89.137/jsp_prj/common/css/main_v1_220901.css"/>
<style type="text/css">

</style>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!--제이쿼리-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">

</script>

</head>
<body>
<%-- <%
request.setCharacterEncoding("UTF-8");

AdminShowDAO asDAO=AdminShowDAO.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");

int price=Integer.parseInt(request.getParameter("price"));
String showId=request.getParameter("showId");
String genreId=request.getParameter("genreId");
String ratingId=request.getParameter("ratingId");
String name=request.getParameter("name");
String status=request.getParameter("status");
String thImg=request.getParameter("thImg");
String mImg=request.getParameter("mImg");
String infoImg=request.getParameter("infoImg");
String runningTime=request.getParameter("runningTime");
String startDate=request.getParameter("startDate");
String endDate=request.getParameter("endDate");
Date inputDate=sdf.parse(request.getParameter("inputDate")); 


//왜 이러는데
AdminShowVO asVO=new AdminShowVO(price,showId,genreId,ratingId,name,status,thImg,mImg,infoImg,runningTime,startDate,endDate, inputDate);
asDAO.insertShow(asVO); 
%>  --%>

					<!-- showAdd에서 '추가'버튼 누르면 값받아서 insert 처리해줌 -->
					<!-- AdminShowDAO에 insertshow 사용 -->
					
					<%request.setCharacterEncoding("UTF-8"); %>
				
					<!-- 1.parmeter를 받을 VO생성   -->
					
					<!-- useBean을 사용하여 MemberDAO와 MemberVO를 불러온다 -->
				   
					<jsp:useBean id="asVO" class="kr.co.sist.vo.AdminShowVO" scope="page"/>
					<!-- VO에 있는 모든 값을 set해줌  -->
					
					<jsp:setProperty property="showId" name="asVO"/>
					<jsp:setProperty property="name" name="asVO"/>
					<jsp:setProperty property="genreId" name="asVO"/>
					<jsp:setProperty property="startDate" name="asVO"/>
					<jsp:setProperty property="endDate" name="asVO"/>
					<jsp:setProperty property="runningTime" name="asVO"/>
					<jsp:setProperty property="ratingId" name="asVO"/>
					<jsp:setProperty property="price" name="asVO"/>
					<jsp:setProperty property="thImg" name="asVO"/>
					<jsp:setProperty property="mImg" name="asVO"/>
					<jsp:setProperty property="infoImg" name="asVO"/>
					<jsp:setProperty property="status" name="asVO"/> 
					
					<jsp:getProperty property="name" name="asVO"/>
					<jsp:getProperty property="showId" name="asVO"/>
					<jsp:getProperty property="genreId" name="asVO"/>
					<jsp:getProperty property="startDate" name="asVO"/>
					<jsp:getProperty property="endDate" name="asVO"/>
					<jsp:getProperty property="runningTime" name="asVO"/>
					<jsp:getProperty property="ratingId" name="asVO"/>
					<%-- <jsp:getProperty property="price" name="asVO"/> --%>
					<jsp:getProperty property="thImg" name="asVO"/>
					<jsp:getProperty property="mImg" name="asVO"/>
					<jsp:getProperty property="infoImg" name="asVO"/>
					<jsp:getProperty property="status" name="asVO"/> 
					
					
					
					 <%-- <% 
					AdminShowDAO asDAO = AdminShowDAO.getInstance();
					 try{
					 int cnt = asDAO.insertShow(asVO); //이게 문제라는 소린데 ...
					
					if(cnt==-1){%>
							alert("추가 실패");
					<%}else{%>
					
						alert("공연이 추가되었습니다");
					<% }//end if %>
					
					<%}finally{
						
					}%> --%>
				 
</body>
</html>