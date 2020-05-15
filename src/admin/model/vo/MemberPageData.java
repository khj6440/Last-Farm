package admin.model.vo;

import java.util.ArrayList;

import member.model.vo.Member;

public class MemberPageData {
	private ArrayList<Member> list;
	private String pageNavi;
	private int totalPage;
	private int totalCount;
	public MemberPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberPageData(ArrayList<Member> list, String pageNavi, int totalPage, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.totalPage = totalPage;
		this.totalCount = totalCount;
	}
	public ArrayList<Member> getList() {
		return list;
	}
	public void setList(ArrayList<Member> list) {
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
