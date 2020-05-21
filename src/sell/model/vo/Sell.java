package sell.model.vo;

import java.sql.Date;

public class Sell {
	private int sellNo;
	private String sellTitle;
	private String sellName;
	private String sellWriter;
	private String sellContent;
	private Date sellEndDate;
	private int sellMax;
	private int sellMin;
	private int sellCount;
	private int sellPrice;
	private Date sellDate;
	private int sellType;
	private String sellCategory1;
	private String sellCategory2;
	private int sellWarning;
	private int sellDeliveryFee;
	private String sellItemOrigin;
	private String sellItemExpireDate;
	private String sellItemQuantity;
	private String sellItemMaterial;
	private String sellItemRule;
	private String thumbnail;
	private int sellDeleteState;
	private String sellRegionalAddr;
	private int timegap;

	public Sell() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Sell(int sellNo, String sellTitle, String sellName, String sellWriter, String sellContent, Date sellEndDate,
			int sellMax, int sellMin, int sellCount, int sellPrice, Date sellDate, int sellType, String sellCategory1,
			String sellCategory2, int sellWarning, int sellDeliveryFee, String sellItemOrigin,
			String sellItemExpireDate, String sellItemQuantity, String sellItemMaterial, String sellItemRule,
			String thumbnail, int sellDeleteState, String sellRegionalAddr, int timegap) {
		super();
		this.sellNo = sellNo;
		this.sellTitle = sellTitle;
		this.sellName = sellName;
		this.sellWriter = sellWriter;
		this.sellContent = sellContent;
		this.sellEndDate = sellEndDate;
		this.sellMax = sellMax;
		this.sellMin = sellMin;
		this.sellCount = sellCount;
		this.sellPrice = sellPrice;
		this.sellDate = sellDate;
		this.sellType = sellType;
		this.sellCategory1 = sellCategory1;
		this.sellCategory2 = sellCategory2;
		this.sellWarning = sellWarning;
		this.sellDeliveryFee = sellDeliveryFee;
		this.sellItemOrigin = sellItemOrigin;
		this.sellItemExpireDate = sellItemExpireDate;
		this.sellItemQuantity = sellItemQuantity;
		this.sellItemMaterial = sellItemMaterial;
		this.sellItemRule = sellItemRule;
		this.thumbnail = thumbnail;
		this.sellDeleteState = sellDeleteState;
		this.sellRegionalAddr = sellRegionalAddr;
		this.timegap = timegap;
	}
	public String getContentBr() {
		return sellContent.replaceAll("\r\n", "<br>");
	}
	public int getSellNo() {
		return sellNo;
	}

	public int getTimegap() {
		return timegap;
	}

	public void setTimegap(int timegap) {
		this.timegap = timegap;
	}

	public void setSellNo(int sellNo) {
		this.sellNo = sellNo;
	}

	public String getSellTitle() {
		return sellTitle;
	}

	public void setSellTitle(String sellTitle) {
		this.sellTitle = sellTitle;
	}

	public String getSellName() {
		return sellName;
	}

	public void setSellName(String sellName) {
		this.sellName = sellName;
	}

	public String getSellWriter() {
		return sellWriter;
	}

	public void setSellWriter(String sellWriter) {
		this.sellWriter = sellWriter;
	}

	public String getSellContent() {
		return sellContent;
	}

	public void setSellContent(String sellContent) {
		this.sellContent = sellContent;
	}

	

	public Date getSellEndDate() {
		return sellEndDate;
	}

	public void setSellEndDate(Date sellEndDate) {
		this.sellEndDate = sellEndDate;
	}

	public int getSellMax() {
		return sellMax;
	}

	public void setSellMax(int sellMax) {
		this.sellMax = sellMax;
	}

	public int getSellMin() {
		return sellMin;
	}

	public void setSellMin(int sellMin) {
		this.sellMin = sellMin;
	}

	public int getSellCount() {
		return sellCount;
	}

	public void setSellCount(int sellCount) {
		this.sellCount = sellCount;
	}

	public int getSellPrice() {
		return sellPrice;
	}

	public void setSellPrice(int sellPrice) {
		this.sellPrice = sellPrice;
	}

	public Date getSellDate() {
		return sellDate;
	}

	public void setSellDate(Date sellDate) {
		this.sellDate = sellDate;
	}

	public int getSellType() {
		return sellType;
	}

	public void setSellType(int sellType) {
		this.sellType = sellType;
	}

	public String getSellCategory1() {
		return sellCategory1;
	}

	public void setSellCategory1(String sellCategory1) {
		this.sellCategory1 = sellCategory1;
	}

	public String getSellCategory2() {
		return sellCategory2;
	}

	public void setSellCategory2(String sellCategory2) {
		this.sellCategory2 = sellCategory2;
	}

	public int getSellWarning() {
		return sellWarning;
	}

	public void setSellWarning(int sellWarning) {
		this.sellWarning = sellWarning;
	}

	public int getSellDeliveryFee() {
		return sellDeliveryFee;
	}

	public void setSellDeliveryFee(int sellDeliveryFee) {
		this.sellDeliveryFee = sellDeliveryFee;
	}

	public String getSellItemOrigin() {
		return sellItemOrigin;
	}

	public void setSellItemOrigin(String sellItemOrigin) {
		this.sellItemOrigin = sellItemOrigin;
	}

	public String getSellItemExpireDate() {
		return sellItemExpireDate;
	}

	public void setSellItemExpireDate(String sellItemExpireDate) {
		this.sellItemExpireDate = sellItemExpireDate;
	}

	public String getSellItemQuantity() {
		return sellItemQuantity;
	}

	public void setSellItemQuantity(String sellItemQuantity) {
		this.sellItemQuantity = sellItemQuantity;
	}

	public String getSellItemMaterial() {
		return sellItemMaterial;
	}

	public void setSellItemMaterial(String sellItemMaterial) {
		this.sellItemMaterial = sellItemMaterial;
	}

	public String getSellItemRule() {
		return sellItemRule;
	}

	public void setSellItemRule(String sellItemRule) {
		this.sellItemRule = sellItemRule;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public int getSellDeleteState() {
		return sellDeleteState;
	}

	public void setSellDeleteState(int sellDeleteState) {
		this.sellDeleteState = sellDeleteState;
	}

	public String getSellRegionalAddr() {
		return sellRegionalAddr;
	}

	public void setSellRegionalAddr(String sellRegionalAddr) {
		this.sellRegionalAddr = sellRegionalAddr;
	}

}
