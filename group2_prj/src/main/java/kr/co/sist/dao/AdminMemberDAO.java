package kr.co.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.common.dao.DbConnection;
import kr.co.sist.vo.AdminMemberVO;

public class AdminMemberDAO {

	private static AdminMemberDAO admDAO;
	private AdminMemberDAO() {
		
		
	}//AdminMemberDAO
	
	public static AdminMemberDAO getInstance(){
		if(admDAO==null) {
			admDAO= new AdminMemberDAO();
			
		}//end if
		return admDAO;
}//end if
	
	// 회원 조회 :selectMember(AdminMemberVO) : List<AdminMemberVO>
	//검색설정은 JSP에서 해야하는건가...? 아니면 여기서 where 조건.? 근데 where 조건 넣으면 all은 어캄? 
	public List<AdminMemberVO> selectMember(AdminMemberVO admVO) throws SQLException{
		
		List<AdminMemberVO>list = new ArrayList<AdminMemberVO>();
		Connection con=null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		
		DbConnection dc = DbConnection.getInstance();
		
		try {
			con=dc.getConn();
			String selectMb = "select name,memberId,to_char(inputdate,'yyyy-MM-dd')inputdate,status from member where 1=1 ";
//			검색조건(아이디,메일수신,회원탈퇴)
			if(!admVO.getMemberId().equals("")) {
				selectMb+="and memberId='"+admVO.getMemberId()+"'";
			}
			if(!admVO.getMailChk().equals("")) {
				selectMb+="and MailChk='"+admVO.getMailChk()+"'";
			}
			if(!admVO.getStatus().equals("")) {
				selectMb+="and status='"+admVO.getStatus()+"'";
			}
			
			pstmt=con.prepareStatement(selectMb);
			
			pstmt.setString(1,admVO.getMemberId());
			pstmt.setString(2,admVO.getMailChk());
			pstmt.setString(3,admVO.getStatus());
			rs=pstmt.executeQuery();
			
			
			if(rs.next()) {
				admVO= new AdminMemberVO();
				admVO.setName(rs.getString("name"));
				admVO.setMemberId(rs.getString("memberId"));
				admVO.setInputDate(rs.getDate("inputdate"));
				admVO.setName(rs.getString("status"));
			}//end if
			
			
			list.add(admVO);
			
		}finally {
			
			dc.dbClose(rs, pstmt, con);
		}//end catch
		
		return list;
	}//selectMember
	
	
	// 회원상세보기 (아이디) :selectMemberDetail(String) : AdminMemberVO

	public AdminMemberVO selectMemberDetail(String memberId) throws SQLException {
		AdminMemberVO admVO=null;
		
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection dc=DbConnection.getInstance();
		
		try {
			con=dc.getConn();
			String selectInfo = "select name,memberId,birth,gender,zipcode,addr1,addr2,email,phone,hphone,"
					+ "mailChk,smsChk,status from member where memberId=?";
			pstmt=con.prepareStatement(selectInfo);
			pstmt.setString(1, memberId);	
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				admVO=new AdminMemberVO();
				admVO.setName(rs.getString("name"));
				admVO.setMemberId(rs.getString("memberId"));
				admVO.setEmail(rs.getString("email"));
				admVO.setBirth(rs.getString("birth"));
				admVO.setGender(rs.getString("gender"));
				admVO.setZipcode(rs.getString("zipcode"));
				admVO.setAddr1(rs.getString("addr1"));
				admVO.setAddr2(rs.getString("addr2"));
				admVO.setPhone(rs.getString("phone"));
				admVO.sethPhone(rs.getString("hPhone"));
				admVO.setMailChk(rs.getString("mailChk"));
				admVO.setSmsChk(rs.getString("smsChk"));
				admVO.setStatus(rs.getString("Status"));
					
			}//end if
		}finally{
			
			dc.dbClose(rs, pstmt, con);
		}//end
		
		return admVO;

	}//selectMemberDetail
	
	// 회원삭제 (아이디) : updateMemberStatus(String): int
	public int updateMemberStatus(String memberId) throws SQLException {
		
		int updateMemberCnt =0;
		DbConnection dc = DbConnection.getInstance();
		PreparedStatement pstmt =null;
		Connection con =null;
		
	    try {

	    con=dc.getConn();
	    String updateMs = "update member set status='N' where memberId=?";
	    	
	    	pstmt=con.prepareStatement(updateMs);
	    	pstmt.setString(1,memberId);
	    	updateMemberCnt=pstmt.executeUpdate();
	    }finally {
		
	    	dc.dbClose(null, pstmt, con);
		
	    }//end finally
		
		return updateMemberCnt;
	}//updateMemberStatus
	
	//삭제완료창에서 삭제완료된 회원 나타내는 method =>이것도 위에 method써도될듯?
	public AdminMemberVO selectDeleteMember(String memberId,String status) throws SQLException {
		
	AdminMemberVO admVO=null;
		
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection dc=DbConnection.getInstance();
		
		try {
			con=dc.getConn();
			String selectdm = "select name,memberId from member where memberId=? and status='N'";
			pstmt=con.prepareStatement(selectdm);
			pstmt.setString(1, memberId);	
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				admVO=new AdminMemberVO();
				admVO.setName(rs.getString("name"));
				admVO.setMemberId(rs.getString("memberId"));
			
			}//end if
		}finally{
			
			dc.dbClose(rs, pstmt, con);
		}//end

		return admVO;
		
	}//selectDeleteMember
	
	
}//AdminMemberDAO
