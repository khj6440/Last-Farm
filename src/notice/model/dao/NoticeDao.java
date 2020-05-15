package notice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import notice.model.vo.Notice;

public class NoticeDao {

	public ArrayList<Notice> selectAll(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from (select rownum as rnum, n.* from (select * from notice order by notice_no desc)n)\r\n"
				+ "where rnum between ? and ?";
		ArrayList<Notice> list = new ArrayList<>();
		Notice n = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				n = new Notice();
				n.setNoticeContent(rset.getString("notice_content"));
				n.setNoticeDate(rset.getDate("notice_date"));
				n.setNoticeFilename(rset.getString("notice_filename"));
				n.setNoticeFilepath(rset.getString("notice_Filepath"));
				n.setNoticeNo(rset.getInt("notice_No"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeWriter(rset.getString("notice_writer"));
				list.add(n);
			}
			//
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);

		}
		return list;
	}

	public int totalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		String query = "select count(*) as num from notice";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if (rset.next()) {

				totalCount = rset.getInt("num");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return totalCount;
	}

	public int totalCountNo(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		String query = "select count(*) as num from notice where notice_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			if (rset.next()) {

				totalCount = rset.getInt("num");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		System.out.println(totalCount);
		return totalCount;
	}

	public ArrayList<Notice> selectNo(Connection conn, int start, int end, int noticeNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from (select rownum as rnum, n.* from (select * from notice where notice_no=? order by notice_no desc)n)\r\n"
				+ "where rnum between ? and ?";
		ArrayList<Notice> list = new ArrayList<Notice>();
		Notice n = null;
		try {

			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();

			while (rset.next()) {

				n = new Notice();
				n.setNoticeContent(rset.getString("notice_content"));
				n.setNoticeDate(rset.getDate("notice_date"));
				n.setNoticeFilename(rset.getString("notice_filename"));
				n.setNoticeFilepath(rset.getString("notice_Filepath"));
				n.setNoticeNo(rset.getInt("notice_No"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeWriter(rset.getString("notice_writer"));
				list.add(n);
			}
			//
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);

		}
//		System.out.println(1);
		return list;
	}

	public int totalCountTitle(Connection conn, String noticeTitle) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		String query = "select count(*) as num from notice where notice_title like ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + noticeTitle + "%");
			rset = pstmt.executeQuery();
			if (rset.next()) {

				totalCount = rset.getInt("num");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);

		}

		return totalCount;
	}

	public ArrayList<Notice> selectTitle(Connection conn, int start, int end, String noticeTitle) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from (select rownum as rnum, n.* from (select * from notice where notice_title like ? order by notice_no desc)n)\r\n"
				+ "where rnum between ? and ?";
		ArrayList<Notice> list = new ArrayList<>();
		Notice n = null;

		try {

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + noticeTitle + "%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				n = new Notice();
				n.setNoticeContent(rset.getString("notice_content"));
				n.setNoticeDate(rset.getDate("notice_date"));
				n.setNoticeFilename(rset.getString("notice_filename"));
				n.setNoticeFilepath(rset.getString("notice_Filepath"));
				n.setNoticeNo(rset.getInt("notice_No"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeWriter(rset.getString("notice_writer"));
				list.add(n);
			}
			//
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);

		}

		return list;
	}

}
