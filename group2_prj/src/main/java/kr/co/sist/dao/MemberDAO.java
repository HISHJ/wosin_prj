package kr.co.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.common.dao.DbConnection;
import kr.co.sist.vo.MemberVO;
import kr.co.sist.vo.QuitMemberVO;





public class MemberDAO {
	private static MemberDAO mbrDAO;

	private MemberDAO() {
		
	}//MemberDAO

	public static MemberDAO getInstance(){
			if(mbrDAO==null) {
				mbrDAO= new MemberDAO();
				
			}//end if
			return mbrDAO;
	}//end if
	
	
//	로그인,마이페이지,비밀번호찾기(id,password),회원가입완료창
	public MemberVO selectMember(MemberVO mbVO) throws SQLException  {
		
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DbConnection dc=DbConnection.getInstance();
		try {
			con=dc.getConn();
			String login= "select * from member where memberId=? and pwd=?";
			pstmt=con.prepareStatement(login);
			
			pstmt.setString(1,mbVO.getMemberId());
			pstmt.setString(2,mbVO.getPwd());
				
			rs=pstmt.executeQuery();
			if(rs.next()) {
				
//			아이디 비밀번호 일치하지 않을때는? jsp로 처리하나?=>jsp로
					mbVO=new MemberVO();
					mbVO.setName(rs.getString("name"));
					mbVO.setMemberId(rs.getString("memberId"));
					mbVO.setBirth(rs.getString("birth"));
					mbVO.setGender(rs.getString("gender"));
					mbVO.setZipcode(rs.getString("zipcode"));
					mbVO.setAddr1(rs.getString("addr1"));
					mbVO.setAddr2(rs.getString("addr2"));
					mbVO.setPhone(rs.getString("phone"));
					mbVO.sethPhone(rs.getString("hPhone"));
					mbVO.setMailChk(rs.getString("mailChk"));
					mbVO.setSmsChk(rs.getString("smsChk"));
//					mbVO.setInputdate(rs.getDate("inputdate"));
					mbVO.setMdate(rs.getString("mdate"));//to_char로 변경
			
				}//end if
					
		}finally {
		
			dc.dbClose(rs, pstmt, con);
			
		}//end catch
		
//	return값 다시 생각해보기
		return mbVO;
		
	}//selectMember
	
//	로그인 boolean으로 = > jsp코드 써보고 깔끔한거로 할거임 
	
	public boolean login(MemberVO mbVO) throws SQLException {

		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		boolean result=false;
		DbConnection dc=DbConnection.getInstance();
		try {
			con=dc.getConn();
			String login= "select * from member where memberId=? and pwd=?";
			pstmt=con.prepareStatement(login);
			
			pstmt.setString(1,mbVO.getMemberId());
			pstmt.setString(2,mbVO.getPwd());
				
			rs=pstmt.executeQuery();
		
			if(rs.next()) {
				result=true;
			}//end if
				
				}finally {
					
					dc.dbClose(rs, pstmt, con);
					
				}//end catch
		
		
		
		return result;
		
	}//login
	
	
	
	
//	아이디 찾기
	
	public MemberVO selectMemberId(MemberVO mbVO) throws SQLException {
		
		
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DbConnection dc=DbConnection.getInstance();
		try {
			con=dc.getConn();
			String idFind= "select memberId,to_char(inputdate,'yyyy-MM-dd')mdate from member where name=? and phone=?";
			pstmt=con.prepareStatement(idFind);
			//회원가입할때 to_char(inputdate,'yyy-MM-dd')하면 select할때는 to_char 안해도 되지 않을까?
			pstmt.setString(1,mbVO.getName());
			pstmt.setString(2,mbVO.getPhone());
			rs=pstmt.executeQuery();
			// 아이디 휴대폰번호 일치하지 않는경우는...?  :jsp로
			
			//일치했을때
			if(rs.next()) {
				mbVO.setMemberId(rs.getString("memberId"));
				mbVO.setMdate(rs.getString("mdate"));
				
				
				
				
			}//end if 
			
		}finally {
			
			dc.dbClose(rs, pstmt, con);
			
		}//end catch
		
		return mbVO;
		
	}//mbVO
//	비밀번호 찾기
	public MemberVO selectMemberPass(MemberVO mbVO) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DbConnection dc=DbConnection.getInstance();
		try {
			con=dc.getConn();
			String passFind= "select memberId,pwd from member where memberId=? and name=? and phone=?";
			pstmt=con.prepareStatement(passFind);
			
			pstmt.setString(1,mbVO.getMemberId());
			pstmt.setString(2,mbVO.getName());
			pstmt.setString(3,mbVO.getPhone());
			rs=pstmt.executeQuery();
			// 아이디 휴대폰번호,이름 일치하지 않는경우는...? 
			
			//일치했을때=>비밀번호변경 페이지로 이동  
			if(rs.next()) {
				mbVO=new MemberVO();
				mbVO.setMemberId(rs.getString("memberId"));
				mbVO.setPwd(rs.getString("pwd"));
			
				
				}//end if 
			
	
		}finally {
		
			dc.dbClose(rs, pstmt, con);
			
		}//end catch
			
