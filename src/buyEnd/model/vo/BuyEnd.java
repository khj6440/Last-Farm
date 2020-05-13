package buyEnd.model.vo;

public class BuyEnd {
	private int buyEndNo;
	private String buyEndWriter;
	private int sellEndNo;
	private String deliveryCode;
	private int buyAmount;
	private String buyPayCode;
	public BuyEnd() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BuyEnd(int buyEndNo, String buyEndWriter, int sellEndNo, String deliveryCode, int buyAmount,
			String buyPayCode) {
		super();
		this.buyEndNo = buyEndNo;
		this.buyEndWriter = buyEndWriter;
		this.sellEndNo = sellEndNo;
		this.deliveryCode = deliveryCode;
		this.buyAmount = buyAmount;
		this.buyPayCode = buyPayCode;
	}
	public int getBuyEndNo() {
		return buyEndNo;
	}
	public void setBuyEndNo(int buyEndNo) {
		this.buyEndNo = buyEndNo;
	}
	public String getBuyEndWriter() {
		return buyEndWriter;
	}
	public void setBuyEndWriter(String buyEndWriter) {
		this.buyEndWriter = buyEndWriter;
	}
	public int getSellEndNo() {
		return sellEndNo;
	}
	public void setSellEndNo(int sellEndNo) {
		this.sellEndNo = sellEndNo;
	}
	public String getDeliveryCode() {
		return deliveryCode;
	}
	public void setDeliveryCode(String deliveryCode) {
		this.deliveryCode = deliveryCode;
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
