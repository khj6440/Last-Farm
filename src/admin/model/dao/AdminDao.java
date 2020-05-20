package admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.vo.Member;
import sell.model.vo.Sell;

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
				m.setMemberStatus(rset.getInt("member_score"));
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
				m.setMemberStatus(rset.getInt("member_score"));
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
		try {

			pstmt = conn.prepareStatement(query);
			for (int i = 0; i < checkList.size(); i++) {
				pstmt.setInt(i + 1, Integer.parseInt(checkList.get(i)));
			}

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
		String query = "select * from (select rownum AS rnum, n.* from sell n where sell_title like ?) where rnum BETWEEN ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+searched+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
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
		String query = "select count(*) as cnt from sell where sell_title like ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+searched+"%");
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

}
