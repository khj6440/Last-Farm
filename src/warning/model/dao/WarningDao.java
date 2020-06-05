package warning.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import review.model.vo.Review;
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

}
