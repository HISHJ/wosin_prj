package kr.co.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import kr.co.sist.vo.*;
import project.vo.AdminShowVO;
import project.vo.DbConnection;


public class AdminScheduleDAO {

	private static AdminScheduleDAO adminScheduleDAO;
	
	private AdminScheduleDAO() {
		
	}//AdminScheduleDAO
	
	public static AdminScheduleDAO getInstance() {
		
		if(adminScheduleDAO == null) {
			adminScheduleDAO = new AdminScheduleDAO();
		}//end if
		return adminScheduleDAO;
	}//getInstance
	
	
	//상영일정 조회 (showINGBoard)
	public List<AdminScheduleVO> selectSchedule(String name,String genreId) throws SQLException{
		List<AdminScheduleVO> list= new ArrayList<AdminScheduleVO>();
		AdminScheduleVO aschVO=null; //조회된 레코도를 저장할 VO
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection db=DbConnection.getInstance();
		
		try {
			//1. 드라이버 로딩
			//2. 커넥션 얻기
				con=db.getConn();
			//3. 쿼리문 생성객체 얻기
				String query="select sc.schId sc_schId, s.showId s_showId, s.name s_name, sc.schDate sc_schDate, g.genretype g_genretype, sc.schTime sc_schTime "
								+ "from show s, schedule sc, genre g "
								+ "where (s.showId = sc.showId) and (s.genreId=g.genreId) ";
			/*	StringBuilder selectSchedule = new StringBuilder();
				selectSchedule.append("select s.showId s_showId, s.name s_name, sc.schDate sc_schDate, s.genreId s_genreId, sc.schTime sc_schTime ")
				.append("from show s join schedule sc ")
				.append("on s.showId = sc.showId ");*/
			/*	.append("where s.name=? and s.genreId=? and status=? ");*/
				
			
				if(genreId!=null) {
					query+=" and g.genretype='"+genreId+"' ";
				}
				
				if(name!=null) { 
					query += " and s.name like '%"+name.trim()+"%' ";
				}
				   pstmt = con.prepareStatement(query); 
				//pstmt=con.prepareStatement( selectSchedule.toString() );
			//4. 바인드 변수 값 설정 ??
				//pstmt.setString(1, );
			
			//5. 쿼리문 수행후 결과 얻기
				rs=pstmt.executeQuery();
				

				while(rs.next()) { // 검색된 레코드의 수를 모르지만 모든 레코드를 저장하기 위해 while
					//생성된 VO에 조회된 값을 설정
					aschVO=new AdminScheduleVO();
					aschVO.setSchId(rs.getString("sc_schId"));
					aschVO.setShowId(rs.getString("s_showId"));
					aschVO.setName(rs.getString("s_name"));
					aschVO.setSchDate(rs.getString("sc_schDate"));
					aschVO.setGenreId(rs.getString("g_genretype"));
					aschVO.setSchTime(rs.getString("sc_schTime"));
					//생성된 VO를 list에 저장
					list.add(aschVO);
				}//end while
				
		}finally {
			//6. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
		
	}//selectSchedule
	
	//상영일정 상세보기(일정코드) 
	public AdminScheduleVO selectScheduleDetail(String schId) throws SQLException {
		
		AdminScheduleVO aschVO=null; 

		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection db=DbConnection.getInstance();
		try {
			//1. 드라이버 로딩
			//2. 커넥션 얻기
				con=db.getConn();
			//3. 쿼리문 생성객체 얻기
				
		
		String query=	"select sc.schId sc_schId, s.showId s_showId, s.name s_name, g.genretype g_genretype, sc.schDate sc_schDate, sc.schTime sc_schTime, s.runningTime s_runningTime, "
		+"r.ratingtype r_ratingtype, s.price s_price, s.mImg s_mImg, s.thImg s_thImg, s.infoImg s_infoImg, s.status s_status "
		+"from  show s, schedule sc, rating r, genre g "
		+"where (s.ratingId=r.ratingId and s.genreId=g.genreId) and (s.showId = sc.showId) and sc.schId=? ";
				
				
				
			/*
			 * String
			 * query=" select s.showId s_showId, s.name s_name, s.genreId s_genreId, sc.schDate sc_schDate, sc.schTime sc_schTime, s.runningTime s_runningTime, "
			 * +"s.ratingId s_ratingId, s.price s_price, s.mImg s_mImg, s.thImg s_thImg, s.infoImg s_infoImg, s.status s_status "
			 * +" from show s join schedule sc " +" on s.showId=sc.showId "
			 * +" where s.showId=? ";
			 */
					
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, schId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				aschVO =new AdminScheduleVO();
				aschVO.setSchId(rs.getString("sc_schId"));
				aschVO.setShowId(rs.getString("s_showId"));
				aschVO.setName(rs.getString("s_name"));
				aschVO.setGenreId(rs.getString("g_genretype"));
				aschVO.setSchDate(rs.getString("sc_schDate"));
				aschVO.setSchTime(rs.getString("sc_schTime"));
				aschVO.setRunningTime(rs.getString("s_runningTime"));
				aschVO.setRatingId(rs.getString("r_ratingtype"));
				aschVO.setPrice(rs.getInt("s_price"));
				aschVO.setThImg(rs.getString("s_thImg"));
				aschVO.setmImg(rs.getString("s_mImg"));
				aschVO.setInfoImg(rs.getString("s_infoImg"));
				aschVO.setStatus(rs.getString("s_status"));
			}//end if
		}finally{
			
			db.dbClose(rs, pstmt, con);
		}//end
		return aschVO;
			
	
	}//selectSchedule
	
