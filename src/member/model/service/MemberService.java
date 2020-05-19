package member.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {

	public Member selectOneMember(String memberId, String memberPw) {
	Connection conn = JDBCTemplate.getConnection();
	Member m = new MemberDao().selectOneMember(conn,memberId,memberPw);
	JDBCTemplate.close(conn);
	
	return m;
	}

	public Member selectOneMember(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = new MemberDao().selectOneMember(conn, memberId);
		JDBCTemplate.close(conn);
		return m;
	}

	public int insertMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().insertMember(conn, m);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Member searchId(String memberName,String memberPh) {
		Connection conn = JDBCTemplate.getConnection();
		Member mId = new MemberDao().searchId(conn, memberName,memberPh);
		JDBCTemplate.close(conn);
		return mId;
		
	}

	public int insertMemberSeller(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().insertMemberSeller(conn, m);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Member searchPw(String memberId, String email) {
		Connection conn = JDBCTemplate.getConnection();
		Member mPw = new MemberDao().searchPw(conn, memberId,email);
		JDBCTemplate.close(conn);
		return mPw;
	}

	public Member sendPw(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().sendPw(conn,m);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return m;
	}

	
}
