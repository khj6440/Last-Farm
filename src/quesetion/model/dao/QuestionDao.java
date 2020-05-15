package quesetion.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import question.model.vo.Question;

public class QuestionDao {

	public ArrayList<Question> selectList(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		ArrayList<Question> list = new ArrayList<Question>();
		String query="select * from(select rownum as rnum, n.* from (select * from question order by question_no desc)n) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset= pstmt.executeQuery();
			while(rset.next()) {
				Question n = new Question();
				n.setQuestionNo(rset.getInt("question_no"));
				n.setQuestionTitle(rset.getString("question_title"));
				n.setQuestionContent(rset.getString("question_content"));
				list.add(n);
			
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

	public int totalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		int result=0;
		String query="select count(*) as cnt from question";
		try {
			pstmt = conn.prepareStatement(query);
			rset= pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	

	public int searchCount(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		int result=0;
		String query="select count(*) as cnt from question where question_title like ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,'%'+keyword+'%');
			rset= pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Question> searchContent(Connection conn, String keyword, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query ="select * from(select rownum as rnum, n.* from (select * from question where question_title like ? order by question_no desc)n) where rnum between ? and ?";
		ArrayList<Question> list = new ArrayList<Question>();
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,'%'+keyword+'%');
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset= pstmt.executeQuery();
			while(rset.next()) {
				Question n = new Question();
				n.setQuestionNo(rset.getInt("question_no"));
				n.setQuestionTitle(rset.getString("question_title"));
				n.setQuestionContent(rset.getString("question_content"));
				list.add(n);
			
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

	public int insertNotice(Connection conn, Question q) {
		PreparedStatement pstmt = null;
		int result=0;
		String query="insert into question values(seq_question.nextval,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, q.getQuestionTitle());
			pstmt.setString(2, q.getQuestionContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteQuestion(Connection conn, int questionNo) {
		PreparedStatement pstmt = null;
		int result =0;
		String query="delete from question where question_no=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, questionNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Question QuestionSearch(Connection conn, int questionNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Question question = null;
		String query = "select * from question where question_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, questionNo);
			rset  = pstmt.executeQuery();
			if(rset.next()) {
				question = new Question();
				question.setQuestionNo(rset.getInt("question_no"));
				question.setQuestionTitle(rset.getString("question_title"));
				question.setQuestionContent(rset.getString("question_content"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return question;
	}

	public int questionUpdate(Connection conn, Question q) {
		PreparedStatement pstmt = null;
		int result=0;
		String query="update question set question_title=?, question_content=? where question_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, q.getQuestionTitle());
			pstmt.setString(2, q.getQuestionContent());
			pstmt.setInt(3, q.getQuestionNo());
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
