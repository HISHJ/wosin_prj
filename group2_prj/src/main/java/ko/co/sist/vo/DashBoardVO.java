package ko.co.sist.vo;

import java.sql.Date;

public class DashBoardVO {
	private int onTheShow, standByShow,
		signUpMember, quitMember, totalMember,
		firstCnt, secondCnt, thirdCnt, fourthCnt, fifthCnt, rsrvtCnt, totalSales;
	
	private String today, oneDayAgo, twoDayAgo,
		threeDayAgo, fourDayAgo, showName, dailyDay;
	private Date date;
	
	public DashBoardVO() {
	}

	public DashBoardVO(int onTheShow, int standByShow, int signUpMember, int quitMember, int totalMember, int firstCnt,
			int secondCnt, int thirdCnt, int fourthCnt, int fifthCnt, String today, String oneDayAgo, String twoDayAgo,
			String threeDayAgo, String fourDayAgo, String showName, Date date) {
		this.onTheShow = onTheShow;
		this.standByShow = standByShow;
		this.signUpMember = signUpMember;
		this.quitMember = quitMember;
		this.totalMember = totalMember;
		this.firstCnt = firstCnt;
		this.secondCnt = secondCnt;
		this.thirdCnt = thirdCnt;
		this.fourthCnt = fourthCnt;
		this.fifthCnt = fifthCnt;
		this.today = today;
		this.oneDayAgo = oneDayAgo;
		this.twoDayAgo = twoDayAgo;
		this.threeDayAgo = threeDayAgo;
		this.fourDayAgo = fourDayAgo;
		this.showName = showName;
		this.date = date;
	}
////////////
	public int getRsrvtCnt() {
		return rsrvtCnt;
	}

	public void setRsrvtCnt(int rsrvtCnt) {
		this.rsrvtCnt = rsrvtCnt;
	}
	
	public String getDailyDay() {
		return dailyDay;
	}

	public void setDailyDay(String dailyDay) {
		this.dailyDay = dailyDay;
	}
	
	public int getTotalSales() {
		return totalSales;
	}

	public void setTotalSales(int totalSales) {
		this.totalSales = totalSales;
	}

	/////////////
	public int getOnTheShow() {
		return onTheShow;
	}

	public void setOnTheShow(int onTheShow) {
		this.onTheShow = onTheShow;
	}

	public int getStandByShow() {
		return standByShow;
	}

	public void setStandByShow(int standByShow) {
		this.standByShow = standByShow;
	}

	public int getSignUpMember() {
		return signUpMember;
	}

	public void setSignUpMember(int signUpMember) {
		this.signUpMember = signUpMember;
	}

	public int getQuitMember() {
		return quitMember;
	}

	public void setQuitMember(int quitMember) {
		this.quitMember = quitMember;
	}

	public int getTotalMember() {
		return totalMember;
	}

	public void setTotalMember(int totalMember) {
		this.totalMember = totalMember;
	}

	public int getFirstCnt() {
		return firstCnt;
	}

	public void setFirstCnt(int firstCnt) {
		this.firstCnt = firstCnt;
	}

	public int getSecondCnt() {
		return secondCnt;
	}

	public void setSecondCnt(int secondCnt) {
		this.secondCnt = secondCnt;
	}

	public int getThirdCnt() {
		return thirdCnt;
	}

	public void setThirdCnt(int thirdCnt) {
		this.thirdCnt = thirdCnt;
	}

	public int getFourthCnt() {
		return fourthCnt;
	}

	public void setFourthCnt(int fourthCnt) {
		this.fourthCnt = fourthCnt;
	}

	public int getFifthCnt() {
		return fifthCnt;
	}

	public void setFifthCnt(int fifthCnt) {
		this.fifthCnt = fifthCnt;
	}

	public String getToday() {
		return today;
	}

	public void setToday(String today) {
		this.today = today;
	}

	public String getOneDayAgo() {
		return oneDayAgo;
	}

	public void setOneDayAgo(String oneDayAgo) {
		this.oneDayAgo = oneDayAgo;
	}

	public String getTwoDayAgo() {
		return twoDayAgo;
	}

	public void setTwoDayAgo(String twoDayAgo) {
		this.twoDayAgo = twoDayAgo;
	}

	public String getThreeDayAgo() {
		return threeDayAgo;
	}

	public void setThreeDayAgo(String threeDayAgo) {
		this.threeDayAgo = threeDayAgo;
	}

	public String getFourDayAgo() {
		return fourDayAgo;
	}

	public void setFourDayAgo(String fourDayAgo) {
		this.fourDayAgo = fourDayAgo;
	}

	public String getShowName() {
		return showName;
	}

	public void setShowName(String showName) {
		this.showName = showName;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
	
}
