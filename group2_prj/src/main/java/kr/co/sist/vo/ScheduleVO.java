package kr.co.sist.vo;

public class ScheduleVO {
	private String schId, showId, schDate, schTime, name,
		startDate, endDate, day, il;
	
	public ScheduleVO() {
	}

	public ScheduleVO(String schId, String showId, String schDate, String schTime,
			String name, String startDate, String endDate, String day, String il) {
		this.schId = schId;
		this.showId = showId;
		this.schDate = schDate;
		this.schTime = schTime;
		this.name = name;
		this.startDate = startDate;
		this.endDate = endDate;
		this.day = day;
	}
	
	public String getIl() {
		return il;
	}

	public void setIl(String il) {
		this.il = il;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getSchId() {
		return schId;
	}

	public void setSchId(String schId) {
		this.schId = schId;
	}

	public String getShowId() {
		return showId;
	}

	public void setShowId(String showId) {
		this.showId = showId;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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


	
	
	
}
