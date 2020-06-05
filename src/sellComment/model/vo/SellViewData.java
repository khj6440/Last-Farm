package sellComment.model.vo;

import java.util.ArrayList;

import sell.model.vo.Sell;

public class SellViewData {
	private Sell s;
	private ArrayList<SellComment> list;
	
	public SellViewData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SellViewData(Sell s, ArrayList<SellComment> list) {
		super();
		this.s = s;
		this.list = list;
	}
	

	public Sell getS() {
		return s;
	}
	public void setS(Sell s) {
		this.s = s;
	}
	public ArrayList<SellComment> getList() {
		return list;
	}
	public void setList(ArrayList<SellComment> list) {
		this.list = list;
	}
}
