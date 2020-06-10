package sellComment.model.vo;

import java.sql.Date;

public class SellComment {
	private int sellCommentNo;
	private int sellCommentLevel;
	private String sellCommentWriter;
	private String sellCommentContent;
	private int sellRef;
	private int sellCommentRef;
	private Date sellCommentDate;
	private int sellCommentWarning;
	private String Writer;
	public SellComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SellComment(int sellCommentNo, int sellCommentLevel, String sellCommentWriter, String sellCommentContent,
			int sellRef, int sellCommentRef, Date sellCommentDate, int sellCommentWarning, String writer) {
		super();
		this.sellCommentNo = sellCommentNo;
		this.sellCommentLevel = sellCommentLevel;
		this.sellCommentWriter = sellCommentWriter;
		this.sellCommentContent = sellCommentContent;
		this.sellRef = sellRef;
		this.sellCommentRef = sellCommentRef;
		this.sellCommentDate = sellCommentDate;
		this.sellCommentWarning = sellCommentWarning;
		Writer = writer;
	}
	public int getSellCommentNo() {
		return sellCommentNo;
	}
	public void setSellCommentNo(int sellCommentNo) {
		this.sellCommentNo = sellCommentNo;
	}
	public int getSellCommentLevel() {
		return sellCommentLevel;
	}
	public void setSellCommentLevel(int sellCommentLevel) {
		this.sellCommentLevel = sellCommentLevel;
	}
	public String getSellCommentWriter() {
		return sellCommentWriter;
	}
	public void setSellCommentWriter(String sellCommentWriter) {
		this.sellCommentWriter = sellCommentWriter;
	}
	public String getSellCommentContent() {
		return sellCommentContent;
	}
	public void setSellCommentContent(String sellCommentContent) {
		this.sellCommentContent = sellCommentContent;
	}
	public int getSellRef() {
		return sellRef;
	}
	public void setSellRef(int sellRef) {
		this.sellRef = sellRef;
	}
	public int getSellCommentRef() {
		return sellCommentRef;
	}
	public void setSellCommentRef(int sellCommentRef) {
		this.sellCommentRef = sellCommentRef;
	}
	public Date getSellCommentDate() {
		return sellCommentDate;
	}
	public void setSellCommentDate(Date sellCommentDate) {
		this.sellCommentDate = sellCommentDate;
	}
	public int getSellCommentWarning() {
		return sellCommentWarning;
	}
	public void setSellCommentWarning(int sellCommentWarning) {
		this.sellCommentWarning = sellCommentWarning;
	}
	public String getWriter() {
		return Writer;
	}
	public void setWriter(String writer) {
		Writer = writer;
	}
	
}
