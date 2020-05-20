package mypage.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.vo.Member;
import message.model.vo.Message;
import sell.model.vo.Sell;
import sellEnd.model.vo.SellEnd;

public class MypageDao {

	public Member selectOneMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = "select * from member where member_id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				m = new Member();
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
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return m;
	}

	public ArrayList<Sell> getBuyList(Connection conn, String memberId) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Sell> list = new ArrayList<Sell>();
		String query = "select * from sell join buy on(sell_no=buy_sell_no) where buy_id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
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

	public ArrayList<SellEnd> getBuyEndList(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<SellEnd> list = new ArrayList<SellEnd>();
		String query = "select * from sell_end join buy_end on(sell_end_no=buy_end_no) where buy_end_writer=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				SellEnd se = new SellEnd();

				se.setSellEndNo(rset.getInt("sell_end_no"));
				se.setSellEndTitle(rset.getString("sell_end_title"));
				se.setSellEndName(rset.getString("sell_end_name"));
				se.setSellEndWriter(rset.getString("sell_end_writer"));
				se.setSellEndContent(rset.getString("sell_end_content"));
				se.setSellDate(rset.getDate("sell_date"));
				se.setSellType(rset.getInt("sell_type"));
				se.setSellCategory1(rset.getString("sell_category1"));
				se.setSellCategory2(rset.getString("sell_category2"));
				se.setSellWarning(rset.getInt("sell_warning"));
				se.setSellEndDate(rset.getDate("sell_end_date"));
				se.setSellEndType(rset.getInt("sell_end_type"));
				se.setSellItemOrigin(rset.getString("sell_item_origin"));
				se.setSellItemQuantity(rset.getString("sell_item_quantity"));
				se.setSellItemMaterial(rset.getString("sell_item_material"));
				se.setSellItemRule(rset.getString("sell_item_rule"));
				se.setThumbnail(rset.getString("thumbnail"));

				list.add(se);
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

	public ArrayList<Message> getMsgList(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ArrayList<Message> list = new ArrayList<Message>();
		String query = "select * from message where msg_receive_id=? or msg_send_id=?";
		ResultSet rset = null;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberId);
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

	public ArrayList<Sell> getSellList(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Sell> list = new ArrayList<Sell>();
		String query = "select * from sell where sell_writer=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
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

	public ArrayList<SellEnd> getSellEndList(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<SellEnd> list = new ArrayList<SellEnd>();
		String query = "select * from sell_end where sell_end_writer=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				SellEnd se = new SellEnd();

				se.setSellEndNo(rset.getInt("sell_end_no"));
				se.setSellEndTitle(rset.getString("sell_end_title"));
				se.setSellEndName(rset.getString("sell_end_name"));
				se.setSellEndWriter(rset.getString("sell_end_writer"));
				se.setSellEndContent(rset.getString("sell_end_content"));
				se.setSellDate(rset.getDate("sell_date"));
				se.setSellType(rset.getInt("sell_type"));
				se.setSellCategory1(rset.getString("sell_category1"));
				se.setSellCategory2(rset.getString("sell_category2"));
				se.setSellWarning(rset.getInt("sell_warning"));
				se.setSellEndDate(rset.getDate("sell_end_date"));
				se.setSellEndType(rset.getInt("sell_end_type"));
				se.setSellItemOrigin(rset.getString("sell_item_origin"));
				se.setSellItemQuantity(rset.getString("sell_item_quantity"));
				se.setSellItemMaterial(rset.getString("sell_item_material"));
				se.setSellItemRule(rset.getString("sell_item_rule"));
				se.setThumbnail(rset.getString("thumbnail"));

				list.add(se);
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
