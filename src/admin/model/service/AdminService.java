package admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.dao.AdminDao;
import admin.model.vo.MemberPageData;
import admin.model.vo.ReviewPageData;
import admin.model.vo.SellPageData;
import admin.model.vo.WarningData;
import common.JDBCTemplate;
import member.model.vo.Member;
import message.model.vo.Message;
import review.model.vo.Review;
import review.model.vo.ReviewAndSell;
import sell.model.vo.Sell;

public class AdminService {

	public ArrayList<Member> selectAllMember() {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = new AdminDao().selectAllMember(conn);

		JDBCTemplate.close(conn);

		return list;
	}

	public MemberPageData selectMemberList(int reqPage,int reqCount,String sort) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = reqCount;
		int totalCount = new AdminDao().totalMemberCount(conn);
		int totalPage = 0;
		String sortName="";
		if(sort.equals("member_id")) {
			sortName="ID순";
		}else if(sort.equals("member_type")) {
			sortName="타입순";
		}else {
			sortName="가입일순";
		}

		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}

		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<Member> list = new AdminDao().selectMemberList(conn, start, end,sort);
		String pageNavi = "";

		int pageNaviSize = 3;

		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<div class='pre_page'><a href='/manageMember?reqPage="
					+ (pageNo - pageNaviSize + (pageNaviSize - 1)) + "&reqCount=" + reqCount +"&sort="+sortName+"'>&lt</a></div>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<div class='page selectPage' >" + pageNo + "</div>";
			} else {
				pageNavi += "<div class='page'><a href='/manageMember?reqPage=" + pageNo + "&reqCount=" + reqCount +"&sort="+sortName+"'>"
						+ pageNo + "</a></div>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		if (pageNo <= totalPage) {
			pageNavi += "<div class='next_page'> <a href='/manageMember?reqPage=" + pageNo + "&reqCount=" + reqCount
					+"&sort="+sortName+"'>&gt</a></div>";
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
		int result1 = new AdminDao().deleteBuy(conn,checkList,param);
		ArrayList<Sell> list = new AdminDao().getDelSellList(conn,checkList,param);
		int result2 = new AdminDao().deleteSell(conn, checkList, param);
		int result3 = new AdminDao().insertSellEnd(conn,list);

		if (result3>0 ) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result2;
	}

	public SellPageData searchSell(int reqPage, int reqCount, String searched) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = reqCount;
		int totalCount = new AdminDao().searchSellCount(conn, searched);
		int totalPage = 0;

		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}

		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<Sell> list = new AdminDao().searchSell(conn, start, end, searched);
		String pageNavi = "";

		int pageNaviSize = 3;

		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<div class='pre_page'><a href='/adminSearchSell?reqPage="
					+ (pageNo - pageNaviSize + (pageNaviSize - 1)) + "&reqCount=" + reqCount + "&search=" + searched
					+ "'>&lt</a></div>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<div class='page selectPage' >" + pageNo + "</div>";
			} else {
				pageNavi += "<div class='page'><a href='/adminSearchSell?reqPage=" + pageNo + "&reqCount=" + reqCount
						+ "&search=" + searched + "'>" + pageNo + "</a></div>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		if (pageNo <= totalPage) {
			pageNavi += "<div class='next_page'> <a href='/adminSearchSell?reqPage=" + pageNo + "&reqCount=" + reqCount
					+ "&search=" + searched + "'>&gt</a></div>";
		}

		SellPageData pd = new SellPageData(list, pageNavi, totalPage, totalCount);
		JDBCTemplate.close(conn);

		return pd;
	}

	public ReviewPageData selectReviewList(int reqPage, int reqCount) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = reqCount;
		int totalCount = new AdminDao().totalReviewCount(conn);
		int totalPage = 0;

		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}

		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<ReviewAndSell> list = new AdminDao().selectReviewList(conn, start, end);
		String pageNavi = "";

		int pageNaviSize = 3;

		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<div class='pre_page'><a href='/manageReview?reqPage="
					+ (pageNo - pageNaviSize + (pageNaviSize - 1)) + "&reqCount=" + reqCount + "'>&lt</a></div>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<div class='page selectPage' >" + pageNo + "</div>";
			} else {
				pageNavi += "<div class='page'><a href='/manageReview?reqPage=" + pageNo + "&reqCount=" + reqCount + "'>"
						+ pageNo + "</a></div>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		if (pageNo <= totalPage) {
			pageNavi += "<div class='next_page'> <a href='/manageReview?reqPage=" + pageNo + "&reqCount=" + reqCount
					+ "'>&gt</a></div>";
		}

		ReviewPageData pd = new ReviewPageData(list, pageNavi, totalPage, totalCount);
		JDBCTemplate.close(conn);

		return pd;
	}

	public int deleteReview(ArrayList<String> checkList) {
		
		Connection conn = JDBCTemplate.getConnection();
		String param = "";
		for (int i = 0; i < checkList.size(); i++) {
			if (i == checkList.size() - 1) {
				param += "?";
			} else {
				param += "?,";
			}
		}
		System.out.println(param);
		int result = new AdminDao().deleteReview(conn, checkList, param);
		System.out.println(result + "개 삭제");

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;
	}

	public ReviewPageData searchReview(int reqPage, int reqCount, String searched) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = reqCount;
		int totalCount = new AdminDao().searchReviewCount(conn, searched);
		int totalPage = 0;

		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}

		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<ReviewAndSell> list = new AdminDao().searchReview(conn, start, end, searched);
		String pageNavi = "";

		int pageNaviSize = 3;

		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<div class='pre_page'><a href='/adminSearchReview?reqPage="
					+ (pageNo - pageNaviSize + (pageNaviSize - 1)) + "&reqCount=" + reqCount + "&search=" + searched
					+ "'>&lt</a></div>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<div class='page selectPage' >" + pageNo + "</div>";
			} else {
				pageNavi += "<div class='page'><a href='/adminSearchReview?reqPage=" + pageNo + "&reqCount=" + reqCount
						+ "&search=" + searched + "'>" + pageNo + "</a></div>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		if (pageNo <= totalPage) {
			pageNavi += "<div class='next_page'> <a href='/adminSearchReview?reqPage=" + pageNo + "&reqCount=" + reqCount
					+ "&search=" + searched + "'>&gt</a></div>";
		}

		ReviewPageData pd = new ReviewPageData(list, pageNavi, totalPage, totalCount);
		JDBCTemplate.close(conn);

		return pd;
	}

	public int deleteMember(ArrayList<String> checkList) {
		
		Connection conn = JDBCTemplate.getConnection();

		String param = "";
		for (int i = 0; i < checkList.size(); i++) {
			if (i == checkList.size() - 1) {
				param += "?";
			} else {
				param += "?,";
			}
		}
		int result = new AdminDao().deleteMember(conn, checkList, param);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;
	}

	
	public MemberPageData searchMember(int reqPage, int reqCount, String searched ,String sort) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = reqCount;
		int totalCount = new AdminDao().searchMemberCount(conn, searched);
		int totalPage = 0;

		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}

		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<Member> list = new AdminDao().searchMember(conn, start, end, searched,sort);
		String pageNavi = "";

		String sortName="";
		if(sort.equals("member_id")) {
			sortName="ID순";
		}else if(sort.equals("member_type")) {
			sortName="타입순";
		}else {
			sortName="가입일순";
		}

		int pageNaviSize = 3;

		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<div class='pre_page'><a href='/adminSearchMember?reqPage="
					+ (pageNo - pageNaviSize + (pageNaviSize - 1)) + "&reqCount=" + reqCount + "&search=" + searched
					+ "&sort="+sortName+"'>&lt</a></div>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<div class='page selectPage' >" + pageNo + "</div>";
			} else {
				pageNavi += "<div class='page'><a href='/adminSearchMember?reqPage=" + pageNo + "&reqCount=" + reqCount
						+ "&search=" + searched + "&sort="+sortName+"'>" + pageNo + "</a></div>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		if (pageNo <= totalPage) {
			pageNavi += "<div class='next_page'> <a href='/adminSearchMember?reqPage=" + pageNo + "&reqCount=" + reqCount
					+ "&search=" + searched + "&sort="+sortName+"'>&gt</a></div>";
		}

		MemberPageData pd = new MemberPageData(list, pageNavi, totalPage, totalCount);
		JDBCTemplate.close(conn);

		return pd;
	}

	public int deleteCancel(int memberNo) {
		// TODO Auto-generated method stub
		Connection conn =JDBCTemplate.getConnection();
		int result = new AdminDao().deleteCancel(conn,memberNo);

		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;
		
	}

	public int modifyMemberStatus(int memberNo, int memberStatus) {
		Connection conn =JDBCTemplate.getConnection();
		int result = new AdminDao().modifyMemberStatus(conn,memberNo,memberStatus);

		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;
	}

	public int totalWarningCount() {
		Connection conn = JDBCTemplate.getConnection();
		int warningCount = new AdminDao().totalWarningCount(conn);
		
		JDBCTemplate.close(conn);
		return warningCount;
	}

	public ArrayList<WarningData> moreWarning(int start) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		int length=5;
		int end = start+length-1;
		ArrayList<WarningData> list = new AdminDao().moreWarning(conn,start,end);
		
		JDBCTemplate.close(conn);
		return list;
	}

	public int getMessageCount() {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		int msgCount = new AdminDao().getMessageCount(conn);
		
		JDBCTemplate.close(conn);
		return msgCount;
	}

	public ArrayList<Message> getMsgList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Message> list = new AdminDao().getMsgList(conn);
		
		JDBCTemplate.close(conn);
		return list;
	}

	public int deleteComment(ArrayList<String> checkList, String type) {
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
		int result = new AdminDao().deleteComment(conn, checkList, param, type);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;
	}

	
	public int readMsg(int msgNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDao().readMsg(conn,msgNo);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;
	}

}
