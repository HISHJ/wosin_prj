package kr.co.sist.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
//import java.sql.PseudoColumnUsage;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.common.dao.DbConnection;
import kr.co.sist.vo.RsrvtInfoVO;


public class RsrvtDAO {

   // 싱글톤
   private static RsrvtDAO rsrvtDAO;

   private RsrvtDAO() {

   }// RsrvtDAO

   public static RsrvtDAO getInstance() {
      if (rsrvtDAO == null) {
         rsrvtDAO = new RsrvtDAO();
      }

      return rsrvtDAO;
   }// getInstance
   
  
   

   // 검증완료✔✔
   // 사용자가 날짜를 설정했을 때 조회되는 예매내역
   public List<RsrvtInfoVO> selectRsrvt(RsrvtInfoVO rVO) throws SQLException {
      List<RsrvtInfoVO> rsrvtlist = new ArrayList<RsrvtInfoVO>();

      DbConnection dc = DbConnection.getInstance();

      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      try {
         con = dc.getConn();
         StringBuilder selectRservt = new StringBuilder();

         selectRservt.append(
               " select to_char(r.inputdate,'yyyy-mm-dd') r_inputdate,r.rsrvtid r_rsrvtid, sho.name sho_name, r.showdate r_showdate, r.totalcnt r_totalcnt, r.totalpice r_totalprice, r.status r_status ")
               .append(" from rsrvt r, show sho, member m ")
               .append(" where (r.memberid = m.memberid and r.showid = sho.showid) and m.memberid = ? "
                     + " and ( ? < to_char(r.inputdate,'yyyy-mm-dd') and to_char(r.inputdate,'yyyy-mm-dd') < ? ) ")
               .append(" order by r_inputdate ");

         pstmt = con.prepareStatement(selectRservt.toString());
         pstmt.setString(1, rVO.getMemberId());
         pstmt.setString(2, rVO.getFindStartDate());
         pstmt.setString(3, rVO.getFindEndDate());

         rs = pstmt.executeQuery();
         RsrvtInfoVO rsrvtVO = null;

         while (rs.next()) {
            rsrvtVO = new RsrvtInfoVO();

            rsrvtVO.setRsrvtInputDate(rs.getDate("r_inputdate"));
            rsrvtVO.setRsrvtId(rs.getString("r_rsrvtid"));
            rsrvtVO.setShowName(rs.getString("sho_name"));
            rsrvtVO.setShowDate(rs.getString("r_showdate"));
            rsrvtVO.setRsrvtTotalCnt(rs.getInt("r_totalcnt"));
            rsrvtVO.setTotalPrice(rs.getInt("r_totalprice"));
            rsrvtVO.setRsrvtStatus(rs.getString("r_status"));

            rsrvtlist.add(rsrvtVO);

         }

      } finally {
         dc.dbClose(rs, pstmt, con);
      }

      return rsrvtlist;
   }// selectShow

   // 예매 상세내역
   public RsrvtInfoVO selectRsrvtDetail(String str) throws SQLException {
      RsrvtInfoVO rVO = null;

      DbConnection dc = DbConnection.getInstance();

      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      try {
         con = dc.getConn();
         StringBuilder selectRsrvtDetail = new StringBuilder();
         selectRsrvtDetail.append(
               " select r_rsrvtid, listagg(s_seatid,',') s_seatid, sho_showid, r_membername ,r_showdate, r_totalcnt, sho_name, r_totalpice ")
               .append(" from rsrvt_u_detail ").append(" where r_rsrvtid = ? ")
               .append(" group by r_rsrvtid, sho_showid, r_membername, r_showdate, r_totalcnt, sho_name, r_totalpice ");

         pstmt = con.prepareStatement(selectRsrvtDetail.toString());

         pstmt.setString(1, str);

         rs = pstmt.executeQuery();

         if (rs.next()) {
            rVO = new RsrvtInfoVO();
            rVO.setRsrvtId(rs.getString("r_rsrvtid"));
            rVO.setSeatId(rs.getString("s_seatid"));
            rVO.setShowId(rs.getString("sho_showid"));
            rVO.setMemberName(rs.getString("r_membername"));
            rVO.setShowDate(rs.getString("r_showdate"));
            rVO.setRsrvtTotalCnt(rs.getInt("r_totalcnt"));
            rVO.setShowName(rs.getString("sho_name"));
            rVO.setTotalPrice(rs.getInt("r_totalpice"));

            // rVO.add(rsrvtVO);

         }
      } finally {
         dc.dbClose(rs, pstmt, con);
      }
      return rVO;
   }// selectRsrvtDetail

