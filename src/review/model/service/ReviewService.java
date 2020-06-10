package review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.dao.MemberDao;
import member.model.vo.Member;
import quesetion.model.dao.QuestionDao;
import question.model.vo.Question;
import question.model.vo.QuestionPageData;
import review.model.dao.ReviewDao;
import review.model.vo.Review;
import review.model.vo.ReviewPageData;
import reviewComment.model.dao.reviewCommentDao;
import reviewComment.model.vo.ReviewComment;
import sell.model.dao.SellSearchDao;
import sell.model.vo.Sell;
import sellEnd.model.vo.SellEnd;

public class ReviewService {

	public ReviewPageData SelectList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 3; //한페이지당 게시물 수
		//총 게시물 수를 구해오는 dao호출
		int totalCount = new ReviewDao().totalCount(conn);
		int totalPage = 0;
		//총 페이지수 검사
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		//조회해 올 게시물 시작번호와 끝번호 연산
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		//해당페이지의 게시물들 조회
		ArrayList<Review> list = new ReviewDao().selectList(conn,start,end);
	
		ArrayList<ReviewComment> list2  = new reviewCommentDao().selectComment(conn);
		
		//페이지 네비게이션 작성 시작
		String pageNavi="";
		//페이지 네비게이션 길이
		int pageNaviSize = 5;
		//시작값을 확인 연산 예)1~5->1, 6~10->6
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo != 1) {
			pageNavi += "<a class='btn btn-outline-secondary' href='/reviewList?reqPage="+(pageNo-pageNaviSize)+"'>이전</a>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='btn btn-outline-secondary'>"+pageNo+"</span>";
			}else {
				pageNavi +=  "<a class='btn btn-outline-secondary' href='/reviewList?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class ='btn btn-outline-secondary' href='/reviewList?reqPage="+pageNo+"'>다음</a>"; 
		}
		
		ReviewPageData pd = new ReviewPageData(list,list2,pageNavi);
		
		JDBCTemplate.close(conn);
		return pd;
	}

	public ReviewPageData commentList(int reviewNo, String commentContent) {
		// TODO Auto-generated method stub
		return null;
	}

	public ReviewPageData serchIdMember(int reqPage, String keyword, String type) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 3; //한페이지당 게시물 수
		//총 게시물 수를 구해오는 dao호출
		int totalCount = new ReviewDao().searchCount(conn, keyword);
		int totalPage = 0;
		//총 페이지수 검사
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		//조회해 올 게시물 시작번호와 끝번호 연산
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		//해당페이지의 게시물들 조회
		ArrayList<Review> list = new ReviewDao().searchWriter(conn,keyword,start,end);
		ArrayList<ReviewComment> list2  = new reviewCommentDao().selectComment(conn);
		String pageNavi="";
		//페이지 네비게이션 길이
		int pageNaviSize = 5;
		//시작값을 확인 연산 예)1~5->1, 6~10->6
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo != 1) {
			pageNavi += "<a class='"
					+ " ' href='/reviewSearch?reqPage="+(pageNo-pageNaviSize)+"&keyword="+keyword+"&type="+type+"'>이전</a>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='btn btn-secondary'>"+pageNo+"</span>";
			}else {
				pageNavi +=  "<a class='btn btn-outline-secondary' href='/reviewSearch?reqPage="+pageNo+"&keyword="+keyword+"&type="+type+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class ='btn btn-outline-secondary' href='/reviewSearch?reqPage="+pageNo+"&keyword="+keyword+"&type="+type+"'>다음</a>"; 
		}
		ReviewPageData pd = new ReviewPageData(list,list2, pageNavi);
		JDBCTemplate.close(conn);
		return pd;
	}

	public ReviewPageData serchContentMember(int reqPage, String keyword, String type) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 3; //한페이지당 게시물 수
		//총 게시물 수를 구해오는 dao호출
		int totalCount = new ReviewDao().searchCountContent(conn, keyword);
		int totalPage = 0;
		//총 페이지수 검사
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		//조회해 올 게시물 시작번호와 끝번호 연산
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		//해당페이지의 게시물들 조회
		ArrayList<Review> list = new ReviewDao().searchTitle(conn,keyword,start,end);
		ArrayList<ReviewComment> list2  = new reviewCommentDao().selectComment(conn);
		String pageNavi="";
		//페이지 네비게이션 길이
		int pageNaviSize = 5;
		//시작값을 확인 연산 예)1~5->1, 6~10->6
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo != 1) {
			pageNavi += "<a class='"
					+ " ' href='/reviewSearch?reqPage="+(pageNo-pageNaviSize)+"&keyword="+keyword+"&type="+type+"'>이전</a>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='btn btn-secondary'>"+pageNo+"</span>";
			}else {
				pageNavi +=  "<a class='btn btn-outline-secondary' href='/reviewSearch?reqPage="+pageNo+"&keyword="+keyword+"&type="+type+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class ='btn btn-outline-secondary' href='/reviewSearch?reqPage="+pageNo+"&keyword="+keyword+"&type="+type+"'>다음</a>"; 
		}
		ReviewPageData pd = new ReviewPageData(list,list2, pageNavi);
		JDBCTemplate.close(conn);
		return pd;
	}

	public SellEnd sellSearch(int reviewRef) {
		Connection conn = JDBCTemplate.getConnection();
		SellEnd s = new ReviewDao().sellSearch(conn, reviewRef);
		JDBCTemplate.close(conn);
		return s;
	}

	public ArrayList<Review> sellReview(int reviewRef) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Review> list = new ReviewDao().sellReview(conn,reviewRef);
		JDBCTemplate.close(conn);
		return list;
	}

	/*public int reviewWarning(int reviewNo, int reviewWarning,int warningType, String warningWriter) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new 
		
		
		
		int result = new ReviewDao().reviewWarning(conn, reviewNo, reviewWarning);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
*/
	public int insertReview(Review r, int sellEndNo, String sellEndWriter) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().insertReview(conn, r, sellEndNo);
		
		ArrayList<Review> list = new ArrayList<Review>();
		list = new ReviewDao().reviewList(conn, sellEndNo);
		
		int size = list.size();
		int scoreResult = 0;
		for(int i=0; i<list.size(); i++) {
			
			
			scoreResult += list.get(i).getReviewScore();
		}
		int  AllScore = scoreResult/size;
		
		int result2 = new ReviewDao().insertScore(conn, AllScore, sellEndWriter);
		
		if(result > 0 && result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int reviewDelete(int reviewNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().reviewDelete(conn, reviewNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Member memberScore(int reviewRef) {
		Connection conn = JDBCTemplate.getConnection();
		SellEnd writer = new ReviewDao().sellSearch(conn, reviewRef);
		
		String w = writer.getSellEndWriter();
		
		Member m = new ReviewDao().memberScore(conn, w);
	
		
		JDBCTemplate.close(conn);
		return m;
		
	}

	public ArrayList<Review> ReviewWarning(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Review> list = new ReviewDao().ReviewWarning(conn,memberId);
		JDBCTemplate.close(conn);
		return list;
	}

}
