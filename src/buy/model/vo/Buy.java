package buy.model.vo;

public class Buy {
	private int buyNo;
	private String buyId;
	private int buySellNo;
	private int buyAmount;
	private String buyPayCode;
	public Buy(int buyNo, String buyId, int buySellNo, int buyAmount, String buyPayCode) {
		super();
		this.buyNo = buyNo;
		this.buyId = buyId;
		this.buySellNo = buySellNo;
		this.buyAmount = buyAmount;
		this.buyPayCode = buyPayCode;
	}
	public Buy() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getBuyNo() {
		return buyNo;
	}
	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}
	public String getBuyId() {
		return buyId;
	}
	public void setBuyId(String buyId) {
		this.buyId = buyId;
	}
	public int getBuySellNo() {
		return buySellNo;
	}
	public void setBuySellNo(int buySellNo) {
		this.buySellNo = buySellNo;
	}
	public int getBuyAmount() {
		return buyAmount;
	}
	public void setBuyAmount(int buyAmount) {
		this.buyAmount = buyAmount;
	}
	public String getBuyPayCode() {
		return buyPayCode;
	}
	public void setBuyPayCode(String buyPayCode) {
		this.buyPayCode = buyPayCode;
	}
	
}
