package sell.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import sell.model.dao.SellSearchDao;
import sell.model.vo.Sell;

public class SellSearchService {

	public ArrayList<Sell> selectSellNationalList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Sell> sellList = new ArrayList<Sell>();
		sellList = new SellSearchDao().selectSellNationalList(conn);
		JDBCTemplate.close(conn);
		return sellList;
	}

}
