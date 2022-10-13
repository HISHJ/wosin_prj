package kr.co.sist.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ko.co.sis.common.dao.DbConnection;
import kr.co.sis.vo.ShowVO;

public class MainDAO {
	private static MainDAO mDAO;

	private MainDAO() {
	}

	public static MainDAO getInstance() {

		if (mDAO == null) {
			mDAO = new MainDAO();
		}
		return mDAO;
	}

	//////////////////////////////////////
//	public static void main(String[] args)throws IOException, SQLException{
//		
//		MainDAO mDAO = MainDAO.getInstance();
//		List<ShowVO> swList = mDAO.selectThImg();
//		
//		for(ShowVO sl : swList) {
//			System.out.print(sl.getShowId()+", ");
//			System.out.print(sl.getThImg()+", ");
//			System.out.println(sl.getmImg());
//		}
//		
//	}
	//////////////////////////////////////
	
	// 공연중인목록 조회해서 반환
	public List<ShowVO> selectThImg() throws SQLException {
		List<ShowVO> listShow = new ArrayList<ShowVO>();

		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dc.getConn();
			StringBuilder selectImgs = new StringBuilder();

			selectImgs.append(" select showId, thImg, mImg ").append(" from show ")
					.append(" where status = '공연예정' ");// 공연중인게없어서 일단예정으로 조회 ㅇㅇ 테이블갈면 수정해야함

			pstmt = con.prepareStatement(selectImgs.toString());

			rs = pstmt.executeQuery();
			ShowVO showVO = null;
			while (rs.next()) { // 조회된 레코드가있으므로 저장하깅위해 VO를 생성
				 showVO = new ShowVO();
				showVO.setShowId(rs.getString("showId"));
				showVO.setThImg(rs.getString("thImg"));
				showVO.setmImg(rs.getString("mImg"));
				listShow.add(showVO);
			}

		} finally {
			dc.dbClose(rs, pstmt, con);
		}
		return listShow;
	}
	
	// test
	public ShowVO selectShowMain(String showId) throws SQLException {
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ShowVO showVO = null;
		try {
			con = dc.getConn();
			StringBuilder selectImgs = new StringBuilder();
			
			selectImgs.append(" select * ").append(" from show ")
			.append(" where showid = ? ");
			
			pstmt = con.prepareStatement(selectImgs.toString());
			pstmt.setString(1, showId);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) { // 조회된 레코드가있으므로 저장하깅위해 VO를 생성
				showVO = new ShowVO();
				showVO.setShowId(rs.getString("showId"));
				showVO.setName(rs.getString("name"));
				showVO.setGenreId(rs.getString("genreid"));
				showVO.setRatingId(rs.getString("RatingId"));
				showVO.setStartDate(rs.getString("startdate"));
				showVO.setEndDate(rs.getString("enddate"));
				showVO.setRunningTime(rs.getString("runningtime"));
				showVO.setmImg(rs.getString("mimg"));
				showVO.setThImg(rs.getString("thimg"));
				showVO.setInfoImg(rs.getString("infoimg"));
				showVO.setStatus(rs.getString("status"));
				showVO.setPrice(rs.getInt("price"));
			}
			
		} finally {
			dc.dbClose(rs, pstmt, con);
		}
		return showVO;
	}

}
