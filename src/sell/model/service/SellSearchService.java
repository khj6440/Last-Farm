package sell.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import sell.model.dao.SellSearchDao;
import sell.model.vo.Sell;
import sell.model.vo.SellCategoryPage;

public class SellSearchService {

   public ArrayList<Sell> selectSellNationalList(String page) {
      Connection conn = JDBCTemplate.getConnection();
      ArrayList<Sell> list = new ArrayList<Sell>();
      list = new SellSearchDao().selectSellNationalList(conn,page);
      JDBCTemplate.close(conn);
      return list;
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
               + (pageNo - pageNaviSize) + "&sortingTab=" + sortingTab + "&searchWord=" + searchWord
               + "'>Before</a>";
      }
      for (int i = 0; i < pageNaviSize; i++) {
         if (reqPage == pageNo) {
            pageNavi += "<span class='btn btn-outline-secondary'>" + pageNo + "</span>";
         } else {
            pageNavi += "<a class='btn btn-outline-secondary' href='sellSearchNationalFrm?reqPage=" + pageNo
                  + "&sortingTab=" + sortingTab + "&searchWord=" + searchWord + "'>" + pageNo + "</a>";
         }
         pageNo++;
         if (pageNo > totalPage) {
            break;
         }
      }
      if (pageNo < totalPage) {
         pageNavi += "<a class='btn btn-outline-secondary'" // 다음 버튼 만들기
               + "href='/sellSearchNationalFrm?reqPage=" + pageNo + "&sortingTab=" + sortingTab + "&searchWord="
               + searchWord + "'>After</a>";
      }
      SellCategoryPage scp = new SellCategoryPage(sellList, pageNavi);
      JDBCTemplate.close(conn);
      return scp;
   }

    //전체에서 카테고리화 + 페이징
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
               + (pageNo - pageNaviSize) + "&sortingTab=" + sortingTab + "'>Before</a>";
      }
      for (int i = 0; i < pageNaviSize; i++) {
         if (reqPage == pageNo) {
            pageNavi += "<span class='btn btn-outline-secondary'>" + pageNo + "</span>";
         } else {
            pageNavi += "<a class='btn btn-outline-secondary' href='sellSearchNationalFrm?reqPage=" + pageNo
                  + "&sortingTab=" + sortingTab + "'>" + pageNo + "</a>";

         }
         pageNo++;
         if (pageNo > totalPage) {
            break;
         }
      }
      if (pageNo < totalPage) {
         pageNavi += "<a class='btn btn-outline-secondary'" // 다음 버튼 만들기
               + "href='/sellSearchNationalFrm?reqPage=" + pageNo + "&sortingTab=" + sortingTab + "'>After</a>";
      }
      SellCategoryPage scp = new SellCategoryPage(sellList, pageNavi);
      JDBCTemplate.close(conn);
      return scp;
   }

   public SellCategoryPage sellEnd(int reqPage, String type1, String type2, String searchWord, String sortingTab) {
         Connection conn = JDBCTemplate.getConnection();
         int numPerPage = 9;
         
         int totalCount = new SellSearchDao().typeCount(conn, type1, type2, searchWord);
         
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
            sellList = new SellSearchDao().selectTimeLeft(conn, start, end, type1, type2, searchWord);
         } else if (sortingTab.equals("구매 인기순")) {
            sellList = new SellSearchDao().selectSellCount(conn, start, end, type1, type2, searchWord);
         } else {
            sellList = new SellSearchDao().selectRecent(conn, start, end ,type1, type2, searchWord);
         }
         

         // 페이징
         String pageNavi = "";
         int pageNaviSize = 5;
         int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
         if (pageNo != 1) {
            pageNavi += "<a class='btn btn-outline-secondary' href='/sellSearchNationalFrm?reqPage="
                  + (pageNo - pageNaviSize) + "&sortingTab=" + sortingTab + "'>Before</a>";
         }
         for (int i = 0; i < pageNaviSize; i++) {
            if (reqPage == pageNo) {
               pageNavi += "<span class='btn btn-outline-secondary'>" + pageNo + "</span>";
            } else {
               pageNavi += "<a class='btn btn-outline-secondary' href='sellSearchNationalFrm?reqPage=" + pageNo
                     + "&sortingTab=" + sortingTab + "'>" + pageNo + "</a>";

            }
            pageNo++;
            if (pageNo > totalPage) {
               break;
            }
         }
         if (pageNo < totalPage) {
            pageNavi += "<a class='btn btn-outline-secondary'" // 다음 버튼 만들기
                  + "href='/sellSearchNationalFrm?reqPage=" + pageNo + "&sortingTab=" + sortingTab + "'>After</a>";
         }
         SellCategoryPage scp = new SellCategoryPage(sellList, pageNavi);
         JDBCTemplate.close(conn);
         return scp;
      }
   
   public ArrayList<Sell> selectList(int test) {
       Connection conn = JDBCTemplate.getConnection();
       System.out.println(test);
       ArrayList<Sell> list = new ArrayList<Sell>();
       list = new SellSearchDao().selectList(conn,test);
       JDBCTemplate.close(conn);
       
       return list;
    }

   }