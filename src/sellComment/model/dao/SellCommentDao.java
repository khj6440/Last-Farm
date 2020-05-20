package sellComment.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import sell.model.vo.Sell;
import sellComment.model.vo.SellComment;

public class SellCommentDao {
	public int sellCommentInsert(Connection conn, SellComment sc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into sell_comment values (seq_sell_comment.nextval,?,?,?,?,?,sysdate,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sc.getSellCommentLevel());
			pstmt.setString(2, sc.getSellCommentWriter());
			pstmt.setString(3, sc.getSellCommentContent());
			pstmt.setInt(4, sc.getSellRef());
			//일반적으로 0을 넣는 구조
//			pstmt.setInt(5, nc.getNoticeCommentRef()); 
			//0을 Null로 넣는 방법. Oracle은 '1'을 입력해도 Number타입으로 자동 형변환을 해준다.
			pstmt.setString(5, sc.getSellCommentRef()==0?null:String.valueOf(sc.getSellCommentRef()));
			pstmt.setInt(6, sc.getSellCommentWarning());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<SellComment> selectCommentList(Connection conn, int sellNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<SellComment> list2 = new ArrayList<SellComment>();
		String query = "select * from sell_comment where sell_ref=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sellNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				SellComment sc = new SellComment();
				sc.setSellCommentNo(rset.getInt("sell_comment_no"));
				sc.setSellCommentLevel(rset.getInt("sell_comment_level"));
				sc.setSellCommentWriter(rset.getString("sell_comment_writer"));
				sc.setSellCommentContent(rset.getString("sell_comment_content"));
				sc.setSellRef(rset.getInt("sell_ref"));
				sc.setSellCommentRef(rset.getInt("sell_comment_ref"));
				sc.setSellCommentDate(rset.getDate("sell_comment_date"));
				sc.setSellCommentWarning(rset.getInt("sell_comment_warning"));
				list2.add(sc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list2;
	}

	public Sell selectOneSell(Connection conn, int sellNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Sell sell = null;
		String query = "select * from sell where sell_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sellNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				sell = new Sell();
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
				sell.setSellRegionalAddr(rset.getString("sell_regional_addr"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return sell;
	}

	public int sellWarning(Connection conn, int sellNo, int sellWarning) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "update sell set sell_warning=? where sell_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, (sellWarning+1));
			pstmt.setInt(2, sellNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int sellCommentDelete(Connection conn, int sc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query="delete from sell_comment where sell_comment_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sc);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
	
		return result;
	}

	public int updateSellComment(Connection conn, SellComment sc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update sell_comment set sell_comment_content=? where sell_comment_no=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, sc.getSellCommentContent());
			pstmt.setInt(2, sc.getSellCommentNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int selectOneSell(Connection conn, int sellNo, int sellDel) {
		PreparedStatement pstmt = null;
		int result = 0;
		sellDel = 1;
		String query = "update sell set sell_delete_state=? where sell_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sellDel);
			pstmt.setInt(2, sellNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateSellCount(Connection conn, int sellNo, int type, int sellCount) {
		PreparedStatement pstmt = null;
		int result = 0;
		sellCount += type;
		String query="update sell set sell_count=? where sell_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sellCount);
			pstmt.setInt(2, sellNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int updateSellCount2(Connection conn, int sellNo, int type, int sellMax, int sellCount) {
		PreparedStatement pstmt = null;
		int result = 0;
		sellMax = type+sellCount;
		String query="update sell set sell_max=? where sell_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sellMax);
			pstmt.setInt(2, sellNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int commentWarning(Connection conn, int sellCommentNo, int sellCommentWarning) {
	     PreparedStatement pstmt = null;
	      int result = 0;
	      String query = "update sell_comment set sell_comment_warning=? where sell_comment_no=?";
	      try {
	         pstmt=conn.prepareStatement(query);
	         pstmt.setInt(1, (sellCommentWarning+1));
	         pstmt.setInt(2, sellCommentNo);
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


	


	
	

