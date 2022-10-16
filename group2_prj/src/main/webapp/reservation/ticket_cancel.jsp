<%@page import="java.util.Enumeration"%>
<%@page import="kr.co.sist.vo.RsrvtInfoVO"%>
<%@page import="kr.co.sist.dao.RsrvtDAO"%>
<%@page import="javax.script.ScriptContext"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="예매취소, 좌석테이블 삭제 페이지" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%request.setCharacterEncoding("UTF-8"); %>
<%
String firstDate = request.getParameter("findStartDate");
String endDate =request.getParameter("findEndDate");
String rId = request.getParameter("rId");
String rStatus= request.getParameter("rStatus");

System.out.println("위치테스트"+firstDate);
System.out.println(endDate);
System.out.println(rId);
System.out.println(rStatus);
if(rId == null){
	response.sendRedirect("http://localhost/group2_prj/reservation/ticket_page.jsp");
} 
System.out.println(rId);
System.out.println(rStatus);

RsrvtInfoVO ivo = new RsrvtInfoVO();
ivo.getRsrvtStatus();
ivo.getRsrvtId();

String[] staArr={"예매완료","예매취소"};
%>

<%
request.setCharacterEncoding("UTF-8");
Enumeration rp = request.getParameterNames();
while(rp.hasMoreElements()){
	String getrp = rp.nextElement()+"";
	System.out.println("ticket_cancel.jsp @@@@request : "+getrp+":"+request.getParameter(getrp)); // values안하니까 좌석 하나만 나옴 ㅇㅇ
}
Enumeration se = session.getAttributeNames();
while(se.hasMoreElements()){
	String getse = se.nextElement()+"";
	System.out.println("ticket_cancel.jsp @@@@session : "+getse+":"+session.getAttribute(getse));
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=11" />
<title>예매내역 취소</title>
<link rel="stylesheet" type="text/css" href="https://flexfile.sejongpac.or.kr/Flex/Rsv/102103/css/style.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>


<SCRIPT language="JavaScript">
var ScriptPreFix ="/Flex";
</script>

<script type="text/javascript" src="https://flexfile.sejongpac.or.kr/Flex/Rsv/102103/js/jquery-ui-1.10.3.custom3.js"></script>


<script src="https://flexfile.sejongpac.or.kr/Flex/Rsv/102103/js/comm.js"></script>
<script src="https://flexfile.sejongpac.or.kr/Flex/Rsv/102103/js/common.js"></script>

				
<script type="text/javascript">

var PROGRAM_LIST ;
var PROGRAM_LIST_COUNT ;
var SEAT_ARRAY_LIST ;
$(function(){
	 
	
	function ViewPrint(){
		$( '#wrap' ).hide();
		$( '.pop_btn_w2' ).hide();
		window.print();
		$( '#wrap' ).show();
		$( '.pop_btn_w2').show();
	}
	
	
	function goMypageList(){
		
	
	}
	
	function fn_tranList(){
		$('.box_r').hide();
		var Listidx = $("#PTRS4224_TRAN").val();
		$('#'+Listidx).show();
	}
	
	function goBack(){
		  try{
		      window.history.go(-2);
		  }catch(e){
			    history.back();
			    alert(e.message);
		  }
	}
})
</script>
<script type="text/javascript">
$(function(){
	$("#okTest").click(function(){
		location.href="http://localhost/group2_prj/reservation/ticket_page.jsp";
	})
});

</script>
</head>
 
<body>




<jsp:useBean id="rVO" class="kr.co.sist.vo.RsrvtInfoVO" scope="page"/>
		  
<jsp:setProperty property="rsrvtStatus" name="rVO" value="<%= staArr[1]%>"/>
<jsp:setProperty property="rsrvtId" name="rVO" value="<%= rId %>"/>

<%
RsrvtDAO rDAO= RsrvtDAO.getInstance();
int cnt = rDAO.updateRsrvt(rVO);
boolean flag = false;
String msg = rId + "번은 예매내역을 변경할 수 없습니다.";
if(cnt ==1){
	msg = rId + "번의 예매내역을 성공적으로 취소하였습니다.";
	flag=true;
}%>
<% 
if(flag){ //업데이트가 된 경우
 //delete작업수행
 int dlCnt = rDAO.deleteSeat(rId);
 String dmsg =rId + "번 예매코드의 좌석은 삭제할 수 없습니다.";
 if(dlCnt != 0){//삭제된 레코드가 1행 또는 n행인 경우
	dmsg = rId + "번 예매코드의 좌석이" + dlCnt + "건 삭제되었습니다"; 
 }//end if
  System.out.println(dmsg);	//사용자에게 보여져야 할 부분이 아니기 때문에 console에만 확인메시지 보냄
}
%>
<form name="ReserveForm" method="post" onsubmit="return false;">
<section id="wrap">
<article class="pop_w modal_w">
	<div id="receipt_top" class="in pop-st1 pop-receipt" style="width: 40%;">
		<div class="tit-st2">
			<h2>예매내역 변경</h2>
			<button type="button" class="close-st1" onclick="location.href='http://localhost/group2_prj/reservation/ticket_page.jsp';" >CLOSE</button>
		</div>

    <div class="cont">
			<div class="box_r">
			  
			  <ul class="box1 com bul-dot">
			    <li class="item">
			      <span >예매번호</span>
			      <span class="datat"><%= rId %></span>
			    </li>
			    
			     
			    <li class="item">
			      <span class="t">예매상태</span>
			      <span class="datat"> <%=rStatus %>  ▶ <%=staArr[1]%></span>
			    </li>
			   
			    
			  </ul>
		  </div>
			  <ul class="bul-dot f13 dot" style="margin-top:10px;">
			    <li class="item">
			      <span class="t" style="font-size:17px;font-weight:bold"><%=msg%></span> 
			     
			    </li>
			  </ul>
			  <button class="btn-st1 bg-purple" id="okTest">확인</button>
		</div>
			  
	</div>
</article>

<div class="pop_bg"></div>
</section>
</form>
</body>
</html>
