package kr.co.sist.vo ;

import java.sql.Date;

public class AdminQuitMemberVO {
	private String memberId, pwd, reason,mdate;

	
	public AdminQuitMemberVO() {
	}

	public AdminQuitMemberVO(String memberId, String pwd, String reason, String mdate) {
		super();
		this.memberId = memberId;
		this.pwd = pwd;
		this.reason = reason;
		this.mdate = mdate;
		
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

	@Override
	public String toString() {
		return "QuitMemberVO [memberId=" + memberId + ", pwd=" + pwd + ", reason=" + reason + ", mdate=" + mdate + "]";
	}





	
	
	
	
}
