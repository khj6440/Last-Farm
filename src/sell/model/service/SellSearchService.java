package sell.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import sell.model.dao.SellSearchDao;
import sell.model.vo.Sell;

public class SellSearchService {
	
	
	public ArrayList<Sell> selectList(int test) {
	      Connection conn = JDBCTemplate.getConnection();
	      ArrayList<Sell> list = new ArrayList<Sell>();
	      list = new SellSearchDao().selectList(conn,test);
	      JDBCTemplate.close(conn);
	      
	      return list;
	   }
}
