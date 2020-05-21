package admin.model.vo;

import java.sql.Date;

public class WarningData {
	private String type;
	private int typeNo;
	private String typeTitle;
	private String typeWriter;
	private Date typeDate;
	private int typeWarning;
	public WarningData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WarningData(String type, int typeNo, String typeTitle, String typeWriter, Date typeDate, int typeWarning) {
		super();
		this.type = type;
		this.typeNo = typeNo;
		this.typeTitle = typeTitle;
		this.typeWriter = typeWriter;
		this.typeDate = typeDate;
		this.typeWarning = typeWarning;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getTypeNo() {
		return typeNo;
	}
	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}
	public String getTypeTitle() {
		return typeTitle;
	}
	public void setTypeTitle(String typeTitle) {
		this.typeTitle = typeTitle;
	}
	public String getTypeWriter() {
		return typeWriter;
	}
	public void setTypeWriter(String typeWriter) {
		this.typeWriter = typeWriter;
	}
	public Date getTypeDate() {
		return typeDate;
	}
	public void setTypeDate(Date typeDate) {
		this.typeDate = typeDate;
	}
	public int getTypeWarning() {
		return typeWarning;
	}
	public void setTypeWarning(int typeWarning) {
		this.typeWarning = typeWarning;
	}
	
	
	
}
