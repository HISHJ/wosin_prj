package ko.co.sist.vo;

import java.sql.Date;

public class AdminMemberVO {
	private String memberId, pwd, name, birth, gender, zipcode,
		addr1, addr2, email, phone, hPhone, mailChk, smsChk, status ,mdate;
	private Date InputDate;
	public AdminMemberVO() {
		super();
	}
	public AdminMemberVO(String memberId, String pwd, String name, String birth, String gender, String zipcode,
			String addr1, String addr2, String email, String phone, String hPhone, String mailChk, String smsChk,
			String status, String mdate, Date inputDate) {
		super();
		this.memberId = memberId;
		this.pwd = pwd;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.email = email;
		this.phone = phone;
		this.hPhone = hPhone;
		this.mailChk = mailChk;
		this.smsChk = smsChk;
		this.status = status;
		this.mdate = mdate;
		this.InputDate = inputDate;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String gethPhone() {
		return hPhone;
	}
	public void sethPhone(String hPhone) {
		this.hPhone = hPhone;
	}
	public String getMailChk() {
		return mailChk;
	}
	public void setMailChk(String mailChk) {
		this.mailChk = mailChk;
	}
	public String getSmsChk() {
		return smsChk;
	}
	public void setSmsChk(String smsChk) {
		this.smsChk = smsChk;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public Date getInputDate() {
		return InputDate;
	}
	public void setInputDate(Date inputDate) {
		InputDate = inputDate;
	}
	@Override
	public String toString() {
		return "AdminMemberVO [memberId=" + memberId + ", pwd=" + pwd + ", name=" + name + ", birth=" + birth
				+ ", gender=" + gender + ", zipcode=" + zipcode + ", addr1=" + addr1 + ", addr2=" + addr2 + ", email="
				+ email + ", phone=" + phone + ", hPhone=" + hPhone + ", mailChk=" + mailChk + ", smsChk=" + smsChk
				+ ", status=" + status + ", mdate=" + mdate + ", InputDate=" + InputDate + "]";
	}

	
	
	
}
	
	
	
	




	
