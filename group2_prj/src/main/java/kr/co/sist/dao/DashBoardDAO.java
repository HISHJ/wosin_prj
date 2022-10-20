package kr.co.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.common.dao.DbConnection;
import kr.co.sist.vo.DashBoardVO;

public class DashBoardDAO {
	private static DashBoardDAO dashDAO;
	private DashBoardDAO() {
	}

	public static DashBoardDAO getInstance() {

		if (dashDAO == null) {
			dashDAO = new DashBoardDAO();
		}
		return dashDAO;
	}
	
	// 공연 대기중, 공연중 
	public DashBoardVO selectDashBoardShow() throws SQLException {
		DashBoardVO dbVO = null;

		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dc.getConn();
			StringBuilder selectDashBoard = new StringBuilder();

			selectDashBoard.append(" select count(*) cnt, status ")
						.append(" from show ")
						.append(" group by status ")
						.append(" having status in ('공연예정','공연중') ")
						.append(" order by status ");

			pstmt = con.prepareStatement(selectDashBoard.toString());

			rs = pstmt.executeQuery();
			dbVO = new DashBoardVO();
			while (rs.next()) { 
				if(rs.getString("status").equals("공연예정")) {
					dbVO.setStandByShow(rs.getInt("cnt")); // ??
				}else if(rs.getString("status").equals("공연중")){
					dbVO.setOnTheShow(rs.getInt("cnt")); // ??
				}
			}

		} finally {
			dc.dbClose(rs, pstmt, con);
		}
		return dbVO;
	}
	
	
	// 금일 가입,탈퇴회원   
	public DashBoardVO selectDashBoardMember() throws SQLException {
		DashBoardVO dbVO = null;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dc.getConn();
			StringBuilder selectDashBoard = new StringBuilder();
			
			
			selectDashBoard.append(" select( ")
			.append(" select count(m.memberid) ")
			.append(" from member m ")
			.append(" where to_char(m.inputdate,'yyyy-mm-dd') = to_char(sysdate,'yyyy-mm-dd')) m_cnt,( ")
			.append(" select count(qm.memberid) ")
			.append(" from quitmember qm ")
			.append(" where to_char(qm.inputdate,'yyyy-mm-dd') = to_char(sysdate,'yyyy-mm-dd') ")
			.append(" )qm_cnt ")
			.append(" from dual ");
			
			pstmt = con.prepareStatement(selectDashBoard.toString());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbVO = new DashBoardVO();
				dbVO.setSignUpMember(rs.getInt("m_cnt"));
				dbVO.setQuitMember(rs.getInt("qm_cnt"));
			}
			
		} finally {
			dc.dbClose(rs, pstmt, con);
		}
		return dbVO;
	}
	
	// 공연별예매건수
	public List<DashBoardVO> selectRsrvtCntByShow() throws SQLException{
		List<DashBoardVO> listCntByShow = new ArrayList<DashBoardVO>();
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dc.getConn();
			StringBuilder sb = new StringBuilder();

			
			sb.append(" select rnum,cnt,(select name from show where showid = r_showid) showname ")
				.append(" from(select row_number() over(order by sum(totalCnt) desc) rnum,sum(totalCnt) cnt,r.showid r_showid ")
				.append(" from rsrvt r ")
				.append(" group by showid) ")
				.append(" where rnum between 1 and 5 ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			DashBoardVO dbVO = null;
			while(rs.next()) {
				dbVO = new DashBoardVO();
				
				dbVO.setShowName(rs.getString("showname"));
				dbVO.setRsrvtCnt(rs.getInt("cnt"));
				listCntByShow.add(dbVO); 
			}
			
		} finally {
			dc.dbClose(rs, pstmt, con);
		}
		return listCntByShow;
		
	}
	
	// 일자별매출
	public List<DashBoardVO> selectDailySales() throws SQLException{
		List<DashBoardVO> listCntByShow = new ArrayList<DashBoardVO>();
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dc.getConn();
			StringBuilder sb = new StringBuilder();
			
			sb.append(" select to_char(days.dt,'yyyy-mm-dd') dailydate, nvl(sum(totalpice),0) totalsales ")
			.append(" from rsrvt r, ")
			.append(" (select to_date(to_char(sysdate,'yyyy-mm-dd'),'YYYY-MM-DD') - level +1 as dt ")
			.append(" from dual ")
			.append(" connect by level <= (to_date(to_char(sysdate,'yyyy-mm-dd'),'YYYY-MM-DD')-to_date(to_char(sysdate-4,'yyyy-mm-dd'),'YYYY-MM-DD')+1)) days ")
			.append(" where days.dt = r.inputdate(+) ")
			.append(" group by days.dt ")
			.append(" order by days.dt desc ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			DashBoardVO dbVO = null;
			while(rs.next()) {
				dbVO = new DashBoardVO();
				
				dbVO.setDailyDay(rs.getString("dailydate"));
				dbVO.setTotalSales(rs.getInt("totalsales"));
				
				listCntByShow.add(dbVO);
			}
			
		} finally {
			dc.dbClose(rs, pstmt, con);
		}
		return listCntByShow;
		
	}
	

}
