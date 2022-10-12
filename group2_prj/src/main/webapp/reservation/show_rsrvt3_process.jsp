<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="kr.co.sis.vo.RsrvtInfoVO"%>
<%@page import="java.util.List"%>
<%@page import="ko.co.sis.dao.RsrvtDAO"%>
<%@page import="kr.co.sis.vo.ShowVO"%>
<%@page import="ko.co.sis.dao.MainDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%

	// ✅✅ ✅✅ ✅✅ 예매에 insert
	// 		좌석에 insert
	request.setCharacterEncoding("UTF-8");
	Enumeration rp = request.getParameterNames();
	while(rp.hasMoreElements()){
		String getrp = rp.nextElement()+"";
		System.out.println("@@@@request : "+getrp+":"+request.getParameter(getrp)); // values안하니까 좌석 하나만 나옴 ㅇㅇ
	}
	Enumeration se = session.getAttributeNames();
	while(se.hasMoreElements()){
		String getse = se.nextElement()+"";
		System.out.println("@@@@session : "+getse+":"+session.getAttribute(getse));
	}
	
	//✅✅ 세션에서 id를 받아서 이름을 받아와서 여기에 넣는다? 뭐가 데이터가 왜이렇게 엉키는거같지
			
	//10-09 rsrvtInfoVO 에 schTime, schDate 있는데 예매테이블에는 ShowDate밖에없음 이거 합쳐서 넣어야할거같음
	
	RsrvtDAO rDAO = RsrvtDAO.getInstance();
	// 지금 세션에 showid, schid 있고 request에 총금액, 선택된 좌석있음.
	// RsrvtInfoVO에 들어가야할값
	String[] seats = request.getParameterValues("seats");
	String schId = (String)session.getAttribute("schTest");
	
	// 비연결성의 문제때문에 상영일정코드, 좌석번호배열 넣고 돌리기 insert하기전에 해야지
	if(rDAO.selectSeatChk(schId, seats)){
		//System.out.println("이미예약된 좌석이 ㅇㅇ");%>
		<script>
		location.href="show_rsrvt3_process_temp_test.jsp";
		</script>
	<%} else {
		//System.out.println("이미예약된 좌석이 ㄴㄴ");
	
	List<RsrvtInfoVO> riList = new ArrayList<RsrvtInfoVO>();
	RsrvtInfoVO rVO = null;
	for(int i=0;i<seats.length;i++){ 
		rVO = new RsrvtInfoVO();
		
		rVO.setShowId((String)session.getAttribute("showId"));
		rVO.setSchId((String)session.getAttribute("schTest"));
		/* rVO.setMemberId((String)session.getAttribute("memberid")); */
		/* rVO.setMemberName((String)session.getAttribute("membername")); */
		rVO.setShowName(request.getParameter("showName"));
		rVO.setSchDate(request.getParameter("date"));
		rVO.setSchTime(request.getParameter("time"));
 		rVO.setSeatId(seats[i]); 
		rVO.setRsrvtCnt(seats.length);
		rVO.setTotalPrice(Integer.parseInt(request.getParameter("totalPrice")));	
		
		riList.add(rVO);
	} 
	
	boolean flag = false;
	//if(rDAO.insertRsrvtTest(rVO)==1){
	//	System.out.println("ㅇㅇ됐음");		 풀어야함		
	//	flag = true;
	//}
	
	// 예매번호를 받아야함
	String rsrvtId = rDAO.selectRsrvtId(rVO);
	
	System.out.println(rsrvtId);
	
	int test = 0;
	//if(flag){	
	//	test = rDAO.insertSeatTest(riList,rsrvtId);		풀어야함
	//} 
	
		
	//if(test==riList.size()){           
		System.out.println(test+"개추가");

// 넘어온 예매번호도 rVO에 넣어줘야겠는데?
	rVO.setRsrvtId(rsrvtId);

	//되나? 10-10 20:59 test
// 1010 21:17 RequestDispatcher 사용테스트
// 근데 굳이 이걸로해야하나? 세션에넣어서 진행하고 마지막페이지에서 제일밑에 세션초기화 넣으면 안되는건가
	RequestDispatcher rd = request.getRequestDispatcher("show_rsrvt4.jsp");
	request.setAttribute("req_rVO", rVO);
	//System.out.println("show_rsrvt3_process"+rVO.toString());
	//request.setAttribute("requestrVO", rVO); action으로 넘어가는게아니고 그냥 location.href로 이동하는거라 null이뜨나?
			
	//session.setAttribute("ses_rVO", rVO); RequestDispatcher로 대체
	
	rd.forward(request,response);
	}
	//} // test==riList.size() if end
%>
