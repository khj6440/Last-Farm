package admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.vo.Member;
import review.model.vo.Review;
import review.model.vo.ReviewAndSell;
import sell.model.vo.Sell;
import sellEnd.model.vo.SellEnd;

public class AdminDao {

	public ArrayList<Member> selectAllMember(Connection conn) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ArrayList<Member> list = new ArrayList<Member>();
		ResultSet rset = null;
		String query = "select * from member";

		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Member m = new Member();
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberCode(rset.getString("member_code"));
				m.setMemberRoadAddr(rset.getString("member_road_addr"));
				m.setMemberDetailAddr(rset.getString("member_detail_addr"));
				m.setMemberPostCode(rset.getString("member_post_code"));
				m.setMemberDeliveryAddr(rset.getString("member_delivery_addr"));
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

				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int totalMemberCount(Connection conn) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) as cnt from member";

		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt("cnt");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Member> selectMemberList(Connection conn, int start, int end) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ArrayList<Member> list = new ArrayList<Member>();
		ResultSet rset = null;
		String query = "select * from" + "(select rownum AS rnum, n.* from " + "member n) where rnum BETWEEN ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Member m = new Member();
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberCode(rset.getString("member_code"));
				m.setMemberDetailAddr(rset.getString("member_detail_addr"));
				m.setMemberPostCode(rset.getString("member_post_code"));
				m.setMemberDeliveryAddr(rset.getString("member_delivery_addr"));
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

				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int totalSellCount(Connection conn) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) as cnt from sell";

		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt("cnt");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Sell> selectSellList(Connection conn, int start, int end) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ArrayList<Sell> list = new ArrayList<Sell>();
		ResultSet rset = null;
		String query = "select * from" + "(select rownum AS rnum, n.* from " + "sell n) where rnum BETWEEN ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Sell s = new Sell();

				s.setSellNo(rset.getInt("sell_no"));
				s.setSellTitle(rset.getString("sell_title"));
				s.setSellName(rset.getString("sell_name"));
				s.setSellWriter(rset.getString("sell_writer"));
				s.setSellContent(rset.getString("sell_content"));
				s.setSellEndDate(rset.getDate("sell_end_date"));
				s.setSellMax(rset.getInt("sell_max"));
				s.setSellMin(rset.getInt("sell_min"));
				s.setSellCount(rset.getInt("sell_count"));
				s.setSellPrice(rset.getInt("sell_price"));
				s.setSellDate(rset.getDate("sell_date"));
				s.setSellType(rset.getInt("sell_type"));
				s.setSellCategory1(rset.getString("sell_category1"));
				s.setSellCategory2(rset.getString("sell_category2"));
				s.setSellWarning(rset.getInt("sell_warning"));
				s.setSellDeliveryFee(rset.getInt("sell_delivery_fee"));
				s.setSellItemOrigin(rset.getString("sell_item_origin"));
				s.setSellItemExpireDate(rset.getString("sell_item_expire_date"));
				s.setSellItemQuantity(rset.getString("sell_item_quantity"));
				s.setSellItemMaterial(rset.getString("sell_item_material"));
				s.setSellItemRule(rset.getString("sell_item_rule"));
				s.setThumbnail(rset.getString("thumbnail"));
				s.setSellDeleteState(rset.getInt("sell_delete_state"));

				list.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int deleteSell(Connection conn, ArrayList<String> checkList, String param) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from sell where sell_no in(" + param + ")";
		System.out.println(query);
		try {

			pstmt = conn.prepareStatement(query);
			for (int i = 0; i < checkList.size(); i++) {
				pstmt.setInt(i + 1, Integer.parseInt(checkList.get(i)));
			}
			System.out.println(query);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public ArrayList<Sell> searchSell(Connection conn, int start, int end, String searched) {
		PreparedStatement pstmt = null;
		ArrayList<Sell> list = new ArrayList<Sell>();
		ResultSet rset = null;
		String query = "select * from (select rownum AS rnum, n.* from sell n where sell_title like ? or sell_writer like ?) where rnum BETWEEN ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + searched + "%");
			pstmt.setString(2, "%" + searched + "%");
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Sell s = new Sell();

				s.setSellNo(rset.getInt("sell_no"));
				s.setSellTitle(rset.getString("sell_title"));
				s.setSellName(rset.getString("sell_name"));
				s.setSellWriter(rset.getString("sell_writer"));
				s.setSellContent(rset.getString("sell_content"));
				s.setSellEndDate(rset.getDate("sell_end_date"));
				s.setSellMax(rset.getInt("sell_max"));
				s.setSellMin(rset.getInt("sell_min"));
				s.setSellCount(rset.getInt("sell_count"));
				s.setSellPrice(rset.getInt("sell_price"));
				s.setSellDate(rset.getDate("sell_date"));
				s.setSellType(rset.getInt("sell_type"));
				s.setSellCategory1(rset.getString("sell_category1"));
				s.setSellCategory2(rset.getString("sell_category2"));
				s.setSellWarning(rset.getInt("sell_warning"));
				s.setSellDeliveryFee(rset.getInt("sell_delivery_fee"));
				s.setSellItemOrigin(rset.getString("sell_item_origin"));
				s.setSellItemExpireDate(rset.getString("sell_item_expire_date"));
				s.setSellItemQuantity(rset.getString("sell_item_quantity"));
				s.setSellItemMaterial(rset.getString("sell_item_material"));
				s.setSellItemRule(rset.getString("sell_item_rule"));
				s.setThumbnail(rset.getString("thumbnail"));
				s.setSellDeleteState(rset.getInt("sell_delete_state"));

				list.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int searchSellCount(Connection conn, String searched) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) as cnt from sell where sell_title like ? or sell_writer like ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + searched + "%");
			pstmt.setString(2, "%" + searched + "%");
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt("cnt");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int totalReviewCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) as cnt from review";

		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt("cnt");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<ReviewAndSell> selectReviewList(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ArrayList<ReviewAndSell> list = new ArrayList<ReviewAndSell>();
		ResultSet rset = null;
		String query = "select n2.* ,NVL(review_writer,'(탈퇴한 회원)') as review_writer2 from (select * from (select rownum as rnum, n.* from (select * from review join sell_end on(review_buy_end_no = sell_end_no)) n) where rnum between ? and ?) n2";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				ReviewAndSell rs = new ReviewAndSell();
				Review r = new Review();
				SellEnd s = new SellEnd();
				r.setReviewBuyEndNo(rset.getInt("review_buy_end_no"));
				r.setReviewContent(rset.getString("review_content"));
				r.setReviewDate(rset.getDate("review_date"));
				r.setReviewNo(rset.getInt("review_no"));
				r.setReviewScore(rset.getInt("review_score"));
				r.setReviewTitle(rset.getString("review_title"));
				r.setReviewWarning(rset.getInt("review_warning"));
				r.setReviewWriter(rset.getString("review_writer2"));

				s.setSellEndTitle(rset.getString("sell_end_title"));
				s.setSellEndWriter(rset.getString("sell_end_writer"));

				rs.setReview(r);
				rs.setSellEnd(s);
				list.add(rs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int deleteReview(Connection conn, ArrayList<String> checkList, String param) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from review where review_no in(" + param + ")";
		System.out.println(query);
		try {

			pstmt = conn.prepareStatement(query);
			for (int i = 0; i < checkList.size(); i++) {
				pstmt.setInt(i + 1, Integer.parseInt(checkList.get(i)));
			}
			System.out.println(query);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public int searchReviewCount(Connection conn, String searched) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) as cnt from review where review_title like ? or review_writer like ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + searched + "%");
			pstmt.setString(2, "%" + searched + "%");
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt("cnt");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<ReviewAndSell> searchReview(Connection conn, int start, int end, String searched) {
		PreparedStatement pstmt = null;
		ArrayList<ReviewAndSell> list = new ArrayList<ReviewAndSell>();
		ResultSet rset = null;
		String query = "select * from (select rownum as rnum, n.* from (select * from review join sell_end on(review_buy_end_no = sell_end_no) where review_title like ? or review_writer like ?) n) where rnum between ? and ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + searched + "%");
			pstmt.setString(2, "%" + searched + "%");
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				ReviewAndSell rs = new ReviewAndSell();
				Review r = new Review();
				SellEnd s = new SellEnd();
				r.setReviewBuyEndNo(rset.getInt("review_buy_end_no"));
				r.setReviewContent(rset.getString("review_content"));
				r.setReviewDate(rset.getDate("review_date"));
				r.setReviewNo(rset.getInt("review_no"));
				r.setReviewScore(rset.getInt("review_score"));
				r.setReviewTitle(rset.getString("review_title"));
				r.setReviewWarning(rset.getInt("review_warning"));
				r.setReviewWriter(rset.getString("review_writer"));

				s.setSellEndTitle(rset.getString("sell_end_title"));
				s.setSellEndWriter(rset.getString("sell_end_writer"));

				rs.setReview(r);
				rs.setSellEnd(s);
				list.add(rs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int deleteMember(Connection conn, ArrayList<String> checkList, String param) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update member set member_status=2 where member_no in(" + param + ")";
		try {
			pstmt = conn.prepareStatement(query);
			for (int i = 0; i < checkList.size(); i++) {
				pstmt.setInt(i + 1, Integer.parseInt(checkList.get(i)));
			}
			System.out.println(query);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public int searchMemberCount(Connection conn, String searched) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) as cnt from member where member_id like ? or member_name like ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + searched + "%");
			pstmt.setString(2, "%" + searched + "%");
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt("cnt");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Member> searchMember(Connection conn, int start, int end, String searched) {
		PreparedStatement pstmt = null;
		ArrayList<Member> list = new ArrayList<Member>();
		ResultSet rset = null;
		String query = "select * from (select rownum AS rnum, n.* from member n where member_id like ? or member_name like ?) where rnum BETWEEN ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + searched + "%");
			pstmt.setString(2, "%" + searched + "%");
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Member m = new Member();
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberCode(rset.getString("member_code"));
				m.setMemberRoadAddr(rset.getString("member_road_addr"));
				m.setMemberDetailAddr(rset.getString("member_detail_addr"));
				m.setMemberPostCode(rset.getString("member_post_code"));
				m.setMemberDeliveryAddr(rset.getString("member_delivery_addr"));
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
				list.add(m);
			}
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
