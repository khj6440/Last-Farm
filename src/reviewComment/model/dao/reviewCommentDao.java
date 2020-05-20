package reviewComment.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import reviewComment.model.vo.ReviewComment;

public class reviewCommentDao {

	public ArrayList<ReviewComment> moreComment(Connection conn, int start, int end, int reviewRef) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewComment> list = new ArrayList<ReviewComment>();
		String query = "select * from(select ROWNUM as rnum, p.* from(select * from review_comment where review_ref=?)p) where rnum between ? and ?";
		try {
			pstmt =conn.prepareStatement(query);
			pstmt.setInt(1, reviewRef);
			pstmt.setInt(2,start);
			pstmt.setInt(3,end);
			rset= pstmt.executeQuery();
			while(rset.next()) {
				ReviewComment c = new ReviewComment();
				c.setReviewCommentNo(rset.getInt("review_comment_no"));
				c.setReviewCommentWriter(rset.getString("review_comment_writer"));
				c.setReviewCommentContent(rset.getString("review_comment_content"));
				c.setReviewRef(rset.getInt("review_ref"));
				c.setReviewCommentDate(rset.getDate("review_comment_date"));
				c.setReviewCommentWarning(rset.getInt("review_comment_warning"));
				list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int reviewCommentInsert(Connection conn,int reviewNo, String commentContent, String commentWriter) {
		PreparedStatement pstmt = null;
		int result =0;
		String query="insert into review_comment values(seq_review_comment.nextval,?,?,?,sysdate,0)";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, commentWriter);
			pstmt.setString(2, commentContent);
			pstmt.setInt(3, reviewNo);
			
	
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<ReviewComment> selectComment(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewComment> list2 = new ArrayList<ReviewComment>();
		String query = "select * from review_comment order by review_comment_date";
		try {
			pstmt = conn.prepareStatement(query);
			rset= pstmt.executeQuery();
			while(rset.next()) {
				ReviewComment c = new ReviewComment();
				c.setReviewCommentNo(rset.getInt("review_comment_no"));
				c.setReviewCommentWriter(rset.getString("review_comment_writer"));
				c.setReviewCommentContent(rset.getString("review_comment_content"));
				c.setReviewRef(rset.getInt("review_ref"));
				c.setReviewCommentDate(rset.getDate("review_comment_date"));
				c.setReviewCommentWarning(rset.getInt("review_comment_warning"));
				list2.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list2;
	}

	public int commentUpdate(Connection conn, int reviewCommentNo, String reviewCommentContent) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update review_comment set review_comment_content=? where review_comment_no=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, reviewCommentContent);
			pstmt.setInt(2, reviewCommentNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
	}
	return result;
	}

	public int commentDelete(Connection conn, int reviewCommentNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from review_comment where review_comment_no=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, reviewCommentNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
	}
	return result;
	}

	public int commentWarning(Connection conn, int reviewCommentNo, int reviewCommentWarning) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update review_comment set review_comment_warning=? where review_comment_no=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, (reviewCommentWarning+1));
			pstmt.setInt(2, reviewCommentNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
	}
	return result;
	}

	

}
