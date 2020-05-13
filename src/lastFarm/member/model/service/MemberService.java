package lastFarm.member.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import lastFarm.member.modelDao.MemberDao;
import member.model.vo.Member;

public class MemberService {

	public Member selectOneMember(String memberId, String memberPw) {
	Connection conn = JDBCTemplate.getConnection();
	Member m = new MemberDao().selectOneMember(conn,memberId,memberPw);
	JDBCTemplate.close(conn);
	
	return m;
	}

}
