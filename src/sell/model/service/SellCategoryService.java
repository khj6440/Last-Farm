package sell.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import common.JDBCTemplate;
import sell.model.dao.SellCategoryDao;
import sell.model.vo.SearchTab;
import sell.model.vo.Sell;
import sell.model.vo.SellCategoryPage;

public class SellCategoryService {

	public SellCategoryPage search(int reqPage, SearchTab st) {
		Connection conn = JDBCTemplate.getConnection();
		//페이지 당 게시물 수
		int numPerPage = 9;
		//전체 게시물 조회
		int totalCount = new SellCategoryDao().totalCount(conn, st);
		//전체 페이지 수 조회
		int totalPage;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("start",String.valueOf(start)); //정수를 문자열로
		map.put("end", String.valueOf(end));
		ArrayList<Sell> list = new SellCategoryDao().selectList(conn,map, st);
		//pageNavi 작성
		String pageNavi = "";
		int pageNaviSize = 5;
		//pageNo 연산 -> 페이지 시작번호 -> 요청페이지 기준으로 -1 요청페이지 +1
		int pageNo = 1;
		if(reqPage!=1) {
			pageNo = reqPage-1;
		}
		//int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		//이전 버튼 생성
		if(pageNo !=1) {
			pageNavi += "<a href='/sellSearchRegional?reqPage="+(pageNo-1)+"&sido="+st.getSido()+"&gugun="+st.getGugun();
			if(st.getType1()!=null) {
				pageNavi += "&type1="+st.getType1();
			}
			if(st.getType2()!=null) {
				pageNavi += "&type2="+st.getType2();
			}
			if(st.getKeyword()!=null) {
				pageNavi += "&keyword="+st.getKeyword();
			}
			pageNavi += "&sortingTab="+st.getSortingTab()+"'>이전</a>";
		}
		//페이지 버튼 생성
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage==pageNo) {
				pageNavi+="<span>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/sellSearchRegional?reqPage="+pageNo+"&sido="+st.getSido()+"&gugun="+st.getGugun();
				if(st.getType1()!=null) {
					pageNavi += "&type1="+st.getType1();
				}
				if(st.getType2()!=null) {
					pageNavi += "&type2="+st.getType2();
				}
				if(st.getKeyword()!=null) {
					pageNavi += "&keyword="+st.getKeyword();
				}
				pageNavi += "&sortingTab="+st.getSortingTab()+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo<=totalPage) {
			pageNavi += "<a href='/sellSearchRegional?reqPage="+pageNo+"&sido="+st.getSido()+"&gugun="+st.getGugun();
			if(st.getType1()!=null) {
				pageNavi += "&type1="+st.getType1();
			}
			if(st.getType2()!=null) {
				pageNavi += "&type2="+st.getType2();
			}
			if(st.getKeyword()!=null) {
				pageNavi += "&keyword="+st.getKeyword();
			}
			pageNavi += "&sortingTab="+st.getSortingTab()+"'>다음</a>";
		}
		SellCategoryPage scp = new SellCategoryPage(list, pageNavi);
		return scp;
	}

}
