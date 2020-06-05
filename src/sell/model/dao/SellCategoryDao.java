package sell.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import sell.model.vo.Sell;

public class SellCategoryDao {

	public int typeCount(Connection conn, String addr, String type1, String type2, String searchWord) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			int result = 0;
			String qAddr = "%"+addr+"%";
			String query ="select * from sell where sell_type=2 and sell_regional_addr like"+qAddr;
			if(type1!=null) {
				String qtype1 = "and sell_category1="+type1;
				query+=qtype1;
			}
			if(type2!=null) {
				String qtype2 = "and sell_category2="+type2;
				query+=qtype2;
			}
			if(searchWord!=null) {
				String qSearchWord = "and sell_title like %"+searchWord+"%";
				query+=qSearchWord;
			}
			try {
				pstmt = conn.prepareStatement(query);
				rset = pstmt.executeQuery();
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


	public ArrayList<Sell> selectSearchAll(Connection conn, String addr, int start, int end, String type1, String type2,
			String searchWord, String sortingTab) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Sell> sellList = new ArrayList<Sell>();
		String qAddr = "%"+addr+"%";
		String query1 = "select s.*, floor(sell_end_date-sysdate+1)as gap from(select rownum as rnum, n.*from(select * from sell where sell_type=2 and sell_regional_addr like"+qAddr;
		String query2 = "order by "+sortingTab+")n)s where rnum between ? and ?";
		if(type1!=null) {
			String qtype1 = "and sell_category1="+type1;
			query1+=qtype1;
		}
		if(type2!=null) {
			String qtype2 = "and sell_category2="+type2;
			query1+=qtype2;
		}
		if(searchWord!=null) {
			String qSearchWord = "and sell_title like %"+searchWord+"%";
			query1+=qSearchWord;
		}
		String query = query1+query2;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Sell sell = new Sell();
				sell.setSellNo(rset.getInt("sell_no"));
				sell.setSellWriter(rset.getString("sell_writer"));
				sell.setSellTitle(rset.getString("sell_title"));
				sell.setThumbnail(rset.getString("thumbnail"));
				sell.setSellPrice(rset.getInt("sell_price"));
				sell.setSellCount(rset.getInt("sell_count"));
				sell.setSellDate(rset.getDate("sell_date"));
				sell.setSellEndDate(rset.getDate("sell_end_date"));
				sell.setTimegap(rset.getInt("gap"));
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
	
	

}
