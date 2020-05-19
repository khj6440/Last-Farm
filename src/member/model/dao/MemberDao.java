package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import member.model.vo.Member;

public class MemberDao {

	public Member selectOneMember(Connection conn, String memberId, String memberPw) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query="select * from member where member_id=? and member_pw=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPw);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				m=new Member();
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberCode(rset.getString("member_code"));
				m.setMemberRoadAddr(rset.getString("member_road_addr"));
				m.setMemberDetailAddr(rset.getString("member_detail_addr"));
				m.setMemberPostCode(rset.getString("member_post_code"));
				m.setMemberRoadAddr2(rset.getString("member_road_addr2"));
				m.setMemberDetailAddr2(rset.getString("member_detail_addr2"));
				m.setMemberPostCode2(rset.getString("member_post_code2"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setMemberEmail(rset.getString("member_email"));
				m.setMemberDate(rset.getDate("member_date"));
				m.setMemberScore(rset.getInt("member_score"));
				m.setMemberType(rset.getInt("member_type"));
				m.setCompanyName(rset.getString("company_name"));
				m.setMemberStatus(rset.getInt("member_status"));
				m.setMemberDelDate(rset.getDate("member_del_date"));
				m.setBankName(rset.getString("bank_name"));
				m.setBankAccount(rset.getString("bank_account"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return m;
	}

	public Member selectOneMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = "select*from member where member_id=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m=new Member();
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberCode(rset.getString("member_code"));
				m.setMemberRoadAddr(rset.getString("member_road_addr"));
				m.setMemberDetailAddr(rset.getString("member_detail_addr"));
				m.setMemberPostCode(rset.getString("member_post_code"));
				m.setMemberRoadAddr2(rset.getString("member_road_addr2"));
				m.setMemberDetailAddr2(rset.getString("member_detail_addr2"));
				m.setMemberPostCode2(rset.getString("member_post_code2"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setMemberEmail(rset.getString("member_email"));
				m.setMemberDate(rset.getDate("member_date"));
				m.setMemberScore(rset.getInt("member_score"));
				m.setMemberType(rset.getInt("member_type"));
				m.setCompanyName(rset.getString("company_name"));
				m.setMemberStatus(rset.getInt("member_status"));
				m.setMemberDelDate(rset.getDate("member_del_date"));
				m.setBankName(rset.getString("bank_name"));
				m.setBankAccount(rset.getString("bank_account"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
			
		}
		return m;
	}

	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query 
		="insert into member values(seq_member.nextval,?,?,?,?,?,?,?,null,null,null,?,?,sysdate,0,1,null,1,sysdate,null,null)";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getMemberCode());
			pstmt.setString(5, m.getMemberPostCode());
			pstmt.setString(6, m.getMemberRoadAddr());
			pstmt.setString(7,m.getMemberDetailAddr());
			pstmt.setString(8, m.getMemberPhone());
			pstmt.setString(9,m.getMemberEmail());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public Member searchId(Connection conn, String memberName,String memberPh) {
		String query = "select*from member where member_name=? and member_phone=?";
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Member mId = null;
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, memberName);
			pstmt.setString(2, memberPh);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				mId=new Member();
				mId.setMemberNo(rset.getInt("member_no"));
				mId.setMemberId(rset.getString("member_id"));
				mId.setMemberPw(rset.getString("member_pw"));
				mId.setMemberName(rset.getString("member_name"));
				mId.setMemberCode(rset.getString("member_code"));
				mId.setMemberRoadAddr(rset.getString("member_road_addr"));
				mId.setMemberDetailAddr(rset.getString("member_detail_addr"));
				mId.setMemberPostCode(rset.getString("member_post_code"));
				mId.setMemberRoadAddr2(rset.getString("member_road_addr2"));
				mId.setMemberDetailAddr2(rset.getString("member_detail_addr2"));
				mId.setMemberPostCode2(rset.getString("member_post_code2"));
				mId.setMemberPhone(rset.getString("member_phone"));
				mId.setMemberEmail(rset.getString("member_email"));
				mId.setMemberDate(rset.getDate("member_date"));
				mId.setMemberScore(rset.getInt("member_score"));
				mId.setMemberType(rset.getInt("member_type"));
				mId.setCompanyName(rset.getString("company_name"));
				mId.setMemberStatus(rset.getInt("member_status"));
				mId.setMemberDelDate(rset.getDate("member_del_date"));
				mId.setBankName(rset.getString("bank_name"));
				mId.setBankAccount(rset.getString("bank_account"));
				
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return mId;
	}

	public int insertMemberSeller(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query 
		="insert into member values(seq_member.nextval,?,?,?,?,?,?,?,?,?,?,?,?,sysdate,0,2,null,1,sysdate,?,?)";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getMemberCode());
			pstmt.setString(5, m.getMemberPostCode());
			pstmt.setString(6, m.getMemberRoadAddr());
			pstmt.setString(7,m.getMemberDetailAddr());
			pstmt.setString(8, m.getMemberPostCode2());
			pstmt.setString(9, m.getMemberRoadAddr2());
			pstmt.setString(10,m.getMemberDetailAddr2());
			pstmt.setString(11, m.getMemberPhone());
			pstmt.setString(12,m.getMemberEmail());
			pstmt.setString(13,m.getBankName());
			pstmt.setString(14,m.getBankAccount());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public Member searchPw(Connection conn, String memberId, String email) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Member mPw = null;
		String query = "select*from member where member_id=? and member_email=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, email);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				mPw=new Member();
				mPw.setMemberNo(rset.getInt("member_no"));
				mPw.setMemberId(rset.getString("member_id"));
				mPw.setMemberPw(rset.getString("member_pw"));
				mPw.setMemberName(rset.getString("member_name"));
				mPw.setMemberCode(rset.getString("member_code"));
				mPw.setMemberRoadAddr(rset.getString("member_road_addr"));
				mPw.setMemberDetailAddr(rset.getString("member_detail_addr"));
				mPw.setMemberPostCode(rset.getString("member_post_code"));
				mPw.setMemberRoadAddr2(rset.getString("member_road_addr2"));
				mPw.setMemberDetailAddr2(rset.getString("member_detail_addr2"));
				mPw.setMemberPostCode2(rset.getString("member_post_code2"));
				mPw.setMemberPhone(rset.getString("member_phone"));
				mPw.setMemberEmail(rset.getString("member_email"));
				mPw.setMemberDate(rset.getDate("member_date"));
				mPw.setMemberScore(rset.getInt("member_score"));
				mPw.setMemberType(rset.getInt("member_type"));
				mPw.setCompanyName(rset.getString("company_name"));
				mPw.setMemberStatus(rset.getInt("member_status"));
				mPw.setMemberDelDate(rset.getDate("member_del_date"));
				mPw.setBankName(rset.getString("bank_name"));
				mPw.setBankAccount(rset.getString("bank_account"));
				
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return mPw;
	}

	public int sendPw(Connection conn,Member m) {
		PreparedStatement pstmt=null;
		int result = 0;
		String query
		="update member set member_pw=? where member_email=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, m.getMemberPw());
			pstmt.setString(2, m.getMemberEmail());
			result= pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}
}
