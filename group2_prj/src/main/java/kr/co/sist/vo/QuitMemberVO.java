package kr.co.sist.vo ;

import java.sql.Date;

public class QuitMemberVO {
	private String memberId, pwd, reason,mdate;
	private Date date;
	
	public QuitMemberVO() {
	}

	public QuitMemberVO(String memberId, String pwd, String reason, String mdate, Date date) {
		super();
		this.memberId = memberId;
		this.pwd = pwd;
		this.reason = reason;
		this.mdate = mdate;
		this.date = date;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "QuitMemberVO [memberId=" + memberId + ", pwd=" + pwd + ", reason=" + reason + ", mdate=" + mdate
				+ ", date=" + date + "]";
	}
	

	
	
	
	
}
