package message.model.vo;

import java.sql.Date;

public class Message {
	private int msgNo;
	private String msgTitle;
	private String msgSendId;
	private String msgContent;
	private String msgReceiveId;
	private Date msgDate;
	public Message(int msgNo, String msgTitle, String msgSendId, String msgContent, String msgReceiveId, Date msgDate) {
		super();
		this.msgNo = msgNo;
		this.msgTitle = msgTitle;
		this.msgSendId = msgSendId;
		this.msgContent = msgContent;
		this.msgReceiveId = msgReceiveId;
		this.msgDate = msgDate;
	}
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}
	public String getMsgTitle() {
		return msgTitle;
	}
	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}
	public String getMsgSendId() {
		return msgSendId;
	}
	public void setMsgSendId(String msgSendId) {
		this.msgSendId = msgSendId;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	public String getMsgReceiveId() {
		return msgReceiveId;
	}
	public void setMsgReceiveId(String msgReceiveId) {
		this.msgReceiveId = msgReceiveId;
	}
	public Date getMsgDate() {
		return msgDate;
	}
	public void setMsgDate(Date msgDate) {
		this.msgDate = msgDate;
	}
	
}
