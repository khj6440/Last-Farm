package admin.model.vo;

import java.util.ArrayList;

import sell.model.vo.Sell;

public class SellPageData {
	private ArrayList<Sell> list;
	private String pageNavi;
	private int totalPage;
	private int totalCount;
	public SellPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SellPageData(ArrayList<Sell> list, String pageNavi, int totalPage, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.totalPage = totalPage;
		this.totalCount = totalCount;
	}
	public ArrayList<Sell> getList() {
		return list;
	}
	public void setList(ArrayList<Sell> list) {
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
