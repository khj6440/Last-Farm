package notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import notice.model.vo.NoticePageData;

public class NoticeService {

	public NoticePageData selectAll(int reqPage) {

		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;//한 페이지당 게시물 수
		//총 게시물 수 구해오기
		int totalCount = new NoticeDao().totalCount(conn);
		//총 페이지 수 연산
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage; 
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		//조회해 올 게시판 시작번호와 끝번호 연산
		int start = (reqPage-1)*numPerPage+1;
		int end = (reqPage*numPerPage);
		//해당페이지의 게시물들 조회
		ArrayList<Notice> list = new NoticeDao().selectAll(conn,start,end);
		String pageNavi = "";
		//페이지 네비게이션 길이
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/noticeList?reqPage="+(pageNo-pageNaviSize)+"'>이전</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/noticeList?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/noticeList?reqPage="+pageNo+"'>다음</a>";
		}
		NoticePageData npd = new NoticePageData(list,pageNavi);
		JDBCTemplate.close(conn);
		
		return npd;
	}

}
