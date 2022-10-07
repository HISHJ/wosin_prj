package kr.co.sist.vo;

public class GenreVO {
	private String genreId, genreType ;
	
	public GenreVO() {
	}

	public GenreVO(String genreId, String genreType) {
		this.genreId = genreId;
		this.genreType = genreType;
	}

	public String getGenreId() {
		return genreId;
	}

	public void setGenreId(String genreId) {
		this.genreId = genreId;
	}

	public String getGenreType() {
		return genreType;
	}

	public void setGenreType(String genreType) {
		this.genreType = genreType;
	}
	
	
}
