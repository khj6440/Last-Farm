package sell.model.vo;

import java.util.ArrayList;

public class SellCategoryPage {
	private ArrayList<Sell> sellList;
	private String pageNavi;
	public SellCategoryPage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SellCategoryPage(ArrayList<Sell> sellList, String pageNavi) {
		super();
		this.sellList = sellList;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Sell> getSellList() {
		return sellList;
	}
	public void setSellList(ArrayList<Sell> sellList) {
		this.sellList = sellList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