	/*
	 * //상영일정 상세보기(일정코드) public AdminScheduleVO selectSchedule(String schId) throws
	 * SQLException {
	 * 
	 * AdminScheduleVO adschVO=null;
	 * 
	 * Connection con=null; PreparedStatement pstmt=null; ResultSet rs=null;
	 * 
	 * DbConnection db=DbConnection.getInstance(); try { //1. 드라이버 로딩 //2. 커넥션 얻기
	 * con=db.getConn(); //3. 쿼리문 생성객체 얻기
	 * 
	 * StringBuilder selectSchedule=new StringBuilder(); selectSchedule
	 * .append("select sc.schId, s.name, s.genreId, sc.schDate, sc.schTime, s.runingTime, s.ratingId, s.price, s.mImg, s.thImg, s.infoImg, s.status "
	 * ) .append("from show s join schedule sc") .append("on s.showId=sc.showId")
	 * .append("where s.showId=?");
	 * 
	 * pstmt=con.prepareStatement(selectSchedule.toString()); //4. 바인드 변수 값 설정 ??
	 * 
	 * //5. 쿼리문 수행후 결과 얻기 rs=pstmt.executeQuery(); if(rs.next()) {
	 * 
	 * adschVO =new AdminScheduleVO(); adschVO.setSchId(rs.getString("schId"));
	 * adschVO.setName(rs.getString("name"));
	 * adschVO.setGenreId(rs.getString("genreId"));
	 * adschVO.setSchDate(rs.getString("schDate"));
	 * adschVO.setSchTime(rs.getString("schTime"));
	 * adschVO.setRuningTime(rs.getString("runingTime"));
	 * adschVO.setRatingId(rs.getString("ratingId"));
	 * adschVO.setPrice(rs.getInt("price"));
	 * adschVO.setThImg(rs.getString("tmImg"));
	 * adschVO.setmImg(rs.getString("mImg"));
	 * adschVO.setInfoImg(rs.getString("infoImg"));
	 * adschVO.setStatus(rs.getString("status")); }//end if }finally{
	 * 
	 * db.dbClose(rs, pstmt, con); }//end return adschVO;
	 * 
	 * 
	 * }//selectSchedule
	 */	
	
	
	//상영일정 정보변경 [상영일, 상영시간 변경?]
	public int updateSchedule(AdminScheduleVO aschVO)throws SQLException{
		
		int updateCnt=0;
		
		Connection con=null;
		PreparedStatement pstmt=null;

		DbConnection db=DbConnection.getInstance();
		
		try {
			con = db.getConn();
		
			
			String query="update schedule "
					+ "set schDate=?, schTime=? "
					+ "where schId=? ";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, aschVO.getSchId());
			pstmt.setString(2, aschVO.getSchDate());
			pstmt.setString(3, aschVO.getSchTime());
		

			
			pstmt.executeUpdate();
			
		}finally {
			db.dbClose(null, pstmt, con);
		}
		
		return updateCnt;
		
	}
	
	
	
	
	
	


	
	
	//상영일정 리스트 (공연코드, VO)
	
	public List<AdminShowVO> selectAdminScheduleAll() throws SQLException{
		
		List<AdminShowVO> list = new ArrayList<AdminShowVO>();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection db=DbConnection.getInstance();
		
		try {
			
			con=db.getConn();
			//3. 쿼리문 생성객체 얻기
				StringBuilder selectAdminScheduleAll=new StringBuilder();
				selectAdminScheduleAll.append("select * ")
							.append("from show");
						
				pstmt=con.prepareStatement( selectAdminScheduleAll.toString() );
					
				
				rs=pstmt.executeQuery();
				
				AdminShowVO adshVO = null;
				
				while(rs.next()) { 
					adshVO=new AdminShowVO();
					adshVO.setShowId(rs.getString("showId"));
					adshVO.setName(rs.getString("name"));
					list.add(adshVO);
				}//end while
				
		}finally {
			//6. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		
			return list;
}//selectAdminSchedule
	
	
	
	// 상영일정 추가 전 조회 ?? 
	public AdminScheduleVO selectshow(String showId) throws SQLException{
		AdminScheduleVO aschVO=null;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
	DbConnection db=DbConnection.getInstance();
		
		try {
			
			con=db.getConn();
			//3. 쿼리문 생성객체 얻기
			String query=" select * from show "
						+" where showId=? ";
			
			pstmt=con.prepareStatement( query);
			pstmt.setString(1, showId);
			rs=pstmt.executeQuery();
			
			/*
			 * StringBuilder selectshow=new StringBuilder();
			 * selectshow.append("select * from show") .append("where showId=?");
			 */
					
		
				while(rs.next()) { 	
					aschVO=new AdminScheduleVO();
					aschVO.setThImg("thImg");
					aschVO.setSchDate("startDate");
					aschVO.setSchTime("endDate");
					aschVO.setShowId("showId");
				}//end while
				
		}finally {
			//6. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		
		
		
		return aschVO;
	}
	
	
		

	//상영일,상영시간 추가
	public int insertSchedule(AdminScheduleVO aschVO) throws SQLException {
		
		int insertSchCnt=0;
		
		Connection con=null;
		PreparedStatement pstmt=null;
	
		
		DbConnection db=DbConnection.getInstance();
		
		try{
		
				con=db.getConn();
			
				String query= "insert into schedule(schId, schDate, schTime) "
									+"values (concat('sch_',lpad(schedule_seq.nextval,6,0)),?,? ) ";
				pstmt = con.prepareStatement(query);
				
			
				pstmt.setString(1, aschVO.getSchDate());
				pstmt.setString(2, aschVO.getSchTime());
				pstmt.executeUpdate();
			
		
		
	
		}finally {
			
			db.dbClose(null, pstmt, con);
		}//end finally
		
		return insertSchCnt;
	}//insert
	

	

}//class
