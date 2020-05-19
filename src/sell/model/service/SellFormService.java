package sell.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import sell.model.dao.SellFormDao;
import sell.model.vo.Sell;

public class SellFormService {

	public int sellFormInsert(Sell s) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new SellFormDao().sellFormInsert(conn,s);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
