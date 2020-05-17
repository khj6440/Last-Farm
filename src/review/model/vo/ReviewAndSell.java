package review.model.vo;

import sellEnd.model.vo.SellEnd;

public class ReviewAndSell {
	private Review review;
	private SellEnd sellEnd;
	public ReviewAndSell() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewAndSell(Review review, SellEnd sellEnd) {
		super();
		this.review = review;
		this.sellEnd = sellEnd;
	}
	public Review getReview() {
		return review;
	}
	public void setReview(Review review) {
		this.review = review;
	}
	public SellEnd getSellEnd() {
		return sellEnd;
	}
	public void setSellEnd(SellEnd sellEnd) {
		this.sellEnd = sellEnd;
	}
	
	
	
}
