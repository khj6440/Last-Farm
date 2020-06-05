package sell.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import sell.model.dao.SellCategoryDao;
import sell.model.vo.Sell;
import sell.model.vo.SellCategoryPage;

public class SellCategoryService {

	public SellCategoryPage sellSearchList(int reqPage, String addr, String type1, String type2, String searchWord,
			String sortingTab) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 9;

		int totalCount = new SellCategoryDao().typeCount(conn, addr, type1, type2, searchWord);

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
		System.out.println(sortingTab);
		if (sortingTab.equals("마감시간 순")) {
			sortingTab = "sell_end_date";
		} else if (sortingTab.equals("구매 인기순")) {
			sortingTab = "sell_count desc";
		} else if (sortingTab.equals("최근 등록순")){
			sortingTab = "sell_date desc";
		}
		sellList = new SellCategoryDao().selectSearchAll(conn, addr, start, end, type1, type2, searchWord,sortingTab);
		
		// 페이징
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		if (pageNo != 1) {
			pageNavi += "<a class='btn btn-outline-secondary' href='/sellSearchRegional?reqPage=" + (pageNo - pageNaviSize)
				 + "&type1=" + type1 + "&type2=" + type2 + "&searchWord=" + searchWord+ "&sortingTab=" + sortingTab
					+ "'>Before</a>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='btn btn-outline-secondary'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn btn-outline-secondary' href='/sellSearchRegional?reqPage="
						+ (pageNo - pageNaviSize) + "&type1=" + type1 + "&type2=" + type2
						+ "&searchWord=" + searchWord+"&sortingTab=" + sortingTab  + "'>" + pageNo + "</a>";

			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (pageNo < totalPage) {
			pageNavi += "<a class='btn btn-outline-secondary' href='/sellSearchRegional?reqPage=" + (pageNo - pageNaviSize)
					+ "&type1=" + type1 + "&type2=" + type2 + "&searchWord=" + searchWord+"&sortingTab=" + sortingTab 
					+ "'>After</a>";
		}
		SellCategoryPage scp = new SellCategoryPage(sellList, pageNavi);
		JDBCTemplate.close(conn);
		return scp;
	}

}
