package message.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import message.model.dao.MessageDao;
import message.model.vo.Message;

public class MessageService {

	public boolean checkId(String msgReceiveId) {
		Connection conn = JDBCTemplate.getConnection();
		boolean check = new MessageDao().checkId(conn,msgReceiveId);
		JDBCTemplate.close(conn);
		
		return check;
	}

	public int messageSend(Message msg) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MessageDao().messageSend(conn,msg);
		
		if(result != 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

}
