package kr.co.sist.dao;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.common.dao.DbConnection;
import kr.co.sist.vo.AdminShowVO;

public class AdminShowDAO {
	private static AdminShowDAO adminshowDAO;
	
	private AdminShowDAO() {

	}//AdminShowDAO
	
	public static AdminShowDAO getInstance() {
		if(adminshowDAO==null) {
			adminshowDAO=new AdminShowDAO();
		}
		
		return adminshowDAO;
	}//getInstance
	
	
	
		//공연 조회
		//공연명, 장르, 상태만 받아서 list뿌려주기 
		//이놈이 찐으로 쓸 놈 
		public List<AdminShowVO> selectShow(String name,String genreId, String status) throws SQLException{
		List<AdminShowVO> list=new ArrayList<AdminShowVO>();
		AdminShowVO asVO=null;
		
		DbConnection db=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=db.getConn();
			
			String query=" select s.showId s_showId, s.name s_name, g.genreId g_genreId, s.price s_price, r.ratingId r_ratingId, s.status s_status "
					+ "from show s, genre g, rating r "  
					+ "where (s.genreId=g.genreId and s.ratingId=r.ratingId) ";
			
			   
			   if(name!=null) {
					query+=" and s.name Like'%"+name.trim()+"%' ";
			   }
			   if(genreId!=null) {
				   query+=" and g.genreId='"+genreId+"' ";
			   }
			   if(status!=null) {
				   query+=" and s.status='"+status+"' ";
			   }
			  
			  
			   
			pstmt = con.prepareStatement(query); 
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				asVO=new AdminShowVO();
				asVO.setShowId(rs.getString("s_showId"));
				asVO.setName(rs.getString("s_name"));
				asVO.setPrice(rs.getInt("s_price"));
				asVO.setGenreId(rs.getString("g_genreId"));
				asVO.setRatingId(rs.getString("r_ratingId"));
				asVO.setStatus(rs.getString("s_status"));
				list.add(asVO);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
			
		}
		
