package kr.co.sist.vo ;

import java.sql.Date;

public class AdminQuitMemberVO {
	private String memberId, pwd, reason;
	private Date date;
	
	public AdminQuitMemberVO() {
	}
	
	public AdminQuitMemberVO(String memberId, String pwd, String reason ,Date date) {
		this.memberId = memberId;
		this.pwd = pwd;
		this.reason = reason;
		this.date=date;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
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

	
}
