package buy.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import buy.model.vo.Buy;
import common.JDBCTemplate;
import sellComment.model.vo.SellViewData;

public class BuyDao {

	public int insertBuy(Connection conn, Buy b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query="insert into buy values(seq_buy.nextval,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getBuyId());
			pstmt.setInt(2, b.getBuySellNo());
			pstmt.setInt(3, b.getBuyAmount());
			pstmt.setString(4, b.getBuyPayCode());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Buy> selectBuy(Connection conn, Buy b) {
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		ArrayList<Buy> list = new ArrayList<Buy>();
		
		String query = "select * from buy where buy_sell_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,b.getBuySellNo());
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Buy b1  = new Buy();
				b1.setBuyAmount(rset.getInt("buy_amount"));
				b1.setBuyId(rset.getString("buy_id"));
				b1.setBuySellNo(rset.getInt("buy_sell_no"));
				b1.setBuyPayCode(rset.getString("buy_pay_code"));
				list.add(b1);
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

	public int selectAllBuy(Connection conn, Buy b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query="insert into buy_end values(seq_buy_end.nextval,?,?,null,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getBuyId());
			pstmt.setInt(2, b.getBuySellNo());
			pstmt.setInt(3, b.getBuyAmount());
			pstmt.setString(4, b.getBuyPayCode());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		System.out.println("구매완료 insert : "+b.getBuySellNo());
		return result;
	}

	public int insertSellEnd(Connection conn, SellViewData svd) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query="insert into sell_end values(?,?,?,?,?,?,?,?,?,?,sysdate,1,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, svd.getS().getSellNo());
			pstmt.setString(2, svd.getS().getSellTitle());
			pstmt.setString(3, svd.getS().getSellName());
			pstmt.setString(4, svd.getS().getSellWriter());
			pstmt.setString(5, svd.getS().getSellContent());
			pstmt.setDate(6, svd.getS().getSellDate());
			pstmt.setInt(7, svd.getS().getSellType());
			pstmt.setString(8, svd.getS().getSellCategory1());
			pstmt.setString(9, svd.getS().getSellCategory2());
			pstmt.setInt(10, svd.getS().getSellWarning());
			pstmt.setString(11, svd.getS().getSellItemOrigin());
			pstmt.setString(12, svd.getS().getSellItemQuantity());
			pstmt.setString(13, svd.getS().getSellItemMaterial());
			pstmt.setString(14, svd.getS().getSellItemRule());
			pstmt.setString(15, svd.getS().getThumbnail());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		System.out.println("판매글 마감 insert : "+svd.getS().getSellNo());
		return result;
	}

	public int deleteBuyList(Connection conn, int sellNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query="delete from buy where buy_sell_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sellNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteSellPage(Connection conn, int sellNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		String query="delete from sell where sell_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sellNo);
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
