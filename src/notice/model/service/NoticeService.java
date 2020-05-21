package notice.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import common.JDBCTemplate;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import notice.model.vo.NoticePageData;

public class NoticeService {

	public NoticePageData selectAll(int reqPage) {

		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;// 한 페이지당 게시물 수
		// 총 게시물 수 구해오기
		int totalCount = new NoticeDao().totalCount(conn);
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
		ArrayList<Notice> list = new NoticeDao().selectAll(conn, start, end);
		String pageNavi = "";
		// 페이지 네비게이션 길이
		int pageNaviSize = 5;
		// 자바의 분모가 분자보다 크면 무조껀 0을 리턴하는 성질을 이용해 페이징 하는법
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn btn-outline-secondary fnt1' href='/noticeList?reqPage=" + (pageNo - pageNaviSize)
					+ "'>이전</a>";
			
		}

		for (int i = 0; i < pageNaviSize; i++) {

			if (reqPage == pageNo) {
				pageNavi += "<span class='btn btn-dark fnt1 '>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn btn-outline-secondary fnt1' href='/noticeList?reqPage=" + pageNo + "'>"
						+ pageNo + "</a>";
				
			}

			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn btn-outline-secondary fnt1' href='/noticeList?reqPage=" + pageNo + "'>다음</a>";
		}

		NoticePageData npd = new NoticePageData(list, pageNavi);
		JDBCTemplate.close(conn);

		return npd;
	}

	public NoticePageData searchNo(int noticeNo, int reqPage ) {

		Connection conn = JDBCTemplate.getConnection();

		int numPerPage = 10;// 한 페이지당 게시물 수
		// 총 게시물 수 구해오기
		int totalCount = new NoticeDao().totalCountNo(conn, noticeNo);
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
		ArrayList<Notice> list = new NoticeDao().selectNo(conn, start, end, noticeNo);

		String pageNavi = "";
		// 페이지 네비게이션 길이
		int pageNaviSize = 5;
		// 자바의 분모가 분자보다 크면 무조껀 0을 리턴하는 성질을 이용해 페이징 하는법
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn btn-outline-secondary fnt1' href='/noticeList?reqPage=" + (pageNo - pageNaviSize)
					+ "" + "'>이전</a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {

			if (reqPage == pageNo) {
				pageNavi += "<span class='btn btn-dark fnt1 '>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn btn-outline-secondary fnt1' href='/noticeList?reqPage=" + pageNo + "'>"
						+ pageNo + "</a>";
			}

			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn btn-outline-secondary fnt1' href='/noticeList?reqPage=" + pageNo + "'>다음</a>";
		}

		NoticePageData npd = new NoticePageData(list, pageNavi);
		JDBCTemplate.close(conn);

		return npd;

	}

	public NoticePageData searchTitle(String noticeTitle, int reqPage) {

		Connection conn = JDBCTemplate.getConnection();

		int numPerPage = 10;// 한 페이지당 게시물 수
		// 총 게시물 수 구해오기
		int totalCount = new NoticeDao().totalCountTitle(conn, noticeTitle);
		// 총 페이지 수 연산
		int totalPage = 0;
		
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		int start = (reqPage - 1) * numPerPage + 1;
		int end = (reqPage * numPerPage);
		// 해당페이지의 게시물들 조회
		ArrayList<Notice> list = new NoticeDao().selectTitle(conn, start, end, noticeTitle);

		String pageNavi = "";
		// 페이지 네비게이션 길이
		int pageNaviSize = 5;
		// 자바의 분모가 분자보다 크면 무조껀 0을 리턴하는 성질을 이용해 페이징 하는법
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn btn-outline-secondary fnt1' href='/searchNotice?"+ "type=noticeTitle&keyword=" + noticeTitle + "&reqPage=" + (pageNo - pageNaviSize)
					+ "'>이전</a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {

			if (reqPage == pageNo) {
				pageNavi += "<span class='btn btn-dark fnt1 '>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn btn-outline-secondary fnt1' href='/searchNotice?"
						+ "type=noticeTitle&keyword=" + noticeTitle + "&reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}

			pageNo++;

			if (pageNo > totalPage) {
				break;
			}
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn btn-outline-secondary fnt1' href='/searchNotice?"+ "type=noticeTitle&keyword=" + noticeTitle + "&reqPage=" + pageNo + "'>다음</a>";
		}

		NoticePageData npd = new NoticePageData(list, pageNavi);
		JDBCTemplate.close(conn);

		return npd;

	}

	public int insertNotice(Notice n) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().insertNotice(conn,n);
		System.out.println(result);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
		
		
	}

	public Notice noticeView(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		Notice n = new NoticeDao().noticeView(conn,noticeNo);
		JDBCTemplate.close(conn);
		
		
		return n;
	}

	public int noticeUpdate(Notice n) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new NoticeDao().noticeUpdate(conn,n);
		if(result != 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		return result;
	}

	public int deleteNotice(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new NoticeDao().deleteNotice(conn,noticeNo);
		if(result != 0 ) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		return result;
	}

}
