package message.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import message.model.dao.MessageDao;
import message.model.vo.Message;
import message.model.vo.MessagePageData;
import notice.model.vo.NoticePageData;

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

	public MessagePageData selectSendMsg(String memberId,int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;// 한 페이지당 게시물 수
		// 총 게시물 수 구해오기
		int totalCount = new MessageDao().totalCount(conn);
		// 총 페이지 수 연산
		int totalPage = 0;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		// 조회해 올 게시판 시작번호와 끝번호 연산
		int start = (reqPage - 1) * numPerPage + 1;
		int end = (reqPage * numPerPage);
		// 해당페이지의 게시물들 조회
		ArrayList<Message> list = new MessageDao().selectSendMsg(conn,memberId,start,end);
		String pageNavi = "";
		// 페이지 네비게이션 길이
		int pageNaviSize = 5;
		// 자바의 분모가 분자보다 크면 무조껀 0을 리턴하는 성질을 이용해 페이징 하는법
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		if (pageNo != 1) {
			pageNavi += "<a class='btn btn-outline-secondary fnt1' href='/messageList?check=1&reqPage=" + (pageNo - pageNaviSize)
					+ "'>이전</a>";
			
		}

		for (int i = 0; i < pageNaviSize; i++) {

			if (reqPage == pageNo) {
				pageNavi += "<span class='btn btn-dark fnt1 '>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn btn-outline-secondary fnt1' href='/messageList?check=1&reqPage=" + pageNo + "'>"
						+ pageNo + "</a>";
				
			}

			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn btn-outline-secondary fnt1' href='/messageList?check=1&reqPage=" + pageNo + "'>다음</a>";
		}

		MessagePageData mpd = new MessagePageData(list,pageNavi);
		JDBCTemplate.close(conn);

		return mpd;
	}
	
	public MessagePageData selectReceiveMsg(String memberId,int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;// 한 페이지당 게시물 수
		// 총 게시물 수 구해오기
		int totalCount = new MessageDao().totalCount(conn);
		// 총 페이지 수 연산
		int totalPage = 0;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		// 조회해 올 게시판 시작번호와 끝번호 연산
		int start = (reqPage - 1) * numPerPage + 1;
		int end = (reqPage * numPerPage);
		// 해당페이지의 게시물들 조회
		ArrayList<Message> list = new MessageDao().selectReceiveMsg(conn,memberId,start,end);
		String pageNavi = "";
		// 페이지 네비게이션 길이
		int pageNaviSize = 5;
		// 자바의 분모가 분자보다 크면 무조껀 0을 리턴하는 성질을 이용해 페이징 하는법
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		if (pageNo != 1) {
			pageNavi += "<a class='btn btn-outline-secondary fnt1' href='/messageList?&reqPage=" + (pageNo - pageNaviSize)
					+ "'>이전</a>";
			
		}

		for (int i = 0; i < pageNaviSize; i++) {

			if (reqPage == pageNo) {
				pageNavi += "<span class='btn btn-dark fnt1 '>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn btn-outline-secondary fnt1' href='/messageList?&reqPage=" + pageNo + "'>"
						+ pageNo + "</a>";
				
			}

			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn btn-outline-secondary fnt1' href='/messageList?&reqPage=" + pageNo + "'>다음</a>";
		}

		MessagePageData mpd = new MessagePageData(list,pageNavi);
		JDBCTemplate.close(conn);

		return mpd;
	}
}

