package question.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import quesetion.model.dao.QuestionDao;
import question.model.vo.Question;
import question.model.vo.QuestionPageData;

public class QuestionService {

	public QuestionPageData selectList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10; //한페이지당 게시물 수
		//총 게시물 수를 구해오는 dao호출
		int totalCount = new QuestionDao().totalCount(conn);
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
		ArrayList<Question> list = new QuestionDao().selectList(conn,start,end);
		//페이지 네비게이션 작성 시작
		String pageNavi="";
		//페이지 네비게이션 길이
		int pageNaviSize = 5;
		//시작값을 확인 연산 예)1~5->1, 6~10->6
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo != 1) {
			pageNavi += "<a class='btn btn-outline-secondary' href='/questionList?reqPage="+(pageNo-pageNaviSize)+"'>이전</a>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='btn btn-outline-secondary'>"+pageNo+"</span>";
			}else {
				pageNavi +=  "<a class='btn btn-outline-secondary' href='/questionList?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class ='btn btn-outline-secondary' href='/questionList?reqPage="+pageNo+"'>다음</a>"; 
		}
		QuestionPageData pd = new QuestionPageData(list, pageNavi);
		JDBCTemplate.close(conn);
		return pd;
	}

	

	public QuestionPageData selectSearch(int reqPage, String keyword) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10; //한페이지당 게시물 수
		//총 게시물 수를 구해오는 dao호출
		int totalCount = new QuestionDao().searchCount(conn, keyword);
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
		ArrayList<Question> list = new QuestionDao().searchContent(conn,keyword,start,end);
		String pageNavi="";
		//페이지 네비게이션 길이
		int pageNaviSize = 5;
		//시작값을 확인 연산 예)1~5->1, 6~10->6
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo != 1) {
			pageNavi += "<a class='"
					+ " ' href='/questionList?reqPage="+(pageNo-pageNaviSize)+"'>이전</a>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='btn btn-secondary'>"+pageNo+"</span>";
			}else {
				pageNavi +=  "<a class='btn btn-outline-secondary' href='/questionList?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class ='btn btn-outline-secondary' href='/questionList?reqPage="+pageNo+"'>다음</a>"; 
		}
		QuestionPageData pd = new QuestionPageData(list, pageNavi);
		JDBCTemplate.close(conn);
		return pd;
	}



	public int insertQuestion(Question q) {
		Connection conn = JDBCTemplate.getConnection();
		int result =  new QuestionDao().insertNotice(conn,q);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}



	public int deleteQuestion(int questionNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result =  new QuestionDao().deleteQuestion(conn,questionNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}



	public Question QuestionSearch(int questionNo) {
		Connection conn = JDBCTemplate.getConnection();
		Question question = new QuestionDao().QuestionSearch(conn, questionNo);
		JDBCTemplate.close(conn);
		return question;
	}



	public int questionUpdate(Question q) {
		Connection conn = JDBCTemplate.getConnection();
		int result =  new QuestionDao().questionUpdate(conn,q);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
