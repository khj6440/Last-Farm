package sell.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import common.JDBCTemplate;
import sell.model.vo.Sell;

public class SellFormDao {

	public int sellFormInsert(Connection conn, Sell s) {
		PreparedStatement pstmt = null;
		int result=0;
		String query = "insert into sell values(seq_sell.nextval,?,?,?,?,?,?,?,0,?,sysdate,?,?,?,0,?,?,?,?,?,?,?,0,?)";
		try {
			pstmt = conn.prepareStatement(query);
			int index=1;
			pstmt.setString(index++, s.getSellTitle());
			pstmt.setString(index++, s.getSellName());
			pstmt.setString(index++, s.getSellWriter());
			pstmt.setString(index++, s.getSellContent());
			pstmt.setDate(index++, s.getSellEndDate());
			pstmt.setInt(index++, s.getSellMax());
			pstmt.setInt(index++, s.getSellMin());
			pstmt.setInt(index++, s.getSellPrice());
			pstmt.setInt(index++, s.getSellType());
			pstmt.setString(index++, s.getSellCategory1());
			pstmt.setString(index++, s.getSellCategory2());
			pstmt.setInt(index++, s.getSellDeliveryFee());
			pstmt.setString(index++, s.getSellItemOrigin());
			pstmt.setString(index++, s.getSellItemExpireDate());
			pstmt.setString(index++, s.getSellItemQuantity());
			pstmt.setString(index++, s.getSellItemMaterial());
			pstmt.setString(index++, s.getSellItemRule());
			pstmt.setString(index++, s.getThumbnail());
			pstmt.setString(index++, s.getSellRegionalAddr());
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
