package kr.co.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.common.dao.DbConnection;
import kr.co.sist.vo.AdminMemberVO;
import kr.co.sist.vo.AdminQuitMemberVO;
import kr.co.sist.vo.QuitMemberVO;


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
	public List<AdminMemberVO> selectMember(String memberId, String mailChk,String smsChk,String status) throws SQLException{
		
		List<AdminMemberVO> Mlist = new ArrayList<AdminMemberVO>();
		AdminMemberVO admVO= null;
		Connection con=null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		
		DbConnection dc = DbConnection.getInstance();
		
		try {
			con=dc.getConn();
			String selectMb = "select name,memberId,to_char(InputDate,'yyyy-MM-dd')mdate,mailChk,smsChk,status from member where 1=1 ";
//			검색조건(아이디,메일수신,회원탈퇴)
			if(memberId!=null) {
				selectMb+=" and memberId='"+memberId+"' ";
			}
			if(mailChk!=null){
				selectMb+=" and MailChk='Y' ";
			}
			if(smsChk!=null) {
				selectMb+=" and smsChk='Y' ";
			}
			if(status!=null) {
				selectMb+=" and status='"+status+"' ";
			}
			
			pstmt=con.prepareStatement(selectMb);
		
			rs=pstmt.executeQuery();
			while(rs.next()) {
				admVO= new AdminMemberVO();
				admVO.setName(rs.getString("name"));
				admVO.setMemberId(rs.getString("memberId"));
				admVO.setMdate(rs.getString("mdate"));
				admVO.setMailChk(rs.getString("mailChk"));
				admVO.setSmsChk(rs.getString("smsChk"));
				admVO.setStatus(rs.getString("status"));
				Mlist.add(admVO);
			}//end if
			
			
		}finally {
			
			dc.dbClose(rs, pstmt, con);
		}//end catch
		
		return Mlist;
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
			String selectInfo = "select name,memberId,birth,gender,zipcode,addr1,addr2,email,phone,"
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
	    String updateMs ="update member set  pwd=' ', name=' ', birth=' ', gender=' ',zipcode=' ',addr1=' ', addr2=' ', email=' ',phone=' ',mailchk=' ',smschk=' ', inputdate=to_date(inputdate,null), status='N' where memberid=?";
	    	
	    	pstmt=con.prepareStatement(updateMs);
	    	pstmt.setString(1,memberId);
	    	updateMemberCnt=pstmt.executeUpdate();
	    }finally {
		
	    	dc.dbClose(null, pstmt, con);
		
	    }//end finally
		
		return updateMemberCnt;
	}//updateMemberStatus

	
	
//	클다에 없는 method : 탈퇴한 회원 quitMember테이블에 추가
	public int insertQuitMember(AdminQuitMemberVO aqmVO) throws SQLException {
		
		int insertCnt=0;
		DbConnection dc = DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		
//		1. 드라이버로딩
		try {
//		2. 커넥션 얻기
			con = dc.getConn();
//		3. 쿼리문생성객체얻기
			String quit="insert into quitmember(memberId,reason,inputdate) values(?,'관리자권한으로 탈퇴',to_char(sysdate,'yyyy-MM-dd'))";
			
			pstmt=con.prepareStatement(quit);
			
			pstmt.setString(1, aqmVO.getMemberId());
			
	// SYSDATE는 어떻게 ????
			
			insertCnt= pstmt.executeUpdate();
	
		}finally {
//	    6. 연결 끊기
		dc.dbClose(null,pstmt,con);
	}//end catch
		
		return insertCnt;

	}//insertQuitMember	
	
	
}//AdminMemberDAO
