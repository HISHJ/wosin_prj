<%@page import="kr.co.sist.dao.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="아이디 중복확인" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://211.63.89.130/jsp_prj/common/css/main_v1_220901.css"/>
<style type="text/css">
#dupWrap{ margin: 0px auto; width: 502px; height: 303px; position: relative;}
#dup{ width: 502px; height: 303px;}
#frm{ position: absolute;top:100px; left:60px; }
#view{position: absolute;top:200px; left:60px;  }
</style>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <!-- Bootstrap JS -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		chkNull();
	});//click
	
	$("#memberId").keydown(function( evt ){
		if(evt.which == 13){
			chkNull();
		}//end if
	});//keydown
	
});//ready
function chkNull(){
	var id=$("#memberId").val();
	if(id == ""){
		alert("중복 검사할 아이디를 입력해 주세요.");
		return;
	}//end if
	
	
	//아이디 특수문자 제외 영문,숫자 4~20자이내+중복검사 필수
	 if(!id.match('^[a-zA-Z0-9]{4,20}$')) {
			 alert('아이디는 특수문자를 제외한 영문, 숫자 조합 4~20자로 사용 가능합니다.');
			$('#memberId').focus();
			 return ;
		 }//idcheck
	
	
	$("#frmDup").submit();
	
	
	
	
}//chkNull

function useId( memberId ){
	opener.window.document.board.memberId.value=memberId;
	self.close();
}//useId
</script>

</head>
<body>
<div id="dupWrap">
<div id="dup">
<div id="frm">
<form action="id_dup.jsp" method="get" id="frmDup">
<label>아이디</label> 
<input type="text" name="memberId" id="memberId" class="inputBox"/> 
<input type="text" style="display:none"/>
<input type="button" value="중복확인"  class="inputBox" id="btn"/>

</form>
</div>
 <c:if test="${ not empty param.memberId  }"> 
<jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="session"/>
<jsp:setProperty property="memberId" name="mbVO"/>
<%=mbVO %>
 <%
//DBMS 연동
MemberDAO mbrDAO = MemberDAO.getInstance();

boolean result=mbrDAO.selectChkId(mbVO);
pageContext.setAttribute("result",result);//true면 사용중, false 미사용
%>
<div id="view">입력하신 <strong><c:out value="${ param.memberId }"/></strong>는
<c:choose>
<c:when test="${ result }">
<span style="color: #FF0000">사용 중</span> 입니다.
</c:when>
<c:otherwise>
<span style="color: #0000FF">사용 가능</span> 합니다.<br/>
<a href="#void" onclick="useId('${ param.memberId }')">사용</a>
</c:otherwise>
</c:choose>
</div>
</c:if>

</div>
</div> 
</body>
</html>