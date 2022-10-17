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
    pageEncoding="UTF-8" info="예매취소, 좌석테이블 삭제 여부묻는 페이지" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 

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

function onstart(){
	// $( '#receipt_top' ).attr('style', "margin-top: -402px;");
}
 

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
		  alert("취소버튼을 누르셨습니다. 예매내역 페이지로 돌아갑니다.");
	      window.history.go(-1);
	  }catch(e){
		    history.back();
		    alert(e.message);
	  }
}//goBack
 
function complete_Rcancel(){
	$("#ReserveForm").submit();	  
}//complete_Rcancel()   

</script>

</head>
 
<body onload="onstart()">

<%request.setCharacterEncoding("UTF-8"); %>
<%
String firstDate = request.getParameter("findStartDate");
String endDate = request.getParameter("findEndDate");
String rId = request.getParameter("rId");
String rStatus= request.getParameter("rStatus");

/* if(rId == null){
	response.sendRedirect("http://localhost/group2_prj/reservation/ticket_page.jsp");
} */
System.out.println(rId);
System.out.println(rStatus);

RsrvtInfoVO ivo = new RsrvtInfoVO();
ivo.getRsrvtStatus();
ivo.getRsrvtId();

String[] staArr={"예매완료","예매취소"};
%>



<form name="ReserveForm" id="ReserveForm" method="post" action="http://localhost/group2_prj/reservation/ticket_cancel.jsp">
 <input type="hidden" name="findStartDate" id="findStartDate" value="<%=firstDate%>"/>
 <input type="hidden" name="findEndDate" id="findEndDate"  value="<%=endDate%>"/>
 <input type="hidden" name="rId" id="rId"  value="<%=rId%>"/>
 <input type="hidden" name="rStatus" id="rStatus"  value="<%=rStatus%>"/>
</form>


<section id="wrap">
<article class="pop_w modal_w">
	<div id="receipt_top" class="in pop-st1 pop-receipt" style="width: 40%;">
		<div class="tit-st2">
			<h2>예매내역 변경</h2>
			<button type="button" class="close-st1" onclick="javascrit:goBack();" >CLOSE</button>
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
			  <ul class="bul-dot f13 dot" style="margin-top:10px;list-style:none;">
			    <li class="item" style="list-style:none;">
			      <span class="t" style="font-size:17px;font-weight:bold">예매내역은 한번 취소하면 변경할 수 없습니다. 정말 취소하시겠습니까?</span> 
			     
			    </li>
			  </ul> 
				<div style="display:flex;align-items:center;">
			   <button class="btn-st1 bg-purple" onClick="complete_Rcancel();" >확인</button>
			   <button class="btn-st1 bg-purple" onclick="javascrit:goBack();">취소</button>
			   </div>
		</div>
			  
	</div>
</article>

<div class="pop_bg"></div>
</section>

</body>
</html>
