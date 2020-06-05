package review.model.vo;

import java.sql.Date;

public class Review {
	private int reviewNo;
	private int reviewBuyEndNo;
	private String reviewTitle;
	private String reviewWriter;
	private String reviewContent;
	private int reviewScore;
	private Date reviewDate;
	private int reviewWarning;
	private String reviewFilepath;
	private String writer;
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Review(int reviewNo, int reviewBuyEndNo, String reviewTitle, String reviewWriter, String reviewContent,
			int reviewScore, Date reviewDate, int reviewWarning, String reviewFilepath, String writer) {
		super();
		this.reviewNo = reviewNo;
		this.reviewBuyEndNo = reviewBuyEndNo;
		this.reviewTitle = reviewTitle;
		this.reviewWriter = reviewWriter;
		this.reviewContent = reviewContent;
		this.reviewScore = reviewScore;
		this.reviewDate = reviewDate;
		this.reviewWarning = reviewWarning;
		this.reviewFilepath = reviewFilepath;
		this.writer = writer;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getReviewBuyEndNo() {
		return reviewBuyEndNo;
	}
	public void setReviewBuyEndNo(int reviewBuyEndNo) {
		this.reviewBuyEndNo = reviewBuyEndNo;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewWriter() {
		return reviewWriter;
	}
	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public int getReviewScore() {
		return reviewScore;
	}
	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getReviewWarning() {
		return reviewWarning;
	}
	public void setReviewWarning(int reviewWarning) {
		this.reviewWarning = reviewWarning;
	}
	public String getReviewFilepath() {
		return reviewFilepath;
	}
	public void setReviewFilepath(String reviewFilepath) {
		this.reviewFilepath = reviewFilepath;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}

}



