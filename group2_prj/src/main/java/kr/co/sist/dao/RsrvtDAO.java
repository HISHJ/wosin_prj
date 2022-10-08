package kr.co.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.PseudoColumnUsage;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import adminVO.AdminRsrvtInfoVO;
import dbConnection.DbConnection;
import userVO.RsrvtInfoVO;
import userVO.SeatVO;

/**
 * 반환형인 것들은 오류 안생기게 method 내부에 값만 넣어놨어요
 * @author user
 */
public class RsrvtDAO {
	
	//싱글톤
	private static RsrvtDAO rsrvtDAO;
	
	private RsrvtDAO() {

	}//RsrvtDAO
	
	
	public static RsrvtDAO getInstance() {
		if(rsrvtDAO == null) {
		    rsrvtDAO = new RsrvtDAO();
		}
		
		return rsrvtDAO;	
	}//getInstance
	
	//✔검증완료a
	/*+(추가)일반적으로 페이지 누르면 날짜를 선택하지 않아도 조회되어있는 상태의 예매내역
	--조회기간은 예매일 기준 7일 전 ~ 현재날짜*/	
	public List<RsrvtInfoVO> selectDefaultRsrvt(String id) throws SQLException {
		List<RsrvtInfoVO> defaultRsrvtlist = new ArrayList<RsrvtInfoVO>();
		
		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dc.getConn();
			StringBuilder selectRservt = new StringBuilder();
			selectRservt.append(" select to_char(r.inputdate,'yyyy-mm-dd') r_inputdate, r.rsrvtid r_rsrvtid, sho.name sho_name, r.showdate r_showdate, r.totalcnt r_totalcnt, r.totalpice r_totalprice, r.status r_status ")
			            .append(" from rsrvt r, show sho, member m ")
			            .append(" where (r.memberid = m.memberid and r.showid = sho.showid) and m.memberid = ? "
			            		+ " and r.inputdate between (sysdate - (interval '1' month)) and sysdate");
//						.append(" order by ? ");
			
		pstmt = con.prepareStatement(selectRservt.toString());
		pstmt.setString(1, id);
	
		
		rs = pstmt.executeQuery();
		RsrvtInfoVO rsrvtVO = null;
		
		while(rs.next()) {
			rsrvtVO = new RsrvtInfoVO();
			
			rsrvtVO.setRsrvtInputDate(rs.getDate("r_inputdate"));
			rsrvtVO.setRsrvtId(rs.getString("r_rsrvtid"));
			rsrvtVO.setShowName(rs.getString("sho_name"));
			rsrvtVO.setShowDate(rs.getString("r_showdate"));
			rsrvtVO.setRsrvtTotalCnt(rs.getInt("r_totalcnt"));		
			rsrvtVO.setTotalPrice(rs.getInt("r_totalprice"));
			rsrvtVO.setRsrvtStatus(rs.getString("r_status"));
			
			defaultRsrvtlist.add(rsrvtVO);
				
		}
			
		}finally {
			dc.dbClose(rs, pstmt, con);
		}
		
		
		
