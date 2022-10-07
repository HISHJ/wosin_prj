package kr.co.sist.vo;

public class RatingVO {
	private String ratingId, ratingType;

	public RatingVO() {
	}

	public RatingVO(String ratingId, String ratingType) {
		this.ratingId = ratingId;
		this.ratingType = ratingType;
	}

	public String getRatingId() {
		return ratingId;
	}

	public void setRatingId(String ratingId) {
		this.ratingId = ratingId;
	}

	public String getRatingType() {
		return ratingType;
	}

	public void setRatingType(String ratingType) {
		this.ratingType = ratingType;
	}
	
	
}
