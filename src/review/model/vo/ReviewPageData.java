package review.model.vo;

import java.util.ArrayList;
import reviewComment.model.vo.ReviewComment;

public class ReviewPageData {
	private ArrayList<Review> list;
	private ArrayList<ReviewComment> list2;
	private String pageNavi;
	public ReviewPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewPageData(ArrayList<Review> list, ArrayList<ReviewComment> list2, String pageNavi) {
		super();
		this.list = list;
		this.list2 = list2;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Review> getList() {
		return list;
	}
	public void setList(ArrayList<Review> list) {
		this.list = list;
	}
	public ArrayList<ReviewComment> getList2() {
		return list2;
	}
	public void setList2(ArrayList<ReviewComment> list2) {
		this.list2 = list2;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
