package kr.co.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ko.co.sist.vo.ScheduleShowVO;
import kr.co.sist.common.dao.DbConnection;
import kr.co.sist.vo.ScheduleVO;



public class ScheduleDAO {
	
	private static ScheduleDAO scheduleDAO;

	private ScheduleDAO() {
	
	}//ScheduleDAO
	
	public static ScheduleDAO getInstance() {
		if(scheduleDAO == null) {
			scheduleDAO = new ScheduleDAO();
		}//end if
		
		return scheduleDAO;
	}
	
	//캘린더
	
	public List<ScheduleShowVO> selectSchedule(String showId) throws SQLException{
		List<ScheduleShowVO> list = new ArrayList<ScheduleShowVO>();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection db=DbConnection.getInstance();
		
		try {
			con=db.getConn();
			String query="select showId, name, startDate, endDate "
							+"from show "
							+"where name is not null "
							+"and startDate = to_date(startDate, 'YYYY-MM-DD')";
			
		
			pstmt = con.prepareStatement(query);
			
			rs = pstmt.executeQuery();
			
			ScheduleShowVO ssVO= null;
			while(rs.next()) {
				
				ssVO.setShowId(rs.getString("showId"));
				ssVO.setName(rs.getString("name"));
				ssVO.setStartDate(rs.getString("startDate"));
				ssVO.setEndDate(rs.getString("endDate"));
				list.add(ssVO);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
	
		return list;

	}//select
	
	
	public List<ScheduleVO> selectTest(String year, String month) throws SQLException {
		List<ScheduleVO> listSch = new ArrayList<ScheduleVO>();

		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dc.getConn();
			StringBuilder selectImgs = new StringBuilder();

			
			/*
			select sch.schid, sch.showid, sch.schdate, sch.schtime, sw.name
			from schedule sch, show sw
			where sch.showid = sw.showid
				and schdate like '2022-10%';
			 */
			String test = year+"-"+month;
			System.out.println("CalendarDAO의 test값 : "+test);
			selectImgs.append(" select sch.schid, sch.showid, sch.schdate, sch.schtime, sw.name, substr(sch.schdate,9) il, to_char(to_date(schdate),'dy') day ")
					.append(" from schedule sch, show sw ")
					.append(" where sch.showid = sw.showid ")
					.append(" and sch.schdate like ?||'%' ");

			pstmt = con.prepareStatement(selectImgs.toString());
			
			pstmt.setString(1,test);
//			pstmt.setString(1,year);
//			pstmt.setString(2,month);

			rs = pstmt.executeQuery();
			ScheduleVO schVO = null;
			while (rs.next()) { // 조회된 레코드가있으므로 저장하깅위해 VO를 생성
				schVO = new ScheduleVO();
				schVO.setSchId(rs.getString("schid"));
				schVO.setShowId(rs.getString("showid"));
				schVO.setSchDate(rs.getString("schdate"));
				schVO.setSchTime(rs.getString("schtime"));
				schVO.setName(rs.getString("name"));
				//if(rs.getString("il").length()==1) {
				String il = rs.getString("il");
				schVO.setIl(il.length()==1?("0"+il):il);
				//schVO.setIl(Integer.parseInt(rs.getString("il"))<10?String.valueOf(rs.getString("il").charAt(1)):rs.getString("il"));
				schVO.setDay(rs.getString("day"));
				listSch.add(schVO);
			}

		} finally {
			dc.dbClose(rs, pstmt, con);
		}
		return listSch;
	}

	
	
	
	

}//class

