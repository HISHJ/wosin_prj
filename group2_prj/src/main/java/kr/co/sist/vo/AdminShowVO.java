package kr.co.sist.vo;

import java.sql.Date;

public class AdminShowVO {
	private int price;
	private String showId, genreId, ratingId, name, status,
		thImg, mImg, infoImg, runningTime, startDate, endDate;
	private Date inputDate;
	
	public AdminShowVO() {
	}

	public AdminShowVO(int price, String showId, String genreId, String ratingId, String name, String status,
			String thImg, String mImg, String infoImg, String runningTime, String startDate, String endDate, Date inputDate) {
		this.price = price;
		this.showId = showId;
		this.genreId = genreId;
		this.ratingId = ratingId;
		this.name = name;
		this.status = status;
		this.thImg = thImg;
		this.mImg = mImg;
		this.infoImg = infoImg;
		this.runningTime = runningTime;
		this.startDate = startDate;
		this.endDate = endDate;
		this.inputDate = inputDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getShowId() {
		return showId;
	}

	public void setShowId(String showId) {
		this.showId = showId;
	}

	public String getGenreId() {
		return genreId;
	}

	public void setGenreId(String genreId) {
		this.genreId = genreId;
	}

	public String getRatingId() {
		return ratingId;
	}

	public void setRatingId(String ratingId) {
		this.ratingId = ratingId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getThImg() {
		return thImg;
	}

	public void setThImg(String thImg) {
		this.thImg = thImg;
	}

	public String getmImg() {
		return mImg;
	}

	public void setmImg(String mImg) {
		this.mImg = mImg;
	}

	public String getInfoImg() {
		return infoImg;
	}

	public void setInfoImg(String infoImg) {
		this.infoImg = infoImg;
	}

	public String getRunningTime() {
		return runningTime;
	}

	public void setRunningTime(String runningTime) {
		this.runningTime = runningTime;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Date getInputDate() {
		return inputDate;
	}

	public void setInputDate(Date inputDate) {
		this.inputDate = inputDate;
	}

	@Override
	public String toString() {
		return "AdminShowVO [price=" + price + ", showId=" + showId + ", genreId=" + genreId + ", ratingId=" + ratingId
				+ ", name=" + name + ", status=" + status + ", thImg=" + thImg + ", mImg=" + mImg + ", infoImg="
				+ infoImg + ", runningTime=" + runningTime + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", inputDate=" + inputDate + "]";
	}
	
	
}