		return mbVO;

	}//member
//비밀번호 변경
public int updatePass(String memberId, String pwd) throws SQLException {
	
	
	DbConnection dc=DbConnection.getInstance();
	PreparedStatement pstmt=null;
	Connection con=null;
	ResultSet rs =null;
	
	try {
		con=dc.getConn();
		
		String updatePass="update member set pwd=? where memberId=?";
		
		pstmt=con.prepareStatement(updatePass);
		
		pstmt.setString(1,pwd);
		pstmt.setString(2,memberId);
		
		return pstmt.executeUpdate();
	}catch(Exception e) {
			e.printStackTrace();
	}finally {
		dc.dbClose(rs, pstmt, con);
	}
	
	
	return -1; 
	
}//updatePass

//회원정보조회

public MemberVO selectMember(String memberId) throws SQLException {
	MemberVO mbVO=null;
	
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	DbConnection dc=DbConnection.getInstance();
	
	try {
		con=dc.getConn();
		String selectInfo = "select name,memberId,pwd,birth,gender,zipcode,addr1,addr2,email,phone,hphone,"
				+ "mailChk,smsChk from member where memberId=?";
		pstmt=con.prepareStatement(selectInfo);
		pstmt.setString(1, memberId);
		
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			
			mbVO=new MemberVO();
			mbVO.setName(rs.getString("name"));
			mbVO.setMemberId(rs.getString("memberId"));
			mbVO.setPwd(rs.getString("pwd")); 
			mbVO.setBirth(rs.getString("birth"));
			mbVO.setGender(rs.getString("gender"));
			mbVO.setZipcode(rs.getString("zipcode"));
			mbVO.setAddr1(rs.getString("addr1"));
			mbVO.setAddr2(rs.getString("addr2"));
			mbVO.setEmail(rs.getString("email"));
			mbVO.setPhone(rs.getString("phone"));
			mbVO.sethPhone(rs.getString("hPhone"));
			mbVO.setMailChk(rs.getString("mailChk"));
			mbVO.setSmsChk(rs.getString("smsChk"));
				
		}//end if
	}finally{
		
		dc.dbClose(rs, pstmt, con);
	}//end
	return mbVO;
}//selectMember

//회원정보수정
public int updateMember(MemberVO mbVO) throws SQLException {
	

	
	DbConnection dc=DbConnection.getInstance();
	PreparedStatement pstmt=null;
	Connection con=null;
	
	
	try {
		con=dc.getConn();
		StringBuilder updateMb = new StringBuilder();
    	updateMb.append("	update member")
    						  .append("	set name=?,birth=?,gender=?, zipcode=?,addr1=?,addr2=?,email=?,phone=?,hphone=?,mailChk=?,smsChk=?")
    						  .append("	where memberId=? and pwd=?	");
		
		
		pstmt=con.prepareStatement(updateMb.toString());
		
		pstmt.setString(1, mbVO.getName());
		pstmt.setString(2, mbVO.getBirth());
		pstmt.setString(3, mbVO.getGender());
		pstmt.setString(4,mbVO.getZipcode());
		pstmt.setString(5,mbVO.getAddr1());
		pstmt.setString(6,mbVO.getAddr2());
		pstmt.setString(7,mbVO.getEmail());
		pstmt.setString(8,mbVO.getPhone());
		pstmt.setString(9,mbVO.gethPhone());
		pstmt.setString(10,mbVO.getMailChk());
		pstmt.setString(11,mbVO.getSmsChk());
		pstmt.setString(12,mbVO.getMemberId());
		pstmt.setString(13,mbVO.getPwd());
		
		return pstmt.executeUpdate();
		
	}catch(Exception e) {
			e.printStackTrace();
	}finally {
		dc.dbClose(null, pstmt, con);
	}
	
	
	return -1;
}//updateMember


//회원가입

public int insertMember(MemberVO mbVO) throws SQLException {
	
	
	Connection con=null;
	PreparedStatement pstmt=null;
	DbConnection dc = DbConnection.getInstance();
	
	
//	1. 드라이버로딩
	try {
//	2. 커넥션 얻기
		con = dc.getConn();
//	3. 쿼리문생성객체얻기
		
		  StringBuilder join = new StringBuilder(); join.append(" insert into member ")
		 .append(" (name,memberId,pwd,birth,gender,zipcode,addr1,addr2,email,phone,hPhone,mailChk,smsChk,inputdate,status) ")
		   .append(" values(?,?,?,?,?,?,?,?,?,?,?,?,?,to_char(sysdate,'yyyy-MM-dd'),'Y')");
		 
		
		
		pstmt=con.prepareStatement(join.toString());
		
		pstmt.setString(1, mbVO.getName());
		pstmt.setString(2, mbVO.getMemberId());
		pstmt.setString(3, mbVO.getPwd());
//		비밀번호 영문 숫자,특문 중 8자~20자 사이만 insert할 수 있는 조건 찾기 
		pstmt.setString(4, mbVO.getBirth());
		pstmt.setString(5, mbVO.getGender());
		pstmt.setString(6, mbVO.getZipcode());
		pstmt.setString(7, mbVO.getAddr1());
		pstmt.setString(8, mbVO.getAddr2());
		pstmt.setString(9, mbVO.getEmail());
		pstmt.setString(10, mbVO.getPhone());
		pstmt.setString(11, mbVO.gethPhone());
		pstmt.setString(12, mbVO.getMailChk());
		pstmt.setString(13, mbVO.getSmsChk());
		
//		가입일 넣는거 그냥 getDate 맞나....? SYSDATE를 어떻게 넣어야하나....to_char(sysdate,"yyyy-mm-dd")


		
		return pstmt.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();
//		
	}finally {
//    6. 연결 끊기
	dc.dbClose(null,pstmt,con);
}//end catch
	

return -1;//데이터베이스오류
	
}//insertMember