   // 예매상태 변경
   public int updateRsrvt(RsrvtInfoVO rVO) throws SQLException {
      int updateCnt = 0;

      DbConnection dc = DbConnection.getInstance();

      Connection con = null;
      PreparedStatement pstmt = null;

      try {
         con = dc.getConn();
         StringBuilder updateCpEmp = new StringBuilder();

         updateCpEmp.append(" update rsrvt").append(" set status = ?").append(" where rsrvtid = ?");

         pstmt = con.prepareStatement(updateCpEmp.toString());

         pstmt.setString(1, rVO.getRsrvtStatus());
         pstmt.setString(2, rVO.getRsrvtId());

         updateCnt = pstmt.executeUpdate();

      } finally {
         dc.dbClose(null, pstmt, con);
      }
      return updateCnt;
   }

   // ✔검증완료
   // "예매취소"라면 delete
   public int deleteSeat(String str) throws SQLException {
      int deleteS = 0;

      DbConnection dc = DbConnection.getInstance();

      Connection con = null;
      PreparedStatement pstmt = null;
      try {
         con = dc.getConn();
         String deleteSeat = " delete from seat where rsrvtid=?  ";
         pstmt = con.prepareStatement(deleteSeat);
         pstmt.setString(1, str);
         deleteS = pstmt.executeUpdate();

      } finally {
         dc.dbClose(null, pstmt, con);
      }

      return deleteS;
   }// deleteSeat

   // 최정민
   public List<RsrvtInfoVO> selectShowSch(String showId) throws IOException, SQLException {
      List<RsrvtInfoVO> showSchList = new ArrayList<RsrvtInfoVO>();

      DbConnection dc = DbConnection.getInstance();

      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      try {
         con = dc.getConn();
         StringBuilder sb = new StringBuilder();
         
         /*
          * 최정민 테스트 현재날짜,시간 이전상영일정은 조회하지않음
			select sch.schdate sch_schdate, sch.schtime sch_schtime, sch.schid sch_schid, to_char(to_date(schdate),'dy') sch_day
			from schedule sch, show sho
			where (sch.showid = sho.showid) and sho.showid= 'sh_0000203' and to_char(sysdate,'yyyy-mm-dd hh24:mm') < schdate ||' '|| schtime
			order by schdate, schtime;
          * 
          */
         //sb.append(" select sch.schdate sch_schdate, sch.schtime sch_schtime, sch.schid sch_schid ")
         sb.append(" select sch.schdate sch_schdate, sch.schtime sch_schtime, sch.schid sch_schid, to_char(to_date(schdate),'dy') sch_day ")
               .append(" from schedule sch, show sho  ")
               .append(" where (sch.showid = sho.showid) and sho.showid= ? ")
               .append(" and to_char(sysdate,'yyyy-mm-dd hh24:mm') < schdate ||' '|| schtime ")
               .append(" order by schdate, schtime ");

         pstmt = con.prepareStatement(sb.toString());

         pstmt.setString(1, showId);
         rs = pstmt.executeQuery();

         RsrvtInfoVO rsrvtVO = null;

         while (rs.next()) {
            rsrvtVO = new RsrvtInfoVO();

            rsrvtVO.setSchDate(rs.getString("sch_schdate"));
            rsrvtVO.setSchTime(rs.getString("sch_schtime"));
            rsrvtVO.setSchId(rs.getString("sch_schid"));
            rsrvtVO.setSchDay(rs.getString("sch_day"));

            showSchList.add(rsrvtVO);
         }

      } finally {
         dc.dbClose(rs, pstmt, con);
      }
      return showSchList;
   }// selectShowSch

