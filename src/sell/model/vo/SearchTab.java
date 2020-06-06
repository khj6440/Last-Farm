package sell.model.vo;

public class SearchTab {
	private String sido;
	private String gugun;
	private String type1;
	private String type2;
	private String keyword;
	private String sortingTab;
	public SearchTab() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SearchTab(String sido, String gugun, String type1, String type2, String keyword, String sortingTab) {
		super();
		this.sido = sido;
		this.gugun = gugun;
		this.type1 = type1;
		this.type2 = type2;
		this.keyword = keyword;
		this.sortingTab = sortingTab;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getType1() {
		return type1;
	}
	public void setType1(String type1) {
		this.type1 = type1;
	}
	public String getType2() {
		return type2;
	}
	public void setType2(String type2) {
		this.type2 = type2;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSortingTab() {
		return sortingTab;
	}
	public void setSortingTab(String sortingTab) {
		this.sortingTab = sortingTab;
	}
	
	
}