//회원가입할때 id중복확인

public boolean selectChkId(MemberVO mbVO) throws SQLException {
	
	boolean result=false;
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	DbConnection dc=DbConnection.getInstance();
	try {
		con=dc.getConn();
		String selectChk= "select memberId from member where memberId=?";
		pstmt=con.prepareStatement(selectChk);
		
		pstmt.setString(1,mbVO.getMemberId());
	
		rs=pstmt.executeQuery();
		
		result=rs.next();
	

	}finally {
	
		dc.dbClose(rs, pstmt, con);
		
	}//end catch
	
	
	return result;
	
	
}






//회원탈퇴

//정보조회
public MemberVO selectMember(QuitMemberVO qmVO) throws SQLException {
	
	MemberVO mbVO=null;
	
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	DbConnection dc=DbConnection.getInstance();
	
	try {
		con=dc.getConn();
		String selectMb = "select name,pwd,memberId,birth,gender,zipcode,addr1,addr2,email,phone,hphone,"
				+ "mailChk,smsChk,status,to_char(inputdate,'yyyy-MM-dd')mdate from member where pwd=?";
		pstmt=con.prepareStatement(selectMb);
		
		pstmt.setString(1,qmVO.getPwd());
		
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			
			mbVO=new MemberVO();
			mbVO.setName(rs.getString("name"));
			mbVO.setMemberId(rs.getString("memberId"));
			mbVO.setPwd(rs.getString("pwd"));
			mbVO.setBirth(rs.getString("birth"));
			mbVO.setGender(rs.getString("gender"));
			mbVO.setZipcode(rs.getString("zipcode"));
			mbVO.setAddr1(rs.getString("addr1"));
			mbVO.setAddr2(rs.getString("addr2"));
			mbVO.setPhone(rs.getString("phone"));
			mbVO.sethPhone(rs.getString("hPhone"));
			mbVO.setMailChk(rs.getString("mailChk"));
			mbVO.setSmsChk(rs.getString("smsChk"));
			mbVO.setStatus(rs.getString("status"));	
			mbVO.setMdate(rs.getString("mdate"));
		}//end if
	}finally{
		
		dc.dbClose(rs, pstmt, con);
	}//end
	return mbVO;
}//selectMember

//탈퇴정보 업데이트


public int updateMemberStatus(String memberId, String pwd) throws SQLException{
	
	int updateMbsCnt=0;
	DbConnection dc=DbConnection.getInstance();
	PreparedStatement pstmt=null;
	Connection con=null;
	
	
	try {
		con=dc.getConn();
		
		
    	String updateMbs ="update member set  pwd=' ', name=' ', birth=' ', gender=' ',zipcode=' ',addr1=' ', addr2=' ', email=' ',phone=' ',hphone=' ',mailchk=' ',smschk=' ', inputdate=to_date(inputdate,null), status='N' where memberid=? and  pwd=?";
    
		pstmt=con.prepareStatement(updateMbs);
		
		pstmt.setString(1,memberId);
		pstmt.setString(2,pwd);
		updateMbsCnt=pstmt.executeUpdate();
		

	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		dc.dbClose(null, pstmt, con);
	}//end finally

	return updateMbsCnt;
	

}//updateMemberStatus

//회원탈퇴 테이블에 추가
public int insertQuitMember(QuitMemberVO qmVO) throws SQLException {
	
	
	DbConnection dc = DbConnection.getInstance();
	Connection con=null;
	PreparedStatement pstmt=null;
	
//	1. 드라이버로딩
	try {
//	2. 커넥션 얻기
		con = dc.getConn();
//	3. 쿼리문생성객체얻기
		String quit="insert into quitmember(memberId,reason,inputdate) values(?,?,to_char(sysdate,'yyyy-MM-dd'))";
		
		pstmt=con.prepareStatement(quit);
		
		pstmt.setString(1, qmVO.getMemberId());//회원정보추가
		pstmt.setString(2, qmVO.getReason());//회원 언어정보 추가
// SYSDATE는 어떻게 ????
		
		return pstmt.executeUpdate();
	}catch(Exception e) {
		e.printStackTrace();

	}finally {
//    6. 연결 끊기
	dc.dbClose(null,pstmt,con);
}//end catch
	
	return -1;

}//insertQuitMember

	
	 
}//MemberDAO