   ////////최정민
   public List<String> selectSeat(String schid) throws SQLException {
      List<String> seatlist = new ArrayList<String>();
      
      DbConnection dc = DbConnection.getInstance();

      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      try {
         con = dc.getConn();
         StringBuilder selectSeat = new StringBuilder();
         selectSeat.append(" select  se.seatid se_seatid  ")
                   .append(" from seat se, schedule sch, rsrvt r ")
                   .append(" where (se.rsrvtid = r.rsrvtid and se.schid = sch.schid ) and sch.schid = ? ");
                   //.append(" where (se.rsrvtid = r.rsrvtid and se.schid = sch.schid ) and sch.schdate=? and sho.showid=?");
         

         pstmt = con.prepareStatement(selectSeat.toString());
         
          pstmt.setString(1, schid);
          
          rs = pstmt.executeQuery();          
         
          while(rs.next()) {
             seatlist.add(rs.getString("se_seatId"));   
          }
      }finally {
         dc.dbClose(rs, pstmt, con);
      }
   
      return seatlist;
   }//selectSeat

//////////////////////10-08 23:07 최정민 show_rsrvt3 페이지 정보뿌리기 위한 쿼리문 테스트
   public RsrvtInfoVO selectRsrvtInfo(String schid, int cnt) throws SQLException {
      RsrvtInfoVO rsrvtInfoVO = null;

      DbConnection dc = DbConnection.getInstance();

      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      try {
         con = dc.getConn();
         StringBuilder selectSeat = new StringBuilder();

         selectSeat.append(" select sho.name sho_name, sch.schdate sch_schdate,  ")
               .append(" sch.schtime sch_schtime, sho.price sho_price ").append(" from schedule sch, show sho ")
               .append(" where (sch.showid = sho.showid) and sch.schid= ? ");

         pstmt = con.prepareStatement(selectSeat.toString());

         pstmt.setString(1, schid);

         rs = pstmt.executeQuery();
         while (rs.next()) {
            rsrvtInfoVO = new RsrvtInfoVO();
            rsrvtInfoVO.setShowName(rs.getString("sho_name"));
            rsrvtInfoVO.setSchDate(rs.getString("sch_schdate"));
            rsrvtInfoVO.setSchTime(rs.getString("sch_schtime"));
            rsrvtInfoVO.setTotalPrice(rs.getInt("sho_price") * cnt);
         }
      } finally {
         dc.dbClose(rs, pstmt, con);
      }

      return rsrvtInfoVO;
   }// selectRsrvtInfo

////////////////////////10-09 show_rsrvt3_process.jsp  예매, 좌석 insert 위한테스트
   public int insertRsrvtTest(RsrvtInfoVO riVO) throws SQLException {
      int i = 0;

      // DbConection클래스의 연결메소드 연결끊기, 메소드 가져오기
      DbConnection dc = DbConnection.getInstance();
      Connection con = null;
      PreparedStatement pstmt = null;

      try {
         con = dc.getConn();
         String insertRsrvt = " insert into rsrvt(rsrvtid,showid,memberid,membername,totalcnt,showdate,totalpice,status,inputdate) "
               + " values(concat('rs_',lpad(show_seq.nextval,7,0)),?,?,?,?,?,?,'예매완료',to_char(sysdate,'yyyy-mm-dd')) ";
         pstmt = con.prepareStatement(insertRsrvt);

         pstmt.setString(1, riVO.getShowId());
         pstmt.setString(2, riVO.getMemberId());
         pstmt.setString(3, riVO.getMemberName());
         pstmt.setInt(4, riVO.getRsrvtTotalCnt());
         pstmt.setString(5, riVO.getSchDate() + " " + riVO.getSchTime());
         pstmt.setInt(6, riVO.getTotalPrice());

         // 5. 쿼리문 수행
         i = pstmt.executeUpdate();

      } finally {
         dc.dbClose(null, pstmt, con);
      }

      return i;
   }// insertRsrvt

   // 최정민
   public int insertSeatTest(List<RsrvtInfoVO> riList, String rsrvtId) throws SQLException {
      int i = 0;

      // DbConection클래스의 연결메소드 연결끊기, 메소드 가져오기
      DbConnection dc = DbConnection.getInstance();
      Connection con = null;
      PreparedStatement pstmt = null;

      // 1.드라이버로딩
      try {
         // 2.Connection연결얻기 (DbConnection 클래스의 getConn())
         con = dc.getConn();
         // 3. 쿼리문 우선작성(bind)
         String insertSeat = " insert into seat(seatid,rsrvtid,schid) values(?,?,?)";
         // 3-1. 쿼리문 생성객체 얻기
         pstmt = con.prepareStatement(insertSeat);
         // 4.바인드변수에 값 설정
         for (RsrvtInfoVO riVO : riList) {
            System.out.println(riVO.getSeatId() + "," + rsrvtId + "," + riVO.getSchId());
            pstmt.setString(1, riVO.getSeatId());
            pstmt.setString(2, rsrvtId);
            pstmt.setString(3, riVO.getSchId());

            // 5. 쿼리문 수행
            i += pstmt.executeUpdate();
         }
      } finally {
         dc.dbClose(null, pstmt, con);
      }
      // System.out.println(i);

      return i;
   }// insertSeat
   
