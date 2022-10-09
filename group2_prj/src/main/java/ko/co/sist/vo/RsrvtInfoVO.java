package ko.co.sist.vo;

import java.sql.Date;

public class RsrvtInfoVO {
	private String rsrvtId, showName, schDate, schTime, rsrvtStatus,
		memberId,memberName, showId, seatId, selectDate,schId,showDate,
		findStartDate, findEndDate,rsrvtPhoneNumber, rsrvtEmail;
	private Date rsrvtInputDate ;
	private int rsrvtTotalCnt, totalPrice;
	
	
	public RsrvtInfoVO() {
		
	}


	public RsrvtInfoVO(String rsrvtId, String showName, String schDate, String schTime, String rsrvtStatus,
			String memberId, String memberName, String showId, String seatId, String selectDate, String schId,
			String showDate, String findStartDate, String findEndDate, String rsrvtPhoneNumber, String rsrvtEmail,
			Date rsrvtInputDate, int rsrvtTotalCnt, int totalPrice) {
		super();
		this.rsrvtId = rsrvtId;
		this.showName = showName;
		this.schDate = schDate;
		this.schTime = schTime;
		this.rsrvtStatus = rsrvtStatus;
		this.memberId = memberId;
		this.memberName = memberName;
		this.showId = showId;
		this.seatId = seatId;
		this.selectDate = selectDate;
		this.schId = schId;
		this.showDate = showDate;
		this.findStartDate = findStartDate;
		this.findEndDate = findEndDate;
		this.rsrvtPhoneNumber = rsrvtPhoneNumber;
		this.rsrvtEmail = rsrvtEmail;
		this.rsrvtInputDate = rsrvtInputDate;
		this.rsrvtTotalCnt = rsrvtTotalCnt;
		this.totalPrice = totalPrice;
	}


	public String getRsrvtId() {
		return rsrvtId;
	}


	public void setRsrvtId(String rsrvtId) {
		this.rsrvtId = rsrvtId;
	}


	public String getShowName() {
		return showName;
	}


	public void setShowName(String showName) {
		this.showName = showName;
	}


	public String getSchDate() {
		return schDate;
	}


	public void setSchDate(String schDate) {
		this.schDate = schDate;
	}


	public String getSchTime() {
		return schTime;
	}


	public void setSchTime(String schTime) {
		this.schTime = schTime;
	}


	public String getRsrvtStatus() {
		return rsrvtStatus;
	}


	public void setRsrvtStatus(String rsrvtStatus) {
		this.rsrvtStatus = rsrvtStatus;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getShowId() {
		return showId;
	}


	public void setShowId(String showId) {
		this.showId = showId;
	}


	public String getSeatId() {
		return seatId;
	}


	public void setSeatId(String seatId) {
		this.seatId = seatId;
	}


	public String getSelectDate() {
		return selectDate;
	}


	public void setSelectDate(String selectDate) {
		this.selectDate = selectDate;
	}


	public String getSchId() {
		return schId;
	}


	public void setSchId(String schId) {
		this.schId = schId;
	}


	public String getShowDate() {
		return showDate;
	}


	public void setShowDate(String showDate) {
		this.showDate = showDate;
	}


	public String getFindStartDate() {
		return findStartDate;
	}


	public void setFindStartDate(String findStartDate) {
		this.findStartDate = findStartDate;
	}


	public String getFindEndDate() {
		return findEndDate;
	}


	public void setFindEndDate(String findEndDate) {
		this.findEndDate = findEndDate;
	}


	public String getRsrvtPhoneNumber() {
		return rsrvtPhoneNumber;
	}


	public void setRsrvtPhoneNumber(String rsrvtPhoneNumber) {
		this.rsrvtPhoneNumber = rsrvtPhoneNumber;
	}


	public String getRsrvtEmail() {
		return rsrvtEmail;
	}


	public void setRsrvtEmail(String rsrvtEmail) {
		this.rsrvtEmail = rsrvtEmail;
	}


	public Date getRsrvtInputDate() {
		return rsrvtInputDate;
	}


	public void setRsrvtInputDate(Date rsrvtInputDate) {
		this.rsrvtInputDate = rsrvtInputDate;
	}


	public int getRsrvtTotalCnt() {
		return rsrvtTotalCnt;
	}


	public void setRsrvtTotalCnt(int rsrvtTotalCnt) {
		this.rsrvtTotalCnt = rsrvtTotalCnt;
	}


	public int getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}


	@Override
	public String toString() {
		return "RsrvtInfoVO [rsrvtId=" + rsrvtId + ", showName=" + showName + ", schDate=" + schDate + ", schTime="
				+ schTime + ", rsrvtStatus=" + rsrvtStatus + ", memberId=" + memberId + ", memberName=" + memberName
				+ ", showId=" + showId + ", seatId=" + seatId + ", selectDate=" + selectDate + ", schId=" + schId
				+ ", showDate=" + showDate + ", findStartDate=" + findStartDate + ", findEndDate=" + findEndDate
				+ ", rsrvtPhoneNumber=" + rsrvtPhoneNumber + ", rsrvtEmail=" + rsrvtEmail + ", rsrvtInputDate="
				+ rsrvtInputDate + ", rsrvtTotalCnt=" + rsrvtTotalCnt + ", totalPrice=" + totalPrice + "]";
	}
	
	
	
	


	
	
	
	
	
	
	
}	
	