		return defaultRsrvtlist;	
	}//selectShow
	
	public RsrvtInfoVO selectDefaultRsrvt2(String id) throws SQLException {
		RsrvtInfoVO defaultRsrvtlist = null;
		
		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dc.getConn();
			StringBuilder selectRservt = new StringBuilder();
			selectRservt.append(" select to_char(r.inputdate,'yyyy-mm-dd') r_inputdate, r.rsrvtid r_rsrvtid, sho.name sho_name, r.showdate r_showdate, r.totalcnt r_totalcnt, r.totalpice r_totalprice, r.status r_status ")
			            .append(" from rsrvt r, show sho, member m ")
			            .append(" where (r.memberid = m.memberid and r.showid = sho.showid) and m.memberid = ? "
			            		+ " and r.inputdate between (sysdate - (interval '1' month)) and sysdate");
//						.append(" order by ? ");
			
		pstmt = con.prepareStatement(selectRservt.toString());
		pstmt.setString(1, id);
	
		
		rs = pstmt.executeQuery();
		RsrvtInfoVO rsrvtVO = null;
		
		if(rs.next()) {
			rsrvtVO = new RsrvtInfoVO();
			
			rsrvtVO.setRsrvtInputDate(rs.getDate("r_inputdate"));
			rsrvtVO.setRsrvtId(rs.getString("r_rsrvtid"));
			rsrvtVO.setShowName(rs.getString("sho_name"));
			rsrvtVO.setShowDate(rs.getString("r_showdate"));
			rsrvtVO.setRsrvtTotalCnt(rs.getInt("r_totalcnt"));		
			rsrvtVO.setTotalPrice(rs.getInt("r_totalprice"));
			rsrvtVO.setRsrvtStatus(rs.getString("r_status"));
			
			//defaultRsrvtlist.add(rsrvtVO);
				
		}
			
		}finally {
			dc.dbClose(rs, pstmt, con);
		}
		
		
		
		return defaultRsrvtlist;	
	}//selectShow
	
	//검증완료✔✔
	//사용자가 날짜를 설정했을 때 조회되는 예매내역
	public List<RsrvtInfoVO> selectRsrvt(RsrvtInfoVO rVO) throws SQLException {
		List<RsrvtInfoVO> rsrvtlist = new ArrayList<RsrvtInfoVO>();
		
		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dc.getConn();
			StringBuilder selectRservt = new StringBuilder();
			
			selectRservt.append(" select to_char(r.inputdate,'yyyy-mm-dd') r_inputdate,r.rsrvtid r_rsrvtid, sho.name sho_name, r.showdate r_showdate, r.totalcnt r_totalcnt, r.totalpice r_totalprice, r.status r_status ")
            .append(" from rsrvt r, show sho, member m ")
            .append(" where (r.memberid = m.memberid and r.showid = sho.showid) and m.memberid = ? "
            		+ " and ( ? < to_char(r.inputdate,'yyyy-mm-dd') and to_char(r.inputdate,'yyyy-mm-dd') < ? ) ")
            .append(" order by r_inputdate ");
			
		pstmt = con.prepareStatement(selectRservt.toString());
		pstmt.setString(1, rVO.getMemberId());
		pstmt.setString(2, rVO.getFindStartDate());
		pstmt.setString(3, rVO.getFindEndDate());
		
		
		rs = pstmt.executeQuery();
		RsrvtInfoVO rsrvtVO = null;
		
		while(rs.next()) {
			rsrvtVO = new RsrvtInfoVO();
			
			rsrvtVO.setRsrvtInputDate(rs.getDate("r_inputdate"));
			rsrvtVO.setRsrvtId(rs.getString("r_rsrvtid"));
			rsrvtVO.setShowName(rs.getString("sho_name"));
			rsrvtVO.setShowDate(rs.getString("r_showdate"));
			rsrvtVO.setRsrvtTotalCnt(rs.getInt("r_totalcnt"));		
			rsrvtVO.setTotalPrice(rs.getInt("r_totalprice"));
			rsrvtVO.setRsrvtStatus(rs.getString("r_status"));
			
			rsrvtlist.add(rsrvtVO);
				
		}
			
		}finally {
			dc.dbClose(rs, pstmt, con);
		}
		
		
		
		return rsrvtlist;	
	}//selectShow
	
	//✔검증완료
	//예매상세내역(예매코드)
	//조인했을 때 공연처음날짜 끝날자 사이의 값이 나오지 않는다.
	// 원래는 단일행인데 좌석번호때문에 LIST로 바꿔놓음(나중에 바꿔)