		return list;
	}//selectShow 
	
		
	
	
	//쿼리문 확인완료
	//공연상세보기(공연코드)
	//매겨변수: 공연코드
	//return: 12개) 공연코드, 공연명, 장르, 시작일, 종료일, 관람시간, 관람등급, 금액, 
	//		  썸네일이미지, 메인이미지, 작품소개이미지, 상태
	//show, rating, genre 3개 inner join
	public AdminShowVO selectShowDetail(String showId) throws SQLException {
		AdminShowVO asVO=null;
		
		
		DbConnection db=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			con=db.getConn();
			
			//select id, type
			String query=" select s.showId s_showId, s.name s_name, s.startDate s_startDate, s.endDate s_endDate, s.runningTime s_runningTime, s.price s_price, s.thImg s_thImg, s.mImg s_mImg, s.infoImg s_infoImg, s.status s_status, r.ratingType r_ratingType, g.genreType g_genreType, s.inputdate s_inputdate "
					+ " from show s, rating r, genre g "
					+ " where (s.ratingId=r.ratingId and s.genreId=g.genreId) and s.showId=? ";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, showId);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				asVO=new AdminShowVO();
				asVO.setShowId(rs.getString("s_showId"));
				asVO.setName(rs.getString("s_name"));
				asVO.setGenreId(rs.getString("g_genreType"));
				asVO.setStartDate(rs.getString("s_startDate"));
				asVO.setEndDate(rs.getString("s_endDate"));
				asVO.setRunningTime(rs.getString("s_runningTime"));
				asVO.setRatingId(rs.getString("r_ratingType"));
				asVO.setPrice(rs.getInt("s_price"));
				asVO.setThImg(rs.getString("s_thImg"));
				asVO.setmImg(rs.getString("s_mImg"));
				asVO.setInfoImg(rs.getString("s_infoImg"));
				asVO.setStatus(rs.getString("s_status"));
				asVO.setInputDate(rs.getDate("s_inputdate"));
			}
			
			System.out.println("섬네일: "+asVO.getThImg());
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return asVO;
	}//selectShowDetail
	
	
	//쿼리문 확인완료
	//공연추가
	//Q.insert,update,delete return 값이 insert횟수인데 이게 어디에 필요하남?
	//return값 어디에 쓰일지 생각해서 반환형 바꾸기 void, boolean 등등
	//매개변수:13개)공연코드(시퀀스), 공연명, 장르, 시작일, 종료일, 관람시간, 관람등급, 금액,
	//		 썸네일이미지, 메인이지, 작품소개이미지,상태, 입력일
	//return: int
	//공연코드는 시퀀스로 받기> 시퀀스 테이블 생성하기
	public int insertShow(AdminShowVO asVO) throws SQLException {
		int i=0;
		
		
		DbConnection db=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			con=db.getConn();
			
			//상태, 입력일 추가
			String query=" insert into show(showId, name, genreId, startDate, endDate, runningTime, ratingId, price, thImg, mImg, infoImg, status, inputDate) "
					+ " values (concat('sh_',lpad(show_seq.nextval,7,0)),?,?,?,?,?,?,?,?,?,?,?,to_char(sysdate,'yyyy-mm-dd')) ";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, asVO.getName());
			pstmt.setString(2, asVO.getGenreId());
			pstmt.setString(3, asVO.getStartDate());
			pstmt.setString(4, asVO.getEndDate());
			pstmt.setString(5, asVO.getRunningTime());
			pstmt.setString(6, asVO.getRatingId());
			pstmt.setInt(7, asVO.getPrice());
			pstmt.setString(8, asVO.getThImg());
			pstmt.setString(9, asVO.getmImg());
			pstmt.setString(10, asVO.getInfoImg());
			pstmt.setString(11, asVO.getStatus());
			
			pstmt.executeUpdate();
			
			rs = pstmt.executeQuery(" select concat('sh_',lpad(show_seq.currval,7,0)) from dual ");
			rs.next();
			
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return i;
	}//insertShow
	
	
	//쿼리문 확인완료
	//공연정보변경
	//매개변수:공연코드,
	//		 set 값) 11개) 공연명, 장르, 시작일, 종료일, 관람시간, 관람등급, 금액,
	//		 썸네일이미지, 메인이지, 작품소개이미지, 상태
	//return:  int what?
	public int updateShow(AdminShowVO asVO) throws SQLException {
		int i=0;
		
		DbConnection db=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		//ResultSet rs=null;
		
		try{
			con=db.getConn();
			
			
			String query=" update show "
					+ " set name=?, genreId=?, startDate=?, endDate=?, runningTime=?, ratingId=?, price=?, thImg=?, mImg=?, infoImg=?, status=?  "
					+ " where showId=? "; //where절 이게 맞나 jsp에서 어떻게 받아와야하지
			
			//asVO.setGenreId(rs.getString("g_genreType"));
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, asVO.getName());
			pstmt.setString(2, asVO.getGenreId());
			pstmt.setString(3, asVO.getStartDate());
			pstmt.setString(4, asVO.getEndDate());
			pstmt.setString(5, asVO.getRunningTime());
			pstmt.setString(6, asVO.getRatingId());
			pstmt.setInt(7, asVO.getPrice());
			pstmt.setString(8, asVO.getThImg());
			pstmt.setString(9, asVO.getmImg());
			pstmt.setString(10, asVO.getInfoImg());
			pstmt.setString(11, asVO.getStatus());
			pstmt.setString(12, asVO.getShowId());
			
			pstmt.executeUpdate();
			
		}finally {
			db.dbClose(null, pstmt, con);
		}
		
		return i;
	}//updateShow
	
	
	//쿼리문 확인 완료
	//공연삭제(공연코드)
	//매개변수: 공연코드
	//return:  int what?
	public int deleteShow(String showId) throws SQLException {
		int i=0;
		
		DbConnection db=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try{
			con=db.getConn();
			
			String query=" delete from show where showId=? ";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, showId);
			
			pstmt.executeUpdate();
		}finally {
			db.dbClose(null, pstmt, con);
		}
		
		return i;
	}//deleteShow
	
	
}//class
