<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.SQLException"%>

<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>

 <jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="session"/>

<%request.setCharacterEncoding("UTF-8"); 

String id=request.getParameter("memberId");

//key가져오기
ServletContext sc = getServletContext();
String plainText = sc.getInitParameter("keyU"); 
//System.out.println( plainText );

//알고리즘 설정하여 MessageDigest
MessageDigest md=MessageDigest.getInstance("MD5");
md.update(plainText.getBytes());
new String(md.digest());
//키 생성
String key=DataEncrypt.messageDigest("MD5", plainText);
//키를 넣어 암호화 객체 생성
DataEncrypt de= new DataEncrypt(key);


String Id=de.encryption(id);

MemberDAO mbrDAO = MemberDAO.getInstance();

try{
	//DB조회
	
boolean result=mbrDAO.selectChkId(Id);

JSONObject login = new JSONObject();
//조회결과를 JSONObject 저장
login.put("result", result);
out.print(login.toJSONString());
}catch(SQLException se){
	se.printStackTrace();
	
}
%>