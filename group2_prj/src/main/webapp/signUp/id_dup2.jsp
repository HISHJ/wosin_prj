<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.SQLException"%>

<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>

 <jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="session"/>
 <jsp:setProperty property="memberId" name="mbVO"/>   
<%



MemberDAO mbrDAO = MemberDAO.getInstance();

try{
	//DB조회
boolean result=mbrDAO.selectChkId(mbVO);

JSONObject login = new JSONObject();
//조회결과를 JSONObject 저장
login.put("result", result);
out.print(login);
}catch(SQLException se){
	se.printStackTrace();
	
}
%>