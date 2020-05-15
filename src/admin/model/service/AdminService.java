package admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.dao.AdminDao;
import admin.model.vo.MemberPageData;
import admin.model.vo.SellPageData;
import common.JDBCTemplate;
import member.model.vo.Member;
import sell.model.vo.Sell;

public class AdminService {

	public ArrayList<Member> selectAllMember() {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = new AdminDao().selectAllMember(conn);

		JDBCTemplate.close(conn);

		return list;
	}

	public MemberPageData selectMemberList(int reqPage) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 5;
		int totalCount = new AdminDao().totalMemberCount(conn);
		int totalPage = 0;

		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}

		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<Member> list = new AdminDao().selectMemberList(conn, start, end);
		String pageNavi = "";

		int pageNaviSize = 3;

		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<div class='pre_page'><a href='/manageMember?reqPage="
					+ (pageNo - pageNaviSize + (pageNaviSize - 1)) + "'>&lt</a></div>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<div class='page selectPage' >" + pageNo + "</div>";
			} else {
				pageNavi += "<div class='page'><a href='/manageMember?reqPage=" + pageNo + "'>" + pageNo + "</a></div>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		if (pageNo <= totalPage) {
			pageNavi += "<div class='next_page'> <a href='/manageMember?reqPage=" + pageNo + "'>&gt</a></div>";
		}

		MemberPageData pd = new MemberPageData(list, pageNavi, totalPage, totalCount);
		JDBCTemplate.close(conn);

		return pd;
	}

	public SellPageData selectSellList(int reqPage, int reqCount) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = reqCount;
		int totalCount = new AdminDao().totalSellCount(conn);
		int totalPage = 0;

		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}

		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<Sell> list = new AdminDao().selectSellList(conn, start, end);
		String pageNavi = "";

		int pageNaviSize = 3;

		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<div class='pre_page'><a href='/manageSell?reqPage="
					+ (pageNo - pageNaviSize + (pageNaviSize - 1)) + "&reqCount=" + reqCount + "'>&lt</a></div>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<div class='page selectPage' >" + pageNo + "</div>";
			} else {
				pageNavi += "<div class='page'><a href='/manageSell?reqPage=" + pageNo + "&reqCount=" + reqCount + "'>"
						+ pageNo + "</a></div>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		if (pageNo <= totalPage) {
			pageNavi += "<div class='next_page'> <a href='/manageSell?reqPage=" + pageNo + "&reqCount=" + reqCount
					+ "'>&gt</a></div>";
		}

		SellPageData pd = new SellPageData(list, pageNavi, totalPage, totalCount);
		JDBCTemplate.close(conn);

		return pd;
	}

	public int deleteSell(ArrayList<String> checkList) {
		// TODO Auto-generated method stub

		Connection conn = JDBCTemplate.getConnection();

		String param = "";
		for (int i = 0; i < checkList.size(); i++) {
			if (i == checkList.size() - 1) {
				param += "?";
			} else {
				param += "?,";
			}
		}

		int result = new AdminDao().deleteSell(conn, checkList, param);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;
	}

	public SellPageData searchSell(int reqPage, int reqCount, String searched) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = reqCount;
		int totalCount = new AdminDao().searchSellCount(conn,searched);
		int totalPage = 0;

		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}

		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<Sell> list = new AdminDao().searchSell(conn, start, end,searched);
		String pageNavi = "";

		int pageNaviSize = 3;

		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<div class='pre_page'><a href='/adminSearchSell?reqPage="
					+ (pageNo - pageNaviSize + (pageNaviSize - 1)) + "&reqCount=" + reqCount + "'&search="+searched+">&lt</a></div>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<div class='page selectPage' >" + pageNo + "</div>";
			} else {
				pageNavi += "<div class='page'><a href='/adminSearchSell?reqPage=" + pageNo + "&reqCount=" + reqCount + "&search="+searched+"'>"
						+ pageNo + "</a></div>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		if (pageNo <= totalPage) {
			pageNavi += "<div class='next_page'> <a href='/adminSearchSell?reqPage=" + pageNo + "&reqCount=" + reqCount
					+ "&search="+searched+"'>&gt</a></div>";
		}

		SellPageData pd = new SellPageData(list, pageNavi, totalPage, totalCount);
		JDBCTemplate.close(conn);

		return pd;
	}

}
