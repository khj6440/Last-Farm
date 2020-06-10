package reviewComment.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import review.model.dao.ReviewDao;
import review.model.vo.Review;
import reviewComment.model.dao.reviewCommentDao;
import reviewComment.model.vo.ReviewComment;

public class reviewCommentService {

	public ArrayList<ReviewComment> moreComment(int start, int reviewRef) {
		Connection conn = JDBCTemplate.getConnection();
		int length = 5;//한번에 더 가지고올 사진 수
		int end = start+length-1;
		ArrayList<ReviewComment> list = new reviewCommentDao().moreComment(conn,start,end,reviewRef);
		JDBCTemplate.close(conn);
		return list;
	}

	public int insertComment(int reviewNo, String commentContent, String commentWriter) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new reviewCommentDao().reviewCommentInsert(conn, reviewNo,commentContent, commentWriter);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int commentUpdate(int reviewCommentNo, String reviewCommentContent) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new reviewCommentDao().commentUpdate(conn, reviewCommentNo, reviewCommentContent);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int commentDelete(int reviewCommentNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new reviewCommentDao().commentDelete(conn, reviewCommentNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<ReviewComment> ReviewWarning(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<ReviewComment> list = new reviewCommentDao().ReviewWarning(conn,memberId);
		
		JDBCTemplate.close(conn);
		return list;
	}

	/*public int commentWarning(int reviewCommentNo, int reviewCommentWarning) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new reviewCommentDao().commentWarning(conn, reviewCommentNo, reviewCommentWarning);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}*/

	

}
