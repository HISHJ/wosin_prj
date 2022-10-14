package kr.co.sist.vo;

import java.sql.Date;
// 유설빈
public class AdminVO {
	private String id, pwd;
	private Date inputDate;
	
	public AdminVO() {
	}

	public AdminVO(String id, String pwd, Date inputDate) {
		this.id = id;
		this.pwd = pwd;
		this.inputDate = inputDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Date getInputDate() {
		return inputDate;
	}

	public void setInputDate(Date inputDate) {
		this.inputDate = inputDate;
	}
	

}
