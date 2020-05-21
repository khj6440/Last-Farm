package member.model.vo;

import java.sql.Date;

public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberCode;
	private String memberRoadAddr;
	private String memberDetailAddr;
	private String memberPostCode;
	private String memberRoadAddr2;
	private String memberDetailAddr2;
	private String memberPostCode2;
	private String memberPhone;
	private String memberEmail;
	private Date memberDate;
	private int memberScore;
	private int memberType;
	private String companyName;
	private int memberStatus;
	private Date memberDelDate;
	private String bankName;
	private String bankAccount;

	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(int memberNo, String memberId, String memberPw, String memberName, String memberCode,
			String memberRoadAddr, String memberDetailAddr, String memberPostCode, String memberRoadAddr2,
			String memberDetailAddr2, String memberPostCode2, String memberPhone, String memberEmail, Date memberDate,
			int memberScore, int memberType, String companyName, int memberStatus, Date memberDelDate, String bankName,
			String bankAccount) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberCode = memberCode;
		this.memberRoadAddr = memberRoadAddr;
		this.memberDetailAddr = memberDetailAddr;
		this.memberPostCode = memberPostCode;
		this.memberRoadAddr2 = memberRoadAddr2;
		this.memberDetailAddr2 = memberDetailAddr2;
		this.memberPostCode2 = memberPostCode2;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
		this.memberDate = memberDate;
		this.memberScore = memberScore;
		this.memberType = memberType;
		this.companyName = companyName;
		this.memberStatus = memberStatus;
		this.memberDelDate = memberDelDate;
		this.bankName = bankName;
		this.bankAccount = bankAccount;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public String getMemberRoadAddr() {
		return memberRoadAddr;
	}

	public void setMemberRoadAddr(String memberRoadAddr) {
		this.memberRoadAddr = memberRoadAddr;
	}

	public String getMemberDetailAddr() {
		return memberDetailAddr;
	}

	public void setMemberDetailAddr(String memberDetailAddr) {
		this.memberDetailAddr = memberDetailAddr;
	}

	public String getMemberPostCode() {
		return memberPostCode;
	}

	public void setMemberPostCode(String memberPostCode) {
		this.memberPostCode = memberPostCode;
	}

	public String getMemberRoadAddr2() {
		return memberRoadAddr2;
	}

	public void setMemberRoadAddr2(String memberRoadAddr2) {
		this.memberRoadAddr2 = memberRoadAddr2;
	}

	public String getMemberDetailAddr2() {
		return memberDetailAddr2;
	}

	public void setMemberDetailAddr2(String memberDetailAddr2) {
		this.memberDetailAddr2 = memberDetailAddr2;
	}

	public String getMemberPostCode2() {
		return memberPostCode2;
	}


	public void setMemberPostCode2(String memberPostCode2) {
		this.memberPostCode2 = memberPostCode2;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public Date getMemberDate() {
		return memberDate;
	}

	public void setMemberDate(Date memberDate) {
		this.memberDate = memberDate;
	}

	public int getMemberScore() {
		return memberScore;
	}

	public void setMemberScore(int memberScore) {
		this.memberScore = memberScore;
	}

	public int getMemberType() {
		return memberType;
	}

	public void setMemberType(int memberType) {
		this.memberType = memberType;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public int getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(int memberStatus) {
		this.memberStatus = memberStatus;
	}

	public Date getMemberDelDate() {
		return memberDelDate;
	}

	public void setMemberDelDate(Date memberDelDate) {
		this.memberDelDate = memberDelDate;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}

}
