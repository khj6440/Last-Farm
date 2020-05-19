package admin.model.vo;

import java.util.ArrayList;

import review.model.vo.Review;
import review.model.vo.ReviewAndSell;


public class ReviewPageData {
	private ArrayList<ReviewAndSell> list;
	private String pageNavi;
	private int totalPage;
	private int totalCount;
	public ReviewPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewPageData(ArrayList<ReviewAndSell> list, String pageNavi, int totalPage, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.totalPage = totalPage;
		this.totalCount = totalCount;
	}
	public ArrayList<ReviewAndSell> getList() {
		return list;
	}
	public void setList(ArrayList<ReviewAndSell> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	
	
}
