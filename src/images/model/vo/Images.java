package images.model.vo;

public class Images {
	private int imgNo;
	private int parentNo;
	private String imgFilepath;
	private int parentType;
	public Images(int imgNo, int parentNo, String imgFilepath, int parentType) {
		super();
		this.imgNo = imgNo;
		this.parentNo = parentNo;
		this.imgFilepath = imgFilepath;
		this.parentType = parentType;
	}
	public Images() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getImgNo() {
		return imgNo;
	}
	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}
	public int getParentNo() {
		return parentNo;
	}
	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}
	public String getImgFilepath() {
		return imgFilepath;
	}
	public void setImgFilepath(String imgFilepath) {
		this.imgFilepath = imgFilepath;
	}
	public int getParentType() {
		return parentType;
	}
	public void setParentType(int parentType) {
		this.parentType = parentType;
	}
	
}
