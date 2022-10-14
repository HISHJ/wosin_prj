package kr.co.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.common.dao.DbConnection;
import kr.co.sist.vo.AdminVO;

	public class AdminDAO {
		private static AdminDAO upsDAO;

		private AdminDAO() {
		}

		public static AdminDAO getInstance() {

			if (upsDAO == null) {
				upsDAO = new AdminDAO();
			}
			return upsDAO;
		}
		
		//아이디,비밀번호 추가
		public void insertInfo(AdminVO adVO) throws SQLException {
			DbConnection dc = DbConnection.getInstance();
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = dc.getConn();
				String insertInfo = "insert into admin(id, pw, inputdate) values(?,?,sysdate)";
				pstmt = con.prepareStatement(insertInfo);
				
				pstmt.setString(1, adVO.getId());
				pstmt.setString(2, adVO.getPwd());
				
				pstmt.executeUpdate();
				
			}finally {
				dc.dbClose(null, pstmt, con);
			}//end fin
			
		} //end method(insertInfo)
		
		
		//암호화 복호화 조회를 위한 쿼리문
		public AdminVO selectAdminAll() throws SQLException {
			AdminVO aVO = new AdminVO();
			DbConnection dc = DbConnection.getInstance();

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				con = dc.getConn();
				String selectAdAll = "select id, pw from admin";
				pstmt = con.prepareStatement(selectAdAll);
				rs = pstmt.executeQuery();
				
				
				if(rs.next()) {
					aVO.setId(rs.getString("id"));
					aVO.setPwd(rs.getString("pw"));
					
					}//end if
				}finally {
					dc.dbClose(rs, pstmt, con);
					
				}
			
			return aVO;
			
			
		} 


		///로그인 시 아이디, 비번 체크 메서드
		//return : int (체크용)
		//parameter : 아이디, 비밀번호
		public int selectAdmin(AdminVO adVO) throws SQLException {
			int chk = -1;
			
			String dbPw = ""; // db에서 꺼낸 비번 담을 변수
			DbConnection dc = DbConnection.getInstance();

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				con = dc.getConn();
				StringBuilder selectAdmin = new StringBuilder();

				selectAdmin.append(" select pw ").append(" from admin ")
						.append(" where id = ? ");

				pstmt = con.prepareStatement(selectAdmin.toString());

				pstmt.setString(1, adVO.getId());

				rs = pstmt.executeQuery();

				if (rs.next()) { // 입력된 아이디에 해당하는 비번이 있는 경우

					dbPw = rs.getString("pw");
					
					if(dbPw.equals(adVO.getPwd())){
						chk=1; //넘겨받은 비번과 꺼내온 비번 비교. 같으면 인증성공
					}else {
						chk = 0; // 다르면 인증실패
					}
				}else {
					chk=-1; // 해당 아이디 없는 경우
				}
			} finally {
				dc.dbClose(rs, pstmt, con);
			}
			return chk;
	
		}
		

		//비밀번호 변경
		public int updateAdmin(String id,String nowPass,String newPass) throws SQLException{
			int updateCnt=0;
			
			DbConnection dc = DbConnection.getInstance();
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = dc.getConn();
				StringBuilder updateAdmin = new StringBuilder();
				
				updateAdmin
				.append(" update admin")
				.append(" set pw = ?")
				.append(" where id = ? and pw = ?");
				
				pstmt = con.prepareStatement(updateAdmin.toString());
				
				pstmt.setString(1,newPass);
				pstmt.setString(2,id);
				pstmt.setString(3,nowPass);
				
				updateCnt = pstmt.executeUpdate();
				
			}finally {
				dc.dbClose(null, pstmt, con);
			}
			return updateCnt;
		}

		
		
		
		
	
		


	}
