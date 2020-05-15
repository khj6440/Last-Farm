package question.model.vo;

public class Question {
	private int questionNo;
	private String questionTitle;
	private String questionContent;
	public Question() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Question(int questionNo, String questionTitle, String questionContent) {
		super();
		this.questionNo = questionNo;
		this.questionTitle = questionTitle;
		this.questionContent = questionContent;
	}
	
	public String getContentBr(){
	      return questionContent.replaceAll("\r\n", "<br>");
	   }
	
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public String getQuestionTitle() {
		return questionTitle;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	
	
	
}
