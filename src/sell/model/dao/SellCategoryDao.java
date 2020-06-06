package sell.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import common.JDBCTemplate;
import sell.model.vo.SearchTab;
import sell.model.vo.Sell;

public class SellCategoryDao {

	public int totalCount(Connection conn, SearchTab st) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String qAddr = "%"+st.getSido()+"%"+st.getGugun()+"%";
		String q ="where sell_type=2 and sell_regional_addr like '"+qAddr+"'";
		if(!st.getType1().equals("null")&&st.getType1()!=null) {
			if(!st.getType2().equals("null")&&st.getType2()!=null) {
				q += " and sell_category1='"+st.getType1()+"' and sell_category2='"+st.getType2()+"'";
			}else {
				q += " and sell_category1='"+st.getType1()+"'";	
			}
		}
		if(st.getKeyword()!=null) {
			q += " and sell_title like '%"+st.getKeyword()+"%'";
		}
		String query = "select count(*)cnt from sell "+q;
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
		System.out.println(result);
		return result;
	}


	public ArrayList<Sell> selectList(Connection conn, HashMap<String, String> map, SearchTab st) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Sell> sellList = new ArrayList<Sell>();
		//쿼리문 조합
		//select s.*, floor(sell_end_date-sysdate+1)as gap from(select rownum as rnum, n.*from(select * from sell order by sell_end_date)n)s 
		//where rnum between 1 and 10;
		String query ="select s.*, floor(sell_end_date-sysdate+1)as gap from(select rownum as rnum, n.*from(select * from sell where sell_type=2 and sell_regional_addr like";
		query += " '%"+st.getSido()+"%"+st.getGugun()+"%"+"'";
		if(!st.getType1().equals("null")&&st.getType1()!=null) {
			if(!st.getType2().equals("null")&&st.getType2()!=null) {
				query += " and sell_category1='"+st.getType1()+"' and sell_category2='"+st.getType2()+"'";
			}else {
				query += " and sell_category1='"+st.getType1()+"'";	
			}
		}
		if(st.getKeyword()!=null) {
			query += " and sell_title like "+"'%"+st.getKeyword()+"%"+"'";
		}
		if(st.getSortingTab().equals("마감시간순")) {
			query += " order by sell_end_date";
		}else if(st.getSortingTab().equals("구매인기순")) {
			query += "order by sell_count desc";
		}else if(st.getSortingTab().equals("최근등록순")) {
			query += "order by sell_date desc";
		}
		query += ")n)s where rnum between "+map.get("start")+" and "+map.get("end");
		System.out.println(query);
		try {
			pstmt = conn.prepareStatement(query);
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
