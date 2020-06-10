package warning.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import review.model.vo.Review;
import sell.model.vo.Sell;
import sellComment.model.vo.SellComment;
import warning.model.vo.Warning;

public class WarningDao {

	public int WarningInsert(Connection conn,int PageNo, int warningType, String warningWriter) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into warning values(seq_warning.nextval,?,?,?)";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, PageNo);
			pstmt.setString(2, warningWriter);
			pstmt.setInt(3, warningType);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
	}
	return result;
	}

	public int warningCnt(Connection conn, int PageNo, int warningType) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		int result=0;
		String query="select count(*) as cnt from warning where warning_page_no=? and warning_type=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, PageNo);
			pstmt.setInt(2, warningType);
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

	

	public ArrayList<Warning> SearchWarning(Connection conn, int review) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query ="select * from warning where warning_type=?";
		ArrayList<Warning> list = new ArrayList<Warning>();
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1,review);
			
			rset= pstmt.executeQuery();
			while(rset.next()) {
				Warning w = new Warning();
				w.setWarningNo(rset.getInt("warning_no"));
				w.setWarningPageNo(rset.getInt("warning_page_no"));
				w.setWarningWriter(rset.getString("warning_writer"));
				w.setWarningType(rset.getInt("warning_type"));
				
				list.add(w);
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
	
	public ArrayList<Warning> Search2Warning(Connection conn, int comment) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query ="select * from warning where warning_type=?";
		ArrayList<Warning> list = new ArrayList<Warning>();
		try {
			pstmt=conn.prepareStatement(query);
			
			pstmt.setInt(1,comment);
			rset= pstmt.executeQuery();
			while(rset.next()) {
				Warning w = new Warning();
				w.setWarningNo(rset.getInt("warning_no"));
				w.setWarningPageNo(rset.getInt("warning_page_no"));
				w.setWarningWriter(rset.getString("warning_writer"));
				w.setWarningType(rset.getInt("warning_type"));
				
				list.add(w);
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

	public ArrayList<SellComment> Search4Warning(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query ="select sell_comment_no,(select warning_writer from warning where sell_comment_no = warning_page_no and warning_writer=?) as writer from sell_comment";
		ArrayList<SellComment> list = new ArrayList<SellComment>();
		try {
		   pstmt=conn.prepareStatement(query);
		      pstmt.setString(1, memberId);
		      rset= pstmt.executeQuery();
		      while(rset.next()) {
		         SellComment sc = new SellComment();

		         //쿼리문에서 가져오는 값만 가져오기!!!
		         sc.setSellCommentWriter(rset.getString("writer"));
		         System.out.println("sc :"+sc.getSellCommentWriter());
		         sc.setSellCommentNo(rset.getInt("sell_comment_no"));
		         sc.setWriter(rset.getString("writer"));
		         System.out.println("sc :"+sc.getWriter());
		         list.add(sc);
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
	
	public int sellWarning(Connection conn, int sellNo, int sellWarning) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "update sell set sell_warning=? where sell_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, (sellWarning + 1));
			pstmt.setInt(2, sellNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Sell> Search3Warning(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query ="select sell_no,(select warning_writer from warning where sell_no = warning_page_no and warning_writer=?) as writer from sell";
		ArrayList<Sell> list = new ArrayList<Sell>();
		try {
		   pstmt=conn.prepareStatement(query);
		      pstmt.setString(1, memberId);
		      rset= pstmt.executeQuery();
		      while(rset.next()) {
		         Sell s = new Sell();

		         s.setSellNo(rset.getInt("sell_no"));
		         s.setWriter(rset.getString("writer"));
		         System.out.println("n :"+s.getWriter());
		         list.add(s);
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


}
