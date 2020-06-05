package review.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.vo.Member;
import question.model.vo.Question;
import review.model.vo.Review;
import sell.model.vo.Sell;
import sellEnd.model.vo.SellEnd;

public class ReviewDao {

	public int totalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		int result=0;
		String query="select count(*) as cnt from review";
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

	public ArrayList<Review> selectList(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		ArrayList<Review> list = new ArrayList<Review>();
		String query="select * from(select rownum as rnum, n.* from (select * from review order by review_no desc)n) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset= pstmt.executeQuery();
			while(rset.next()) {
				Review n = new Review();
				n.setReviewNo(rset.getInt("review_no"));
				n.setReviewBuyEndNo(rset.getInt("review_buy_end_no"));
				n.setReviewTitle(rset.getString("review_title"));
				n.setReviewWriter(rset.getString("review_writer"));
				n.setReviewContent(rset.getString("review_content"));
				n.setReviewScore(rset.getInt("review_score"));
				n.setReviewDate(rset.getDate("review_date"));
				n.setReviewWarning(rset.getInt("review_warning"));
				n.setReviewFilepath(rset.getString("review_filepath"));
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

	public int searchCount(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		int result=0;
		String query="select count(*) as cnt from review where review_writer = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,keyword);
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

	public ArrayList<Review> searchWriter(Connection conn, String keyword, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query ="select * from(select rownum as rnum, n.* from (select * from review where review_writer=? order by review_no desc)n) where rnum between ? and ?";
		ArrayList<Review> list = new ArrayList<Review>();
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,keyword);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset= pstmt.executeQuery();
			while(rset.next()) {
				Review n = new Review();
				n.setReviewNo(rset.getInt("review_no"));
				n.setReviewBuyEndNo(rset.getInt("review_buy_end_no"));
				n.setReviewTitle(rset.getString("review_title"));
				n.setReviewWriter(rset.getString("review_writer"));
				n.setReviewContent(rset.getString("review_content"));
				n.setReviewScore(rset.getInt("review_score"));
				n.setReviewDate(rset.getDate("review_date"));
				n.setReviewWarning(rset.getInt("review_warning"));
				n.setReviewFilepath(rset.getString("review_filepath"));
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

	public int searchCountContent(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		int result=0;
		String query="select count(*) as cnt from review where review_title like ?";
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

	public ArrayList<Review> searchTitle(Connection conn, String keyword, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query ="select * from(select rownum as rnum, n.* from (select * from review where review_title like ? order by review_no desc)n) where rnum between ? and ?";
		ArrayList<Review> list = new ArrayList<Review>();
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,'%'+keyword+'%');
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset= pstmt.executeQuery();
			while(rset.next()) {
				Review n = new Review();
				n.setReviewNo(rset.getInt("review_no"));
				n.setReviewBuyEndNo(rset.getInt("review_buy_end_no"));
				n.setReviewTitle(rset.getString("review_title"));
				n.setReviewWriter(rset.getString("review_writer"));
				n.setReviewContent(rset.getString("review_content"));
				n.setReviewScore(rset.getInt("review_score"));
				n.setReviewDate(rset.getDate("review_date"));
				n.setReviewWarning(rset.getInt("review_warning"));
				n.setReviewFilepath(rset.getString("review_filepath"));
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

	public SellEnd sellSearch(Connection conn, int reviewRef) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		SellEnd s = null;
		String query = "select * from sell_end where sell_end_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reviewRef);
			rset  = pstmt.executeQuery();
			if(rset.next()) {
				s = new SellEnd();
				s.setSellEndNo(rset.getInt("sell_end_no"));
				s.setSellEndTitle(rset.getString("sell_end_title"));
				s.setSellEndName(rset.getString("sell_end_name"));
				s.setSellEndWriter(rset.getString("sell_end_writer"));
				s.setSellEndContent(rset.getString("sell_end_content"));
				s.setSellDate(rset.getDate("sell_date"));
				s.setSellType(rset.getInt("sell_type"));
				s.setSellCategory1(rset.getString("sell_category1"));
				s.setSellCategory2(rset.getString("sell_category2"));
				s.setSellWarning(rset.getInt("sell_warning"));
				s.setSellEndDate(rset.getDate("sell_end_date"));
				s.setSellEndType(rset.getInt("sell_type"));
				s.setSellItemOrigin(rset.getString("sell_item_origin"));
				s.setSellItemQuantity(rset.getString("sell_item_quantity"));
				s.setSellItemMaterial(rset.getString("sell_item_material"));
				s.setSellItemRule(rset.getString("sell_item_rule"));
				s.setThumbnail(rset.getString("thumbnail"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return s;
	}

	public ArrayList<Review> sellReview(Connection conn, int reviewRef) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query ="select * from review where review_buy_end_no =?";
		ArrayList<Review> list = new ArrayList<Review>();
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1,reviewRef);
			rset= pstmt.executeQuery();
			while(rset.next()) {
				Review n = new Review();
				n.setReviewNo(rset.getInt("review_no"));
				n.setReviewBuyEndNo(rset.getInt("review_buy_end_no"));
				n.setReviewTitle(rset.getString("review_title"));
				n.setReviewWriter(rset.getString("review_writer"));
				n.setReviewContent(rset.getString("review_content"));
				n.setReviewScore(rset.getInt("review_score"));
				n.setReviewDate(rset.getDate("review_date"));
				n.setReviewWarning(rset.getInt("review_warning"));
				n.setReviewFilepath(rset.getString("review_filepath"));
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

	public int reviewWarning(Connection conn, int reviewNo, int reviewWarning) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update review set review_warning=? where review_no=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, (reviewWarning+1));
			pstmt.setInt(2, reviewNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
	}
	return result;
	}

	public int insertReview(Connection conn, Review r, int sellEndNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into review values(seq_review.nextval,?,?,?,?,?,sysdate,0,?)";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, sellEndNo);
			pstmt.setString(2, r.getReviewTitle());
			pstmt.setString(3, r.getReviewWriter());
			pstmt.setString(4, r.getReviewContent());
			pstmt.setInt(5, r.getReviewScore());
			pstmt.setString(6, r.getReviewFilepath());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
	}
	return result;
	}

	public ArrayList<Review> reviewList(Connection conn ,int sellEndNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query ="select * from review where review_buy_end_no = ?";
		ArrayList<Review> list = new ArrayList<Review>();
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, sellEndNo);
			rset= pstmt.executeQuery();
			while(rset.next()) {
				Review n = new Review();
				n.setReviewNo(rset.getInt("review_no"));
				n.setReviewBuyEndNo(rset.getInt("review_buy_end_no"));
				n.setReviewTitle(rset.getString("review_title"));
				n.setReviewWriter(rset.getString("review_writer"));
				n.setReviewContent(rset.getString("review_content"));
				n.setReviewScore(rset.getInt("review_score"));
				n.setReviewDate(rset.getDate("review_date"));
				n.setReviewWarning(rset.getInt("review_warning"));
				n.setReviewFilepath(rset.getString("review_filepath"));
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

	public int insertScore(Connection conn, int AllScore, String sellEndWriter) {
		PreparedStatement pstmt = null;
		int result2 = 0;
		String query = "update member set member_score=? where member_id=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, AllScore);
			pstmt.setString(2, sellEndWriter);
			result2 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
	}
	return result2;
	}

	public int reviewDelete(Connection conn, int reviewNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from review where review_no=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, reviewNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Member memberScore(Connection conn,String w) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = "select * from member where member_id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, w);
			rset  = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member();
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberCode(rset.getString("member_code"));
				m.setMemberRoadAddr(rset.getString("member_road_addr"));
				m.setMemberDetailAddr(rset.getString("member_detail_addr"));
				m.setMemberPostCode(rset.getString("member_post_code"));
				m.setMemberRoadAddr2(rset.getString("member_road_addr2"));
				m.setMemberDetailAddr2(rset.getString("member_detail_addr2"));
				m.setMemberPostCode2(rset.getString("member_post_code2"));
				
				m.setMemberPhone(rset.getString("member_phone"));
				m.setMemberEmail(rset.getString("member_email"));
				m.setMemberDate(rset.getDate("member_date"));
				m.setMemberScore(rset.getInt("member_score"));
				m.setMemberType(rset.getInt("member_type"));
				m.setCompanyName(rset.getString("company_name"));
				m.setMemberStatus(rset.getInt("member_status"));
				m.setMemberDelDate(rset.getDate("member_del_date"));
				m.setBankName(rset.getString("bank_name"));
				m.setBankAccount(rset.getString("bank_account"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}



}
