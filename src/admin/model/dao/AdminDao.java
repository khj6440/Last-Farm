package admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.model.vo.WarningData;
import common.JDBCTemplate;
import member.model.vo.Member;
import message.model.vo.Message;
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

	public ArrayList<Member> selectMemberList(Connection conn, int start, int end, String sort) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ArrayList<Member> list = new ArrayList<Member>();
		ResultSet rset = null;
		String query = "select * from (select rownum AS rnum, n.* from (select * from member order by " + sort
				+ ")n) where rnum BETWEEN ? and ?";
		System.out.println(sort);
		System.out.println(query);
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
		String query = "select * from (select rownum AS rnum, n.* from (select * from sell order by sell_delete_state desc) n) where rnum BETWEEN ? and ?";
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
		String query = "update member set member_status=2,member_del_date=sysdate+14 where member_no in(" + param + ")";
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

	public ArrayList<Member> searchMember(Connection conn, int start, int end, String searched, String sort) {
		PreparedStatement pstmt = null;
		ArrayList<Member> list = new ArrayList<Member>();
		ResultSet rset = null;
		String query = "select * from (select rownum AS rnum, n.* from (select * from member order by " + sort
				+ ")n where member_id like ? or member_name like ?) where rnum BETWEEN ? and ?";
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

	public int deleteCancel(Connection conn, int memberNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update member set member_status=1,member_del_date=null where member_no=?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public int modifyMemberStatus(Connection conn, int memberNo, int memberStatus) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update member set member_status=? where member_no=?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberStatus);
			pstmt.setInt(2, memberNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public int totalWarningCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select count(*) as cnt from (select 'sell' as type,sell_no as type_no ,sell_title as type_title,sell_writer as type_writer,sell_date as type_date,sell_warning as type_warning from sell where sell_warning>=5"
				+ " union "
				+ "select 'review' as type,review_no,review_title,review_writer,review_date,review_warning from review where review_warning>=5"
				+ " union "
				+ "select 'review_comment' as type,review_comment_no,review_comment_content,review_comment_writer,review_comment_date,review_comment_warning from review_comment where review_comment_warning>=5"
				+ " union "
				+ "select 'sell_comment' as type,sell_comment_no,sell_comment_content,sell_comment_writer,sell_comment_date,sell_comment_warning from sell_comment where sell_comment_warning>=5)";
		int result = 0;
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

	public ArrayList<WarningData> moreWarning(Connection conn, int start, int end) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ArrayList<WarningData> list = new ArrayList<WarningData>();
		String query = "select * from(" + "select rownum as rnum, p.* from("
				+ "select 'sell' as type,sell_no as type_no ,sell_title as type_title,sell_writer as type_writer,sell_date as type_date,sell_warning as type_warning from sell where sell_warning>=5 "
				+ " union "
				+ " select 'review' as type,review_no,review_title,review_writer,review_date,review_warning from review where review_warning>=5 "
				+ " union "
				+ "select 'review_comment' as type,review_comment_no,review_comment_content,review_comment_writer,review_comment_date,review_comment_warning from review_comment where review_comment_warning>=5 "
				+ " union "
				+ "select 'sell_comment' as type,sell_comment_no,sell_comment_content,sell_comment_writer,sell_comment_date,sell_comment_warning from sell_comment where sell_comment_warning>=5 )p order by type_date desc) where rnum between ? and ?";

		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				WarningData wd = new WarningData();
				wd.setType(rset.getString("type"));
				wd.setTypeDate(rset.getDate("type_date"));
				wd.setTypeNo(rset.getInt("type_no"));
				wd.setTypeTitle(rset.getString("type_title"));
				wd.setTypeWarning(rset.getInt("type_warning"));
				wd.setTypeWriter(rset.getString("type_writer"));

				list.add(wd);
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

	public int getMessageCount(Connection conn) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) as cnt from message where msg_receive_id='admin' and msg_read=0";

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

	public ArrayList<Message> getMsgList(Connection conn) {
		PreparedStatement pstmt = null;
		ArrayList<Message> list = new ArrayList<Message>();
		String query = "select * from message where msg_receive_id='admin' or msg_send_id='admin' order by msg_date desc";
		ResultSet rset = null;

		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Message m = new Message();
				m.setMsgContent(rset.getString("msg_content"));
				m.setMsgDate(rset.getDate("msg_date"));
				m.setMsgNo(rset.getInt("msg_no"));
				m.setMsgRead(rset.getInt("msg_read"));
				m.setMsgReceiveId(rset.getString("msg_receive_id"));
				m.setMsgSendId(rset.getString("msg_send_id"));
				m.setMsgTitle(rset.getString("msg_title"));
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

	public int deleteBuy(Connection conn, ArrayList<String> checkList, String param) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from buy where buy_sell_no in(" + param + ")";
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

	public ArrayList<Sell> getDelSellList(Connection conn, ArrayList<String> checkList, String param) {
		PreparedStatement pstmt = null;
		ArrayList<Sell> list = new ArrayList<Sell>();
		String query = "select * from sell where sell_no in(" + param + ")";
		ResultSet rset = null;
		System.out.println(query);
		try {
			pstmt = conn.prepareStatement(query);
			for (int i = 0; i < checkList.size(); i++) {
				pstmt.setInt(i + 1, Integer.parseInt(checkList.get(i)));
			}
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
			JDBCTemplate.close(pstmt);
		}

		return list;
	}

	public int insertSellEnd(Connection conn, ArrayList<Sell> list) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into sell_end values(?,?,?,?,?,?,?,?,?,?,sysdate,2,?,?,?,?,?)";

		try {
			for (int i = 0; i < list.size(); i++) {
				System.out.println(query);
				pstmt = conn.prepareStatement(query);
				int index=1;
				pstmt.setInt(index++, list.get(i).getSellNo());
				pstmt.setString(index++, list.get(i).getSellTitle());
				pstmt.setString(index++, list.get(i).getSellName());
				pstmt.setString(index++, list.get(i).getSellWriter());
				pstmt.setString(index++, list.get(i).getSellContent());
				pstmt.setDate(index++, list.get(i).getSellDate());
				pstmt.setInt(index++, list.get(i).getSellType());
				pstmt.setString(index++, list.get(i).getSellCategory1());
				pstmt.setString(index++, list.get(i).getSellCategory2());
				pstmt.setInt(index++, list.get(i).getSellWarning());
				pstmt.setString(index++, list.get(i).getSellItemOrigin());
				pstmt.setString(index++, list.get(i).getSellItemQuantity());
				pstmt.setString(index++, list.get(i).getSellItemMaterial());
				pstmt.setString(index++, list.get(i).getSellItemRule());
				pstmt.setString(index++, list.get(i).getThumbnail());
				
				result +=pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public int deleteComment(Connection conn, ArrayList<String> checkList, String param, String type) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from "+type+" where "+type+"_no in(" + param + ")";
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

	public int readMsg(Connection conn, int msgNo) {

		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update message set msg_read=1 where msg_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, msgNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

}
