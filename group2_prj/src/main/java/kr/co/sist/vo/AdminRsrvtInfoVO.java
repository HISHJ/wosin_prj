package kr.co.sist.vo;

import java.sql.Date;

public class AdminRsrvtInfoVO {
	private String rsrvtId, showName, schDate, schTime, rsrvtStatus,
		userName, showId, seatId, phone, userId,
		findStartDate, findEndDate, email;
	private Date rsrvtInputDate;
	private int rsrvtCnt, totalPrice;
	
	public AdminRsrvtInfoVO() {
	}

	public AdminRsrvtInfoVO(String rsrvtId, String showName, String schDate, String schTime, String rsrvtStatus,
			String userName, String showId, String seatId, String phone, String userId, String findStartDate,
			String findEndDate, String email, Date rsrvtInputDate, int rsrvtCnt, int totalPrice) {
		this.rsrvtId = rsrvtId;
		this.showName = showName;
		this.schDate = schDate;
		this.schTime = schTime;
		this.rsrvtStatus = rsrvtStatus;
		this.userName = userName;
		this.showId = showId;
		this.seatId = seatId;
		this.phone = phone;
		this.userId = userId;
		this.findStartDate = findStartDate;
		this.findEndDate = findEndDate;
		this.email = email;
		this.rsrvtInputDate = rsrvtInputDate;
		this.rsrvtCnt = rsrvtCnt;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRsrvtInputDate() {
		return rsrvtInputDate;
	}

	public void setRsrvtInputDate(Date rsrvtInputDate) {
		this.rsrvtInputDate = rsrvtInputDate;
	}

	public int getRsrvtCnt() {
		return rsrvtCnt;
	}

	public void setRsrvtCnt(int rsrvtCnt) {
		this.rsrvtCnt = rsrvtCnt;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
}
