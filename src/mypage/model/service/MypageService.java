package mypage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.vo.Member;
import message.model.vo.Message;
import mypage.model.dao.MypageDao;
import sell.model.vo.Sell;
import sellEnd.model.vo.SellEnd;

public class MypageService {

	public Member selectOneMember(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = new MypageDao().selectOneMember(conn, memberId);
		JDBCTemplate.close(conn);

		return m;
	}

	public ArrayList<Sell> getBuyList(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Sell> list = new MypageDao().getBuyList(conn, memberId);
		
		JDBCTemplate.close(conn);

		return list;
	}

	public ArrayList<SellEnd> getBuyEndList(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<SellEnd> list = new MypageDao().getBuyEndList(conn, memberId);
		
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Message> getMsgList(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Message> list = new MypageDao().getMsgList(conn, memberId);
		
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Sell> getSellList(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Sell> list = new MypageDao().getSellList(conn, memberId);
		
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<SellEnd> getSellEndList(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<SellEnd> list = new MypageDao().getSellEndList(conn, memberId);
		System.out.println("list size:"+list.size());
		JDBCTemplate.close(conn);
		return list;
	}

}
