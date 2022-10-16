<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="로그아웃 클릭시 호출되는 페이지" %>

<%
if(session.getAttribute("memberId") != null){
session.removeAttribute("memberId"); //세션 값 초기화%>
<script type="text/javascript">
$(function(){
alert("로그아웃되었습니다.");
location.href="http://localhost/group2_prj/main/index.jsp";
});
</script>
<%}%>

