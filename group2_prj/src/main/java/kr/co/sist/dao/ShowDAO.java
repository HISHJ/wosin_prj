package kr.co.sist.dao;

import java.sql.Connection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.common.dao.DbConnection;
import kr.co.sist.vo.GenreVO;
import kr.co.sist.vo.RatingVO;
import kr.co.sist.vo.ShowVO;

public class ShowDAO {
	private static ShowDAO showDAO;
	
	private ShowDAO() {
	
	}//ShowDAO
	
	
	//엉망이구만
	//static method, 반환형 method 공부
	public static ShowDAO getInstance() {
		if(showDAO==null) {
			showDAO=new ShowDAO();
		}
		
		return showDAO;
	}//getInstance
	
	
	//쿼리문 확인완료
	//공연선택, 상세(공연코드)
	//매개변수: 공연코드
	//return: 8개) 썸네일이미지, 작품소개이미지, 공연명, 시작일, 종료일, 관람등급, 금액, 관람시간 
	//return: 장소 고정이므로 html처리, ratingId inner join하기
	public ShowVO selectShow(String showId) throws SQLException {
		ShowVO sVO = null;
		
		DbConnection db=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			con=db.getConn();
			
			//ratingId ratingType 
			String query=" select s.thImg s_thImg, s.infoImg s_infoImg, s.name s_name, s.startDate s_startDate, s.endDate s_endDate, s.price s_price, s.runningTime s_runningTime, r.ratingId r_ratingId "
					+ " from show s, rating r "
					+ " where (s.ratingId=r.ratingId) and s.showId=? ";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, showId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				sVO=new ShowVO();
				sVO.setThImg(rs.getString("s_thImg"));
				sVO.setInfoImg(rs.getString("s_infoImg"));
				sVO.setName(rs.getString("s_name"));
				sVO.setStartDate(rs.getString("s_startDate"));
				sVO.setEndDate(rs.getString("s_endDate"));
				sVO.setRatingId(rs.getString("r_ratingId"));
				sVO.setPrice(rs.getInt("s_price"));
				sVO.setRunningTime(rs.getString("s_runningTime"));
			}
			
		}finally {
			db.dbClose(rs, pstmt, con); 
		}
		
		return sVO;	
	}//selectShow
	
	//검색 하는 애들 마다 메소드 주기 모르겠다
	public ShowVO selectDate(Date date) {
		ShowVO sVO=null;
		
		return sVO;
	}//날짜선택
	
	public ShowVO selectGenre(String g) {
		ShowVO sVO=null;
		
		return sVO;
	}//장르선택
	
	
	//공연코드 타고 넘어가야해 showid
	public List<ShowVO> selectSearch(String searchWrd) throws SQLException {
		List<ShowVO> list=new ArrayList<ShowVO>();
		ShowVO sVO=null;
		DbConnection db=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			con=db.getConn();
			
			//ratingId ratingType 
								///쇼아이디!
			String query=" select s.showId s_showId, s.thImg s_thImg, s.name s_name, s.startDate s_startDate, s.endDate s_endDate, g.genreId g_genreId "
					+ " from show s, genre g "
					+ " where (s.genreId=g.genreId) ";
			
			if(searchWrd.trim()!=null) { //and 안써도되나
					query += " and s.name like '%"+searchWrd.trim()+"%' ";////
			}
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				sVO=new ShowVO();
				sVO.setThImg(rs.getString("s_thImg"));
				sVO.setName(rs.getString("s_name"));
				sVO.setStartDate(rs.getString("s_startDate"));
				sVO.setEndDate(rs.getString("s_endDate"));
				sVO.setGenreId(rs.getString("g_genreId"));
				sVO.setShowId(rs.getString("s_showId")); //쇼아이디!
				list.add(sVO);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con); 
		}
		
		return list;
	}//검색어 입력
	
	
	//얘는 체크 어떻게 하지
	//공연검색
	//우선 이거 keep
	//시작~종료사이에 상영일(이러면 상영코드 가져와야하는거 아님?)응 아님 부등호써서 쿼리문 짜면됨
	// 기간 버튼 누를때마다 시작~종료일 달라지는건 jsp에서?
	//매개변수: 날짜? 장르, 공연명
	//return: VO로받고: 썸네일, 공연명, 기간(첫,끝),장르 ++++++++ 관람등급
	public ShowVO selectShow(ShowVO sVO) throws SQLException{
		ShowVO sVO2=null;
		GenreVO gVO=null;
		RatingVO rVO=null;
		
		DbConnection db=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			con=db.getConn(); 
			
			String query=" select s.thImg s_thImg, s.name s_name, s.startDate s_startDate, s.endDate s_endDate, g.genreId g_genreId "
					+ " from show s, genre g"
					+" where (s.genreId=g.genreId) ";
					//+ "and s.startDate<=to_char(sysdate,'yyyy-mm-dd') and s.endDate>=to_char(sysdate,'yyyy-mm-dd')";
			
			
			if(sVO.getGenreId()!=null){
				query+=" and g.genreId='"+sVO.getGenreId()+"'";
			}
			/*
			 * if(sVO.getRatingId()!=null){
			 * query+=" and r.ratingId='"+sVO.getRatingId()+"'"; }
			 */
			if(sVO.getName()!=null){
				query+=" and s.name='"+sVO.getName()+"'";
			}
		
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				sVO2=new ShowVO();//이렇게 하는거 맞아 ?
				gVO=new GenreVO();
				sVO2.setThImg(rs.getString("s_thImg"));
				sVO2.setName(rs.getString("s_name"));
				sVO2.setShowId(rs.getString("showId"));
				sVO2.setStartDate(rs.getString("s_startDate"));
				sVO2.setEndDate(rs.getString("s_endDate"));
				gVO.setGenreType(rs.getString("g_genreId"));
				
			}
				
		}finally {
			db.dbClose(rs, pstmt, con);
			
		}
		
		return sVO2;
		
	}//selectShow

}//class
