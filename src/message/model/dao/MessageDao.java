package message.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	public int totalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		String query = "select count(*) as num from message";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if (rset.next()) {

				totalCount = rset.getInt("num");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return totalCount;
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

	/**
	 * @param conn
	 * @param memberId
	 * @param start
	 * @param end
	 * @return
	 */
	public ArrayList<Message> selectSendMsg(Connection conn, String memberId, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from(select rownum as rnum, n.* from (select * from message where msg_send_id=? order by msg_read)n) where rnum between ? and ?";
		ArrayList<Message> list = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			System.out.println("Dao:"+memberId);
			rset = pstmt.executeQuery();
			System.out.println(rset);
			list = new ArrayList<Message>();
			while(rset.next()) {
				System.out.println(13579);
				Message msg = new Message();
				msg.setMsgContent(rset.getString("msg_content"));
				msg.setMsgDate(rset.getDate("msg_date"));
				msg.setMsgNo(rset.getInt("msg_no"));
				msg.setMsgRead(rset.getInt("msg_read"));
				msg.setMsgReceiveId(rset.getString("msg_receive_id"));
				msg.setMsgSendId(rset.getString("msg_send_id"));
				msg.setMsgTitle(rset.getString("msg_title"));
				list.add(msg);
			
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
	
	public ArrayList<Message> selectReceiveMsg(Connection conn, String memberId, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from(select rownum as rnum, n.* from (select * from message where msg_receive_id=? order by msg_read)n) where rnum between ? and ?";
		ArrayList<Message> list = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			list = new ArrayList<Message>();
			while(rset.next()) {
				Message msg = new Message();
				msg.setMsgContent(rset.getString("msg_content"));
				msg.setMsgDate(rset.getDate("msg_date"));
				msg.setMsgNo(rset.getInt("msg_no"));
				msg.setMsgRead(rset.getInt("msg_read"));
				msg.setMsgReceiveId(rset.getString("msg_receiveid"));
				msg.setMsgSendId(rset.getString("msg_sendid"));
				msg.setMsgTitle(rset.getString("msg_title"));
				list.add(msg);
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