   // 최정민 예매완료후 예매번호 받아서 좌석insert위한 메서드
   public String selectRsrvtId(RsrvtInfoVO riVO) throws SQLException {
      String rsrvtId = "";

      // DbConection클래스의 연결메소드 연결끊기, 메소드 가져오기
      DbConnection dc = DbConnection.getInstance();
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         con = dc.getConn();
         StringBuilder sb = new StringBuilder();

         sb.append(" select r_rsrvtid ").append(" from (select r.rsrvtid r_rsrvtid ")
               .append(" from show sw, rsrvt r, schedule sc ").append(" where r.showid = ? ")
               .append(" and r.memberid = ? ").append(" order by r_rsrvtid desc) ").append(" where rownum = 1 ");

         pstmt = con.prepareStatement(sb.toString());
         
         pstmt.setString(1, riVO.getShowId());
         pstmt.setString(2, riVO.getMemberId());

         rs = pstmt.executeQuery();
         if (rs.next()) {
            rsrvtId = rs.getString("r_rsrvtid");
         } else {
            System.out.println("조회된값없음");
         }

      } finally {
         dc.dbClose(rs, pstmt, con);
      }

      return rsrvtId;
   }// selectRsrvtId

   // 10-11 최정민 비연결성 처리위한 select 매서드
   public boolean selectSeatChk(String schid, String[] seats) throws SQLException {
      boolean flag = false;

      DbConnection dc = DbConnection.getInstance();
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         con = dc.getConn();
         StringBuilder sb = new StringBuilder();

         sb.append(" select * from seat ").append(" where schid = ? and seatid = ? ");

         pstmt = con.prepareStatement(sb.toString());

         for (int i = 0; i < seats.length; i++) {
            pstmt.setString(1, schid);
            pstmt.setString(2, seats[i]);
            rs = pstmt.executeQuery();

            flag = rs.next(); 
            if (flag) {
               break;
            }
         }

      } finally {
         dc.dbClose(rs, pstmt, con);
      }

      return flag;
   }
   
   // 2022-10-15 최정민 rsrvt테이블 insert 위한 회원명 조회 메서드 추가////////////////////////////////////////
   
   public String selectMemberName(String mbId) throws SQLException {
		
	    String memberName = "";
	    
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DbConnection dc=DbConnection.getInstance();
		try {
			con=dc.getConn();
			String nameFind= " select name from member where memberid = ? ";
			pstmt=con.prepareStatement(nameFind);
			
			pstmt.setString(1,mbId);
			rs=pstmt.executeQuery();
			
			//일치했을때
			if(rs.next()) {
				memberName = rs.getString("name");
				
			}//end if 
			
		}finally {
			
			dc.dbClose(rs, pstmt, con);
			
		}//end catch
		
		return memberName;
	}
   
    public RsrvtInfoVO selectSchInfo(String schid) throws SQLException {
    	RsrvtInfoVO schInfo = null;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DbConnection dc=DbConnection.getInstance();
		try {
			con=dc.getConn();
			String str = " select schdate, schtime, to_char(to_date(schdate),'dy') schday from schedule where schid = ? ";
			pstmt=con.prepareStatement(str);
			
			pstmt.setString(1,schid);
			rs = pstmt.executeQuery();
			 
			//일치했을때
			if(rs.next()) {
				schInfo = new RsrvtInfoVO();
				schInfo.setSchDate(rs.getString("schdate"));
				schInfo.setSchTime(rs.getString("schtime"));
				schInfo.setSchDay(rs.getString("schday"));
			}
			
		}finally {
			
			dc.dbClose(rs, pstmt, con);
			
		}//end catch
		
		return schInfo;
	}

}// class