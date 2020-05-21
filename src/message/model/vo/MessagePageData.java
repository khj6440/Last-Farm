package message.model.vo;

import java.util.ArrayList;

public class MessagePageData {
	private ArrayList<Message> list;
	private String pageNavi;
	public MessagePageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MessagePageData(ArrayList<Message> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Message> getList() {
		return list;
	}
	public void setList(ArrayList<Message> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}