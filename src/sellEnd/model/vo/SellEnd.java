package sellEnd.model.vo;

import java.sql.Date;

public class SellEnd {
	private int sellEndNo;
	private String sellEndTitle;
	private String sellEndName;
	private String sellEndWriter;
	private String sellEndContent;
	private Date sellDate;
	private int sellType;
	private String sellCategory1;
	private String sellCategory2;
	private int sellWarning;
	private Date sellEndDate;
	private int sellEndType;
	private String sellItemOrigin;
	private String sellItemQuantity;
	private String sellItemMaterial;
	private String sellItemRule;
	private String thumbnail;
	private String sellRegionalAddr;
	public SellEnd() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SellEnd(int sellEndNo, String sellEndTitle, String sellEndName, String sellEndWriter, String sellEndContent,
			Date sellDate, int sellType, String sellCategory1, String sellCategory2, int sellWarning, Date sellEndDate,
			int sellEndType, String sellItemOrigin, String sellItemQuantity, String sellItemMaterial,
			String sellItemRule, String thumbnail, String sellRegionalAddr) {
		super();
		this.sellEndNo = sellEndNo;
		this.sellEndTitle = sellEndTitle;
		this.sellEndName = sellEndName;
		this.sellEndWriter = sellEndWriter;
		this.sellEndContent = sellEndContent;
		this.sellDate = sellDate;
		this.sellType = sellType;
		this.sellCategory1 = sellCategory1;
		this.sellCategory2 = sellCategory2;
		this.sellWarning = sellWarning;
		this.sellEndDate = sellEndDate;
		this.sellEndType = sellEndType;
		this.sellItemOrigin = sellItemOrigin;
		this.sellItemQuantity = sellItemQuantity;
		this.sellItemMaterial = sellItemMaterial;
		this.sellItemRule = sellItemRule;
		this.thumbnail = thumbnail;
		this.sellRegionalAddr = sellRegionalAddr;
	}
	public int getSellEndNo() {
		return sellEndNo;
	}
	public void setSellEndNo(int sellEndNo) {
		this.sellEndNo = sellEndNo;
	}
	public String getSellEndTitle() {
		return sellEndTitle;
	}
	public void setSellEndTitle(String sellEndTitle) {
		this.sellEndTitle = sellEndTitle;
	}
	public String getSellEndName() {
		return sellEndName;
	}
	public void setSellEndName(String sellEndName) {
		this.sellEndName = sellEndName;
	}
	public String getSellEndWriter() {
		return sellEndWriter;
	}
	public void setSellEndWriter(String sellEndWriter) {
		this.sellEndWriter = sellEndWriter;
	}
	public String getSellEndContent() {
		return sellEndContent;
	}
	public void setSellEndContent(String sellEndContent) {
		this.sellEndContent = sellEndContent;
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
	public Date getSellEndDate() {
		return sellEndDate;
	}
	public void setSellEndDate(Date sellEndDate) {
		this.sellEndDate = sellEndDate;
	}
	public int getSellEndType() {
		return sellEndType;
	}
	public void setSellEndType(int sellEndType) {
		this.sellEndType = sellEndType;
	}
	public String getSellItemOrigin() {
		return sellItemOrigin;
	}
	public void setSellItemOrigin(String sellItemOrigin) {
		this.sellItemOrigin = sellItemOrigin;
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
	public String getSellRegionalAddr() {
		return sellRegionalAddr;
	}
	public void setSellRegionalAddr(String sellRegionalAddr) {
		this.sellRegionalAddr = sellRegionalAddr;
	}
}
