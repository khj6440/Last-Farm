package sellComment.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.dao.MemberDao;
import member.model.vo.Member;
import sell.model.vo.Sell;
import sellComment.model.dao.SellCommentDao;
import sellComment.model.vo.SellComment;
import sellComment.model.vo.SellViewData;

public class SellCommentService {
	public int sellCommentInsert(SellComment sc) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new SellCommentDao().sellCommentInsert(conn, sc);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public SellViewData selectOneSell(int sellNo) {
		Connection conn = JDBCTemplate.getConnection();
		Sell s = new SellCommentDao().selectOneSell(conn, sellNo);
		ArrayList<SellComment> list = new SellCommentDao().selectCommentList(conn, sellNo);
		SellViewData svd = new SellViewData(s, list);
		JDBCTemplate.close(conn);
		return svd;
	}

	public int sellWarning(int sellNo, int sellWarning) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new SellCommentDao().sellWarning(conn, sellNo, sellWarning);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Member selectOneWriter(String sellWriter) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = new MemberDao().selectOneWriter(conn, sellWriter);
		JDBCTemplate.close(conn);
		return m;
	}

	public int sellCommentDelete(int sc) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new SellCommentDao().sellCommentDelete(conn, sc);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateSellComment(SellComment sc) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new SellCommentDao().updateSellComment(conn, sc);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int selectOneSell(int sellNo, int sellDel) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new SellCommentDao().selectOneSell(conn, sellNo, sellDel);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateSellCount(int sellNo, int type,int sellCount) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new SellCommentDao().updateSellCount(conn,sellNo, type,sellCount);
		if(result >0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}


	public int commentWarning(int sellCommentNo, int sellCommentWarning) {
		   Connection conn = JDBCTemplate.getConnection();
		      int result = new SellCommentDao().commentWarning(conn, sellCommentNo, sellCommentWarning);
		      if(result > 0) {
		         JDBCTemplate.commit(conn);
		      }else {
		         JDBCTemplate.rollback(conn);
		      }
		      JDBCTemplate.close(conn);
		      return result;
	}


	

	

}
