package kr.co.sist.vo;

public class ShowVO {
	private String showId, name, genreId, ratingId, startDate,
		endDate, runningTime, mImg, thImg, infoImg, status;
	private int price;
	
	public ShowVO() {
	}

	public ShowVO(String showId, String name, String genreId, String ratingId, String startDate, String endDate,
			String runningTime, String mImg, String thImg, String infoImg, String status, int price) {
		this.showId = showId;
		this.name = name;
		this.genreId = genreId;
		this.ratingId = ratingId;
		this.startDate = startDate;
		this.endDate = endDate;
		this.runningTime = runningTime;
		this.mImg = mImg;
		this.thImg = thImg;
		this.infoImg = infoImg;
		this.status = status;
		this.price = price;
	}

	public String getShowId() {
		return showId;
	}

	public void setShowId(String showId) {
		this.showId = showId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getRunningTime() {
		return runningTime;
	}

	public void setRunningTime(String runningTime) {
		this.runningTime = runningTime;
	}

	public String getmImg() {
		return mImg;
	}

	public void setmImg(String mImg) {
		this.mImg = mImg;
	}

	public String getThImg() {
		return thImg;
	}

	public void setThImg(String thImg) {
		this.thImg = thImg;
	}

	public String getInfoImg() {
		return infoImg;
	}

	public void setInfoImg(String infoImg) {
		this.infoImg = infoImg;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
	
}
