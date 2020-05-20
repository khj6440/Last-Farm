package mypage.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import member.model.dao.MemberDao;
import member.model.vo.Member;
import mypage.model.dao.MypageDao;

public class MypageService {

	public Member selectOneMember(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = new MypageDao().selectOneMember(conn, memberId);
		JDBCTemplate.close(conn);

		return m;
	}
	public int updateMember(Member m) {
		Connection conn= JDBCTemplate.getConnection();
		System.out.println(m.getMemberPostCode()+1);
		int result = new MypageDao().updateMember(conn, m);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		System.out.println(m.getBankAccount());
		JDBCTemplate.close(conn);
		return result;
	}
	
	
	public int removeMember(String memberId) {
		Connection conn= JDBCTemplate.getConnection();
		int result = new MypageDao().deleteMember(conn, memberId);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
