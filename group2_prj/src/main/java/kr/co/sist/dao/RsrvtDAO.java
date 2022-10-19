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


/**
 * 반환형인 것들은 오류 안생기게 method 내부에 값만 넣어놨어요
 * 
 * @author user 
 */
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
   
   //페이지네이션을 위한 쿼리문
	// 사용자가 날짜를 설정했을 때 조회되는 예매내역
		public int selectRsrvtPagenation(RsrvtInfoVO rVO) throws SQLException {
			int count = 0;

			DbConnection dc = DbConnection.getInstance();

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				con = dc.getConn();
				StringBuilder selectRservt = new StringBuilder();

				selectRservt
				        .append("select count(*) count")
				        .append(" from (select to_char(r.inputdate,'yyyy-mm-dd') r_inputdate,r.rsrvtid r_rsrvtid, sho.name sho_name, r.showdate r_showdate, r.totalcnt r_totalcnt, r.totalpice r_totalprice, r.status r_status ")
						.append(" from rsrvt r, show sho, member m ")
						.append(" where (r.memberid = m.memberid and r.showid = sho.showid) and m.memberid = ? "
								+ " and ( ? < to_char(r.inputdate,'yyyy-mm-dd') and to_char(r.inputdate,'yyyy-mm-dd') < ? ) ")
						.append(" order by r_inputdate )");

				pstmt = con.prepareStatement(selectRservt.toString());
				pstmt.setString(1, rVO.getMemberId());
				pstmt.setString(2, rVO.getFindStartDate());
				pstmt.setString(3, rVO.getFindEndDate());

				rs = pstmt.executeQuery();
				
				RsrvtInfoVO vo = null;	
				
				while (rs.next()) {
					vo = new RsrvtInfoVO();

					count = rs.getInt("count");

				}

			} finally {
				dc.dbClose(rs, pstmt, con);
			}

			return count;
		}// selectShow

   
   

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

   // ✔검증완료a
   // 예매내역삭제 - 좌석 편 (예매상태로 유효성검사 해야할 듯)
   // 이 예매코드의 예매상태가 "예매완료"라면 delete X
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

   /////////////////////////////////////////////////////// 위까지
   /////////////////////////////////////////////////////// 설빈영역/////////////////////////////////////////////////////////
   ////////////////////////////////////// 1008 show_rsrvt3.jsp 용 최정민 테스트
   // ✔검증완료ㄱ
   // ✔공영상영날짜조회(공연코드)
   public List<RsrvtInfoVO> selectShowSch(String showId) throws IOException, SQLException {
      List<RsrvtInfoVO> showSchList = new ArrayList<RsrvtInfoVO>();

      DbConnection dc = DbConnection.getInstance();

      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      try {
         con = dc.getConn();
         StringBuilder sb = new StringBuilder();
         //sb.append(" select sch.schdate sch_schdate, sch.schtime sch_schtime, sch.schid sch_schid ")
         sb.append(" select sch.schdate sch_schdate, sch.schtime sch_schtime, sch.schid sch_schid, to_char(to_date(schdate),'dy') sch_day ")
               .append(" from schedule sch, show sho  ")
               .append(" where (sch.showid = sho.showid) and sho.showid= ? ")
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

//////////////////////10-08 23:07 show_rsrvt3 페이지 정보뿌리기 위한 쿼리문 테스트
   public RsrvtInfoVO selectRsrvtInfo(String schid, int cnt) throws SQLException {
      RsrvtInfoVO rsrvtInfoVO = null;

      DbConnection dc = DbConnection.getInstance();

      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      try {
         con = dc.getConn();
         StringBuilder selectSeat = new StringBuilder();

         /*
          * select sho.thimg sho_thimg, sho.name sho_name, sch.schdate sch_schdate,
          * sch.schtime sch_schtime, sho.price sho_price from schedule sch, show sho
          * where (sch.showid = sho.showid) and sch.schid= 'sctest0009';
          */
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
   /* public int insertRsrvtList(List<RsrvtInfoVO> riList) throws SQLException { */
   public int insertRsrvtTest(RsrvtInfoVO riVO) throws SQLException {
      int i = 0;

      // DbConection클래스의 연결메소드 연결끊기, 메소드 가져오기
      DbConnection dc = DbConnection.getInstance();
      Connection con = null;
      PreparedStatement pstmt = null;

      // 1.드라이버로딩
      try {
         // 2.Connection연결얻기 (DbConnection 클래스의 getConn())
         con = dc.getConn();
         // 3. 쿼리문 우선작성(bind) memberid,membername 로그인이랑 연결되면 추후 가져와야함

         // 좌석번호는 얘한테 줄필요가없는거?
         // ? 그럼 반복할 필요가없네 아예?
         String insertRsrvt = " insert into rsrvt(rsrvtid,showid,memberid,membername,totalcnt,showdate,totalpice,status,inputdate) "
               + " values(concat('rs_',lpad(show_seq.nextval,7,0)),?,?,?,?,?,?,'예매완료',to_char(sysdate,'yyyy-mm-dd')) ";
         // 3-1. 쿼리문 생성객체 얻기
         pstmt = con.prepareStatement(insertRsrvt);
         // 4. 바인드변수에 값 설정

         /* for(RsrvtInfoVO riVO : riList){ */
         pstmt.setString(1, riVO.getShowId());
         pstmt.setString(2, riVO.getMemberId());
         pstmt.setString(3, riVO.getMemberName());
         pstmt.setInt(4, riVO.getRsrvtTotalCnt());
         pstmt.setString(5, riVO.getSchDate() + " " + riVO.getSchTime());
         pstmt.setInt(6, riVO.getTotalPrice());

         // 5. 쿼리문 수행
         i = pstmt.executeUpdate();
         /* } */

      } finally {
         dc.dbClose(null, pstmt, con);
      }

      return i;
   }// insertRsrvt

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

   public String selectRsrvtId(RsrvtInfoVO riVO) throws SQLException {
      String rsrvtId = "";

      // DbConection클래스의 연결메소드 연결끊기, 메소드 가져오기
      DbConnection dc = DbConnection.getInstance();
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      // 1.드라이버로딩
      try {
         // 2.Connection연결얻기 (DbConnection 클래스의 getConn())
         con = dc.getConn();
         // 3. 쿼리문 우선작성(bind)
         /*
          * select r_rsrvtid from (select r.rsrvtid r_rsrvtid from show sw, rsrvt r,
          * schedule sc where r.showid = 'showtest77' and r.memberid = 'test24' and
          * sc.schid = 'sctest0008' order by r_rsrvtid desc ) where rownum = 1;
          */
         StringBuilder sb = new StringBuilder();

         sb.append(" select r_rsrvtid ").append(" from (select r.rsrvtid r_rsrvtid ")
               .append(" from show sw, rsrvt r, schedule sc ").append(" where r.showid = ? ")
               .append(" and r.memberid = ? ").append(" order by r_rsrvtid desc) ").append(" where rownum = 1 ");

         pstmt = con.prepareStatement(sb.toString());
         // System.out.println(riVO.getShowId());
         // System.out.println(riVO.getSchId());
         // 3-1. 쿼리문 생성객체 얻기
         // 4.바인드변수에 값 설정
         pstmt.setString(1, riVO.getShowId());
         pstmt.setString(2, riVO.getMemberId());
         /* pstmt.setString(3, riVO.getSchId()); */
         /* String test3 = "sctest0008"; */
         /* pstmt.setString(1, test1); */
//         String test2 = "test24";
//         pstmt.setString(2, test2);

         // 5. 쿼리문 수행
         rs = pstmt.executeQuery();
         if (rs.next()) {
            rsrvtId = rs.getString("r_rsrvtid");
            // System.out.println(rs.getString("r_rsrvtid"));
         } else {
            System.out.println("조회된값없음");
         }

      } finally {
         dc.dbClose(rs, pstmt, con);
      }

      return rsrvtId;
   }// selectRsrvtId

   // 10-11 비연결성 처리위한 select 매서드
   public boolean selectSeatChk(String schid, String[] seats) throws SQLException {
      boolean flag = false;

      DbConnection dc = DbConnection.getInstance();
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         con = dc.getConn();
         /*
          * select * from seat where schid = 'sctest0002' and seatid = '3';
          */
         StringBuilder sb = new StringBuilder();

         sb.append(" select * from seat ").append(" where schid = ? and seatid = ? ");

         pstmt = con.prepareStatement(sb.toString());

         for (int i = 0; i < seats.length; i++) {
            // System.out.println("확인용 : "+schid+","+seats);
            pstmt.setString(1, schid);
            pstmt.setString(2, seats[i]);
            rs = pstmt.executeQuery();

            flag = rs.next(); // 해당 상영일정코드와, 좌석번호가 있다 ㅇㅇ
            if (flag) {
               break;
            }
         }

      } finally {
         dc.dbClose(rs, pstmt, con);
      }

      return flag;
   }
   
   // 2022-10-15 rsrvt테이블 insert 위한 회원명 조회 메서드 추가////////////////////////////////////////
   
   public String selectMemberName(String mbId) throws SQLException {
		
	    String memberName = "없숨";
	    
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
		
	    /*
	     * select schdate, schtime from schedule
	    where schid='sctest0009';
	     */
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