/*	public RsrvtInfoVO selectRsrvtDetail(String str) throws SQLException {
		RsrvtInfoVO rVO= null;
		
		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			con = dc.getConn();
			StringBuilder selectRsrvtDetail = new StringBuilder();
			selectRsrvtDetail.append(" select r_rsrvtid, listagg(s_seatid,',') s_seatid, sho_showid, r_membername ,r_showdate, r_totalcnt, sho_name, r_totalpice ")					
			                 .append(" from rsrvt_u_detail ")
			                 .append(" where r_rsrvtid = ? ")
			                 .append(" group by r_rsrvtid, sho_showid, r_membername, r_showdate, r_totalcnt, sho_name, r_totalpice ");
			
			pstmt = con.prepareStatement(selectRsrvtDetail.toString());
			pstmt.setString(1, str);
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rVO = new RsrvtInfoVO();
				rVO.setRsrvtId(rs.getString("r_rsrvtid"));
				rVO.setSeatId(rs.getString("s_seatid"));
				rVO.setShowId(rs.getString("sho_showid"));
				rVO.setMemberName(rs.getString("r_membername"));
				rVO.setShowDate(rs.getString("r_showdate"));
				rVO.setRsrvtTotalCnt(rs.getInt("r_totalcnt"));
				rVO.setShowName(rs.getString("sho_name"));
				rVO.setTotalPrice(rs.getInt("r_totalpice"));			
				
				//rVO.add(rsrvtVO);
		
			}
		}finally {
			dc.dbClose(rs, pstmt, con);
		}
		return rVO;
	}//selectRsrvtDetail*/
	
	public RsrvtInfoVO selectRsrvtDetail(String str) throws SQLException {
		RsrvtInfoVO rVO= null;
		
		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			con = dc.getConn();
			StringBuilder selectRsrvtDetail = new StringBuilder();
			selectRsrvtDetail.append(" select r_rsrvtid, listagg(s_seatid,',') s_seatid, sho_showid, r_membername ,r_showdate, r_totalcnt, sho_name, r_totalpice ")					
			                 .append(" from rsrvt_u_detail ")
			                 .append(" where r_rsrvtid = ? ")
			                 .append(" group by r_rsrvtid, sho_showid, r_membername, r_showdate, r_totalcnt, sho_name, r_totalpice ");
			
			pstmt = con.prepareStatement(selectRsrvtDetail.toString());

			pstmt.setString(1, str);
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rVO = new RsrvtInfoVO();
				rVO.setRsrvtId(rs.getString("r_rsrvtid"));
				rVO.setSeatId(rs.getString("s_seatid"));
				rVO.setShowId(rs.getString("sho_showid"));
				rVO.setMemberName(rs.getString("r_membername"));
				rVO.setShowDate(rs.getString("r_showdate"));
				rVO.setRsrvtTotalCnt(rs.getInt("r_totalcnt"));
				rVO.setShowName(rs.getString("sho_name"));
				rVO.setTotalPrice(rs.getInt("r_totalpice"));			
				
				//rVO.add(rsrvtVO);
		
			}
		}finally {
			dc.dbClose(rs, pstmt, con);
		}
		return rVO;
	}//selectRsrvtDetail
	
	//✔검증완료거
	//예매내역삭제(예매코드)
	/*public int deleteRsrvt(String str) throws SQLException {
		int deleteR=0;
		
		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		
		
		try {
			con = dc.getConn();
			String deleteRsrvt = " delete from rsrvt where rsrvtid=? ";
			pstmt = con.prepareStatement(deleteRsrvt);
			pstmt.setString(1, str);
			deleteR = pstmt.executeUpdate(); //0이면 삭제된 레코드 X
			
		}finally {
			dc.dbClose(null, pstmt, con);
		}	
		
		return deleteR;
	}//deleteRsrvt*/
	
	//예매상태 변경
	public int updateRsrvt(RsrvtInfoVO rVO) throws SQLException{
		int updateCnt=0;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = dc.getConn();
			StringBuilder updateCpEmp = new StringBuilder();
			
			updateCpEmp
			.append(" update rsrvt")
			.append(" set status = ?")
			.append(" where rsrvtid = ?");
			
			pstmt = con.prepareStatement(updateCpEmp.toString());
			
			pstmt.setString(1, rVO.getRsrvtStatus());
			pstmt.setString(2, rVO.getRsrvtId());
			
			updateCnt = pstmt.executeUpdate();
			
		}finally {
			dc.dbClose(null, pstmt, con);
		}
		return updateCnt;
	}

	
	
	
	//✔검증완료a
	//예매내역삭제 - 좌석 편 (예매상태로 유효성검사 해야할 듯)
	//이 예매코드의 예매상태가 "예매완료"라면 delete X
	//"예매취소"라면 delete
	public int deleteSeat(String str) throws SQLException {
		int deleteS=0;
		
		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dc.getConn();
			String deleteSeat = " delete from seat where rsrvtid=?  ";
			pstmt = con.prepareStatement(deleteSeat);
			pstmt.setString(1, str);
			deleteS = pstmt.executeUpdate(); 
			
		}finally {
		  dc.dbClose(null, pstmt, con);		
		}
		
		
		return deleteS;
	}//deleteSeat
	
	
	//✔검증완료ㄱ
	//✔공영상영날짜조회(공연코드)
	public List<String> selectShowSch(String str) throws SQLException {
		List<String> showSchList =new ArrayList<>();
		
		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dc.getConn();
			StringBuilder selectShowSch = new StringBuilder();
			selectShowSch.append(" select sch.schdate sch_schdate ")
			             .append(" from schedule sch, show sho  ")
			             .append(" where (sch.showid = sho.showid) and sho.showid=? ");
			
		pstmt = con.prepareStatement(selectShowSch.toString());
		
		pstmt.setString(1, str);
		
		rs = pstmt.executeQuery();
		//RsrvtInfoVO rsrvtVO = null;
		
		while(rs.next()) {
			//rsrvtVO = new RsrvtInfoVO();
			//rsrvtVO.setSchDate(rs.getString(" schdate "));
			
			showSchList.add(rs.getString("sch_schdate"));
		}	
			
		}finally {
			dc.dbClose(rs, pstmt, con);
		}	
		
		
		return showSchList;
	}//selectShowSch
	
	//조회결과 안나옴..
	public String selectSchTime(RsrvtInfoVO riVO) throws SQLException {
		String schTime="";
		
		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dc.getConn();
			StringBuilder selectSchTime = new StringBuilder();
			selectSchTime.append(" select schtime ")
						 .append(" from schedule  ")
						 .append(" where schdate = ? and showid= ? ");
			
			pstmt = con.prepareStatement(selectSchTime.toString());
			pstmt.setString(1, riVO.getSchDate());
			pstmt.setString(2, riVO.getSchTime());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
	           
				schTime = rs.getString("schtime");
			}
			
			
		}finally {
			dc.dbClose(rs, pstmt, con);
		}
		
		return schTime;
	}//selectSchTime
	
	
	//검증완료✔
	//✔좌석조회(상영정보(공연코드), 선택날짜) - 좌석 테이블에서 좌석컬럼의 레코드만 반환하면 되니까 List<String>
	//조인 : 좌석- 예매 - 공연- 공연일정
	//복합키 기준으로 짠 쿼리문.
	//좌석조회 역시 order by 로 순차적으로 조회되게 하면 좋을 듯
	public List<String> selectSeat(RsrvtInfoVO riVO) throws SQLException {
		List<String> seatlist=new ArrayList<String>();
		
		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dc.getConn();
			StringBuilder selectSeat = new StringBuilder();
			selectSeat.append(" select  se.seatid se_seatid  ")
			          .append(" from seat se, schedule sch, rsrvt r, show sho ")
			          .append(" where (se.rsrvtid = r.rsrvtid and se.schid = sch.schid ) and sch.schdate=? and sho.showid=?");
			

			pstmt = con.prepareStatement(selectSeat.toString());
			
		    pstmt.setString(1, riVO.getSchDate());
		    pstmt.setString(2, riVO.getShowId());
		    
		    rs = pstmt.executeQuery();		    
		   
		    while(rs.next()) {
		    	
		    	
		    	seatlist.add(rs.getString("se_seatId"));	
		    }
		}finally {
			dc.dbClose(rs, pstmt, con);
		}
	
		return seatlist;
	}//selectSeat
	
	//검증완료✔
	//예매하기
	// insert 시 예매번호 시퀀스도 추가되어야 함 (시퀀스 생성해야해)
	public int insertRsrvt(RsrvtInfoVO riVO) throws SQLException {
		int i=0;
		
		//DbConection클래스의 연결메소드 연결끊기, 메소드 가져오기
		DbConnection dc = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		//1.드라이버로딩
		try {
			//2.Connection연결얻기 (DbConnection 클래스의 getConn())
			con = dc.getConn();
			//3. 쿼리문 우선작성(bind)
		    String insertRsrvt =" insert into rsrvt(rsrvtid,showid,memberid,membername,totalcnt,showdate,totalpice,status,inputdate) values(?,?,?,?,?,?,?,?,to_char(sysdate,'yyyy-mm-dd'))";
		    //3-1. 쿼리문 생성객체 얻기
		    pstmt= con.prepareStatement(insertRsrvt);
		    //4. 바인드변수에 값 설정
		    pstmt.setString(1, riVO.getRsrvtId());
		    pstmt.setString(2, riVO.getShowId());
		    pstmt.setString(3, riVO.getMemberId());
		    pstmt.setString(4, riVO.getMemberName());
		    pstmt.setInt(5, riVO.getRsrvtTotalCnt());
		    //pstmt.setDate(6, riVO.getRsrvtInputDate());
		    pstmt.setString(6, riVO.getShowDate());   
		    pstmt.setInt(7, riVO.getTotalPrice());
		    pstmt.setString(8, riVO.getRsrvtStatus());
		
		    //5. 쿼리문 수행
		    pstmt.executeUpdate();
	
		}finally {
			dc.dbClose(null, pstmt, con);
		}
		
		
		
		return i;
	}//insertRsrvt
	
	//검증완료✔
	//좌석번호는 시퀀스X / 예매하기 과정에서 선택된 좌석번호가 추가될 것임	
	public int insertSeat(RsrvtInfoVO riVO) throws SQLException {
		int i=0;
	
		//DbConection클래스의 연결메소드 연결끊기, 메소드 가져오기
		DbConnection dc = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		//1.드라이버로딩
		try {
			//2.Connection연결얻기 (DbConnection 클래스의 getConn())
			con = dc.getConn();
			//3. 쿼리문 우선작성(bind)
		    String insertSeat =" insert into seat(seatid,rsrvtid,schid) values(?,?,?)";
		    //3-1. 쿼리문 생성객체 얻기
		    pstmt = con.prepareStatement(insertSeat);
		    //4.바인드변수에 값 설정
		    pstmt.setString(1, riVO.getSeatId());
		    pstmt.setString(2, riVO.getRsrvtId());
		    pstmt.setString(3, riVO.getSchId());
		    
		  //5. 쿼리문 수행
		    pstmt.executeUpdate();
		    
		}finally {
			dc.dbClose(null, pstmt, con);
		}
		
		
		return i;
	}//insertSeat
	
	
	

}//class
