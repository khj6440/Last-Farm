package warning.model.vo;

public class Warning {
	private int warningNo;
	private int warningPageNo;
	private String warningWriter;
	private int warningType;
	public Warning() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Warning(int warningNo, int warningPageNo, String warningWriter, int warningType) {
		super();
		this.warningNo = warningNo;
		this.warningPageNo = warningPageNo;
		this.warningWriter = warningWriter;
		this.warningType = warningType;
	}
	public int getWarningNo() {
		return warningNo;
	}
	public void setWarningNo(int warningNo) {
		this.warningNo = warningNo;
	}
	public int getWarningPageNo() {
		return warningPageNo;
	}
	public void setWarningPageNo(int warningPageNo) {
		this.warningPageNo = warningPageNo;
	}
	public String getWarningWriter() {
		return warningWriter;
	}
	public void setWarningWriter(String warningWriter) {
		this.warningWriter = warningWriter;
	}
	public int getWarningType() {
		return warningType;
	}
	public void setWarningType(int warningType) {
		this.warningType = warningType;
	}
	
}
