package kr.co.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.common.dao.DbConnection;
import kr.co.sist.vo.AdminRsrvtInfoVO;
import oracle.security.o3logon.a;

public class AdminRsrvtDAO {
	private static AdminRsrvtDAO arDAO;

	private AdminRsrvtDAO() {
	}

	public static AdminRsrvtDAO getInstance() {

		if (arDAO == null) {
			arDAO = new AdminRsrvtDAO();
		}
		return arDAO;
	}
	
	//리스트조회 / 동적쿼리 사용
	//검색버튼 각각 있는 경우
	public List<AdminRsrvtInfoVO> selectRsrvt(AdminRsrvtInfoVO inputVO) throws SQLException {
		List<AdminRsrvtInfoVO> outputList = new ArrayList<AdminRsrvtInfoVO>();
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//String queryAdd="";
		
		try {
			con = dc.getConn();
			String selectRsrvt =  "select  r.rsrvtid r_id, m.name m_name, m.memberid m_id, m.phone m_phone, r.inputdate r_input, r.status r_status from  rsrvt r, member m where (r.memberid = m.memberid) ";
			
			if(!(inputVO.getRsrvtStatus()==null)){
				selectRsrvt += " and r.status = '" + inputVO.getRsrvtStatus() + "' ";
			}
			
			if(!(inputVO.getFindStartDate()==null) && !(inputVO.getFindEndDate()==null)) {
				selectRsrvt += " and '" + inputVO.getFindStartDate() +  "' < r.inputdate"
						     + " and '" + inputVO.getFindEndDate() +  "' > r.inputdate";

			}
			
			pstmt = con.prepareStatement(selectRsrvt);
			
			rs = pstmt.executeQuery();
			
			AdminRsrvtInfoVO ariVO= null;
			while(rs.next()) {
				ariVO = new AdminRsrvtInfoVO();
				
				ariVO.setRsrvtId(rs.getString("r_id"));
				ariVO.setUserName(rs.getString("m_name"));
				ariVO.setUserId(rs.getString("m_id"));
				ariVO.setPhone(rs.getString("m_phone"));
				ariVO.setRsrvtInputDate(rs.getDate("r_input"));
				ariVO.setRsrvtStatus(rs.getString("r_status"));
				
				outputList.add(ariVO);
				
			}
		
		} finally {
			dc.dbClose(rs, pstmt, con);
		}
		return outputList;
	
	}
	
	public AdminRsrvtInfoVO selectRsrvtDetail(String rsrvtId) throws SQLException {
		AdminRsrvtInfoVO ariVO = new AdminRsrvtInfoVO();
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dc.getConn();
			StringBuilder selectOneCpEmp = new StringBuilder();
			
			
			selectOneCpEmp.append(" select r_rsrvtid , sw_name ,r_membername , r_memberid, r_totalcnt,"
					+ "   listagg(st_seatid,',') st_seatid,r_inputdate ,m_phone, m_email,r_totalprice,r_status")
			.append(" from rsrvt_detail_ ")
			.append(" where r_rsrvtid =? ")
			.append(" group by r_rsrvtid,sw_name,r_membername, r_memberid,r_totalcnt,r_inputdate,m_phone,m_email, r_totalprice,r_status ");
			
			pstmt = con.prepareStatement(selectOneCpEmp.toString());
			
			pstmt.setString(1, rsrvtId);
			
			rs = pstmt.executeQuery();
			
			
			if (rs.next()) {
				ariVO = new AdminRsrvtInfoVO();
				
				ariVO.setRsrvtId(rs.getString("r_rsrvtid"));
				ariVO.setShowName(rs.getString("sw_name"));
				ariVO.setUserName(rs.getString("r_membername"));
				ariVO.setUserId(rs.getString("r_memberid"));
				ariVO.setRsrvtCnt(rs.getInt("r_totalcnt"));
				ariVO.setSeatId(rs.getString("st_seatid"));
				ariVO.setRsrvtInputDate(rs.getDate("r_inputdate"));
				ariVO.setPhone(rs.getString("m_phone"));
				ariVO.setEmail(rs.getString("m_email"));
				ariVO.setTotalPrice(rs.getInt("r_totalprice"));
				ariVO.setRsrvtStatus(rs.getString("r_status"));
				
			}
			
		} finally {
			dc.dbClose(rs, pstmt, con);
		}
		return ariVO;
	}
	


}