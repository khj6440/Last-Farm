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



	public ArrayList<Sell> selectSellNationalList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Sell> sellList = new ArrayList<Sell>();
		sellList = new SellSearchDao().selectSellNationalList(conn);
		JDBCTemplate.close(conn);
		return sellList;
	}

	//서치박스에서 카테고리화 + 페이징
	public SellCategoryPage searchBoxSorting(int reqPage, String sortingTab, String searchWord) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 9;
		int totalCount = new SellSearchDao().totalCountByWord(conn, searchWord);
		int totalPage = 0;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		// 탭 종류에 따라 sorting
		ArrayList<Sell> sellList = new ArrayList<Sell>();
		if (sortingTab.equals("마감시간 순")) {
			sellList = new SellSearchDao().selectWordTimeLeft(conn, start, end, searchWord);
		} else if (sortingTab.equals("구매 인기순")) {
			sellList = new SellSearchDao().selectWordSellCount(conn, start, end, searchWord);
		} else {
			sellList = new SellSearchDao().selectWordRecent(conn, start, end, searchWord);
		}
		
		// 페이징
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		if (pageNo != 1) {
			pageNavi += "<a class='btn btn-outline-secondary' href='/sellSearchNationalFrm?reqPage="
					+ (pageNo - pageNaviSize) + "'>Before</a>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='btn btn-outline-secondary'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn btn-outline-secondary' href='sellSearchNationalFrm?reqPage=" + pageNo + "'>"
						+ pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (pageNo < totalPage) {
			pageNavi += "<a class='btn btn-outline-secondary'" // 다음 버튼 만들기
					+ "href='/sellSearchNationalFrm?reqPage=" + pageNo + "'>After</a>";
		}
		SellCategoryPage scp = new SellCategoryPage(sellList, pageNavi);
		JDBCTemplate.close(conn);
		return scp;
	}

	// 전체에서 카테고리화 + 페이징
	public SellCategoryPage selectList(int reqPage, String sortingTab) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 9;
		int totalCount = new SellSearchDao().totalCount(conn);
		int totalPage = 0;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		// 탭 종류에 따라 sorting
		ArrayList<Sell> sellList = new ArrayList<Sell>();
		if (sortingTab.equals("마감시간 순")) {
			sellList = new SellSearchDao().selectAllTimeLeft(conn, start, end);
		} else if (sortingTab.equals("구매 인기순")) {
			sellList = new SellSearchDao().selectAllSellCount(conn, start, end);
		} else {
			sellList = new SellSearchDao().selectAllRecent(conn, start, end);
		}

		// 페이징
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		if (pageNo != 1) {
			pageNavi += "<a class='btn btn-outline-secondary' href='/sellSearchNationalFrm?reqPage="
					+ (pageNo - pageNaviSize) + "'>Before</a>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='btn btn-outline-secondary'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn btn-outline-secondary' href='sellSearchNationalFrm?reqPage=" + pageNo + "'>"
						+ pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (pageNo < totalPage) {
			pageNavi += "<a class='btn btn-outline-secondary'" // 다음 버튼 만들기
					+ "href='/sellSearchNationalFrm?reqPage=" + pageNo + "'>After</a>";
		}
		SellCategoryPage scp = new SellCategoryPage(sellList, pageNavi);
		JDBCTemplate.close(conn);
		return scp;
	}


}
