package message.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import message.model.vo.Message;

public class MessageDao {

	public boolean checkId(Connection conn, String msgReceiveId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean check = false;
		String query = "select * from member where member_id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, msgReceiveId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				
				check = true;
				System.out.println("dao 성공"+check);
			}		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return check;
	}

	public int messageSend(Connection conn, Message msg) {
		PreparedStatement pstmt = null;
		String query = "insert into message values(seq_msg.nextval,?,?,?,?,sysdate,0)";
		int result = 0;
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setString(1, msg.getMsgTitle());
			pstmt.setString(2, msg.getMsgSendId());
			pstmt.setString(3, msg.getMsgContent());
			pstmt.setString(4, msg.getMsgReceiveId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
		}
		
		return result;
	}

}
