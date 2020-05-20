package sell.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import sell.model.vo.Sell;

public class SellSearchDao {
	public ArrayList<Sell> selectList(Connection conn,int test) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      ArrayList<Sell> list = new ArrayList<Sell>();
	      String query = "select * from (select rownum as rnum, n.* from ( select * from sell where sell_type=? order by sell_no desc)n) where rnum between 1 and 9";
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setInt(1, test);
	         rset = pstmt.executeQuery();
	         while(rset.next()) {
	            Sell sell = new Sell();
	            sell.setSellNo(rset.getInt("sell_no"));
	            sell.setSellTitle(rset.getString("sell_title"));
	            sell.setSellName(rset.getString("sell_name"));
	            sell.setSellWriter(rset.getString("sell_writer"));
	            sell.setSellContent(rset.getString("sell_content"));
	            sell.setSellEndDate(rset.getDate("sell_date"));
	            sell.setSellMax(rset.getInt("sell_max"));
	            sell.setSellMin(rset.getInt("sell_min"));
	            sell.setSellCount(rset.getInt("sell_count"));
	            sell.setSellPrice(rset.getInt("sell_price"));
	            sell.setSellDate(rset.getDate("sell_date"));
	            sell.setSellType(rset.getInt("sell_type"));
	            sell.setSellCategory1(rset.getString("sell_category1"));
	            sell.setSellCategory2(rset.getString("sell_category2"));
	            sell.setSellWarning(rset.getInt("sell_warning"));
	            sell.setSellDeliveryFee(rset.getInt("sell_delivery_fee"));
	            sell.setSellItemOrigin(rset.getString("sell_item_origin"));
	            sell.setSellItemExpireDate(rset.getString("sell_item_expire_date"));
	            sell.setSellItemQuantity(rset.getString("sell_item_quantity"));
	            sell.setSellItemMaterial(rset.getString("sell_item_material"));
	            sell.setSellItemRule(rset.getString("sell_item_rule"));
	            sell.setThumbnail(rset.getString("thumbnail"));
	            sell.setSellDeleteState(rset.getInt("sell_delete_state"));
	            list.add(sell);
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
