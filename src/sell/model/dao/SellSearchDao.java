package sell.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.jasper.tagplugins.jstl.core.Set;

import common.JDBCTemplate;
import sell.model.vo.Sell;

public class SellSearchDao {
	//전체 조회
	public ArrayList<Sell> selectSellNationalList(Connection conn, String page) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Sell> list = new ArrayList<Sell>();
		String query = "select*from sell where sell_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, page);
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
				sell.setSellDeleteState(rset.getInt("sell_detail_state"));
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
	
		public ArrayList<Sell> selectSellFromSearchBox(Connection conn, String searchWord) {
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				ArrayList<Sell> sellList = new ArrayList<Sell>();
				String searchQuery = "%"+searchWord+"%";
				String query = "select*from sell where sell_title like ?";
				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, searchQuery);
					rset = pstmt.executeQuery();
					while(rset.next()) {
						Sell sell = new Sell();
						sell.setSellNo(rset.getInt("sell_no"));
						sell.setSellTitle(rset.getString("sell_title"));
						sell.setThumbnail(rset.getString("thumbnail"));
						sell.setSellPrice(rset.getInt("sell_price"));
						sell.setSellCount(rset.getInt("sell_count"));
						sell.setSellDate(rset.getDate("sell_date"));
						sell.setSellEndDate(rset.getDate("sell_end_date"));
						sellList.add(sell);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
				return sellList;
		}
	
	//전체 마감시간순
	public ArrayList<Sell> selectAllTimeLeft(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Sell> sellList = new ArrayList<Sell>();
		String query = "select*from(select rownum as rnum, n.*from(select*from sell order by sell_end_date)n) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Sell sell = new Sell();
				sell.setSellNo(rset.getInt("sell_no"));
				sell.setSellTitle(rset.getString("sell_title"));
				sell.setThumbnail(rset.getString("thumbnail"));
				sell.setSellPrice(rset.getInt("sell_price"));
				sell.setSellCount(rset.getInt("sell_count"));
				sell.setSellDate(rset.getDate("sell_date"));
				sell.setSellEndDate(rset.getDate("sell_end_date"));
				sellList.add(sell);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return sellList;
	}
	//전체 구매 인기순
	public ArrayList<Sell> selectAllSellCount(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Sell> sellList = new ArrayList<Sell>();
		String query = "select*from(select rownum as rnum, n.*from(select*from sell order by sell_count desc)n) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Sell sell = new Sell();
				sell.setSellNo(rset.getInt("sell_no"));
				sell.setSellTitle(rset.getString("sell_title"));
				sell.setThumbnail(rset.getString("thumbnail"));
				sell.setSellPrice(rset.getInt("sell_price"));
				sell.setSellCount(rset.getInt("sell_count"));
				sell.setSellDate(rset.getDate("sell_date"));
				sell.setSellEndDate(rset.getDate("sell_end_date"));
				sellList.add(sell);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return sellList;

	}
	//전체 최근등록순
	public ArrayList<Sell> selectAllRecent(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Sell> sellList = new ArrayList<Sell>();
		String query = "select*from(select rownum as rnum, n.*from(select*from sell order by sell_date desc)n) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Sell sell = new Sell();
				sell.setSellNo(rset.getInt("sell_no"));
				sell.setSellTitle(rset.getString("sell_title"));
				sell.setThumbnail(rset.getString("thumbnail"));
				sell.setSellPrice(rset.getInt("sell_price"));
				sell.setSellCount(rset.getInt("sell_count"));
				sell.setSellDate(rset.getDate("sell_date"));
				sell.setSellEndDate(rset.getDate("sell_end_date"));
				sellList.add(sell);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return sellList;
	}
	//전체 페이징 카운트
	public int totalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) as cnt from sell where sell_title like ?";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
		
		

	//서치박스 검색 중 마감시간 순
	public ArrayList<Sell> selectWordTimeLeft(Connection conn, int start, int end, String searchWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Sell> sellList = new ArrayList<Sell>();
		String searchQuery = "%"+searchWord+"%";
		String query = "select*from(select rownum as rnum, n.*from(select*from sell order by sell_end_date)n) where rnum between ? and ? and sell_title like ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setString(3, searchQuery);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Sell sell = new Sell();
				sell.setSellNo(rset.getInt("sell_no"));
				sell.setSellTitle(rset.getString("sell_title"));
				sell.setThumbnail(rset.getString("thumbnail"));
				sell.setSellPrice(rset.getInt("sell_price"));
				sell.setSellCount(rset.getInt("sell_count"));
				sell.setSellDate(rset.getDate("sell_date"));
				sell.setSellEndDate(rset.getDate("sell_end_date"));
				sellList.add(sell);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return sellList;
	}
	//서치박스 검색 중 구매 인기순
	public ArrayList<Sell> selectWordSellCount(Connection conn, int start, int end, String searchWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Sell> sellList = new ArrayList<Sell>();
		String searchQuery = "%"+searchWord+"%";
		String query = "select*from(select rownum as rnum, n.*from(select*from sell order by sell_count desc)n) where rnum between ? and ? and sell_title like ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setString(3, searchQuery);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Sell sell = new Sell();
				sell.setSellNo(rset.getInt("sell_no"));
				sell.setSellTitle(rset.getString("sell_title"));
				sell.setThumbnail(rset.getString("thumbnail"));
				sell.setSellPrice(rset.getInt("sell_price"));
				sell.setSellCount(rset.getInt("sell_count"));
				sell.setSellDate(rset.getDate("sell_date"));
				sell.setSellEndDate(rset.getDate("sell_end_date"));
				sellList.add(sell);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return sellList;
	}
	//서치박스 검색 중 최근 등록순
	public ArrayList<Sell> selectWordRecent(Connection conn, int start, int end, String searchWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Sell> sellList = new ArrayList<Sell>();
		String searchQuery = "%"+searchWord+"%";
		String query = "select*from(select rownum as rnum, n.*from(select*from sell order by sell_date desc)n) where rnum between ? and ? and sell_title like ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setString(3, searchQuery);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Sell sell = new Sell();
				sell.setSellNo(rset.getInt("sell_no"));
				sell.setSellTitle(rset.getString("sell_title"));
				sell.setThumbnail(rset.getString("thumbnail"));
				sell.setSellPrice(rset.getInt("sell_price"));
				sell.setSellCount(rset.getInt("sell_count"));
				sell.setSellDate(rset.getDate("sell_date"));
				sell.setSellEndDate(rset.getDate("sell_end_date"));
				sellList.add(sell);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return sellList;
	}
	//서치박스 검색 페이징
	public int totalCountByWord(Connection conn, String searchWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String searchQuery = "%"+searchWord+"%";
		String query = "select count(*) as cnt from sell where sell_title like ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, searchQuery);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
}
}
