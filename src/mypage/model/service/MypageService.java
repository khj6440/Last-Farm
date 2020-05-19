package mypage.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import member.model.vo.Member;
import mypage.model.dao.MypageDao;

public class MypageService {

	public Member selectOneMember(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = new MypageDao().selectOneMember(conn, memberId);
		JDBCTemplate.close(conn);

		return m;
	}

}
