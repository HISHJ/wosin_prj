package ko.co.sist.vo;

import java.sql.Date; // sql맞던가?

//회원관리 테이블에서 번호생성은 어떻게 하는거지?
public class MemberVO {
	private String memberId, pwd, name, birth,gender,
		zipcode, addr1, addr2, email, phone, hPhone, //mdate : to_char을 string으로 변환
		mailChk, smsChk, status,mdate;
	private Date inputdate;
	public MemberVO() {
		super();
	}
	public MemberVO(String memberId, String pwd, String name, String birth,  String gender,
			String zipcode, String addr1, String addr2, String email, String phone, String hPhone, 
			String mailChk, String smsChk, String mdate,String status, Date inputdate) {
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
		this.mdate = mdate;
		this.status = status;
		this.inputdate = inputdate;
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
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getInputdate() {
		return inputdate;
	}
	public void setInputdate(Date inputdate) {
		this.inputdate = inputdate;
	}
	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", pwd=" + pwd + ", name=" + name + ", birth=" + birth + ", gender="
				+ gender + ", zipcode=" + zipcode + ", addr1=" + addr1 + ", addr2=" + addr2 + ", email=" + email
				+ ", phone=" + phone + ", hPhone=" + hPhone + ", mdate=" + mdate + ", mailChk=" + mailChk + ", smsChk="
				+ smsChk + ", status=" + status + ", inputdate=" + inputdate + "]";
	}

	
	
}//MemberVO
	