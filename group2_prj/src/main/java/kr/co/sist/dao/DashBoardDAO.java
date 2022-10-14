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
//	private static DashBoardVO dbVO;
	private DashBoardDAO() {
	}

	public static DashBoardDAO getInstance() {

		if (dashDAO == null) {
			dashDAO = new DashBoardDAO();
		}
		return dashDAO;
	}
//	public static void main(String[] args) throws SQLException {
//		DashBoardDAO dbDAO = DashBoardDAO.getInstance();
////		String str = dbDAO.selectDashBoardShow();
////		DashBoardVO dbVO = dbDAO.selectDashBoardShow();
////		System.out.println(dbVO.getStandByShow());
////		System.out.println(dbVO.getOnTheShow());
//		
//		List<DashBoardVO> rsrvtByShow = dbDAO.selectRsrvtCntByShow();
//		for(DashBoardVO dbVO : rsrvtByShow) {
//			System.out.print(dbVO.getRsrvtCnt()+", ");
//			System.out.println(dbVO.getShowName());
//		}
//	} 
	
	// 공연 대기중, 공연중 
	public DashBoardVO selectDashBoardShow() throws SQLException {
		DashBoardVO dbVO = null;

		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String cnt = "";
		
		try {
			con = dc.getConn();
			StringBuilder selectDashBoard = new StringBuilder();

			/*
			-- 대시보드테스트
			select count(*) cnt, status
			from show
			group by status
			having status in('공연예정','공연중')
			order by status;
			근데 이러면 레코드가 두개인데 dual테이블사용해서 아래 회원구하는것처럼 한레코드에 두컬럼으로 나오게해야하나
			 */
			selectDashBoard.append(" select count(*) cnt, status ")
						.append(" from show ")
						.append(" group by status ")
						.append(" having status in ('공연예정','공연중') ")
						.append(" order by status "); // 이러면 공연예정이 공연중보다 앞이겠지?

			pstmt = con.prepareStatement(selectDashBoard.toString());

			rs = pstmt.executeQuery();
			dbVO = new DashBoardVO();
			while (rs.next()) { // 조회된 레코드가있으므로 저장하깅위해 VO를 생성
//				// 이걸 한줄로 받을수있나?
				if(rs.getString("status").equals("공연예정")) {
					dbVO.setStandByShow(rs.getInt("cnt")); // ??
				}else if(rs.getString("status").equals("공연중")){
					dbVO.setOnTheShow(rs.getInt("cnt")); // ??
				}
//				cnt= String.valueOf(rs.getInt("cnt"));
			}

		} finally {
			dc.dbClose(rs, pstmt, con);
		}
		return dbVO;
	}
	
	
	// 금일 가입,탈퇴회원    금일가입은 inputDate있다쳐도 금일탈퇴는 탈퇴테이블에 그게 없는데?
	public DashBoardVO selectDashBoardMember() throws SQLException {
		DashBoardVO dbVO = null;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dc.getConn();
			StringBuilder selectDashBoard = new StringBuilder();
			
			
			/* 금일 가입, 탈퇴 회원수 구하기
			select(
				select count(m.memberid)
				from member m
				where to_char(m.inputdate,'yyyy-mm-dd') = to_char(sysdate,'yyyy-mm-dd')
				) m_cnt ,(
				select count(qm.memberid)
				from quitmember qm
				where to_char(qm.inputdate,'yyyy-mm-dd') = to_char(sysdate,'yyyy-mm-dd')
				)qm_cnt
			from dual;
			 */
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

			
			/*
			select showid ,sum(totalCnt) cnt from rsrvt group by showid order by cnt desc;
			-- 공연별 건수랑 해당 공연명 쿼리
			select rnum,cnt,(select name from show where showid = r_showid) showname
			from(select row_number() over(order by sum(totalCnt) desc) rnum,sum(totalCnt) cnt,r.showid r_showid
			from rsrvt r
			group by showid)
			where rnum between 1 and 5;
			 */
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
/*				switch(rs.getInt("rnum")) {
				case 1:
					dbVO.setFirstCnt(rs.getInt("cnt"));
					break;
				case 2:
					dbVO.setSecondCnt(rs.getInt("cnt"));
					break;
				case 3:
					dbVO.setThirdCnt(rs.getInt("cnt"));
					break;
				case 4:
					dbVO.setFourthCnt(rs.getInt("cnt"));
					break;
				case 5:
					dbVO.setFifthCnt(rs.getInt("cnt"));
					break;
				} */
				// 이렇게 cnt변수 하나만 필요하지않나?? 다 따로받아야돼?
				
				listCntByShow.add(dbVO); // 리스트에서 .get(i) 이렇게 빼쓰면 앞에서부터 최고예매건수 아닌가?
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
			
			/*
			-- 일자별 매출 조회 쿼리 test----------------------------
			select days.dt dailydate, nvl(sum(totalpice),0) totalsales
			from rsrvt r,
			(select to_date(to_char(sysdate,'yyyy-mm-dd'),'YYYY-MM-DD') - level +1 as dt
			from dual
			connect by level <= (to_date(to_char(sysdate,'yyyy-mm-dd'),'YYYY-MM-DD')
														-to_date(to_char(sysdate-4,'yyyy-mm-dd'),'YYYY-MM-DD')+1)) days
			where days.dt = r.inputdate(+)
			group by days.dt 
			order by days.dt desc;
			 */
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
