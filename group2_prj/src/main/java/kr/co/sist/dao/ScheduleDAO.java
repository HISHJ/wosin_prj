package kr.co.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ko.co.sist.vo.ScheduleShowVO;
import kr.co.sist.common.dao.DbConnection;



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
	
	//캘린더(월)
	public List<ScheduleShowVO> selectSchedule(String showId) throws SQLException{
			List<ScheduleShowVO> list = new ArrayList<ScheduleShowVO>();
		
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			DbConnection db=DbConnection.getInstance();
			
			try {
				//1. 드라이버 로딩
				//2. 커넥션 얻기
					con=db.getConn();
				//3. 쿼리문 생성객체 얻기
					StringBuilder selectSchedule=new StringBuilder();
					selectSchedule.append(" select showId, name, to_date(startDate, 'YYYY-MM-DD') ")
								.append(" from show ")
								.append(" order by startDate ");
					
					
					pstmt=con.prepareStatement( selectSchedule.toString() );
					//4. 바인드 변수 값 설정 ??
					
					pstmt.setString(1, showId);
				
				//5. 쿼리문 수행후 결과 얻기
					rs=pstmt.executeQuery();
					
					ScheduleShowVO schVO = null;
			
					while(rs.next()) { // 검색된 레코드의 수를 모르지만 모든 레코드를 저장하기 위해 while
						//검색된 레코드를 VO에 저장
						schVO=new ScheduleShowVO();
						schVO.setShowId("showId");
						schVO.setStartDate("startDate");
						schVO.setName("name");
					
						//생성된 VO를 list에 저장
						list.add(schVO);
					}//end while
					
			}finally {
				//6. 연결 끊기
				db.dbClose(rs, pstmt, con);
			}//end finally
			
				return list;
	}//selectSchedule
	
	
	

}//class
